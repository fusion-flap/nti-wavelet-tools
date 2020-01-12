pro ms_execute_nti_wavelet_main, data = data, timeax = timeax, position = position, $
    ntiwt_timeax = ntiwt_timeax, ntiwt_freqax = ntiwt_freqax, ntiwt_transforms = ntiwt_transforms, $
    ntiwt_stft_fres = ntiwt_stft_fres, ntiwt_stft_step = ntiwt_stft_step, ntiwt_stft_width = ntiwt_stft_width

nti_wavelet_main,$
  ; Input
    data=data, dtimeax=timeax, chpos=position, expname='MS', $
    transf_selection=1, cwt_selection=0, stft_selection=1, $
    stft_length=ntiwt_stft_width, stft_fres=ntiwt_stft_fres, $
    stft_step=ntiwt_stft_step, freq_min=0,$
    crosstr_selection=0, coh_selection=0, $
    transfer_selection=0, mode_selection=0, $
  ; Output
    timeax = ntiwt_timeax, freqax=freqax, transforms=transforms

ntiwt_freqax = 1e3*freqax
ntiwt_transforms = transforms

end