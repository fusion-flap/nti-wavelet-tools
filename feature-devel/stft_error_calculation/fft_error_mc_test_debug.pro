pro fft_error_mc_test_debug, iteration = iteration, data = data, td_err = td_err

nti_wavelet_default, iteration, 1d5
nti_wavelet_default, c, 0.1

nti_wavelet_default, n, 2358
nti_wavelet_default, t,findgen(n)/743
nti_wavelet_default, data, 1.234*sin(123.435*t+2.34) + 2.498*sin(221.935*t+4.43) + 0.66*sin(375.872*t+2.96) + 0.4*randomn(23, n)
nti_wavelet_default, td_err, c*abs(data+10)

data = data-mean(data)	;Substracting mean


;Generate window
win = pg_gen_win(300, masksize = n)

;Calculate FFT
fourier = fft(data*win)
re_ft = real_part(fourier)
im_ft = imaginary(fourier)
abs_ft = abs(fourier)
phase_ft = atan(fourier, /phase)


;Analytical
;-------------------------------------------------------------------------------

fft_error_propagation, fourier = fourier, td_err = td_err, win = win, $
  re_err = re_err, im_err = im_err, abs_err = abs_err, phase_err = phase_err

;Monte Carlo
;-------------------------------------------------------------------------------

re_sum = fltarr(n)
re_sum_2 = fltarr(n)

im_sum = fltarr(n)
im_sum_2 = fltarr(n)

abs_sum = fltarr(n)
abs_sum_2 = fltarr(n)

phase_sum = fltarr(n)
phase_sum_2 = fltarr(n)

;Time indicator
time = systime(1)

i = long(0)
while (i lt iteration) do begin
  ;Number of datapoints
  n = n_elements(data)
  ;Perturbating FFT
  pert_re = re_ft + re_err*randomn(seed, n)
  pert_im = im_ft + im_err*randomn(seed, n)
  ;Abs and phase of perturbated signal
  pert_abs = sqrt(pert_re^2 + pert_im^2)

  ;Saving
  abs_sum = abs_sum + pert_abs
  abs_sum_2 = abs_sum_2 + (pert_abs)^2

;   phase_sum = phase_sum + atan(pert_fourier, /phase)
;   phase_sum_2 = phase_sum_2 + (atan(pert_fourier, /phase))^2

  ;Status bar
  if ((i mod 10000) eq 0) then begin
    print, 100.*i/iteration,' %'
  endif

 i = i+1

endwhile

;Time indicator
print, 'Time: ', (systime(1) - time), ' s'


abs_dev = sqrt(abs_sum_2/iteration - (abs_sum/iteration)^2)
;phase_dev = sqrt(phase_sum_2/iteration - (phase_sum/iteration)^2)

stop

return

















plot, abs(fourier(115:130)), yrange = [-3,3], psym = -1
oplot, imaginary(fourier(115:130)), color = 100, psym = -1
oplot, real_part(fourier(115:130)), color = 300, psym = -1


errplot, abs(fourier(115:130))-abs_err(115:130), abs(fourier(115:130))+abs_err(115:130)
errplot, real_part(fourier(115:130))-re_err(115:130), real_part(fourier(115:130))+re_err(115:130), color = 300
errplot, imaginary(fourier(115:130))-im_err(115:130), imaginary(fourier(115:130))+im_err(115:130), color = 100

errplot, abs(fourier(115:130))-abs_dev(115:130), abs(fourier(115:130))+abs_dev(115:130)
errplot, real_part(fourier(115:130))-re_dev(115:130), real_part(fourier(115:130))+re_dev(115:130), color = 300
errplot, imaginary(fourier(115:130))-im_dev(115:130), imaginary(fourier(115:130))+im_dev(115:130), color = 100






plot, abs(fourier(100:150))                      
oplot, phase_err(100:150), psym = -1, color = 300
oplot, phase_dev(100:150), psym = -1, color = 100

plot, abs(fourier(200:300))                      
oplot, phase_err(200:300), psym = -1, color = 300
oplot, phase_dev(200:300), psym = -1, color = 100







plot, re_dev(20:100), /ystyle, psym = -1
oplot, re_err(20:100), psym = 5

plot, im_dev(20:100), /ystyle, psym = -1
oplot, im_err(20:100), psym = 5



p = 100
q = 130

plot, abs_ft(p:q)
errplot, abs_ft(p:q)-abs_err(p:q), abs_ft(p:q)+abs_err(p:q)
oplot, (abs(pert_fourier))(p:q), psym = 2

end