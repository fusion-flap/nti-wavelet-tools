pro stft_error_mc_test, iteration = iteration

restore, 'ece_signal_ntiwt.sav'
data = data(*,0:1)
n = n_elements(data(*,0))
errdata = 0.1*data
fixtimeax = timeax

channels = channels(0:1)
phi = [0,0]
theta = [0,0]


nti_wavelet_default, iteration, 1d3

timeax = fixtimeax
;Run nti_wavelet_main
  nti_wavelet_main,$
  ; Input
    data=data, errdata=errdata, dtimeax=timeax, chpos=[0,0], expname='STFT_EP', shotnumber='1234', $
    transf_selection=1, cwt_selection=0, stft_selection=1, $
    stft_length=50, stft_fres=500, stft_step=10, $
    freq_min=0, $;freq_max=200,$
    crosstr_selection=0, coh_selection=0, $
    transfer_selection=0, mode_selection=0, $
  ; Output
    timeax=timeax, freqax=freqax, scaleax=scaleax, transforms=transforms, smoothed_apsds=smoothed_apsds,$
    crosstransforms=crosstransforms, smoothed_crosstransforms=smoothed_crosstransforms,$
    coherences=coherences, transfers=transfers, modenumbers=modenumbers, qs=qs, $
    channels=channels, channelpairs_used=channelpairs_used, $
    stft_window=stft_window, abs_errs=abs_errs, phase_errs=phase_errs, error=1, $
    stft_ed=stft_ed, err_ed=err_ed

energy_density = stft_ed
stft = transforms
transforms = 0

stop

;Monte Carlo

;Initialize arrays
transformsize=size(stft)

abs_sums=fltarr(2,transformsize(2),transformsize(3))
abs_sum_2s=fltarr(2,transformsize(2),transformsize(3))

phase_sums=fltarr(2,transformsize(2),transformsize(3))
phase_sum_2s=fltarr(2,transformsize(2),transformsize(3))

;Time indicator
time = systime(1)

i = long(0)
while (i lt iteration) do begin
  ;Perturbating signal
  timeax = fixtimeax
  pert_data = data + errdata*randomn(seed, n, 2)

  ;STFT of perturbated signal
  ;Run nti_wavelet_main
  nti_wavelet_main,$
  ; Input
    data=pert_data, dtimeax=timeax, chpos=[0,0], expname='STFT_EP', shotnumber='1234', $
    transf_selection=1, cwt_selection=0, stft_selection=1, $
    stft_length=50, stft_fres=500, stft_step=10, $
    freq_min=0, $;freq_max=200,$
    crosstr_selection=0, coh_selection=0, $
    transfer_selection=0, mode_selection=0, $
  ; Output
    transforms=transforms, error=0, stft_ed=stft_ed

  ;Saving
  abs_sums = abs_sums + abs(stft_ed)
  abs_sum_2s = abs_sum_2s + (abs(stft_ed))^2

  phase_sums = phase_sums + atan(transforms, /phase)
  phase_sum_2s = phase_sum_2s + (atan(transforms, /phase))^2

  ;Status bar
  if ((i mod 100) eq 0) then begin
    print, 'MONTE CARLO: ', 100.*i/iteration,' %'
  endif

 i = i+1

endwhile

;Time indicator
print, 'Time: ', (systime(1) - time), ' s'



abs_dev = sqrt(abs_sum_2s/iteration - (abs_sums/iteration)^2)
phase_dev = sqrt(phase_sum_2s/iteration - (phase_sums/iteration)^2)

stop

end
