;+
; Name: ECE_FULL_RECONSTR
;
; Purpose: Reconstruction of ECE signals from harmonic components by STFT
;
; Input:
;	recalculate: recalculate STFT with nti_wavelet_main.pro, default is restoring .sav file
;	point: center of investigated time interval
;	ch: number of investigated channel
;	modes: number of upper harmonics taking into account
;	modify: manually modify phase or frequency in the reconstruction
;	eps: save reconstruction to .eps file
;	stft_length: the length of the window in number os data points
;	stft_fres: number of frequency samlpes of STFT in number of frequency points
;	stft_step: length of time steps of STFT in number of data points
;-


pro ece_full_reconstr, recalculate = recalculate, point = point, ch = ch, modes = modes, modify = modify, eps = eps, $
	stft_length = stft_length, stft_fres = stft_fres, stft_step = stft_step


;****************
;* SET DEFAULTS *
;****************

;Semi hard-wired input parameters :)
band = 10		;search for 2nd harmonic in [2*f1-band, 2*f1+band]
error = 1		;calculate error of STFT
deviation = 0.07	;uncertainty of ECE signals

;Set defaults
nti_wavelet_default, recalculate, 0
nti_wavelet_default, point, 2.473
nti_wavelet_default, ch, 0
nti_wavelet_default, modes, 3
nti_wavelet_default, modify, 0
nti_wavelet_default, eps, 0
nti_wavelet_default, stft_length, 32
nti_wavelet_default, stft_fres, 320
nti_wavelet_default, stft_step, 16;8

;Define colors for plot
pg_initgraph
!p.charsize = 3
loadct, 39
blue = 64
cyan = 96
green = 160
yellow = 192
red = 224
white = 255
colors = [red, green, blue, cyan]

;Create user symbol
ang = 2*!PI*findgen(49)/48.
xarr = cos(ang)  &  yarr = sin(ang)
usersym, 2*xarr, 2*yarr, /fill


;******************
;* CALCULATE STFT *
;******************

;Create filename of .sav file
filen = 'ece_stft_length_'+pg_num2str(stft_length)+$
	'_fres_'+pg_num2str(stft_fres)+'_step_'+pg_num2str(stft_step)+'.sav'

;Check existence of .sav file:
exist = file_test(filen)

if ((not exist) or recalculate) then begin

;Calculating STFT
  restore, 'AUG_25091_all_ECE.sav'
  data = ece_data.data
  timeax = ece_data.time
  n = n_elements(data(*,0))
  errdata = deviation*data

  ;Run nti_wavelet_main
  nti_wavelet_main,$
  ; Input
    data=data, errdata=errdata, dtimeax=timeax, chpos=phi, expname=expname, shotnumber=shotnumber, $
    transf_selection=1, stft_details=1, cwt_selection=0, stft_selection=1, $
    stft_length=stft_length, stft_fres=stft_fres, stft_step=stft_step, $
    freq_min=0, $
    crosstr_selection=1, coh_selection=0, $
    transfer_selection=0, mode_selection=0, $
  ; Output
    timeax=stft_timeax, freqax=freqax, scaleax=scaleax, transforms=transforms, smoothed_apsds=smoothed_apsds,$
    crosstransforms=crosstransforms, smoothed_crosstransforms=smoothed_crosstransforms,$
    coherences=coherences, transfers=transfers, modenumbers=modenumbers, qs=qs, $
    channels=channels, channelpairs_used=channelpairs_used, $
    stft_window=stft_window, detailed_transforms=detailed_transforms, detailed_crosstransforms=detailed_crosstransforms, $
    error=error

abs_errs=detailed_transforms.abs.error
phase_errs=detailed_transforms.phase.error
stft_ed=detailed_transforms.ed.value
err_ed=detailed_transforms.ed.error

    print, 'Saving data to '+filen+'!'
    save, n, errdata, stft_timeax, freqax, transforms, channels, stft_window, $
	abs_errs, phase_errs, stft_ed, err_ed, error, filename = filen

endif else begin

;Loading data
  print, 'Loading data from '+filen+'!'
  restore, 'AUG_25091_all_ECE.sav'
  data = ece_data.data
  timeax = ece_data.time
  restore, filen

endelse


;*************************
;* CREATE RECONSTRUCTION *
;*************************

;Search index of investigated time point
  ;timeax of STFT
  inds = where((stft_timeax-point) eq min(stft_timeax-point, /abs))
  inds = inds(0)
  ;timeax of the measured signal
  indt = where((timeax-stft_timeax(inds)) eq min(timeax-stft_timeax(inds), /abs))
  indt = indt(0)

;Initialize arrays
ch_plot = ch
amps = dblarr(60,modes)
amp_errs = dblarr(60,modes)

for ch = 0, 59 do begin

  ;Indices of peaks
  find = where(stft_ed(ch,inds,40:85) eq max(stft_ed(ch,inds,40:85)))
  find = find(0)+40
  for i = 2, modes do begin
    tmp = where(stft_ed(ch,inds,i*find(0)-band:i*find(0)+band) eq max(stft_ed(ch,inds,i*find(0)-band:i*find(0)+band)))
    find = [find, tmp(0) + i*find(0) - band]
  endfor

  ;Frequency of the modes
  freq = 1d3*freqax(find)
  ;Energy peaks
  energy = reform(stft_ed(ch,inds,find))
  ;Phases
  phase = reform(atan(transforms(ch,inds,find), /phase))
  ;Amplitudes
  dt = (timeax(n-1)-timeax(0))/(n-1)
  sigmaf = 1/(!pi*stft_length*dt)
  amp = sqrt(2*energy*sigmaf*sqrt(!pi))

  ed_err = err_ed(ch,inds,find)
  amp_err = sigmaf*sqrt(!pi)*ed_err/amp

  amps(ch, *) = amp
  amp_errs(ch, *) = amp_err

endfor

;********************************************************************
;********************************************************************
;********************************************************************
  ch = ch_plot
  ;Indices of peaks
  find = where(stft_ed(ch,inds,40:85) eq max(stft_ed(ch,inds,40:85)))
  find = find(0)+40
  for i = 2, modes do begin
    tmp = where(stft_ed(ch,inds,i*find(0)-band:i*find(0)+band) eq max(stft_ed(ch,inds,i*find(0)-band:i*find(0)+band)))
    find = [find, tmp(0) + i*find(0) - band]
  endfor
  ;Frequency of the modes
  freq = 1d3*freqax(find)
  ;Energy peaks
  energy = reform(stft_ed(ch,inds,find))
  ;Phases
  phase = reform(atan(transforms(ch,inds,find), /phase))
  ;Amplitudes
  dt = (timeax(n-1)-timeax(0))/(n-1)
  sigmaf = 1/(!pi*stft_length*dt)
  amp = sqrt(2*energy*sigmaf*sqrt(!pi))
;********************************************************************
;********************************************************************
;********************************************************************


;****************
;* CREATE PLOTS *
;****************


;PEAKS ON ENERGY_DENSTIY
;-----------------------
window, 0

  ;Plot energy density
  plot, freqax, stft_ed(ch_plot,inds,*), title = 'STFT', ytitle = 'Energy density [eV!E2!N Hz!E-1!N]', /xstyle
  for i = 0, modes-1 do $
    oplot, [freqax(find(i)), freqax(find(i))], [0, 2*max(stft_ed(ch_plot,inds,*))], linestyle = 2, color = red

;PLOT Amplitudes
;-----------

if eps then begin
  pg_initgraph, /print
  !p.font = 0
  device, filename = 'Amplitudes_time: '+pg_num2str(timeax(indt))+' s_channel: '+channels(ch_plot)+'.eps'
endif else begin
  window, 1
endelse

  rad = ece_data.info.R
  plot, rad, 1d-3*amps(*,0), /nodata, xrange = [1.75,2.0], xtitle = 'Radial position [m]', ytitle = 'dT!De!N [keV]', yrange = [0, 1.6], /ystyle
  for i = 0, modes-1 do begin
    oplot, rad, 1d-3*amps(*,i), psym = 8, color = colors(i mod 4)
  endfor
  for i = 0, modes-1 do begin
    oplot, rad, 1d-3*amps(*,i), color = colors(i mod 4), thick = 10
    errplot, rad, 1d-3*(amps(*,i)-amp_errs(*,i)), 1d-3*(amps(*,i)+amp_errs(*,i)), color = colors(i mod 4), thick = 5
  endfor
  
if eps then begin
  device, /close
  pg_initgraph
endif

;RECONSTRUCTION
;--------------

  ;Create timeax for reconstruction:
  tim = timeax(indt-35:indt+35)
  tim = tim-mean(tim)

  ;Crop measured signal
  meas = data(indt-35:indt+35,ch_plot)

  ;Calculate average value
  avg = mean(meas)

  ;Create reconstruction
  fit = avg
  for i = 0, modes-1 do $
    fit = fit + amp(i)*cos(2*!pi*freq(i)*tim + phase(i))

  ;Calculate residuals
  residuals = (meas-fit)/(deviation*meas)

if eps then begin
  pg_initgraph, /print
  !p.font = 0
  device, filename = 'Reconstruction_time: '+pg_num2str(timeax(indt))+' s_channel: '+channels(ch_plot)+'.eps'
endif else begin
  window, 2
endelse

  ;Plot measured signal and errors
  plot, 1d3*tim, 1d-3*meas, psym=-4, title = 'Reconstruction @ time: '+pg_num2str(timeax(indt))+' s @ channel: '+channels(ch_plot), ytitle = 'T!De!N [keV]', thick = 10, xrange = [-1,1]
  errplot, 1d3*tim, 1d-3*(1-deviation)*meas, 1d-3*(1+deviation)*meas, thick = 5
  ;Plot reconstruction
  oplot, 1d3*tim, 1d-3*fit, psym=-1, color = red, thick = 10
  ;Plot components
  for i = 0, modes-1 do $
    oplot, 1d3*tim, 1d-3*(max(meas)/3 + amp(i)*cos(2*!pi*freq(i)*tim + phase(i))), color = colors(i mod 4), thick = 10
if eps then begin
  device, /close
  pg_initgraph
endif

if eps then begin
  pg_initgraph, /print
  !p.font = 0
  device, filename = 'Residuals: '+pg_num2str(timeax(indt))+' s_channel: '+channels(ch_plot)+'.eps'
endif else begin
  window, 3
endelse

  ;Plot residuals
  plot, 1d3*tim, residuals, psym = 8, yrange = [-1.2, 1.2], thick = 10, ytitle = 'Residuals', xtitle = 'Relative time [ms]', /ystyle, xrange = [-1,1]
  oplot, 1d3*tim, residuals, thick = 10
  oplot, [min(1d3*tim)-0.5, max(1d3*tim)+0.5], [1,1], linestyle = 2, color = red, thick = 10
  oplot, [min(1d3*tim)-0.5, max(1d3*tim)+0.5], [0,0], linestyle = 1, color = red, thick = 10
  oplot, [min(1d3*tim)-0.5, max(1d3*tim)+0.5], [-1,-1], linestyle = 2, color = red, thick = 10
if eps then begin
  device, /close
  pg_initgraph
endif

!p.charsize = 0

end