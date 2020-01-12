;v1.00->v.1.01 Various plotting settings changes
;v1.01->v.1.1  Introdicung beforemax switch

pro gp_fit_bp,ID_in,ID,crash_group=crash_group,plot=plot,tstart=tstart,tend=tend,$
              beforemax=beforemax,fit_length=fit_length,norm=norm,$
              ;thr_times_mean=thr_times_mean,thr_times_std=thr_times_std,$
              ylog=ylog,thr=thr

version='1.1.1'
prog='gp_fit_bp.pro'

;INIT
;=====================================================================
nti_wavelet_default,tstart,-0.03
nti_wavelet_default,tend,  -0.002
nti_wavelet_default,fit_length,tend-tstart
nti_wavelet_default,plot,1
nti_wavelet_default,norm,1
nti_wavelet_default,thr,0.1 ;10%
nti_wavelet_default,ylog,1

;INPUT DATA
;=====================================================================

;Loading data
print,'Loading bandpower data from run:'
print,ID_in
restore,'./output/'+ID_in+'_bp.sav'

N=n_elements(trange(*,0))

;Get constants for the given crash group from external file
;Determine crash group from number of crashes
gp_fit_bp_constants,N,norm=norm,crash_group=crash_group,$
                    crash_times=crash_times,A_orig=A_orig,thro=thro
A_orig=double(A_orig)

if norm then begin
   thr=thr
endif else begin
   thr=thro
endelse

;Re-creating time axes
dt=(trange(0,1)-trange(0,0))/n_elements(bpv(0,*,0))
fit_length_N=round(fit_length/dt)

timeaxes=dblarr(N,n_elements(bpv(0,*,0)))
errors=dblarr(N)

for i=0,N-1 do begin
   timeaxes(i,*)=findgen(n_elements(bpv(0,*,0)))
   timeaxes(i,*)=timeaxes(i,*)*dt
   timeaxes(i,*)=timeaxes(i,*)+trange(i,0)
   errors(i)=abs(max(timeaxes(i,*))-trange(i,1)+dt)   
endfor

print,'Maximum RELATIVE error in time axis reconstruction (error/dt):'
print,max(errors)/dt

;NORMING
;=====================================================================
;Norming time axes to the crash times
timeaxes_normed=timeaxes
for i=0,N-1 do begin
   timeaxes_normed(i,*)=timeaxes(i,*)-crash_times(i)
endfor

;Norming the bandpowers
if norm then begin
   for i=0,N-1 do begin
      bpv(0,*,i)=bpv(0,*,i)/max(bpv(0,*,i))
   endfor
endif

;FITTING
;=====================================================================

;Start fitting for the [tsart,tend] ms interval
print,'Start fitting for the interval:'
if keyword_set(beforemax) then begin
   print,'Adaptive time range selection, parameters:'
   print,[beforemax-fit_length,beforemax]
endif else begin
   print,[tstart,tend]
endelse

;Initializing variables
yfits=dblarr(N,fit_length_N)
x_es=yfits
y_es=yfits
params=dblarr(N,3)
sigmas=dblarr(N,3)
chisqs=dblarr(N)

;Actual fitting
for i=0,N-1 do begin
   if keyword_set(beforemax) then begin
      index2=gp_where(bpv(0,*,i),max(bpv(0,*,i)))+round(beforemax/dt)
      index1=index2-fit_length_N+1
   endif else begin
      indexes=where((timeaxes_normed(i,*) ge tstart) and (timeaxes_normed(i,*) le tend))
      ;index1=gp_where(timeaxes_normed(i,*),tstart)
      ;index2=gp_where(timeaxes_normed(i,*),tend)
      index1=min(indexes)
      index2=max(indexes)
   endelse

   x=timeaxes_normed(i,index1:index2)
   y=bpv(0,index1:index2,i)
   x=reform(x)
   y=reform(y)
   y_es(i,*)=y
   x_es(i,*)=x

   A=A_orig

   A(2)=mean(bpv(0,0:gp_where(timeaxes_normed(i,*),(tend-0.01)),i))

   A(2)=sqrt(A(2))
   weights=(1./y)
   yfit=curvefit(x,y,weights,A,sigma,function_name='gp_exponential', chisq=chisq, itmax=2000, /double, fita=[1, 1, 1])
   A(2)=A(2)*A(2)
   sigma(2)=sigma(2)*sigma(2)

   yfits(i,*)=yfit
   params(i,*)=A
   sigmas(i,*)=sigma
   chisqs(i)=chisq
endfor


;Calculating averages
;=====================================================================
params_mean=dblarr(3)
sigmas_mean=dblarr(3)
for i=0,2 do begin
   ;params_mean(i)=mean(params(*,i))
   ;sigmas_mean(i)=mean(sigmas(*,i))
   params_mean_tmp=gp_weighted_mean(reform(params(*,i)),reform(sigmas(*,i)),std_out=std_out)
   params_mean(i)=params_mean_tmp
   sigmas_mean(i)=std_out
endfor

;Printing results to stdin
;=====================================================================
print,'===================================='
print,'Mean values and relative errors (%):'
print,params_mean
;print,sigmas_mean
print,abs(100*sigmas_mean/params_mean)

print,'MAX and SUM chisq'
print,[max(chisqs),TOTAL(chisq)]


;Calculating threshold times
;=====================================================================
thr_times=dblarr(N)
for i=0,N-1 do begin
   index=gp_where(yfits(i,*),thr)
   thr_times(i)=x_es(i,index)
endfor

thr_message_main='Average threshold time [ms] and its STD [%] to reach '
if norm then begin
   thr_message_suffix=pg_num2str(thr*100,length=2)+'% (normalized)'
endif else begin
   thr_message_suffix=pg_num2str(thr)+' (absolute)'
endelse
thr_message=thr_message_main+thr_message_suffix

print,thr_message

;Simple average
if 1 then begin
   thr_times_mean=mean(thr_times)
   thr_times_std=100*stdev(thr_times)/abs(mean(thr_times))
endif

;Chisq average
if 0 then begin
   thr_times_mean=gp_weighted_mean(thr_times,1/sqrt(chisqs),std_out=std_out)
   thr_times_std=100*std_out/abs(thr_times_mean)
endif

;Gaussian average
if 0 then begin
   a=reform(params(*,0))
   b=reform(params(*,1))
   c=reform(params(*,2))
   da2=(reform(sigmas(*,0)))^2
   db2=(reform(sigmas(*,1)))^2
   dc2=(reform(sigmas(*,2)))^2

   weights=sqrt(da2/(b^2)*(a^2)+db2*(alog((thr-c)/a)/b^2)^2+dc2/(b(thr-c))^2)

   thr_times_mean=gp_weighted_mean(thr_times,weights,std_out=std_out)
   thr_times_std=100*std_out/abs(thr_times_mean)
endif

print,[1000*thr_times_mean,thr_times_std]


;Plotting bandpowers and fits
;=====================================================================
if plot then begin
print,'Plotting results into files...'
pg_initgraph,/print
for i=0,N-1 do begin
   device,filename='./output/'+ID+'_'+pg_num2str(i)+'_bp_fit.eps'

   plot,timeaxes_normed(i,*),bpv(0,*,i),title='Bandpower fit of '+crash_group+': #'+nti_wavelet_i2str(i)+$
        ' Crash (@ '+pg_num2str(crash_times(i))+' s)',thick=2,charthick=3,charsize=2,$
        xtitle='Crash-shifted time (s)',xstyle=1, ytitle='Normalized amplitude',ylog=ylog
   oplot,x_es(i,*),yfits(i,*),linestyle=5,thick=5

   datas_prog='ID: '+ID+$
              '!CGroup: '+crash_group+$
              '!CProg: '+prog+', V.: '+version+$
              '!CDate: '+systime()

   if keyword_set(beforemax) then begin
      index2=gp_where(bpv(0,*,i),max(bpv(0,*,i)))+round(beforemax/dt)
      index1=index2-fit_length_N+1
      fit_between=pg_num2str(beforemax,length=7)+'s before MAX, length: '+pg_num2str(fit_length,length=7)+'s'+$
                  '!C(Which here is'+pg_num2str(min(reform(timeaxes_normed(i,index1:index2))))+'s & '+$
                                     pg_num2str(max(reform(timeaxes_normed(i,index1:index2))))+'s)'
   endif else begin
      fit_between=pg_num2str(tstart,length=7)+'s & '+pg_num2str(tend,length=7)+'s'
   endelse

   
   datas='ID in: '+ID_in+$
         '!CCrashes: '+pg_num2str(N)+' Points: '+pg_num2str(n_elements(bpv(0,*,0)))+' dt: '+pg_num2str(dt)+$
         '!COriginal trange: '+pg_num2str(trange(i,0),length=6)+'s - '+pg_num2str(trange(i,1),length=6)+'s'+$
         '!CFit between: '+fit_between

   datas_fit='ID: '+ID+$
             '!C '+$
             '!CFitted params (A1*exp(A2*X)+A3) and relative STD(%):'+$
             '!C'+pg_num2str(params(i,0))+' '+pg_num2str(params(i,1))+' '+pg_num2str(params(i,2))+$
             '!C'+pg_num2str(abs(100*sigmas(i,0)/params(i,0)))+' '+pg_num2str(abs(100*sigmas(i,1)/params(i,1)))+$
                                                               ' '+pg_num2str(abs(100*sigmas(i,2)/params(i,2)))+$
             '!CChisq of fit: '+pg_num2str(chisqs(i))+$
             '!CTHR time: '+pg_num2str(1000*thr_times(i),length=4)+' ms'
             
   datas_fit_mean='MEAN and STD(%) of the '+nti_wavelet_i2str(N)+' weighted averaged params:'+$
                  '!C'+pg_num2str(params_mean(0))+' '+pg_num2str(params_mean(1))+' '+pg_num2str(params_mean(2))+$
                  '!C'+pg_num2str(abs(100*sigmas_mean(0)/params_mean(0)))+' '+pg_num2str(abs(100*sigmas_mean(1)/params_mean(1)))+$
                                                                          ' '+pg_num2str(abs(100*sigmas_mean(2)/params_mean(2)))+$
                  '!CMax chisq: '+pg_num2str(max(chisqs(*)))+$
                  '!CMean THR time (ms) to reach '+thr_message_suffix+$
                  '!C'+pg_num2str(1000*thr_times_mean,length=4)+' ms +/- '+pg_num2str(thr_times_std)+'%'

             

   xyouts,0.99,0.12,datas,/normal,orientation=90,charsize=1.3,charthick=2
   xyouts,0.99,0.63,datas_prog,/normal,orientation=90,charsize=1.3,charthick=2
   xyouts,0.15,0.90,datas_fit,/normal,charthick=1.5, charsize=1.7
   xyouts,0.15,0.70,datas_fit_mean,/normal,charthick=2.5, charsize=2

   device,/close

endfor
;gp_sort,ID
pg_initgraph
endif



end
