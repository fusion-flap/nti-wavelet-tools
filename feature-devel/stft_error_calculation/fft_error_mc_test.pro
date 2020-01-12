pro fft_error_mc_test, iteration = iteration, data = data, td_err = td_err

nti_wavelet_default, iteration, 1d5
nti_wavelet_default, c, 0.1
nti_wavelet_default, win, 1

 nti_wavelet_default, n, 1358
 nti_wavelet_default, t,findgen(n)/743
 nti_wavelet_default, data, 1.234*sin(123.435*t+2.34) + 4.498*sin(221.935*t+4.43) + 0.36*sin(375.872*t+2.96) + 0.4*randomn(seed, n)
 nti_wavelet_default, td_err, c*abs(data+10)

;restore, 'ece_signal_ntiwt.sav'
;data = data(*,5)
;td_err = 0.1*data

data = data-mean(data)	;Substracting mean

n = n_elements(data)

;Generate window
win = pg_gen_win(100, masksize = n)
;win = [fltarr(940), win]

;Calculate FFT
fourier = fft(data*win)
abs_ft = abs(fourier)
phase_ft = atan(fourier, /phase)
re_ft = real_part(fourier)
im_ft = imaginary(fourier)

stop

;Analytical
;-------------------------------------------------------------------------------

fft_error_propagation, fourier = fourier, td_err = td_err, win = win, $
  re_err = re_err, im_err = im_err, abs_err = abs_err, phase_err = phase_err, $
  abs_crit = abs_crit, abs_quad = abs_quad, phase_crit = phase_crit, phase_quad = phase_quad, $
  filtered_abs_err = filtered_abs_err, filtered_phase_err = filtered_phase_err

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
  ;Perturbating signal
  pert_data = data + td_err*randomn(seed, n)
  ;FFT of perturbated signal
  pert_fourier = fft(pert_data*win)

  ;Saving
  re_sum = re_sum + real_part(pert_fourier)
  re_sum_2 = re_sum_2 + (real_part(pert_fourier))^2

  im_sum = im_sum + imaginary(pert_fourier)
  im_sum_2 = im_sum_2 + (imaginary(pert_fourier))^2

  abs_sum = abs_sum + abs(pert_fourier)
  abs_sum_2 = abs_sum_2 + (abs(pert_fourier))^2

  phase_sum = phase_sum + atan(pert_fourier, /phase)
  phase_sum_2 = phase_sum_2 + (atan(pert_fourier, /phase))^2

  ;Status bar
  if ((i mod 10000) eq 0) then begin
    print, 100.*i/iteration,' %'
  endif

 i = i+1

endwhile

;Time indicator
print, 'Time: ', (systime(1) - time), ' s'


re_dev = sqrt(re_sum_2/iteration - (re_sum/iteration)^2)
im_dev = sqrt(im_sum_2/iteration - (im_sum/iteration)^2)
abs_dev = sqrt(abs_sum_2/iteration - (abs_sum/iteration)^2)
phase_dev = sqrt(phase_sum_2/iteration - (phase_sum/iteration)^2)

stop

return











re_ft = real_part(fourier)
im_ft = imaginary(fourier)


z = findgen(n) ## findgen(n); z = u*x
cov = reform(-0.5*1./n^2*(sin(2*2*!pi*z/n) ## (td_err^2*win^2))) ;calculate covariance

gg = abs_err
nonlin =  0.5*(im_ft^2)/(abs_ft^3)*re_err^2 + 0.5*(re_ft^2)/(abs_ft^3)*im_err^2 + cov*(re_ft*im_ft)/(abs_ft^3)

gg(where(10*nonlin gt abs_ft)) = 1./0

plot, gg(0:300)
oplot, abs_dev, color = 20












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