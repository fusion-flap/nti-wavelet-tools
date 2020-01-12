pro run_chirp_analysis_stft

; Run STFT:
; --------
  filename = 'AUGD_30809_MHA_4.8s-4.9s.sav'
  trange = [4.800, 4.899]

; STFT resolution:
; ----------------
  resample = 200
  stft_length = 100
  stft_fres = long(2000)
  stft_step = 1

; Run chirp_analysis_stft:
chirp_analysis_stft, $
    filename = filename, trange = trange, $
    stft_length = stft_length, stft_fres = stft_fres, stft_step = stft_step, $
    resample = resample, chind = [1, 0, 0, 0, 0]

end