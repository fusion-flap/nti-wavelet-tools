;+
; Name: ECE_RECONSTRUCTION
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


pro ece_reconstruction, recalculate = recalculate, point = point, ch = ch, modes = modes, modify = modify, eps = eps, $
	stft_length = stft_length, stft_fres = stft_fres, stft_step


;****************
;* SET DEFAULTS *
;****************

;Semi hard-wired input parameters :)
band = 10		;search for 2nd harmonic in [2*f1-band, 2*f1+band]
error = 0		;calculate error of STFT
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
nti_wavelet_default, stft_step, 8

;Define colors for plot
pg_initgraph
loadct, 39
blue = 64
cyan = 96
green = 160
yellow = 192
red = 224
white = 255

;Create user symbol
ang = 2*!PI*findgen(49)/48.
xarr = cos(ang)  &  yarr = sin(ang)
usersym, xarr, yarr, /fill


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
  restore, 'ece_signal_ntiwt.sav'
  n = n_elements(data(*,0))
  errdata = deviation*data

  ;Run nti_wavelet_main
  nti_wavelet_main,$
  ; Input
    data=data, errdata=errdata, dtimeax=timeax, chpos=phi, expname=expname, shotnumber=shotnumber, $
    transf_selection=1, cwt_selection=0, stft_selection=1, $
    stft_length=stft_length, stft_fres=stft_fres, stft_step=stft_step, $
    freq_min=0, $
    crosstr_selection=0, coh_selection=0, $
    transfer_selection=0, mode_selection=0, $
  ; Output
    timeax=stft_timeax, freqax=freqax, scaleax=scaleax, transforms=transforms, smoothed_apsds=smoothed_apsds,$
    crosstransforms=crosstransforms, smoothed_crosstransforms=smoothed_crosstransforms,$
    coherences=coherences, transfers=transfers, modenumbers=modenumbers, qs=qs, $
    channels=channels, channelpairs_used=channelpairs_used, $
    stft_window=stft_window, abs_errs=abs_errs, phase_errs=phase_errs, stft_ed=stft_ed, err_ed=err_ed, error=error

    print, 'Saving data to '+filen+'!'
    save, n, errdata, stft_timeax, freqax, transforms, channels, stft_window, $
	abs_errs, phase_errs, stft_ed, err_ed, error, filename = filen

endif else begin

;Loading data
  print, 'Loading data from '+filen+'!'
  restore, 'ece_signal_ntiwt.sav'
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

;Indices of peaks
find = where(stft_ed(ch,inds,*) eq max(stft_ed(ch,inds,*)))
find = find(0)
for i = 2, modes do begin
  tmp = where(stft_ed(ch,inds,i*find(0)-band:i*find(0)+band) eq max(stft_ed(ch,inds,i*find(0)-band:i*find(0)+band)))
  find = [find, tmp(0) + i*find(0) - band]
endfor

;Frequency of the modes
freq = 1d3*freqax(find)
if modify then begin
print, '*********************************************'
  print, 'Modify frequency of components [freq]!'
  print, freq
  stop
print, '*********************************************'
endif

;Energy peaks
energy = reform(stft_ed(ch,inds,find))

;Phases
phase = reform(atan(transforms(ch,inds,find), /phase))
if modify then begin
print, '*********************************************'
  print, 'Modify the phase [phase]!'
  print, phase
  stop
print, '*********************************************'
endif

;Amplitudes
dt = (timeax(n-1)-timeax(0))/(n-1)
sigmaf = 1/(!pi*stft_length*dt)
amp = sqrt(2*energy*sigmaf*sqrt(!pi))

;****************
;* CREATE PLOTS *
;****************


;PEAKS ON ENERGY_DENSTIY
;-----------------------
window, 0, xpos = 0
!p.multi = [0,1,2]

  ;Plot energy density
  plot, freqax, stft_ed(ch,inds,*), title = 'STFT', ytitle = 'Energy density [eV!E2!N Hz!E-1!N]', /xstyle
  for i = 0, modes-1 do $
    oplot, [freqax(find(i)), freqax(find(i))], [0, 2*max(stft_ed(ch,inds,*))], linestyle = 2, color = red
  ;Plot phase
  plot, freqax, atan(transforms(ch,inds,*), /phase), xtitle = 'Frequency [kHz]', ytitle = 'Phase [rad]', $
    yrange = [-!pi, !pi], /xstyle, /ystyle
  for i = 0, modes-1 do $
    oplot, [freqax(find(i)), freqax(find(i))], [-!pi, !pi], linestyle = 2, color = red

;PLOT PHASES
;-----------
window, 1, xpos = 0, ypos = 200, ysize = 200
!p.multi = [0,modes,1]

  ;Plot phases
  for i = 0,modes-1 do begin
    plot, freqax(find(i)-band:find(i)+band), atan(transforms(ch,inds,find(i)-band:find(i)+band), /phase), $
	xtitle = 'Frequency [kHz]', ytitle = 'Phase [rad]', /ystyle, thick = 2, charsize = 2
    oplot, freqax(find(i)-band:find(i)+band), atan(transforms(ch,inds,find(i)-band:find(i)+band), /phase), $
	psym = 8, color = red
  endfor

;RECONSTRUCTION
;--------------
window, 2, xpos = 700, ysize = 800

  ;Create timeax for reconstruction:
  tim = timeax(indt-30:indt+30)
  tim = tim-mean(tim)

  ;Crop measured signal
  meas = data(indt-30:indt+30,ch)

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
  device, filename = 'Reconstruction_time: '+pg_num2str(timeax(indt))+' s_channel: '+channels(ch)+'.eps'
endif

  !p.multi = [0,1,2]

  ;Plot measured signal and errors
  plot, 1d3*tim, meas, psym=-4, title = 'Reconstruction @ time: '+pg_num2str(timeax(indt))+' s @ channel: '+channels(ch), ytitle = '[T!De!N]'
  errplot, 1d3*tim, (1-deviation)*meas, (1+deviation)*meas
  ;Plot reconstruction
  oplot, 1d3*tim, fit, psym=-1, color = red, thick = 2
  ;Plot components
  colors = [red, green, blue, cyan]
  for i = 0, modes-1 do $
    oplot, 1d3*tim, max(meas)/3 + amp(i)*cos(2*!pi*freq(i)*tim + phase(i)), color = colors(i mod 4)

  ;Plot residuals
  plot, 1d3*tim, residuals, psym = -1, yrange = [-1.5, 1.5], thick = 2, ytitle = 'Residuals', xtitle = 'Relative time [ms]', /ystyle
  oplot, [min(1d3*tim)-0.5, max(1d3*tim)+0.5], [1,1], linestyle = 2, color = red
  oplot, [min(1d3*tim)-0.5, max(1d3*tim)+0.5], [0,0], linestyle = 1, color = red
  oplot, [min(1d3*tim)-0.5, max(1d3*tim)+0.5], [-1,-1], linestyle = 2, color = red

if eps then begin
  device, /close
  pg_initgraph
endif


;*****************
;* PRINT RESULTS *
;*****************

print, '*********************************************'
print, 'Frequency of the modes [kHz]: ', 1d-3*freq
print, 'Phase of the modes [rad]: ', phase
print, 'Residuals: max ', max(residuals, /abs), ' @ avg ', mean(abs(residuals))
print, '*********************************************'


end