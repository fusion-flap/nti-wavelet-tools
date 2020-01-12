pro ms_loading_stft_transforms, channel = channel, timepoint = timepoint, timeax = timeax, $
    ntiwt_freqax = ntiwt_freqax, ntiwt_transforms = ntiwt_transforms, fourier = fourier, $
    ntiwt_stft_width = ntiwt_stft_width, ntiwt_stft_fres = ntiwt_stft_fres, ntiwt_stft_step = ntiwt_stft_step

	dt = (timeax(n_elements(timeax)-1)-timeax(0))/(n_elements(timeax)-1)
	df = (ntiwt_freqax(n_elements(ntiwt_freqax)-1)-ntiwt_freqax(0))/(n_elements(ntiwt_freqax)-1)

        enbw = 100 ; should be defined somehow
        f_ind = where(ntiwt_freqax gt enbw)


;Calculating energy density
stft = reform(ntiwt_transforms(channel, *, *))
energy_density = 2*(abs(stft))^2

;Requested segment of full stft
segment_stft = reform(ntiwt_transforms(channel, timepoint, *))

;Requested segment of full energy density
segment_energy_density = reform(energy_density(timepoint, *))

; ;Calculating amplitude
; amplitude = 0*segment_energy_density
; n = n_elements(amplitude)
; half_width = ceil(3/(2*ntiwt_stft_width*dt/ntiwt_stft_step)/2/df)
; for i = 0, n-1 do begin
;   amplitude(i) = sqrt(2*total(segment_energy_density(max([i-half_width, 0]):min([i+half_width, n-1])))*df)
; endfor

;Calculating sigma
sigma_t = ntiwt_stft_width/ntiwt_stft_step/2.*dt
sigma_f = 1./(2*!pi*sigma_t)
amplitude = sqrt(2*segment_energy_density*sigma_f*sqrt(!pi))



fft1 = segment_stft

;freq
freq = ntiwt_freqax

;pow
pow = segment_energy_density*dt*df

;pow_rms
pow_rms = sqrt(2.*pow)

;pow_rms_tot
pow_rms_tot = sqrt(2.*total(pow[f_ind])*df)/2./!pi

;pow_peak
pow_peak = amplitude

;pow_peak_tot
pow_peak_tot = sqrt(2)*sqrt(total(pow[f_ind])*df)/2./!pi

;phase
phase = atan(segment_stft, /phase)

        fourier = {four:fft1, freq:freq, $
                   pow:pow, pow_rms:pow_rms, pow_peak:pow_peak, $
                   pow_rms_tot:pow_rms_tot, pow_peak_tot:pow_peak_tot, $
                   phase:phase, enbw:enbw}


end
