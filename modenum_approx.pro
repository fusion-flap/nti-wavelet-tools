;+
;NAME: modenum_approx
;
; Written by: Nora Lazanyi (laznor@reak.bme.hu) 2010.09.22.
;
; Purpose: Plot approximated mode numbers on the time-frequency plane 
;          from AUG B31-01 and B31-03 coils using Snipe's method [Snipes_PPCF_43_L23_2001]
;
; Calling sequence:
;    modenum_approx, shot, trange=trange, fmax=fmax, nscale=nscale, $
;    cwt=cwt, family=family, order=order, pitch_angle=pitch_angle,$
;    avr=avr, cohlim=cohlim, print=print, timeax=timeax,freqax=freqax, modenum=modenum
;
; Inputs:
;   shot: Shot number
;   timeax: Time axis
;   freqax: Frequency axis
;   trange: Time range
;   fmax: The maxima of frequency
;   filterparam1: mode number steps, default=1
;   cwt: calculate with continuous wavelet transform
;   pitch_angle: =arctan(B_pol/B_tor) Can be calculated with aug_get_magnetic_field.pro 
;
; Outputs:
;   timeax: Time axis
;   freqax: Frequency axis
;   modenum: The approximated mode numbers
;
; Example:
;    modenum_approx, 22188, trange=[4.395,4.415],fmax=200., /cwt, order=12, pitch_angle=0.1898, /print
;    save, /all, filename='data/AUG_modenum_approx_22188_4.395_ord_12.sav'
;
; Modification:
;  2010.10.11. Nora Lazanyi: Plot the coherence limited mode numbers 
;-


pro modenum_approx, shot, trange=trange, fmax=fmax, nscale=nscale, cwt=cwt, family=family, order=order, pitch_angle=pitch_angle,$
 avr=avr, cohlim=cohlim, print=print, timeax=timeax,freqax=freqax, modenum=modenum

print=keyword_set(print)
cwt=keyword_set(cwt)
if not(keyword_set(fmax)) then fmax=1.0e32
if not(keyword_set(fmin)) then fmin=0.
if not(keyword_set(family)) then family = 'Morlet'
if not(keyword_set(order)) then order=6
if not(keyword_set(avr)) then avr=5
if not(keyword_set(cohlim)) then cohlim=0.5

channels=['AUG_Mirnov/B31-01','AUG_Mirnov/B31-03']
channessize=n_elements(channels)

; Read data, and resize to the size of the first channel, if necessary
get_rawsignal,shot,channels(0),timeax,data,trange=trange
timesize=n_elements(timeax)
fmax=double(fmax)
if timeax(timesize-1)-timeax(0) LT timesize/(fmax*1000*2) then begin
  timesize=floor((timeax(timesize-1)-timeax(0))*fmax*1000*2)
  data=pg_resample(data,timesize)
  timeax=timeax(0)+findgen(timesize)/(fmax*1000*2)
endif
datas=fltarr(n_elements(channels),n_elements(data))
datas(0,*)=data
for i=1,channessize-1 do begin
  get_rawsignal,shot,channels(i),timeax2,data,trange=trange
  if NOT (norm(timeax-timeax2) EQ 0) then begin
    stime=timeax2(1)-timeax2(0)
    shift=(timeax2(0)-timeax(0))/stime
    data=pg_retrigger(data,shift)
    data=pg_resample(data,timesize)
  endif
  datas(i,*)=data
endfor

; Initialize graphics
pg_initgraph,print=print


; Calculate energy-density distributions for channels B31-02 and B31-03
if cwt then begin
  print,'CWT for '+nti_wavelet_i2str(shot)+channels(0)
  time=timeax
  transform=pg_scalogram_sim2(datas(0,*),time,shot=shot,channel=channels(0),trange=trange,family=family,order=order,dscale=dscale,$
    start_scale=start_scale, nscale=nscale, plot=transplot, print=print, poster=poster, /pad, opt=opt, $
    freqax=freqax, scaleax=scaleax)
  transformsize=size(transform)
  transforms=complexarr(channessize,transformsize(1),transformsize(2))
  transforms(0,*,*)=transform
  for i=1,channessize-1 do begin
    print,'CWT for '+nti_wavelet_i2str(shot)+channels(i)
    time=timeax
    transforms(i,*,*)=pg_scalogram_sim2(datas(i,*),time,shot=shot,channel=channels(i),trange=trange,family=family,order=order,dscale=dscale,$
      start_scale=start_scale, nscale=nscale, plot=transplot, print=print, poster=poster, /pad, opt=opt, $
      freqax=freqax, scaleax=scaleax)
  endfor
endif else begin
  print,'STFT for '+nti_wavelet_i2str(shot)+channels(0)
  time=timeax
  transform=pg_spectrogram_sim(datas(0,*),time,shot=shot,channel=channels(0),trange=trange,windowname=windowname, $
    windowsize=windowsize,masksize=masksize,step=step, $
    freqres=freqres, plot=transplot, print=print, poster=poster, log=log, opt=opt, freqax=freqax)
  transformsize=size(transform)
  transformsize(2)=transformsize(2)/2+1 ;Store for positive frequencies only
  transforms=complexarr(channessize,transformsize(1),transformsize(2))
  transforms(0,*,*)=transform(*,0:transformsize(2)-1) ;Store for positive frequencies only
  for i=1,channessize-1 do begin
    print,'STFT for '+nti_wavelet_i2str(shot)+channels(i)
    time=timeax
    transform=pg_spectrogram_sim(datas(i,*),time,shot=shot,channel=channels(i),trange=trange,windowname=windowname, $
      windowsize=windowsize,masksize=masksize,step=step, $
      freqres=freqres, plot=transplot, print=print, poster=poster, log=log, opt=opt, freqax=freqax)
    transforms(i,*,*)=transform(*,0:transformsize(2)-1) ;Store for positive frequencies only
  endfor
endelse
timeax=time ;Set new time axis

;Determining the mode numbers

wavenumber=make_array(transformsize(1),transformsize(2))

amplitude=abs(transforms)

for i=0L,transformsize(1)-1 do begin
 for j=0L, transformsize(2)-1 do begin
  wavenumber(i,j)=alog(amplitude(1,i,j)/amplitude(0,i,j))/0.036
 endfor
endfor

modenumapprox=wavenumber*1.65*tan(pitch_angle)

;Plotting data

if cwt then begin
    title='Approximated mode numbers of shot: '+nti_wavelet_i2str(shot)+' '+channels(0)+' '+channels(1)
    if print then device,filename=pg_filename(title) else window,/free
    pg_plot4,reverse(modenumapprox,2),ct=5,xrange=[min(timeax),max(timeax)],yrange=[min(freqax),max(freqax)]$
      ,/ylog,y2range=[min(-pg_log2(scaleax)),max(-pg_log2(scaleax))], zrange=[0.,10.]$
      ,xtitle='Time (s)',ytitle='Frequency (kHz)',y2title='-log base 2 of scale'$
      ,title=title,data=printdatas, poster=poster
endif

; Calculate coherence between the probes

smoothed_transsize=transformsize
if cwt then begin
    scaleind=where(scaleax LT smoothed_transsize(1)/(avr*2*!PI))
    scaleax=scaleax(scaleind)
    smoothed_transsize(2)=n_elements(scaleax)
    freqax=order/scaleax/(timeax(1)-timeax(0))/1000/2/!PI
  endif


cphases=fltarr(smoothed_transsize(1),smoothed_transsize(2))
cpows=fltarr(smoothed_transsize(1),smoothed_transsize(2))
cohs=fltarr(smoothed_transsize(1),smoothed_transsize(2))
smoothed_apsds=complexarr(channessize,smoothed_transsize(1),smoothed_transsize(2))
smoothed_avrcpsd=fltarr(smoothed_transsize(1),smoothed_transsize(2))     

for i=0,channessize-1 do begin
    if cwt then begin
      ; Chop off the frequencies too low for averaging
      transform=reform(transforms(i,*,scaleind))
      ; Time intergration
      for k=0,smoothed_transsize(2)-1 do $
        smoothed_apsds(i,*,k)=smooth(abs(transform(*,k))^2,ceil(scaleax(k)*avr*2*!PI), /EDGE_TRUNCATE)
    endif
endfor
     

       
    print,'Crosstransforms for '+nti_wavelet_i2str(shot)+'_'+channels(0)+' '+channels(1)
    wait,0.1
    ctrans=conj(reform(transforms(0,*,*)))*reform(transforms(1,*,*)) ; Calculate cross-transform
    ; Smoothing cross-transforms in time for averaging
    if avr GT 0 then begin
      if cwt then begin
        ; Chop off the frequencies too low for averaging
        ctrans=ctrans(*,scaleind)
        ; Time intergration
        for k=0,smoothed_transsize(2)-1 do ctrans(*,k)=smooth(ctrans(*,k),ceil(scaleax(k)*avr*2.*!PI), /EDGE_TRUNCATE)
        ; Calculate coherence
        coh=float(abs(ctrans)/sqrt(reform(smoothed_apsds(0,*,*))*reform(smoothed_apsds(1,*,*))))
      endif else begin
        inttime=avr*windowsize/step
        ; Time intergration
        ctranssize=size(ctrans)
        for k=0,smoothed_transsize(2)-1 do ctrans(*,k)=smooth(ctrans(*,k),inttime, /EDGE_TRUNCATE)
        ; Calculate coherence
        coh=float(abs(ctrans)/sqrt(reform(smoothed_apsds(0,*,*))*reform(smoothed_apsds(1,*,*))))
      endelse
     cohs(*,*)=coh
    endif
    cphases(*,*)=atan(imaginary(ctrans),float(ctrans)) ; Calculate cross-phase
    cpows(*,*)=abs(ctrans) ; Calculate cross-power
    smoothed_avrcpsd=smoothed_avrcpsd+abs(ctrans) ; Calculate cross-power

print, 'Program successfully finished!'

timeax=timeax
freqax=freqax
modenum=modenumapprox

end