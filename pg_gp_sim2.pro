pro pg_gp_sim2,number=number,shot=shot,time=time,norm=norm,sigma=sigma,Rnull=Rnull,plot=plot,$
            snr=snr, modenumber=modenumber,t_drop=t_drop,$
            t_rec=t_rec, myburst=myburst,realgeometry=realgeometry

nti_wavelet_default,PHIsurf,13.5
nti_wavelet_default,shot,47941
nti_wavelet_default,number,shot
nti_wavelet_default,time,0.5

nti_wavelet_default,n,1000
nti_wavelet_default,m,300
nti_wavelet_default,perturb_pos,3.
nti_wavelet_default,sigma,0.5
nti_wavelet_default,c,1
nti_wavelet_default,modenumber,3
nti_wavelet_default,reffon,1
nti_wavelet_default,realgeometry,1
nti_wavelet_default,plot,0

norm=keyword_set(norm)

raxis=fltarr(10,100)
zaxis=fltarr(10,100)
raxis_new=fltarr(n,100)
zaxis_new=fltarr(n,100)
raxis_interpolated=fltarr(n,m)
zaxis_interpolated=fltarr(n,m)

temp=fltarr(2,1000)

;FLUXDATA READING

path='data/fluxdata_beta/'
filename='fluxsurfshot_'+nti_wavelet_i2str(shot)+'_time_'+pg_num2str(time,length=4)+'_phi_'+pg_num2str(PHIsurf, length=4)+$
	'_beta_0.000'+'.dat'
if NOT realgeometry then filename='fluxsurfshot_47941_time_'+pg_num2str(time,length=4)+'_phi_'+pg_num2str(PHIsurf, length=4)+$
	'_beta_0.000'+'.dat'
file=path+filename

openr,1,file
readf,1,temp
close,1


r0=0
z0=0
if norm then begin
r0=temp[0,0]
y0=temp[1,0]
endif

for i=0, 9 do begin
   for j=0, 99 do begin
	raxis(i,j)=temp[0,i*100+j]-r0
	zaxis(i,j)=temp[1,i*100+j]-z0
   endfor
endfor

r0=temp[0,0]
z0=temp[1,0]
rn0=0
zn0=0
if norm then begin
rn0=r0
yn0=z0
endif

for i=0, 9 do begin
   for j=0, 99 do begin
	raxis(i,j)=temp[0,i*100+j]-rn0
	zaxis(i,j)=temp[1,i*100+j]-zn0
   endfor
endfor


;INTERPOLATING

for k=0,99 do begin
raxis_new[*,k]=interpol(raxis[*,k],n)
zaxis_new[*,k]=interpol(zaxis[*,k],n)
endfor

for k=0,n-1 do begin
raxis_interpolated[k,*]=interpol(raxis_new[k,*],m)
zaxis_interpolated[k,*]=interpol(zaxis_new[k,*],m)

endfor

;Mirnov positions

mir_dist_orig=[27.85,32.85,38.8,36.45,31.9,27.3,24.8,25.05,27.25,30.4,36.4,39.1,33.1,26.15,24.6,25.6] ;W7-AS MIR-1
mir_theta=[10,30,50,85,100,120,145,165,185,200,220,255,275,305,340,355]/180.*!PI ; W7-AS MIR-1

mirpos_r=mir_dist_orig*cos(mir_theta)+r0
mirpos_z=mir_dist_orig*sin(mir_theta)+z0

;Testing data reading and interpolation
if plot then begin
plot,raxis_interpolated,zaxis_interpolated,PSYM=3,title='interpolated fluxsurf in shot '+nti_wavelet_i2str(shot)+', n='+nti_wavelet_i2str(n)+' m='+nti_wavelet_i2str(m), xrange=[160,240],yrange=[-50,50]
oplot, mirpos_r,mirpos_z,PSYM=7
endif



;CREATING CYLINDRICAL COORDINATES

raxis_cylindrical=fltarr(n,m)
zaxis_cylindrical=fltarr(n,m)

;getting effective radius
refflast=[12.7272,12.727,12.7272,12.7246,12.7273,12.7268,12.5331,12.5322,12.5326,12.5317,12.533]
if realgeometry then begin
	if shot EQ 47941 then refflast0=17.9153 else refflast0=refflast(shot-52123)
endif else begin
	refflast0=17.9153
endelse

Rnull=refflast0-perturb_pos
;creating reff vector
reff=fltarr(n)
for i=0,n-1 do reff(i)=i*refflast0/n

;calculating cylindrical coordinates

for i=0, n-1 do begin
   for j=0, m-1 do begin
	raxis_cylindrical(i,j)=reff(i)*cos(2*j*!PI/m)+r0
	zaxis_cylindrical(i,j)=reff(i)*sin(2*j*!PI/m)+z0
     endfor
endfor

;plot,raxis_cylindrical, zaxis_cylindrical

;CALCULATING jr VECTOR

gauss=fltarr(n)
jr=fltarr(n)

for i=0,n-1 do gauss(i)=exp((-(reff(i)-Rnull)^2)/2/sigma^2)
for i=0, n-1 do jr(i)=exp(-((reff(i)-Rnull)^2)/2/sigma^2)*(1-reff(i)*(reff(i)-Rnull)/2/sigma^2)

if plot then begin
window, /free
plot, reff, gauss, xrange=[0,20], title='Surusegeloszlas hengerben'
window,/free
plot, reff, jr, xrange=[0,20], title='Arameloszlas hengerben'
endif
;CALCULATING jt MATRIX

jt=complexarr(n,m)

for i=0, n-1 do begin
   for j=0, m-1 do begin
      jt(i,j)=c*jr(i)*exp(COMPLEX(0,1)*modenumber*2*j*!PI/m);cos(modenumber*j*!PI/m)
     endfor
   endfor
if plot then isurface,jt,raxis_cylindrical,zaxis_cylindrical,title='jt'

;CALCULATING Is MATRIX

Is=complexarr(n,m)
d=reff(1)-reff(0)

if reffon then begin
for i=0, n-1 do begin
   for j=0, m-1 do begin
      Is(i,j)=jt(i,j)*(2*!PI/m)*(2*d*reff(i))
   endfor
endfor
endif else begin
for i=0, n-1 do begin
   for j=0, m-1 do begin
      Is(i,j)=jt(i,j)*(2*!PI/m)*(2*d);*reff(i))
   endfor
endfor
endelse



if plot then isurface,Is,raxis_interpolated,zaxis_interpolated, title='I'

;CALCULATING B at MIRNOV-COIL POSITIONS
;c2=mu0/(2*!PI)
B=complexarr(16)

if realgeometry then begin
for k=0,15 do begin
   for i=0, n-1 do begin
      for j=0, m-1 do begin
         B(k)=B(k)+Is(i,j)/sqrt((mirpos_r(k)-raxis_interpolated(i,j))^2+(mirpos_z(k)-zaxis_interpolated(i,j))^2)
      endfor
   endfor
endfor
endif else begin
for k=0,15 do begin
   for i=0, n-1 do begin
      for j=0, m-1 do begin
         B(k)=B(k)+Is(i,j)/sqrt((mirpos_r(k)-raxis_cylindrical(i,j))^2+(mirpos_z(k)-zaxis_cylindrical(i,j))^2)
      endfor
   endfor
endfor
endelse




;GENERATING SIGNAL (gp_mod_signal.pro)
f_sampling=333333.;500000.
nti_wavelet_default,freq,25e3
nti_wavelet_default,trange,[0.4,0.6]

dt=1/f_sampling
length=(trange[1]-trange[0])/dt
timeax=trange[0]+findgen(length)/length*(trange[1]-trange[0])
nti_wavelet_default,t_drop,5e-3
nti_wavelet_default,t_rec,20e-3
nti_wavelet_default,snr,2
nti_wavelet_default,myburst,0

if myburst then begin
   signal=sin(freq*2*!PI*timeax)
   t_event=findgen(10*t_rec*length)/length
   burst=(1-exp(-t_event/t_drop))*exp(-t_event/t_rec)
   n_event=1./10/t_rec
   burst_length=n_elements(burst)
   modulation=fltarr(length)
   for i=0,n_event-1 do modulation[i*burst_length : (i+1)*burst_length-1]=burst
   mod_signal=signal*modulation
endif else begin
;data from pg_sim.pro
;   burstlength=(trange[1]-trange[0])/(10*t_rec)
   freq2=freq/1000
   mod_signal=pg_sim(bs=freq2,trange=trange,snr=snr,dt=dt,burstlength=100,burstdens=0.5)
endelse


;CALCULATING TIME-DEPENDING SIGNAL PART (gp_deriv.pro)
spectrum=FFT(mod_signal-mean(mod_signal))
faxis=findgen(floor(n_elements(spectrum)/2.)+1)
faxis=faxis/max(faxis)*(1/(timeax[2]-timeax[1])/2.)

faxis2=findgen(n_elements(spectrum))
faxis2=faxis2/max(faxis2)*(1/(timeax[2]-timeax[1]))

;t_signal=FFT(-COMPLEX(0,1)*faxis2*2*spectrum/max(faxis2),/inverse)

;CALCULATING MIRNOV DATA
mir_w=complexarr(16,n_elements(spectrum))
for i=0,15 do mir_w(i,*)=B(i)*spectrum*COMPLEX(0,1)*faxis2*2/max(faxis2)
mir_t=fltarr(16,n_elements(spectrum))
for i=0,15 do mir_t(i,*)=real_part(FFT(-mir_w(i,*),/inverse))

mir=fltarr(16,n_elements(mir_t(0,*)))

for i=0,15 do mir(i,*)=mir_t(i,*)+sqrt(total((mir_t(i,*))^2)/length/snr)*randomn(seed,length)


;DATA SAVING
data=dblarr(n_elements(mir[0,*]))
for i=0,15 do begin
	fn='data/'+nti_wavelet_i2str(number)+'_gp_sim_channel_'+nti_wavelet_i2str(i+1)+'.sav'
	data=reform(mir[i,*])
	sampletime=dt
	starttime=trange(0)
	endtime=trange(1)
	save,data,sampletime,starttime,endtime,filename=fn
endfor

end


