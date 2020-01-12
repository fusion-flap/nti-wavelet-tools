pro run_chirp_analysis_plot_stft

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
  bandwidth = 2
  ; Interpolation:
  tdens = 1
  fdens = 2

; Channels:
; ---------
  channels = ['MHA-B31-14']

; Plot parameters:
; ---------------
  time_min = 4.850
  time_max = 4.860
  freq_min = 0
  freq_max = 50
  noridge = 0



; Run run_chirp_analysis_plot_stft
for i = 0, n_elements(channels) - 1 do begin

  channel = channels(i)
  
  ; Run chirp_analysis_amplitudes:
  chirp_analysis_plot_stft, $ 
  ; STFT parameters:
    expname = expname, shotnumber = shotnumber, channel = channel, $
    trange = trange, stft_length = stft_length, stft_fres = stft_fres, $
    stft_step = stft_step, resample = resample, $
  ; Ridge following parameters:
    start_x = start_x, bandwidth = bandwidth, $
  ; Interpolation:
    tdens = tdens, fdens = fdens, $
  ; Input:
    time_min = time_min, time_max = time_max, $
    freq_min = freq_min, freq_max = freq_max, $
    noridge = noridge

endfor

end
