;v 1.00->v 1.01: shifting ID mark inner
;v 1.01->v 1.02: correcting interval approximation (dashed lines
;                represent 95% probability), adding returned values
;                off ccf
;v 1.02->v 1.03: Added ID info on printed bandpowers, correcting FFT
;                analyser input
;v 1.03->v 1.04: Saving bandpowers into file.

pro gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,$
              trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,$
              f_le=f_le,fmax=fmax,ID=ID,$
              ccf_mean=ccf_mean,ccf_err=ccf_err,t_c=t_c,bp_save=bp_save

version=1.04
prog='gp_bp_ccf.pro'
nti_wavelet_default,fft_analyser,0
nti_wavelet_default,f_le,fmax

print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=windowsize,masksize=masksize,freqres=1,opt=0.1,/print,trange=t_stft,timeax=timeax,freqax=freqax,fmax=fmax,ID=ID)
timeax2=timeax
winlength=1000.*windowsize*(timeax(2)-timeax(1))
stft2=stft

dt=trange(0,1)-trange(0,0)

size=n_elements(trange[*,0])

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,bands,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2,ID=ID
bpv=dblarr(2,n_elements(bp[0,*]),size)
bp_timeaxes=dblarr(n_elements(timeax2),size)
bpv[*,*,0]=bp
bp_timeaxes[*,0]=timeax2

for i=0,size-1 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,bands,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2,ID=ID
bpv[*,*,i]=bpt
bp_timeaxes[*,1]=timeax2
endfor

;resampling to get rid of the effect of stft windowing
;bpv_orig=bpv
timeax_temp=timeax[0:n_elements(bpv[0,*,0])-1]
;timeax_temp2=timeax_temp
;q=bpv_orig[0,*,0]
;gp_resample,q,timeax_temp2,f_le
;bpv=dblarr(2,n_elements(q),size)
;timeax_temp2=timeax_temp


;for i=0,1 do begin
;   for j=0,size-1 do begin
;      q=bpv_orig[i,*,j]
;      gp_resample,q,timeax_temp2,f_le
;      timeax_temp2=timeax_temp
;      bpv[i,*,j]=q
;   endfor
;endfor

;q=bpv_orig[0,*,0]
;gp_resample,q,timeax_temp,f_le

c=dblarr(n_elements(reform(bpv[0,*,0])),size)
impv12=c
impv21=c
t_c=lindgen(n_elements(c(*,0)))-ceil(n_elements(c(*,0))/2.)+1
;t_c=t_c*(timeax[2]-timeax[1])*1000;in ms
t_c=t_c*(timeax_temp[2]-timeax_temp[1])*1000;in ms


for i=0,size-1 do begin
pg_initgraph,/print
c[*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast)
gp_imp,reform(bpv[0,*,i]),reform(bpv[1,*,i]),imp12=imp12,imp21=imp21
impv12[*,i]=imp12
impv21[*,i]=imp21
device,filename='./output/'+ID+'_'+pg_num2str(i)+'_ccf.eps'
plot,t_c,c[*,i],title=ID+': '+pg_num2str(i)+'_ccf',thick=3,charthick=3,charsize=2,$
     xtitle='Time delay (ms)',xstyle=1
device,/close
endfor

save,bpv,trange,bp_timeaxes,filename='./output/'+ID+'_bp.sav'


ccf_mean=dblarr(n_elements(c[*,0]))
ccf_err=dblarr(n_elements(c[*,0]))
imp12_mean=ccf_mean
imp21_mean=imp12_mean
imp12_err=imp12_mean
imp21_err=imp12_mean

datas_prog='shot: '+pg_num2str(shot)+', trange: '+pg_num2str(trange(0),length=4)+'s - '+pg_num2str(trange(1),length=4)+'s'+$
           '!CID: '+ID+$
           '!CProg: '+prog+', V.: '+pg_num2str(version,length=4)+$
           '!CDate: '+systime()

datas='Ch: '+channel1+$
      '!CWin: '+nti_wavelet_i2str(windowsize)+' ('+pg_num2str(winlength,length=4)+'ms), Mask: '+nti_wavelet_i2str(masksize)+', '+'f_max: '+pg_num2str(fmax)+$
      '!CFqs: '+nti_wavelet_i2str(bands(0))+'-'+nti_wavelet_i2str(bands(1))+' & '+nti_wavelet_i2str(bands(2))+'-'+nti_wavelet_i2str(bands(3))+' (kHz), Length: '+pg_num2str(dt,length=5)+'s'+$
      '!CAverages: '+nti_wavelet_i2str(size)+', f_d: '+pg_num2str(f_le)+'kHz, ccf_dt: '+pg_num2str(t_c[1]-t_c[0],length=5)+'ms '+'N: '+nti_wavelet_i2str(n_elements(c[*,0]))

;ccf_title=ID+': ccf-average (#'+nti_wavelet_i2str(shot)+', '+pg_num2str(trange(0),length=4)+'s-'+pg_num2str(trange(1),length=4)+'s)'
ccf_title=ID+': ccf-average'


for i=0,n_elements(ccf_mean)-1 do ccf_mean(i)=mean(c(i,*))
for i=0,n_elements(ccf_err)-1 do ccf_err(i)=stdev(c(i,*))
device,filename='./output/'+ID+'_ccf-average.eps'
plot,t_c,ccf_mean,title=ccf_title,thick=4,charthick=3,charsize=2,$
     yrange=[min(ccf_mean-ccf_err),max(ccf_mean+ccf_err)],ystyle=1,xtitle='Time delay (ms)',$
     xstyle=1

oplot,t_c,(ccf_mean-1.96*ccf_err/sqrt(size)),linestyle=5,thick=4
oplot,t_c,(ccf_mean+1.96*ccf_err/sqrt(size)),linestyle=5,thick=4
xyouts,0.99,0.12,datas,/normal,orientation=90,charsize=1.3,charthick=2
xyouts,0.99,0.63,datas_prog,/normal,orientation=90,charsize=1.3,charthick=2
device,/close

for i=0,n_elements(imp12_mean)-1 do imp12_mean(i)=mean(impv12(i,*))
for i=0,n_elements(imp21_mean)-1 do imp21_mean(i)=mean(impv21(i,*))
for i=0,n_elements(imp12_err)-1 do imp12_err(i)=stdev(impv12(i,*))
for i=0,n_elements(imp21_err)-1 do imp21_err(i)=stdev(impv21(i,*))

device,filename='./output/'+ID+'_imp12-average.eps'
plot,t_c,imp12_mean,title=ID+': imp12-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)',$
     yrange=[min(imp12_mean-imp12_err),max(imp12_mean+imp12_err)]

oplot,t_c,(imp12_mean-imp12_err),linestyle=5,thick=4
oplot,t_c,(imp12_mean+imp12_err),linestyle=5,thick=4
device,/close

device,filename='./output/'+ID+'_imp21-average.eps'
plot,t_c,imp21_mean,title=ID+': imp21-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)';,$
     yrange=[min(imp21_mean-imp21_err),max(imp21_mean+imp21_err)]

oplot,t_c,(imp21_mean-imp21_err),linestyle=5,thick=4
oplot,t_c,(imp21_mean+imp21_err),linestyle=5,thick=4
device,/close

save,impv12,impv21,filename='./output/'+ID+'_imp.sav'

pg_initgraph

;gp_sort,ID



if fft_analyser then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,size*n_elements(bpv[0,*,0]))
timeax_new=timeax[0:size*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
if f_le EQ fmax then begin
gp_resample,data_low,timeax_new,(2/winlength)
gp_resample,data_high,timeax_new2,(2/winlength)
endif

;Using 2-channel Fourier-analyser
gp_analyse,shot,ID+pg_num2str(bands[0])+'-'+pg_num2str(bands[1]),ID+pg_num2str(bands[2])+'-'+pg_num2str(bands[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/size,hann=0

gp_analyse,shot,ID+pg_num2str(bands[2])+'-'+pg_num2str(bands[3]),ID+pg_num2str(bands[0])+'-'+pg_num2str(bands[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/size,hann=0

;Plotting other custom functions
blocksize=n_elements(data_low)/size
cohphase=gp_cohphasef(data_low,data_high,blocksize,hann=0,meanapsd1=meanapsd1,meanapsd2=meanapsd2,meancpsd=meancpsd,errapsd1=errapsd1,errapsd2=errapsd2,errcpsd=errcpsd)
errphase=1/!PI/(1+cohphase[*,1]^2)*imaginary(meancpsd)/float(meancpsd)*$
	sqrt((Imaginary(errcpsd)/Imaginary(meancpsd))^2+(Float(errcpsd)/Float(meancpsd))^2) ;Gauss
errphase[0]=1e-10

f=findgen(floor(blocksize/2.)+1)
f=f/max(f)
fn=(1/(timeax_new[2]-timeax_new[1])/2.)
faxis=f*fn/1000

pg_initgraph,/print
device,filename='./output/'+ID+'_phase-error.eps'
plot,faxis,cohphase[0:blocksize/2-1,1],ystyle=1,thick=4,charthick=3,charsize=2
oplot,faxis,cohphase[0:blocksize/2-1,1]-errphase[0:blocksize/2-1],linestyle=5
oplot,faxis,cohphase[0:blocksize/2-1,1]+errphase[0:blocksize/2-1],linestyle=5

device,/close
pg_initgraph
;gp_sort,ID

endif

end
