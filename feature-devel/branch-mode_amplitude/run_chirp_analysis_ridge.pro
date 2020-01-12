pro run_chirp_analysis_ridge

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
  start_x = 4.854
  start_freq = [15., 25.]
  bandwidth = 2
  ; Noise:
  noisetime = [4.848, 4.852]
  noisefreq = [20., 40.]
  treshold = 2.
  xrange_unit = [4.850, 4.855]
  ; Interpolation:
  tdens = 1
  fdens = 2

; Channels:
; ---------
  channels = ['MHA-B31-14']

; Run chirp_analysis_ridge:
for i = 0, n_elements(channels) - 1 do begin

  channel = channels(i)

  ; Run chirp_analysis_ridge:
  chirp_analysis_ridge, $
    ; STFT parameters:
      expname = expname, shotnumber = shotnumber, channel = channel, $
      trange = trange, stft_length = stft_length, stft_fres = stft_fres, $
      stft_step = stft_step, resample = resample, $
    ; Ridge following parameters:
      start_x = start_x, start_freq = start_freq, bandwidth = bandwidth, $
      xrange_unit = xrange_unit, $
    ; Noise:
      noisetime = noisetime, noisefreq = noisefreq, treshold = treshold, $
    ; Interpolation:
      tdens = tdens, fdens = fdens

endfor

end