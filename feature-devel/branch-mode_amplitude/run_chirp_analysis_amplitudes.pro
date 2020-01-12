pro run_chirp_analysis_amplitudes

; Experiment:
; ###########
  expname = 'AUGD'
  shotnumber = 30809
  trange = [4.800, 4.899]

; STFT resolution:
; ###############
  resample = 200
  stft_length = 100
  stft_fres = long(2000)
  stft_step = 1

; Ridge parameters:
; -----------------
; EPS @3 AUGD:FPP28881.0, rho, t=0.65399998-0.65700001 s
  start_x = 4.854
  bandwidth = 2
  ; Interpolation:
  tdens = 1
  fdens = 2

; Channels:
; ---------
  channels = ['MHA-B31-14']

; Input parameters:
; ----------------
  maxorder = 1
    


; Run chirp_analysis_amplitudes:
channel = channels(0)

chirp_analysis_amplitudes, $ 
; STFT parameters:
  expname = expname, shotnumber = shotnumber, channel = channel, $
  trange = trange, stft_length = stft_length, stft_fres = stft_fres, $
  stft_step = stft_step, resample = resample, $
; Ridge following parameters:
  start_x = start_x, bandwidth = bandwidth, $
; Interpolation:
  tdens = tdens, fdens = fdens, $
; Inputs:
  maxorder = maxorder, $
; Outputs:
  itimeax = itimeax, iridge = iridge, $
  amplitudes = amplitudes, noises = noises, sigma = sigma

; Info for plots:
info = $
  '!Cshot: ' + expname + ' ' + nti_wavelet_i2str(shotnumber) + $
  '!Cwinsize: ' + nti_wavelet_i2str(stft_length) + '!C ' + pg_num2str(2*sigma) + 's' + $
  '!Cfres: ' + nti_wavelet_i2str(stft_fres) + $
  '!Cstep: ' + nti_wavelet_i2str(stft_step)

amps = dblarr(n_elements(channels), maxorder + 1, n_elements(itimeax))
errors = dblarr(n_elements(channels), maxorder + 1, n_elements(itimeax))

amps(0, *, *) = amplitudes(*, *)
errors(0, *, *) = noises(*, *)
  
for i = 1, n_elements(channels) - 1 do begin

  channel = channels(i)
  
  ; Run chirp_analysis_amplitudes:
  chirp_analysis_amplitudes, $ 
  ; STFT parameters:
    expname = expname, shotnumber = shotnumber, channel = channel, $
    trange = trange, stft_length = stft_length, stft_fres = stft_fres, $
    stft_step = stft_step, resample = resample, $
  ; Ridge following parameters:
    start_x = start_x, bandwidth = bandwidth, $
  ; Interpolation:
    tdens = tdens, fdens = fdens, $
  ; Inputs:
    maxorder = maxorder, $
  ; Outputs:
    itimeax = itimeax, iridge = iridge, $
    amplitudes = amplitudes, noises = noises

  amps(i, *, *) = amplitudes(*, *)
  errors(i, *, *) = noises(*, *)

endfor


; Info for plots:
info = $
  '!Cshot: ' + expname + ' ' + nti_wavelet_i2str(shotnumber) + $
  '!Cwinsize: ' + nti_wavelet_i2str(stft_length) + '!C ' + pg_num2str(2*sigma) + 's' + $
  '!Cfres: ' + nti_wavelet_i2str(stft_fres) + $
  '!Cstep: ' + nti_wavelet_i2str(stft_step)

; Use time points where all of the amplitude values are valid (>0):
valid = intarr(n_elements(itimeax))
for i = 0, n_elements(itimeax) - 1 do $
  if min(amps(*, 0, i)) ne 0 then valid(i) = 1

vtimeax = itimeax(where(valid))
vamps = amps(*, *, where(valid))
verrors = errors(*, *, where(valid))

; Shorten name of channels
for i = 0, n_elements(channels) - 1 do begin
  channels(i) = strmid(channels(i), 4)
endfor


; Plot amplitudes:
nti_wavelet_plot_1d, vtimeax, reform(vamps(*, 0, *), [1, n_elements(vtimeax)]), $
  error = reform(verrors(*, 0, *), [1, n_elements(vtimeax)]), /errstyle, $
  legend = channels, $
  yrange = [0, 1.1*max(reform(vamps(*, 0, *), [1, n_elements(vtimeax)]))], $
  title = 'Amplitudes', xtitle = 'Time [s]', $
  ytitle = 'Amplitudes', $
  psym = 0, name = 'amps', info = info


; Plot corrected amplitudes:

for i = 0, n_elements(channels) - 1 do begin

; Plot amplitudes:
nti_wavelet_plot_1d, vtimeax, reform(vamps(i, *, *), [maxorder + 1, n_elements(vtimeax)]), $
  error = reform(verrors(i, *, *), [maxorder + 1, n_elements(vtimeax)]), /errstyle, $
  legend = pg_num2str(findgen(maxorder + 1)), $
  yrange = [0, 1.1*max(reform(vamps(i, *, *), [maxorder + 1, n_elements(vtimeax)]))], $
  title = 'Amplitudes', xtitle = 'Time [s]', $
  ytitle = 'Amplitudes', $
  psym = 0, name = 'amps', info = info

endfor
  
end
