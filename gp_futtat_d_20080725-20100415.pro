pro gp_futtat_d

ID='2010_04_16_1311_20975_D_bp_fit_norm'
;remake of ID='2009_12_08_1537_20975_D_bp_fit_norm'
ID_in='2009_12_07_1000-20975_J53_D_bandpowers'
gp_fit_bp,ID_in,ID,beforemax=-0.0008
return

ID='2010_04_15_1600_23476_spec_12kHz_32'
;spectrograms
shot=23476
channel1='General/_AUG_SXR_J53_time_0.0000-6.0000'
;this is a manually corrected file!
fmax=12
windowsize=32

times=[$
2.6482, 2.6782, 2.7081, 2.7415, 2.7785,$
2.8204, 2.8637, 2.9066, 2.9496, 2.9925,$
3.0332, 3.0739, 3.1188, 3.1633, 3.2084,$
3.2528, 3.2987, 3.3439, 3.3844, 3.4396,$
3.4876, 3.5255, 3.5633, 3.6159, 3.6702,$
3.7238, 3.7757, 3.8250, 3.8770, 3.9307,$
3.9837, 4.0377, 4.0920, 4.1442, 4.1856]

for i=0,n_elements(times)-1 do begin
   trange=[times(i)-0.035,times(i)+0.015]
   stft=pg_spectrogram(shot,channel1,windowsize=windowsize,opt=0.1,/print,trange=trange,fmax=fmax,ID=ID)
endfor

gp_sort,ID,/fixbb
return
;================================================================================================
;================================================================================================


ID='2010_04_15_1540_23476_spec_12kHz_128'
;spectrograms
shot=23476
channel1='General/_AUG_SXR_J53_time_0.0000-6.0000'
;this is a manually corrected file!
fmax=12
windowsize=128

times=[$
2.6482, 2.6782, 2.7081, 2.7415, 2.7785,$
2.8204, 2.8637, 2.9066, 2.9496, 2.9925,$
3.0332, 3.0739, 3.1188, 3.1633, 3.2084,$
3.2528, 3.2987, 3.3439, 3.3844, 3.4396,$
3.4876, 3.5255, 3.5633, 3.6159, 3.6702,$
3.7238, 3.7757, 3.8250, 3.8770, 3.9307,$
3.9837, 4.0377, 4.0920, 4.1442, 4.1856]

for i=0,n_elements(times)-1 do begin
   trange=[times(i)-0.035,times(i)+0.015]
   stft=pg_spectrogram(shot,channel1,windowsize=windowsize,opt=0.1,/print,trange=trange,fmax=fmax,ID=ID)
endfor

gp_sort,ID,/fixbb
return
;================================================================================================
;================================================================================================


ID='2010_04_15_1540_23476_spec_12kHz'
;spectrograms
shot=23476
channel1='General/_AUG_SXR_J53_time_0.0000-6.0000'
;this is a manually corrected file!
fmax=12
windowsize=64

times=[$
2.6482, 2.6782, 2.7081, 2.7415, 2.7785,$
2.8204, 2.8637, 2.9066, 2.9496, 2.9925,$
3.0332, 3.0739, 3.1188, 3.1633, 3.2084,$
3.2528, 3.2987, 3.3439, 3.3844, 3.4396,$
3.4876, 3.5255, 3.5633, 3.6159, 3.6702,$
3.7238, 3.7757, 3.8250, 3.8770, 3.9307,$
3.9837, 4.0377, 4.0920, 4.1442, 4.1856]

for i=0,n_elements(times)-1 do begin
   trange=[times(i)-0.035,times(i)+0.015]
   stft=pg_spectrogram(shot,channel1,windowsize=windowsize,opt=0.1,/print,trange=trange,fmax=fmax,ID=ID)
endfor

gp_sort,ID
return
;================================================================================================
;================================================================================================


ID='2010_04_15_1313_23476_spec_20kHz_new'
;spectrograms
shot=23476
channel1='General/_AUG_SXR_J53_time_0.0000-6.0000'
;this is a manually corrected file!
fmax=20
windowsize=64

times=[$
2.6482, 2.6782, 2.7081, 2.7415, 2.7785,$
2.8204, 2.8637, 2.9066, 2.9496, 2.9925,$
3.0332, 3.0739, 3.1188, 3.1633, 3.2084,$
3.2528, 3.2987, 3.3439, 3.3844, 3.4396,$
3.4876, 3.5255, 3.5633, 3.6159, 3.6702,$
3.7238, 3.7757, 3.8250, 3.8770, 3.9307,$
3.9837, 4.0377, 4.0920, 4.1442, 4.1856]

for i=0,n_elements(times)-1 do begin
   trange=[times(i)-0.035,times(i)+0.015]
   stft=pg_spectrogram(shot,channel1,windowsize=windowsize,opt=0.1,/print,trange=trange,fmax=fmax,ID=ID)
endfor

gp_sort,ID
return
;================================================================================================
;================================================================================================


ID='2010_04_15_1030_23476_spec_20kHz'
;spectrograms
shot=23476
channel1='General/_AUG_SXR_J53_time_0.0000-6.0000'
fmax=20
windowsize=64

times=[$
2.6482, 2.6782, 2.7081, 2.7415, 2.7785,$
2.8204, 2.8637, 2.9066, 2.9496, 2.9925,$
3.0332, 3.0739, 3.1188, 3.1633, 3.2084,$
3.2528, 3.2987, 3.3439, 3.3844, 3.4396,$
3.4876, 3.5255, 3.5633, 3.6159, 3.6702,$
3.7238, 3.7757, 3.8250, 3.8770, 3.9307,$
3.9837, 4.0377, 4.0920, 4.1442, 4.1856]

for i=0,n_elements(times)-1 do begin
   trange=[times(i)-0.035,times(i)+0.015]
   stft=pg_spectrogram(shot,channel1,windowsize=windowsize,opt=0.1,/print,trange=trange,fmax=fmax,ID=ID)
endfor

gp_sort,ID
return
;================================================================================================
;================================================================================================


ID='2010_04_14_1312_23476_spec'
;spectrograms
shot=23476
channel1='General/_AUG_SXR_J53_time_0.0000-6.0000'
fmax=40
windowsize=64

times=[$
2.6482, 2.6782, 2.7081, 2.7415, 2.7785,$
2.8204, 2.8637, 2.9066, 2.9496, 2.9925,$
3.0332, 3.0739, 3.1188, 3.1633, 3.2084,$
3.2528, 3.2987, 3.3439, 3.3844, 3.4396,$
3.4876, 3.5255, 3.5633, 3.6159, 3.6702,$
3.7238, 3.7757, 3.8250, 3.8770, 3.9307,$
3.9837, 4.0377, 4.0920, 4.1442, 4.1856]

for i=0,n_elements(times)-1 do begin
   trange=[times(i)-0.035,times(i)+0.015]
   stft=pg_spectrogram(shot,channel1,windowsize=windowsize,opt=0.1,/print,trange=trange,fmax=fmax,ID=ID)
endfor

gp_sort,ID
return
;================================================================================================
;================================================================================================


ID='2010_04_14_1130_23476_spec'
;spectrograms
shot=23476
channel1='General/_AUG_SXR_J53_time_0.0000-6.0000'
fmax=40
windowsize=64

times=[$
2.6482, 2.6782, 2.7081, 2.7415, 2.7785,$
2.8204, 2.8637, 2.9066, 2.9496, 2.9925,$
3.0332, 3.0739, 3.1188, 3.1633, 3.2084,$
3.2528, 3.2987, 3.3439, 3.3844, 3.4396,$
3.4876, 3.5255, 3.5633, 3.6159, 3.6702,$
3.7238, 3.7757, 3.8250, 3.8770, 3.9307,$
3.9837, 4.0377, 4.0920, 4.1442, 4.1856]

for i=0,n_elements(times)-1 do begin
   trange=[times(i)-0.07,times(i)+0.03]
   stft=pg_spectrogram(shot,channel1,windowsize=windowsize,opt=0.1,/print,trange=trange,fmax=fmax,ID=ID)
endfor

gp_sort,ID

return

;================================================================================================
;================================================================================================


ID='2010_04_09_1121_23091_spec_128_20ms'
;spectrograms
shot=23091
channel1='General/_AUG_SXR_J53_time_0.0000-6.0000'

times=[2.3635, 2.3865, 2.4033, 2.4212, 2.4415, 2.4608, 2.4815, 2.8798,$
    2.8918, 2.902, 2.9133, 2.9245, 2.9355, 2.945, 2.955, 2.9719, 2.9838,$
    2.9944, 3.0048, 3.0167, 3.0256, 3.0345, 3.0478, 3.0584, 3.071, 3.081,$
    3.095, 3.1045, 3.114, 3.1256, 3.1335, 3.1435, 3.153, 3.1668, 3.191,$
    3.202, 3.214, 3.2265, 3.2378, 3.2644, 3.2975, 3.315, 3.3215, 3.3325,$
    3.3455, 3.4268, 3.437, 3.4488, 3.4903, 3.508, 3.525, 3.542, 3.5543,$
    3.5652, 3.578, 3.5908, 3.615, 3.6355, 3.6457, 3.6815, 3.6925, 3.7025,$
    3.716, 3.7305, 3.7428, 3.7902, 3.804, 3.8165, 3.8318, 3.8608, 3.8755,$
    3.9575, 3.975, 4.005, 4.0197, 4.0358, 4.0642, 4.0788, 4.18, 4.1945]

for i=0,n_elements(times)-1 do begin
   trange=[times(i)-0.015,times(i)+0.005]
   stft=pg_spectrogram(shot,channel1,windowsize=128,opt=0.1,/print,trange=trange,fmax=10,ID=ID)
endfor

gp_sort,ID

return

;================================================================================================
;================================================================================================


ID='2010_04_09_1032_23091_spec_32_20ms'
;spectrograms
shot=23091
channel1='General/_AUG_SXR_J53_time_0.0000-6.0000'

times=[2.3635, 2.3865, 2.4033, 2.4212, 2.4415, 2.4608, 2.4815, 2.8798,$
    2.8918, 2.902, 2.9133, 2.9245, 2.9355, 2.945, 2.955, 2.9719, 2.9838,$
    2.9944, 3.0048, 3.0167, 3.0256, 3.0345, 3.0478, 3.0584, 3.071, 3.081,$
    3.095, 3.1045, 3.114, 3.1256, 3.1335, 3.1435, 3.153, 3.1668, 3.191,$
    3.202, 3.214, 3.2265, 3.2378, 3.2644, 3.2975, 3.315, 3.3215, 3.3325,$
    3.3455, 3.4268, 3.437, 3.4488, 3.4903, 3.508, 3.525, 3.542, 3.5543,$
    3.5652, 3.578, 3.5908, 3.615, 3.6355, 3.6457, 3.6815, 3.6925, 3.7025,$
    3.716, 3.7305, 3.7428, 3.7902, 3.804, 3.8165, 3.8318, 3.8608, 3.8755,$
    3.9575, 3.975, 4.005, 4.0197, 4.0358, 4.0642, 4.0788, 4.18, 4.1945]

for i=0,n_elements(times)-1 do begin
   trange=[times(i)-0.015,times(i)+0.005]
   stft=pg_spectrogram(shot,channel1,windowsize=32,opt=0.1,/print,trange=trange,fmax=20,ID=ID)
endfor

gp_sort,ID

return

;================================================================================================
;================================================================================================


ID='2010_04_09_1005_23091_spec_64_20ms'
;spectrograms
shot=23091
channel1='General/_AUG_SXR_J53_time_0.0000-6.0000'

times=[2.3635, 2.3865, 2.4033, 2.4212, 2.4415, 2.4608, 2.4815, 2.8798,$
    2.8918, 2.902, 2.9133, 2.9245, 2.9355, 2.945, 2.955, 2.9719, 2.9838,$
    2.9944, 3.0048, 3.0167, 3.0256, 3.0345, 3.0478, 3.0584, 3.071, 3.081,$
    3.095, 3.1045, 3.114, 3.1256, 3.1335, 3.1435, 3.153, 3.1668, 3.191,$
    3.202, 3.214, 3.2265, 3.2378, 3.2644, 3.2975, 3.315, 3.3215, 3.3325,$
    3.3455, 3.4268, 3.437, 3.4488, 3.4903, 3.508, 3.525, 3.542, 3.5543,$
    3.5652, 3.578, 3.5908, 3.615, 3.6355, 3.6457, 3.6815, 3.6925, 3.7025,$
    3.716, 3.7305, 3.7428, 3.7902, 3.804, 3.8165, 3.8318, 3.8608, 3.8755,$
    3.9575, 3.975, 4.005, 4.0197, 4.0358, 4.0642, 4.0788, 4.18, 4.1945]

for i=0,n_elements(times)-1 do begin
   trange=[times(i)-0.015,times(i)+0.005]
   stft=pg_spectrogram(shot,channel1,windowsize=64,opt=0.1,/print,trange=trange,fmax=10,ID=ID)
endfor

gp_sort,ID

return

;================================================================================================
;================================================================================================


ID='2010_04_07_1456_23091_spec_64_100ms'
;spectrograms
shot=23091
channel1='General/_AUG_SXR_J53_time_0.0000-6.0000'

times=[2.3635, 2.3865, 2.4033, 2.4212, 2.4415, 2.4608, 2.4815, 2.8798,$
    2.8918, 2.902, 2.9133, 2.9245, 2.9355, 2.945, 2.955, 2.9719, 2.9838,$
    2.9944, 3.0048, 3.0167, 3.0256, 3.0345, 3.0478, 3.0584, 3.071, 3.081,$
    3.095, 3.1045, 3.114, 3.1256, 3.1335, 3.1435, 3.153, 3.1668, 3.191,$
    3.202, 3.214, 3.2265, 3.2378, 3.2644, 3.2975, 3.315, 3.3215, 3.3325,$
    3.3455, 3.4268, 3.437, 3.4488, 3.4903, 3.508, 3.525, 3.542, 3.5543,$
    3.5652, 3.578, 3.5908, 3.615, 3.6355, 3.6457, 3.6815, 3.6925, 3.7025,$
    3.716, 3.7305, 3.7428, 3.7902, 3.804, 3.8165, 3.8318, 3.8608, 3.8755,$
    3.9575, 3.975, 4.005, 4.0197, 4.0358, 4.0642, 4.0788, 4.18, 4.1945]

for i=0,n_elements(times)-1 do begin
   trange=[times(i)-0.07,times(i)+0.03]
   stft=pg_spectrogram(shot,channel1,windowsize=64,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
endfor

gp_sort,ID

return

;================================================================================================
;================================================================================================


ID='2010_04_07_1450_23091_spec_64_10ms'
;spectrograms
shot=23091
channel1='General/_AUG_SXR_J53_time_0.0000-6.0000'

times=[2.3635, 2.3865, 2.4033, 2.4212, 2.4415, 2.4608, 2.4815, 2.8798,$
    2.8918, 2.902, 2.9133, 2.9245, 2.9355, 2.945, 2.955, 2.9719, 2.9838,$
    2.9944, 3.0048, 3.0167, 3.0256, 3.0345, 3.0478, 3.0584, 3.071, 3.081,$
    3.095, 3.1045, 3.114, 3.1256, 3.1335, 3.1435, 3.153, 3.1668, 3.191,$
    3.202, 3.214, 3.2265, 3.2378, 3.2644, 3.2975, 3.315, 3.3215, 3.3325,$
    3.3455, 3.4268, 3.437, 3.4488, 3.4903, 3.508, 3.525, 3.542, 3.5543,$
    3.5652, 3.578, 3.5908, 3.615, 3.6355, 3.6457, 3.6815, 3.6925, 3.7025,$
    3.716, 3.7305, 3.7428, 3.7902, 3.804, 3.8165, 3.8318, 3.8608, 3.8755,$
    3.9575, 3.975, 4.005, 4.0197, 4.0358, 4.0642, 4.0788, 4.18, 4.1945]

for i=0,n_elements(times)-1 do begin
   trange=[times(i)-0.007,times(i)+0.003]
   stft=pg_spectrogram(shot,channel1,windowsize=64,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
endfor

gp_sort,ID

return

;================================================================================================
;================================================================================================


ID='2010_04_07_1433_23091_spec_128_10ms'
;spectrograms
shot=23091
channel1='General/_AUG_SXR_J53_time_0.0000-6.0000'

times=[2.3635, 2.3865, 2.4033, 2.4212, 2.4415, 2.4608, 2.4815, 2.8798,$
    2.8918, 2.902, 2.9133, 2.9245, 2.9355, 2.945, 2.955, 2.9719, 2.9838,$
    2.9944, 3.0048, 3.0167, 3.0256, 3.0345, 3.0478, 3.0584, 3.071, 3.081,$
    3.095, 3.1045, 3.114, 3.1256, 3.1335, 3.1435, 3.153, 3.1668, 3.191,$
    3.202, 3.214, 3.2265, 3.2378, 3.2644, 3.2975, 3.315, 3.3215, 3.3325,$
    3.3455, 3.4268, 3.437, 3.4488, 3.4903, 3.508, 3.525, 3.542, 3.5543,$
    3.5652, 3.578, 3.5908, 3.615, 3.6355, 3.6457, 3.6815, 3.6925, 3.7025,$
    3.716, 3.7305, 3.7428, 3.7902, 3.804, 3.8165, 3.8318, 3.8608, 3.8755,$
    3.9575, 3.975, 4.005, 4.0197, 4.0358, 4.0642, 4.0788, 4.18, 4.1945]

for i=0,n_elements(times)-1 do begin
   trange=[times(i)-0.007,times(i)+0.003]
   stft=pg_spectrogram(shot,channel1,windowsize=128,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
endfor

gp_sort,ID

return

;================================================================================================
;================================================================================================



ID='2010_01_08_1106_frequencies_20974'
print,ID
shot=20974
channel1='General/_AUG_SXR_J53_f_t_2.09500-2.12978_f_10-16_graph'
channel2='General/_AUG_SXR_J53_f_t_2.09500-2.12978_f_2.50000-9.00000_graph-lin'
gp_analyse,shot,channel1,channel2,ID=ID,blocksize=32
return

;================================================================================================
;================================================================================================


ID='2009_12_14_1117_frequencies_20974'
print,ID
shot=20974
channel1='General/_AUG_SXR_J53_f_2.09500-2.12960_frange_10-16_graph'
channel2='General/_AUG_SXR_J53_f_2.09500-2.12960_frange_2.5-9.0_graph-lin'
gp_analyse,shot,channel1,channel2,ID=ID,blocksize=32
return


ID='2009_12_14_0343_frequencies_20974'
print,ID
shot=20974
channel1='General/_AUG_SXR_J53_time_0.0000-6.0000_freq_trange=1.91000-1.93900_frange=10-16_graph'
channel2='General/_AUG_SXR_J53_time_0.0000-6.0000_freq_trange=1.91000-1.93900_frange=4-9_graph'
gp_analyse,shot,channel1,channel2,ID=ID,blocksize=32
return

ID='2009_12_10_1100_res_spec'
for i=1,12 do begin
trange=[0.5*(i-1),0.5*i]
channel1='General/_AUG_SXR_J53_time_0.0000-6.0000'
shot=23922
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=1000,freqres=1,opt=0.1,/print,trange=trange,fmax=20,ID=ID)
shot=23923
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=1000,freqres=1,opt=0.1,/print,trange=trange,fmax=20,ID=ID)
shot=23924
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=1000,freqres=1,opt=0.1,/print,trange=trange,fmax=20,ID=ID)
endfor
gp_sort,ID
return

ID='2009_12_10_0340_res_spec_500ms'
for i=1,2 do begin
trange=[0.5*(i-1),0.5*i]
channel1='General/_AUG_SXR_J53_time_0.0000-6.0000'
shot=23922
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=572,opt=0.1,/print,trange=trange,fmax=20,ID=ID)
shot=23923
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=572,opt=0.1,/print,trange=trange,fmax=20,ID=ID)
shot=23924
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=572,opt=0.1,/print,trange=trange,fmax=20,ID=ID)
endfor
gp_sort,ID
return


;geri@deep:~/.idl/itt/rbuf> grep gp_fit_bp history |grep -v ".r gp_fit_bp"|cut -d"<" -f 1|uniq
;================================================================================================
;================================================================================================
gp_fit_bp,'2009_12_07_1615-20974_J53_A_bandpowers','2009_12_08_1535_20974_A_bp_fit_nonorm_thr',beforemax=-0.0008 
gp_fit_bp,'2009_12_07_1615-20974_J53_A_bandpowers','2009_12_08_1535_20974_A_bp_fit_norm_thr',beforemax=-0.0008,norm=1 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1618_20975_D_bp_fit_norm_thr',beforemax=-0.0008,norm=1 
gp_fit_bp,'2009_12_07_1641-20975_J53_A_bandpowers','2009_12_08_1532_20975_A_bp_fit_norm_thr',beforemax=-0.0003,norm=1 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1618_20975_D_bp_fit_norm_thr',beforemax=-0.0008,norm=1 
gp_fit_bp,'2009_12_07_1615-20974_J53_A_bandpowers','2009_12_08_1535_20974_A_bp_fit_norm_thr',beforemax=-0.0008,norm=1 
gp_fit_bp,'2009_12_07_1641-20975_J53_A_bandpowers','2009_12_08_1532_20975_A_bp_fit_nonorm_thr',beforemax=-0.0003 
gp_fit_bp,'2009_12_07_1615-20974_J53_A_bandpowers','2009_12_08_1535_20974_A_bp_fit_norm_thr',beforemax=-0.0008,norm=1 
gp_fit_bp,'2009_12_07_1641-20975_J53_A_bandpowers','2009_12_08_1532_20975_A_bp_fit_norm_thr',beforemax=-0.0003,norm=1 
gp_fit_bp,'2009_12_07_1641-20975_J53_A_bandpowers','2009_12_08_1532_20975_A_bp_fit_nonorm_thr',beforemax=-0.0003 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1618_20975_D_bp_fit_norm_thr',beforemax=-0.0008,norm=1 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1618_20975_D_bp_fit_nonorm_thr',beforemax=-0.0008 
gp_fit_bp,'2009_12_07_1641-20975_J53_A_bandpowers','2009_12_08_1532_20975_A_bp_fit_nonorm_thr',beforemax=-0.0003 
gp_fit_bp,'2009_12_07_1615-20974_J53_A_bandpowers','2009_12_08_1535_20974_A_bp_fit_nonorm_thr',beforemax=-0.0008 
gp_fit_bp,'2009_12_07_1641-20975_J53_A_bandpowers','2009_12_08_1532_20975_A_bp_fit_nonorm_thr',beforemax=-0.0003 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1618_20975_D_bp_fit_nonorm_thr',beforemax=-0.0008 
gp_fit_bp,'2009_12_07_1641-20975_J53_A_bandpowers','2009_12_08_1532_20975_A_bp_fit_nonorm_thr',beforemax=-0.0003 
gp_fit_bp,'2009_12_07_1615-20974_J53_A_bandpowers','2009_12_08_1535_20974_A_bp_fit_nonorm_thr',beforemax=-0.0008 
gp_fit_bp,'2009_12_07_1615-20974_J53_A_bandpowers','2009_12_08_1535_20974_A_bp_fit_nonorm_thr',beforemax=-0.0008,norm=0 
gp_fit_bp,'2009_12_07_1615-20974_J53_A_bandpowers','2009_12_08_1535_20974_A_bp_fit_norm_thr',beforemax=-0.0008 
gp_fit_bp,'2009_12_07_1641-20975_J53_A_bandpowers','2009_12_08_1532_20975_A_bp_fit_nonorm_thr',beforemax=-0.0003,norm=0 
gp_fit_bp,'2009_12_07_1641-20975_J53_A_bandpowers','2009_12_08_1532_20975_A_bp_fit_norm_thr',beforemax=-0.0003 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1618_20975_D_bp_fit_nonorm_thr',beforemax=-0.0008,norm=0 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1618_20975_D_bp_fit_norm_thr',beforemax=-0.0008 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1618_20975_D_bp_fit_norm_thr',beforemax=-0.0008,norm=0 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1618_20975_D_bp_fit_norm_thr',beforemax=-0.0008 
gp_fit_bp,'2009_12_07_1641-20975_J53_A_bandpowers','2009_12_08_1532_20975_A_bp_fit_norm',beforemax=-0.0003 
gp_fit_bp,'2009_12_07_1615-20974_J53_A_bandpowers','2009_12_08_1535_20974_A_bp_fit_norm',beforemax=-0.0008 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1537_20975_D_bp_fit_norm',beforemax=-0.0008 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1537_20975_D_bp_fit_nonorm',beforemax=-0.0008,norm=0 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1502_20975_D_bp_fit_nonorm',beforemax=-0.0008,norm=0 
gp_fit_bp,'2009_12_07_1615-20974_J53_A_bandpowers','2009_12_08_1535_20974_A_bp_fit_nonorm',beforemax=-0.0008,norm=0 
gp_fit_bp,'2009_12_07_1641-20975_J53_A_bandpowers','2009_12_08_1532_20975_A_bp_fit_nonorm',beforemax=-0.0003,norm=0 
gp_fit_bp,'2009_12_07_1641-20975_J53_A_bandpowers','2009_12_08_1522_20975_A_bp_fit',beforemax=-0.0003 
gp_fit_bp,'2009_12_07_1641-20975_J53_A_bandpowers','2009_12_08_1522_20975_A_bp_fit',beforemax=-0.0005 
gp_fit_bp,'2009_12_07_1641-20975_J53_A_bandpowers','2009_12_08_1522_20975_A_bp_fit',beforemax=-0.0008 
gp_fit_bp,'2009_12_07_1615-20974_J53_A_bandpowers','2009_12_08_1500_20974_A_bp_fit',beforemax=-0.0008 
gp_fit_bp,'2009_12_07_1615-20974_J53_A_bandpowers','2009_12_08_1500_20974_A_bp_fit',beforemax=-0.002 
gp_fit_bp,'2009_12_07_1615-20974_J53_A_bandpowers','2009_12_08_1500_20974_A_bp_fit',beforemax=-0.001 
gp_fit_bp,'2009_12_07_1615-20974_J53_A_bandpowers','2009_12_08_1500_20974_A_bp_fit',beforemax=-0.0008 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1502_20975_D_bp_fit',beforemax=-0.0008 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1502_20975_D_bp_fit',beforemax=-0.001 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1502_20975_D_bp_fit',beforemax=-0.003 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1502_20975_D_bp_fit',beforemax=-0.0015 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1502_20975_D_bp_fit',beforemax=-0.001 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1502_20975_D_bp_fit',beforemax=-0.002 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1502_20975_D_bp_fit',beforemax=-0.0015 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1502_20975_D_bp_fit',beforemax=-0.001 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1502_20975_D_bp_fit',beforemax=-0.0015 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1502_20975_D_bp_fit',beforemax=-0.001 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1502_20975_D_bp_fit',beforemax=-0.0008 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1502_20975_D_bp_fit',beforemax=-0.001 
gp_fit_bp,'2009_12_07_1615-20974_J53_A_bandpowers','2009_12_08_1500_20974_A_bp_fit',beforemax=-0.001 
gp_fit_bp,'2009_12_07_1615-20974_J53_A_bandpowers','2009_12_08_bp_fit_test',beforemax=-0.001 
gp_fit_bp,'2009_12_07_1615-20974_J53_A_bandpowers','2009_12_08_bp_fit_test',beforemax=-0.0005 
gp_fit_bp,'2009_12_07_1615-20974_J53_A_bandpowers','2009_12_08_bp_fit_test',beforemax=-0.0008 
gp_fit_bp,'2009_12_07_1615-20974_J53_A_bandpowers','2009_12_08_bp_fit_test',beforemax=-0.001 
gp_fit_bp,'2009_12_07_1615-20974_J53_A_bandpowers','2009_12_08_bp_fit_test',beforemax=-0.002 
gp_fit_bp,'2009_12_07_1615-20974_J53_A_bandpowers','2009_12_08_bp_fit_test' 
gp_fit_bp,'2009_12_07_1641-20975_J53_A_bandpowers','2009_12_08_1421_20975_A_bp_fit',tstart=-0.03,tend=-0.0035 
gp_fit_bp,'2009_12_07_1615-20974_J53_A_bandpowers','2009_12_08_1417_20974_A_bp_fit',tstart=-0.03 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1400_20975_D_bp_fit',tstart=-0.03 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1400_20975_D_bp_fit',tstart=-0.025 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1400_20975_D_bp_fit',tstart=-0.02 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1400_20975_D_bp_fit',tstart=-0.015 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1400_20975_D_bp_fit',tstart=-0.01 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1400_20975_D_bp_fit',tstart=-0.015 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1400_20975_D_bp_fit',tstart=-0.02 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1400_20975_D_bp_fit',tstart=-0.025 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1400_20975_D_bp_fit',tstart=-0.03 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1400_20975_D_bp_fit',tstart=-0.04 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1400_20975_D_bp_fit',tstart=-0.03 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1400_20975_D_bp_fit',tstart=-0.02 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_08_1400_20975_D_bp_fit' 
gp_fit_bp,'2009_12_07_1641-20975_J53_A_bandpowers','2009_12_07_1741_20975_A_bp_fit',tstart=-0.0095,tend=-0.0035 
gp_fit_bp,'2009_12_07_1641-20975_J53_A_bandpowers','2009_12_07_1741_20975_A_bp_fit',tstart=-0.01,tend=-0.0035 
gp_fit_bp,'2009_12_07_1641-20975_J53_A_bandpowers','2009_12_07_1741_20975_A_bp_fit',tstart=-0.011,tend=-0.0035 
gp_fit_bp,'2009_12_07_1641-20975_J53_A_bandpowers','2009_12_07_1741_20975_A_bp_fit',tstart=-0.011,tend=-0.004 
gp_fit_bp,'2009_12_07_1641-20975_J53_A_bandpowers','2009_12_07_1741_20975_A_bp_fit',tstart=-0.011,tend=-0.003 
gp_fit_bp,'2009_12_07_1641-20975_J53_A_bandpowers','2009_12_07_1741_20975_A_bp_fit',tstart=-0.011,tend=-0.002 
gp_fit_bp,'2009_12_07_1641-20975_J53_A_bandpowers','2009_12_07_1741_20975_A_bp_fit',tstart=-0.011,tend=-0.001 
gp_fit_bp,'2009_12_07_1641-20975_J53_A_bandpowers','2009_12_07_1741_20975_A_bp_fit',tstart=-0.011 
gp_fit_bp,'2009_12_07_1641-20975_J53_A_bandpowers','2009_12_07_1741_20975_A_bp_fit',tstart=-0.01 
gp_fit_bp,'2009_12_07_1641-20975_J53_A_bandpowers','2009_12_07_1741_20975_A_bp_fit',tstart=-0.009 
gp_fit_bp,'2009_12_07_1641-20975_J53_A_bandpowers','2009_12_07_1741_20975_A_bp_fit' 
gp_fit_bp,'2009_12_07_1641-20975_J53_A_bandpowers','2009_12_07_1647_20975_A_bp_fit' 
gp_fit_bp,'2009_12_07_1615-20974_J53_A_bandpowers','2009_12_07_1636_20974_A_bp_fit' 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_07_1600_20975_D_bp_fit' 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers','2009_12_07_1511_bp_fit' 
gp_fit_bp,'2009_12_07_1000-20975_J53_D_bandpowers'
;================================================================================================
;================================================================================================




ID='2009_12_07_1641-20975_J53_A_bandpowers'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
t_stft=[3.87,4.6]
bands=[4,7,8,15]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(8,2)
trange[0,*]=[3.9d0,3.94d0]
trange[1,*]=[4.0d0,4.04d0]
trange[2,*]=[4.085d0,4.125d0]
trange[3,*]=[4.17d0,4.21d0]
trange[4,*]=[4.25d0,4.29d0]
trange[5,*]=[4.325d0,4.365d0]
trange[6,*]=[4.395d0,4.435d0]
trange[7,*]=[4.455d0,4.495d0]
for i=0,7 do trange[i,1]=trange[i,0]+0.06d0

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID
return

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************


ID='2009_12_07_1615-20974_J53_A_bandpowers'
shot=20974
channel1='General/_AUG_SXR_J53_time_0.0000-6.0000'
t_stft=[1.36,2.56]
bands=[4,9,10,16]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(17,2)
trange[0,*]=[0,1.4145d0]
trange[1,*]=[0,1.505d0]
trange[2,*]=[0,1.5855d0]
trange[3,*]=[0,1.66d0]
trange[4,*]=[0,1.73d0]
trange[5,*]=[0,1.798d0]
trange[6,*]=[0,1.866d0]
trange[7,*]=[0,1.93201d0]
trange[8,*]=[0,1.996d0]
trange[9,*]=[0,2.059d0]
trange[10,*]=[0,2.122d0]
trange[11,*]=[0,2.185d0]
trange[12,*]=[0,2.252d0]
trange[13,*]=[0,2.315d0]
trange[14,*]=[0,2.383d0]
trange[15,*]=[0,2.446d0]
trange[16,*]=[0,2.505d0]
dt=0.025d0
for i=0,16 do trange[i,0]=trange[i,1]-dt
for i=0,16 do trange[i,1]=trange[i,0]+0.05d0

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID
return

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_12_07_1000-20975_J53_D_bandpowers'
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
t_stft=[1.38,2.55]
bands=[5,9,10,17]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93001d0,1.96001d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]
for i=0,14 do begin
   trange[i,1]=trange[i,0]+0.05
endfor

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID
return

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_12_01_1358-20975_J53_D_bandpowers'
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
t_stft=[1.38,2.55]
bands=[5,9,10,17]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93001d0,1.96001d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]
for i=0,14 do begin
   trange[i,1]=trange[i,0]+0.05
endfor

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID
return

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

l=[46,48,49,50,51,54,56,57,58]
shot=20975
trange=[2.347d0,2.377d0]
for i=0,n_elements(l)-1 do begin
ID='2009_07_03_1112_phase_J53_J'+pg_num2str(l(i),length=2)
print, ID
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
channel2='General/_AUG_SXR_J'+pg_num2str(l(i),length=2)+'_time_0.0000-6.0000'
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID,blocksize=1024
endfor
return

l=[46,48,49,50,51,54,56,57,58]
shot=20975
trange=[1.855d0,1.885d0]
for i=0,n_elements(l)-1 do begin
ID='2009_07_03_0135_phase_J53_J'+pg_num2str(l(i),length=2)
print, ID
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
channel2='General/_AUG_SXR_J'+pg_num2str(l(i),length=2)+'_time_0.0000-6.0000'
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID,blocksize=1024
endfor
return

l=[46,48,49,50,51,54,56,57,58]
shot=20975
trange=[1.635d0,1.665d0]
for i=0,n_elements(l)-1 do begin
ID='2009_07_03_0129_phase_J53_J'+pg_num2str(l(i),length=2)
print, ID
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
channel2='General/_AUG_SXR_J'+pg_num2str(l(i),length=2)+'_time_0.0000-6.0000'
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID,blocksize=1024
endfor
return


l=[46,48,49,50,51,54,56,57,58]
shot=20975
trange=[1.635d0,1.665d0]
for i=0,n_elements(l)-1 do begin
ID='2009_07_03_0116_phase_J53_J'+pg_num2str(l(i),length=2)
print, ID
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
channel2='General/_AUG_SXR_J'+pg_num2str(l(i),length=2)+'_time_0.0000-6.0000'
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID
endfor
return


ID='2009_06_25_1623_20975_A_RAW'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
channel2='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[4.307,4.407]
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID
return

ID='2009_06_25_1543_20975_D_RAW'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
channel2='General/_AUG_SXR_J53_time_0.0000-3.0000'
trange=[1.607,1.707]
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID
return

ID='2009_06_25_1424_20974_A_RAW'
print,ID
shot=20974
channel1='General/_AUG_SXR_J53_time_0.0000-6.0000'
channel2='General/_AUG_SXR_J53_time_0.0000-6.0000'
trange=[2.059,2.159]
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID
gp_sort,ID
return

ID='2009_06_25_0514_20974_A_RAW'
print,ID
shot=20974
channel1='General/_AUG_SXR_J53_time_0.0000-6.0000'
channel2='General/_AUG_SXR_J53_time_0.0000-6.0000'
trange=[1.869,1.969]
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID
gp_sort,ID
return

ID='2009_06_25_0439_20975_A_RAW'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
channel2='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[3.981,4.08]
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID
gp_sort,ID
return

ID='2009_06_09_1748_22748_test_f2'
print,ID
shot=22748
channel1='General/_AUG_SXR_J53_time_1.8000-2.1000'
trange=[1.9,2]
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40)
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40)
gp_sort,ID
return

ID='2009_06_09_1746_22748_test_f2'
print,ID
shot=22748
channel1='General/_AUG_SXR_J53_time_1.8000-2.1000'
trange=[1.8,2.1]
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=2572,freqres=1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40)
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40)
gp_sort,ID
return

ID='2009_06_09_1738_22748_test_f2'
print,ID
shot=22748
channel1='General/_AUG_SXR_J53_time_1.8000-2.1000'
channel2='General/_AUG_SXR_J53_time_1.8000-2.1000'
trange=[1.8,2.1]
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID
gp_sort,ID
return

ID='2009_06_09_1732_22748_test_f2'
print,ID
shot=22748
channel1='General/_AUG_SXR_J53_time_1.8000-2.1000'
trange=[1.8,2.1]
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40)
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40)
gp_sort,ID
return

ID='2009_06_09_0935_noise'
print,ID
shot=20975
channel1='General/_AUG_SXR_J57_time_0.0000-6.0000'
channel2='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[3.78,3.88]
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID
gp_sort,ID
return

ID='2009_06_08_1844_noise'
print,ID
shot=20975
channel1='General/_AUG_SXR_J57_time_0.0000-6.0000'
channel2='General/_AUG_SXR_H57_time_0.0000-6.0000'
trange=[3.78,3.88]
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID
gp_sort,ID
return

ID='2009_06_08_1214_spikes'
print,ID
shot=20975
channel1='General/_AUG_SXR_J57_time_0.0000-6.0000'
channel2='AUG_mirnov/B31-08'
trange=[0,0.1]
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=18,dscale=0.01,plot=1,opt=0.15,/print,phaselevel=5,trange=trange)
gp_sort,ID

ID='2009_06_08_1217_spikes'
print,ID
shot=20975
channel1='General/_AUG_SXR_J57_time_0.0000-6.0000'
channel2='AUG_mirnov/B31-08'
trange=[0.1,0.2]
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=18,dscale=0.01,plot=1,opt=0.15,/print,phaselevel=5,trange=trange)
gp_sort,ID
return

ID='2009_06_08_1208_spikes'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
channel2='AUG_mirnov/B31-08'
trange=[0,0.1]
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=18,dscale=0.01,plot=1,opt=0.15,/print,phaselevel=5,trange=trange)
gp_sort,ID

ID='2009_06_08_1211_spikes'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
channel2='AUG_mirnov/B31-08'
trange=[0.1,0.2]
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=18,dscale=0.01,plot=1,opt=0.15,/print,phaselevel=5,trange=trange)
gp_sort,ID
return

ID='2009_06_08_1105_spikes'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
channel2='AUG_mirnov/B31-08'
trange=[0.2,0.3]
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=18,dscale=0.01,plot=1,opt=0.15,/print,phaselevel=5,trange=trange)
gp_sort,ID

ID='2009_06_08_1108_spikes'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
channel2='AUG_mirnov/B31-08'
trange=[1.2,1.3]
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=18,dscale=0.01,plot=1,opt=0.15,/print,phaselevel=5,trange=trange)
gp_sort,ID

ID='2009_06_08_1111_spikes'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
channel2='AUG_mirnov/B31-08'
trange=[2.2,2.3]
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=18,dscale=0.01,plot=1,opt=0.15,/print,phaselevel=5,trange=trange)
gp_sort,ID
return

ID='2009_06_08_1037_spikes'
print,ID
shot=20975
channel1='General/_AUG_SXR_J57_time_0.0000-6.0000'
channel2='AUG_mirnov/B31-08'
trange=[0.2,0.3]
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=18,dscale=0.01,plot=1,opt=0.15,/print,phaselevel=5,trange=trange)
gp_sort,ID

ID='2009_06_08_1040_spikes'
print,ID
shot=20975
channel1='General/_AUG_SXR_J57_time_0.0000-6.0000'
channel2='AUG_mirnov/B31-08'
trange=[1.2,1.3]
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=18,dscale=0.01,plot=1,opt=0.15,/print,phaselevel=5,trange=trange)
gp_sort,ID

ID='2009_06_08_1043_spikes'
print,ID
shot=20975
channel1='General/_AUG_SXR_J57_time_0.0000-6.0000'
channel2='AUG_mirnov/B31-08'
trange=[2.2,2.3]
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=18,dscale=0.01,plot=1,opt=0.15,/print,phaselevel=5,trange=trange)
gp_sort,ID
return

ID='2009_06_07_1751-20975_H60_D'
shot=20975
channel1='General/_AUG_SXR_H60_time_0.0000-6.0000'
t_stft=[1.38,2.55]
bands=[5,9,10,17]
f_le=50
windowsize=64
masksize=1572
fmax=50
trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93d0,1.96d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID
gp_sort,ID

ID='2009_06_07_1748-20975_H59_D'
shot=20975
channel1='General/_AUG_SXR_H59_time_0.0000-6.0000'
t_stft=[1.38,2.55]
bands=[5,9,10,17]
f_le=50
windowsize=64
masksize=1572
fmax=50
trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93d0,1.96d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID
gp_sort,ID

ID='2009_06_07_1745-20975_H57_D'
shot=20975
channel1='General/_AUG_SXR_H57_time_0.0000-6.0000'
t_stft=[1.38,2.55]
bands=[5,9,10,17]
f_le=50
windowsize=64
masksize=1572
fmax=50
trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93d0,1.96d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID
gp_sort,ID

ID='2009_06_07_1742-20975_H56_D'
shot=20975
channel1='General/_AUG_SXR_H56_time_0.0000-6.0000'
t_stft=[1.38,2.55]
bands=[5,9,10,17]
f_le=50
windowsize=64
masksize=1572
fmax=50
trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93d0,1.96d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID
gp_sort,ID

ID='2009_06_07_1739-20975_H54_D'
shot=20975
channel1='General/_AUG_SXR_H54_time_0.0000-6.0000'
t_stft=[1.38,2.55]
bands=[5,9,10,17]
f_le=50
windowsize=64
masksize=1572
fmax=50
trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93d0,1.96d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID
gp_sort,ID

ID='2009_06_07_1736-20975_H53_D'
shot=20975
channel1='General/_AUG_SXR_H53_time_0.0000-6.0000'
t_stft=[1.38,2.55]
bands=[5,9,10,17]
f_le=50
windowsize=64
masksize=1572
fmax=50
trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93d0,1.96d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID
gp_sort,ID

ID='2009_06_07_1733-20975_H51_D'
shot=20975
channel1='General/_AUG_SXR_H51_time_0.0000-6.0000'
t_stft=[1.38,2.55]
bands=[5,9,10,17]
f_le=50
windowsize=64
masksize=1572
fmax=50
trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93d0,1.96d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID
gp_sort,ID


ID='2009_06_07_1730-20975_H49_D'
shot=20975
channel1='General/_AUG_SXR_H49_time_0.0000-6.0000'
t_stft=[1.38,2.55]
bands=[5,9,10,17]
f_le=50
windowsize=64
masksize=1572
fmax=50
trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93d0,1.96d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID
gp_sort,ID
return

ID='2009_06_07_1657-20975_H47_D'
shot=20975
channel1='General/_AUG_SXR_H47_time_0.0000-6.0000'
t_stft=[1.38,2.55]
bands=[5,9,10,17]
f_le=50
windowsize=64
masksize=1572
fmax=50
trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93d0,1.96d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID
gp_sort,ID
return


ID='2009_06_07_1526_fishbone'
print,ID
shot=20975
channel1='General/_AUG_SXR_J57_time_0.0000-6.0000'
channel2='AUG_mirnov/B31-08'
trange=[3.78,3.88]
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID
gp_sort,ID
return

ID='2009_06_07_1503_elm'
print,ID
shot=20975
channel1='General/_AUG_SXR_J57_time_0.0000-6.0000'
channel2='AUG_mirnov/B31-08'
trange=[3.78,3.88]
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=18,dscale=0.01,plot=1,opt=0.15,/print,phaselevel=5,trange=trange)
gp_sort,ID
return

ID='2009_06_05_1456_fishbone'
print,ID
shot=20975
channel1='General/_AUG_SXR_J57_time_0.0000-6.0000'
channel2='AUG_mirnov/B31-08'
trange=[3.78,3.84]
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID
gp_sort,ID
return

ID='2009_06_05_1442_fishbone'
print,ID
shot=20975
channel1='AUG_mirnov/B31-08'
trange=[3.78,3.88]
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100)
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100)
gp_sort,ID
return

ID='2009_06_05_1440_fishbone'
print,ID
shot=20975
channel1='AUG_mirnov/B31-08'
trange=[3.78,3.88]
stft=pg_spectrogram(shot,channel1,windowsize=16,masksize=2572,freqres=1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100)
stft=pg_spectrogram(shot,channel1,windowsize=32,masksize=2572,freqres=1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100)
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=2572,freqres=1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100)
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100)
gp_sort,ID
return

ID='2009_06_05_1436_fishbone'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
channel2='AUG_mirnov/B31-08'
trange=[3.78,3.88]
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID
gp_sort,ID
return

ID='2009_06_05_1431_fishbone'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
channel2='AUG_mirnov/B31-08'
trange=[1.394,1.404]
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID
gp_sort,ID
return

ID='2009_06_05_1428_fishbone'
print,ID
shot=20975
channel1='AUG_mirnov/C09-32'
channel2='AUG_mirnov/B31-08'
trange=[1.394,1.404]
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID
gp_sort,ID
return

ID='2009_06_05_1426_fishbone'
print,ID
shot=20975
channel1='AUG_mirnov/C09-32'
trange=[1.394,1.404]
stft=pg_spectrogram(shot,channel1,windowsize=16,masksize=2572,freqres=1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100)
stft=pg_spectrogram(shot,channel1,windowsize=32,masksize=2572,freqres=1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100)
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=2572,freqres=1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100)
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100)
gp_sort,ID
return

ID='2009_06_05_1423_fishbone'
print,ID
shot=20975
channel1='AUG_mirnov/C09-32'
trange=[1.394,1.404]
stft=pg_spectrogram(shot,channel1,windowsize=16,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100)
stft=pg_spectrogram(shot,channel1,windowsize=32,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100)
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100)
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100)
gp_sort,ID
return

ID='2009_06_05_1205_fishbone'
print,ID
shot=20975
channel1='AUG_mirnov/B31-08'
trange=[1.394,1.404]
stft=pg_spectrogram(shot,channel1,windowsize=32,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100)
stft=pg_spectrogram(shot,channel1,windowsize=16,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100)
gp_sort,ID
return

ID='2009_06_05_1205_fishbone'
print,ID
shot=20975
channel1='AUG_mirnov/B31-08'
trange=[1.399,1.404]
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100)
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100)
gp_sort,ID
return

ID='2009_06_04_0947'
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
channel2='General/_AUG_SXR_J53_time_0.0000-3.0000'
trange=[2.113,2.213]
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID
return

ID='2009_06_04_0951'
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
channel2='General/_AUG_SXR_I53_time_2.5000-2.9000'
trange=[2.5,2.54]
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID
return

ID='2009_06_04_0947'
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
channel2='General/_AUG_SXR_J53_time_0.0000-3.0000'
trange=[2.11,2.21]
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID
return

ID='2009_05_15_1418-20975_J53_D'
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
t_stft=[1.38,2.55]
bands=[5,9,10,17]
f_le=0.4
windowsize=64
masksize=1572
fmax=40
trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93001d0,1.96001d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID
return


ID='2009_05_15_0416-20975_J53_D'
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
t_stft=[1.38,2.55]
bands=[5,9,10,17]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93001d0,1.96001d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID
return

ID='2009_05_07_0344-20975_J53_D'
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
t_stft=[1.38,2.55]
bands=[10,17,20,27]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93001d0,1.96001d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID
return

ID='2009_05_07_0341-20975_J53_D'
shot=20975
channel1='General/_AUG_SXR_J51_time_0.0000-6.0000'
t_stft=[1.38,2.55]
bands=[5,9,10,17]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93001d0,1.96001d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID
return


ID='2009_05_07_0334-20975_J53_D'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
t_stft=[1.38,2.55]
bands=[10,17,20,27]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93001d0,1.96001d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID
return

ID='2009_04_01_1317-20974_J57_A'
print,ID
shot=20974
channel1='General/_AUG_SXR_J57_time_0.0000-6.0000'
t_stft=[1.36,2.54]
bands=[4,9,10,16]
windowsize=64
masksize=1572
fmax=100
trange=dblarr(17,2)
trange[0,*]=[0,1.4145d0]
trange[1,*]=[0,1.505d0]
trange[2,*]=[0,1.5855d0]
trange[3,*]=[0,1.66d0]
trange[4,*]=[0,1.73d0]
trange[5,*]=[0,1.798d0]
trange[6,*]=[0,1.866d0]
trange[7,*]=[0,1.932d0]
trange[8,*]=[0,1.996d0]
trange[9,*]=[0,2.059d0]
trange[10,*]=[0,2.122d0]
trange[11,*]=[0,2.185d0]
trange[12,*]=[0,2.252d0]
trange[13,*]=[0,2.315d0]
trange[14,*]=[0,2.383d0]
trange[15,*]=[0,2.446d0]
trange[16,*]=[0,2.505d0]
dt=0.025
for i=0,16 do trange[i,0]=trange[i,1]-dt

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID
return

ID='2009_04_01_1050-20974_J57_A'
print,ID
shot=20974
channel1='General/_AUG_SXR_J57_time_0.0000-6.0000'
t_stft=[1.36,2.54]
bands=[30,40,45,55]
windowsize=64
masksize=1572
fmax=100
trange=dblarr(17,2)
trange[0,*]=[0,1.4145d0]
trange[1,*]=[0,1.505d0]
trange[2,*]=[0,1.5855d0]
trange[3,*]=[0,1.66d0]
trange[4,*]=[0,1.73d0]
trange[5,*]=[0,1.798d0]
trange[6,*]=[0,1.866d0]
trange[7,*]=[0,1.932d0]
trange[8,*]=[0,1.996d0]
trange[9,*]=[0,2.059d0]
trange[10,*]=[0,2.122d0]
trange[11,*]=[0,2.185d0]
trange[12,*]=[0,2.252d0]
trange[13,*]=[0,2.315d0]
trange[14,*]=[0,2.383d0]
trange[15,*]=[0,2.446d0]
trange[16,*]=[0,2.505d0]
dt=0.025
for i=0,16 do trange[i,0]=trange[i,1]-dt

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID
return

ID='2009_03_30_1618'
print,ID
shot=20974
channel1='General/_AUG_SXR_J57_time_0.0000-6.0000'
trange=[1.399,1.404]
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100,ID=ID)
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100,ID=ID)
stft=pg_spectrogram(shot,channel1,windowsize=32,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100,ID=ID)
stft=pg_spectrogram(shot,channel1,windowsize=16,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100,ID=ID)
stft=pg_spectrogram(shot,channel1,windowsize=8,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100,ID=ID)
gp_sort,ID
return

ID='2009_03_30_1545-20974_J57_A'
print,ID
shot=20974
channel1='General/_AUG_SXR_J57_time_0.0000-6.0000'
t_stft=[1.36,2.54]
bands=[30,40,45,55]
windowsize=64
masksize=1572
fmax=100
trange=dblarr(17,2)
trange[0,*]=[0,1.4145d0]
trange[1,*]=[0,1.505d0]
trange[2,*]=[0,1.5855d0]
trange[3,*]=[0,1.66d0]
trange[4,*]=[0,1.73d0]
trange[5,*]=[0,1.798d0]
trange[6,*]=[0,1.866d0]
trange[7,*]=[0,1.932d0]
trange[8,*]=[0,1.996d0]
trange[9,*]=[0,2.059d0]
trange[10,*]=[0,2.122d0]
trange[11,*]=[0,2.185d0]
trange[12,*]=[0,2.252d0]
trange[13,*]=[0,2.315d0]
trange[14,*]=[0,2.383d0]
trange[15,*]=[0,2.446d0]
trange[16,*]=[0,2.505d0]
dt=0.025
for i=0,16 do trange[i,0]=trange[i,1]-dt

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID
return

ID='2009_03_30_1404-20974_J53_A'
print,ID
shot=20974
channel1='General/_AUG_SXR_J53_time_0.0000-6.0000'
t_stft=[1.36,2.54]
bands=[30,40,45,55]
windowsize=64
masksize=1572
fmax=60

trange=dblarr(17,2)
trange[0,*]=[0,1.4145d0]
trange[1,*]=[0,1.505d0]
trange[2,*]=[0,1.5855d0]
trange[3,*]=[0,1.66d0]
trange[4,*]=[0,1.73d0]
trange[5,*]=[0,1.798d0]
trange[6,*]=[0,1.866d0]
trange[7,*]=[0,1.932d0]
trange[8,*]=[0,1.996d0]
trange[9,*]=[0,2.059d0]
trange[10,*]=[0,2.122d0]
trange[11,*]=[0,2.185d0]
trange[12,*]=[0,2.252d0]
trange[13,*]=[0,2.315d0]
trange[14,*]=[0,2.383d0]
trange[15,*]=[0,2.446d0]
trange[16,*]=[0,2.505d0]
dt=0.025
for i=0,16 do trange[i,0]=trange[i,1]-dt

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID
return

ID='2009_03_30_1219-20974_J53_A'
print,ID
shot=20974
channel1='General/_AUG_SXR_J53_time_0.0000-6.0000'
t_stft=[1.36,2.54]
bands=[30,40,45,55]
f_le=100
windowsize=64
masksize=1572
fmax=100
trange=dblarr(17,2)
trange[0,*]=[0,1.4145d0]
trange[1,*]=[0,1.505d0]
trange[2,*]=[0,1.5855d0]
trange[3,*]=[0,1.66d0]
trange[4,*]=[0,1.73d0]
trange[5,*]=[0,1.798d0]
trange[6,*]=[0,1.866d0]
trange[7,*]=[0,1.932d0]
trange[8,*]=[0,1.996d0]
trange[9,*]=[0,2.059d0]
trange[10,*]=[0,2.122d0]
trange[11,*]=[0,2.185d0]
trange[12,*]=[0,2.252d0]
trange[13,*]=[0,2.315d0]
trange[14,*]=[0,2.383d0]
trange[15,*]=[0,2.446d0]
trange[16,*]=[0,2.505d0]
dt=0.025
for i=0,16 do trange[i,0]=trange[i,1]-dt

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID
return


ID='2009_03_25_1540_J53_J57'
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
channel2='General/_AUG_SXR_J57_time_0.0000-6.0000'
trange=[1.399,1.404]
blocksize=1000
gp_analyse,20975,channel1,channel2,trange=trange,ID=ID,blocksize=blocksize
return




ID='2009_03_20_1328-20974_J53_A'
print,ID
shot=20974
channel1='General/_AUG_SXR_J53_time_0.0000-6.0000'
t_stft=[1.36,2.54]
bands=[30,40,45,55]
f_le=100
windowsize=64
masksize=1572
fmax=100
trange=dblarr(17,2)
trange[0,*]=[0,1.4145d0]
trange[1,*]=[0,1.505d0]
trange[2,*]=[0,1.5855d0]
trange[3,*]=[0,1.66d0]
trange[4,*]=[0,1.73d0]
trange[5,*]=[0,1.798d0]
trange[6,*]=[0,1.866d0]
trange[7,*]=[0,1.932d0]
trange[8,*]=[0,1.996d0]
trange[9,*]=[0,2.059d0]
trange[10,*]=[0,2.122d0]
trange[11,*]=[0,2.185d0]
trange[12,*]=[0,2.252d0]
trange[13,*]=[0,2.315d0]
trange[14,*]=[0,2.383d0]
trange[15,*]=[0,2.446d0]
trange[16,*]=[0,2.505d0]
dt=0.025
for i=0,16 do trange[i,0]=trange[i,1]-dt

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID
return

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************


ID='2009_03_20_1235-20974_J57_A'
print,ID
shot=20974
channel1='General/_AUG_SXR_J57_time_0.0000-6.0000'
t_stft=[1.36,2.54]
bands=[30,40,45,55]
f_le=100
windowsize=64
masksize=1572
fmax=100
trange=dblarr(17,2)
trange[0,*]=[0,1.4145d0]
trange[1,*]=[0,1.505d0]
trange[2,*]=[0,1.5855d0]
trange[3,*]=[0,1.66d0]
trange[4,*]=[0,1.73d0]
trange[5,*]=[0,1.798d0]
trange[6,*]=[0,1.866d0]
trange[7,*]=[0,1.932d0]
trange[8,*]=[0,1.996d0]
trange[9,*]=[0,2.059d0]
trange[10,*]=[0,2.122d0]
trange[11,*]=[0,2.185d0]
trange[12,*]=[0,2.252d0]
trange[13,*]=[0,2.315d0]
trange[14,*]=[0,2.383d0]
trange[15,*]=[0,2.446d0]
trange[16,*]=[0,2.505d0]
dt=0.025
for i=0,16 do trange[i,0]=trange[i,1]-dt

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID
return

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************


ID='2009_03_20_1235-20974_J57_A'
print,ID
shot=20974
channel1='General/_AUG_SXR_J57_time_0.0000-6.0000'
t_stft=[1.36,2.54]
bands=[65,75,85,95]
f_le=100
windowsize=64
masksize=1572
fmax=100
trange=dblarr(17,2)
trange[0,*]=[0,1.4145d0]
trange[1,*]=[0,1.505d0]
trange[2,*]=[0,1.5855d0]
trange[3,*]=[0,1.66d0]
trange[4,*]=[0,1.73d0]
trange[5,*]=[0,1.798d0]
trange[6,*]=[0,1.866d0]
trange[7,*]=[0,1.932d0]
trange[8,*]=[0,1.996d0]
trange[9,*]=[0,2.059d0]
trange[10,*]=[0,2.122d0]
trange[11,*]=[0,2.185d0]
trange[12,*]=[0,2.252d0]
trange[13,*]=[0,2.315d0]
trange[14,*]=[0,2.383d0]
trange[15,*]=[0,2.446d0]
trange[16,*]=[0,2.505d0]
dt=0.025
for i=0,16 do trange[i,0]=trange[i,1]-dt

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID
return

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************



ID='2009_03_20_1133-20974_J53_A'
shot=20974
channel1='General/_AUG_SXR_J53_time_0.0000-6.0000'
t_stft=[1.36,2.54]
bands=[16,19,21,24]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(17,2)
trange[0,*]=[0,1.4145d0]
trange[1,*]=[0,1.505d0]
trange[2,*]=[0,1.5855d0]
trange[3,*]=[0,1.66d0]
trange[4,*]=[0,1.73d0]
trange[5,*]=[0,1.798d0]
trange[6,*]=[0,1.866d0]
trange[7,*]=[0,1.932d0]
trange[8,*]=[0,1.996d0]
trange[9,*]=[0,2.059d0]
trange[10,*]=[0,2.122d0]
trange[11,*]=[0,2.185d0]
trange[12,*]=[0,2.252d0]
trange[13,*]=[0,2.315d0]
trange[14,*]=[0,2.383d0]
trange[15,*]=[0,2.446d0]
trange[16,*]=[0,2.505d0]
dt=0.025
for i=0,16 do trange[i,0]=trange[i,1]-dt

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID
return

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_03_09_1414-20974_J51_A'
shot=20974
channel1='General/_AUG_SXR_J51_time_0.0000-6.0000'
t_stft=[1.36,2.54]
bands=[4,9,10,16]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(17,2)
trange[0,*]=[0,1.4145d0]
trange[1,*]=[0,1.505d0]
trange[2,*]=[0,1.5855d0]
trange[3,*]=[0,1.66d0]
trange[4,*]=[0,1.73d0]
trange[5,*]=[0,1.798d0]
trange[6,*]=[0,1.866d0]
trange[7,*]=[0,1.932d0]
trange[8,*]=[0,1.996d0]
trange[9,*]=[0,2.059d0]
trange[10,*]=[0,2.122d0]
trange[11,*]=[0,2.185d0]
trange[12,*]=[0,2.252d0]
trange[13,*]=[0,2.315d0]
trange[14,*]=[0,2.383d0]
trange[15,*]=[0,2.446d0]
trange[16,*]=[0,2.505d0]
dt=0.025
for i=0,16 do trange[i,0]=trange[i,1]-dt

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_03_09_1416-20975_J51_D'
shot=20975
channel1='General/_AUG_SXR_J51_time_0.0000-6.0000'
t_stft=[1.38,2.55]
bands=[5,9,10,17]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93001d0,1.96001d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_03_09_1416-20975_J51_A'
shot=20975
channel1='General/_AUG_SXR_J51_time_0.0000-6.0000'
t_stft=[3.87,4.6]
bands=[4,7,8,15]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(8,2)
trange[0,*]=[3.9d0,3.94d0]
trange[1,*]=[4.0d0,4.04d0]
trange[2,*]=[4.085d0,4.125d0]
trange[3,*]=[4.17d0,4.21d0]
trange[4,*]=[4.25d0,4.29d0]
trange[5,*]=[4.325d0,4.365d0]
trange[6,*]=[4.395d0,4.435d0]
trange[7,*]=[4.455d0,4.495d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************
return


ID='2009_03_09_1303-20974_J46_A'
shot=20974
channel1='General/_AUG_SXR_J46_time_0.0000-6.0000'
t_stft=[1.36,2.54]
bands=[4,9,10,16]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(17,2)
trange[0,*]=[0,1.4145d0]
trange[1,*]=[0,1.505d0]
trange[2,*]=[0,1.5855d0]
trange[3,*]=[0,1.66d0]
trange[4,*]=[0,1.73d0]
trange[5,*]=[0,1.798d0]
trange[6,*]=[0,1.866d0]
trange[7,*]=[0,1.932d0]
trange[8,*]=[0,1.996d0]
trange[9,*]=[0,2.059d0]
trange[10,*]=[0,2.122d0]
trange[11,*]=[0,2.185d0]
trange[12,*]=[0,2.252d0]
trange[13,*]=[0,2.315d0]
trange[14,*]=[0,2.383d0]
trange[15,*]=[0,2.446d0]
trange[16,*]=[0,2.505d0]
dt=0.025
for i=0,16 do trange[i,0]=trange[i,1]-dt

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_03_09_1304-20974_J48_A'
shot=20974
channel1='General/_AUG_SXR_J48_time_0.0000-6.0000'
t_stft=[1.36,2.54]
bands=[4,9,10,16]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(17,2)
trange[0,*]=[0,1.4145d0]
trange[1,*]=[0,1.505d0]
trange[2,*]=[0,1.5855d0]
trange[3,*]=[0,1.66d0]
trange[4,*]=[0,1.73d0]
trange[5,*]=[0,1.798d0]
trange[6,*]=[0,1.866d0]
trange[7,*]=[0,1.932d0]
trange[8,*]=[0,1.996d0]
trange[9,*]=[0,2.059d0]
trange[10,*]=[0,2.122d0]
trange[11,*]=[0,2.185d0]
trange[12,*]=[0,2.252d0]
trange[13,*]=[0,2.315d0]
trange[14,*]=[0,2.383d0]
trange[15,*]=[0,2.446d0]
trange[16,*]=[0,2.505d0]
dt=0.025
for i=0,16 do trange[i,0]=trange[i,1]-dt

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************


ID='2009_03_09_1305-20974_J49_A'
shot=20974
channel1='General/_AUG_SXR_J49_time_0.0000-6.0000'
t_stft=[1.36,2.54]
bands=[4,9,10,16]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(17,2)
trange[0,*]=[0,1.4145d0]
trange[1,*]=[0,1.505d0]
trange[2,*]=[0,1.5855d0]
trange[3,*]=[0,1.66d0]
trange[4,*]=[0,1.73d0]
trange[5,*]=[0,1.798d0]
trange[6,*]=[0,1.866d0]
trange[7,*]=[0,1.932d0]
trange[8,*]=[0,1.996d0]
trange[9,*]=[0,2.059d0]
trange[10,*]=[0,2.122d0]
trange[11,*]=[0,2.185d0]
trange[12,*]=[0,2.252d0]
trange[13,*]=[0,2.315d0]
trange[14,*]=[0,2.383d0]
trange[15,*]=[0,2.446d0]
trange[16,*]=[0,2.505d0]
dt=0.025
for i=0,16 do trange[i,0]=trange[i,1]-dt

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_03_09_1306-20974_J50_A'
shot=20974
channel1='General/_AUG_SXR_J50_time_0.0000-6.0000'
t_stft=[1.36,2.54]
bands=[4,9,10,16]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(17,2)
trange[0,*]=[0,1.4145d0]
trange[1,*]=[0,1.505d0]
trange[2,*]=[0,1.5855d0]
trange[3,*]=[0,1.66d0]
trange[4,*]=[0,1.73d0]
trange[5,*]=[0,1.798d0]
trange[6,*]=[0,1.866d0]
trange[7,*]=[0,1.932d0]
trange[8,*]=[0,1.996d0]
trange[9,*]=[0,2.059d0]
trange[10,*]=[0,2.122d0]
trange[11,*]=[0,2.185d0]
trange[12,*]=[0,2.252d0]
trange[13,*]=[0,2.315d0]
trange[14,*]=[0,2.383d0]
trange[15,*]=[0,2.446d0]
trange[16,*]=[0,2.505d0]
dt=0.025
for i=0,16 do trange[i,0]=trange[i,1]-dt

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************
return


ID='2009_03_09_1138-20975_J50_D'
shot=20975
channel1='General/_AUG_SXR_J50_time_0.0000-6.0000'
t_stft=[1.38,2.55]
bands=[5,9,10,17]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93001d0,1.96001d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_03_09_1139-20975_J50_A'
shot=20975
channel1='General/_AUG_SXR_J50_time_0.0000-6.0000'
t_stft=[3.87,4.6]
bands=[4,7,8,15]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(8,2)
trange[0,*]=[3.9d0,3.94d0]
trange[1,*]=[4.0d0,4.04d0]
trange[2,*]=[4.085d0,4.125d0]
trange[3,*]=[4.17d0,4.21d0]
trange[4,*]=[4.25d0,4.29d0]
trange[5,*]=[4.325d0,4.365d0]
trange[6,*]=[4.395d0,4.435d0]
trange[7,*]=[4.455d0,4.495d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_03_09_1140-20975_J49_D'
shot=20975
channel1='General/_AUG_SXR_J49_time_0.0000-6.0000'
t_stft=[1.38,2.55]
bands=[5,9,10,17]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93001d0,1.96001d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_03_09_1141-20975_J49_A'
shot=20975
channel1='General/_AUG_SXR_J49_time_0.0000-6.0000'
t_stft=[3.87,4.6]
bands=[4,7,8,15]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(8,2)
trange[0,*]=[3.9d0,3.94d0]
trange[1,*]=[4.0d0,4.04d0]
trange[2,*]=[4.085d0,4.125d0]
trange[3,*]=[4.17d0,4.21d0]
trange[4,*]=[4.25d0,4.29d0]
trange[5,*]=[4.325d0,4.365d0]
trange[6,*]=[4.395d0,4.435d0]
trange[7,*]=[4.455d0,4.495d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_03_09_1142-20975_J48_D'
shot=20975
channel1='General/_AUG_SXR_J48_time_0.0000-6.0000'
t_stft=[1.38,2.55]
bands=[5,9,10,17]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93001d0,1.96001d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_03_09_1143-20975_J48_A'
shot=20975
channel1='General/_AUG_SXR_J48_time_0.0000-6.0000'
t_stft=[3.87,4.6]
bands=[4,7,8,15]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(8,2)
trange[0,*]=[3.9d0,3.94d0]
trange[1,*]=[4.0d0,4.04d0]
trange[2,*]=[4.085d0,4.125d0]
trange[3,*]=[4.17d0,4.21d0]
trange[4,*]=[4.25d0,4.29d0]
trange[5,*]=[4.325d0,4.365d0]
trange[6,*]=[4.395d0,4.435d0]
trange[7,*]=[4.455d0,4.495d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_03_09_1144-20975_J46_D'
shot=20975
channel1='General/_AUG_SXR_J46_time_0.0000-6.0000'
t_stft=[1.38,2.55]
bands=[5,9,10,17]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93001d0,1.96001d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_03_09_1145-20975_J46_A'
shot=20975
channel1='General/_AUG_SXR_J46_time_0.0000-6.0000'
t_stft=[3.87,4.6]
bands=[4,7,8,15]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(8,2)
trange[0,*]=[3.9d0,3.94d0]
trange[1,*]=[4.0d0,4.04d0]
trange[2,*]=[4.085d0,4.125d0]
trange[3,*]=[4.17d0,4.21d0]
trange[4,*]=[4.25d0,4.29d0]
trange[5,*]=[4.325d0,4.365d0]
trange[6,*]=[4.395d0,4.435d0]
trange[7,*]=[4.455d0,4.495d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

return


ID='2009_02_25_1611_J58_SCA'
shot=20975
channel1='General/_AUG_SXR_J58_time_0.0000-6.0000'
trange=[3.78,3.88]
cwt=pg_scalogram([shot],[channel1],order=3,dscale=0.01,plot=1,opt=0.1,/print,/pad,trange=trange,ID=ID)
cwt=pg_scalogram([shot],[channel1],order=6,dscale=0.01,plot=1,opt=0.1,/print,/pad,trange=trange,ID=ID)
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.1,/print,/pad,trange=trange,ID=ID)
gp_sort,ID

ID='2009_02_25_1612_J60_SCA'
shot=20975
channel1='General/_AUG_SXR_J60_time_0.0000-6.0000'
trange=[3.78,3.88]
cwt=pg_scalogram([shot],[channel1],order=3,dscale=0.01,plot=1,opt=0.1,/print,/pad,trange=trange,ID=ID)
cwt=pg_scalogram([shot],[channel1],order=6,dscale=0.01,plot=1,opt=0.1,/print,/pad,trange=trange,ID=ID)
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.1,/print,/pad,trange=trange,ID=ID)
gp_sort,ID
return

ID='2009_02_26_1606_20975_J58_A_SPE_64'
print,ID
shot=20975
channel1='General/_AUG_SXR_J58_time_0.0000-6.0000'
times=[3.85,3.948,4.051,4.1345,4.217,4.3013,4.378,4.446,4.507]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
print,trange
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100,ID=ID)
endfor
gp_sort,ID

ID='2009_02_26_1607_20975_J58_A_SPE_128'
print,ID
shot=20975
channel1='General/_AUG_SXR_J58_time_0.0000-6.0000'
times=[3.85,3.948,4.051,4.1345,4.217,4.3013,4.378,4.446,4.507]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
print,trange
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100,ID=ID)
endfor
gp_sort,ID
return

ID='2009_02_26_1545_J57_J60'
shot=20975
channel1='General/_AUG_SXR_J57_time_0.0000-6.0000'
channel2='General/_AUG_SXR_J60_time_0.0000-6.0000'
trange=[1.38,2.55]
blocksize=10000
gp_analyse,20975,channel1,channel2,trange=trange,ID=ID,blocksize=blocksize

ID='2009_02_26_1546_J58_J60'
shot=20975
channel1='General/_AUG_SXR_J58_time_0.0000-6.0000'
channel2='General/_AUG_SXR_J60_time_0.0000-6.0000'
trange=[1.38,2.55]
blocksize=10000
gp_analyse,20975,channel1,channel2,trange=trange,ID=ID,blocksize=blocksize
return

ID='2009_02_26_1542_20975_J60_A_SPE_64'
print,ID
shot=20975
channel1='General/_AUG_SXR_J60_time_0.0000-6.0000'
times=[3.85,3.948,4.051,4.1345,4.217,4.3013,4.378,4.446,4.507]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
print,trange
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100,ID=ID)
endfor
gp_sort,ID

ID='2009_02_26_1543_20975_J60_A_SPE_128'
print,ID
shot=20975
channel1='General/_AUG_SXR_J60_time_0.0000-6.0000'
times=[3.85,3.948,4.051,4.1345,4.217,4.3013,4.378,4.446,4.507]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
print,trange
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100,ID=ID)
endfor
gp_sort,ID
return

ID='2009_02_26_1326_20975_J57_A_SPE_64'
print,ID
shot=20975
channel1='General/_AUG_SXR_J57_time_0.0000-6.0000'
times=[3.85,3.948,4.051,4.1345,4.217,4.3013,4.378,4.446,4.507]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
print,trange
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100,ID=ID)
endfor
gp_sort,ID

ID='2009_02_26_1327_20975_J57_A_SPE_128'
print,ID
shot=20975
channel1='General/_AUG_SXR_J57_time_0.0000-6.0000'
times=[3.85,3.948,4.051,4.1345,4.217,4.3013,4.378,4.446,4.507]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
print,trange
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100,ID=ID)
endfor
gp_sort,ID
return

ID='2009_02_25_1417_J57_J58'
shot=20975
channel1='General/_AUG_SXR_J57_time_0.0000-6.0000'
channel2='General/_AUG_SXR_J58_time_0.0000-6.0000'
trange=[3.78, 3.88]
blocksize=10000
gp_analyse,20975,channel1,channel2,trange=trange,ID=ID,blocksize=blocksize

ID='2009_02_25_1418_J57_J58'
shot=20975
channel1='General/_AUG_SXR_J57_time_0.0000-6.0000'
channel2='General/_AUG_SXR_J58_time_0.0000-6.0000'
trange=[1.38,2.55]
blocksize=10000
gp_analyse,20975,channel1,channel2,trange=trange,ID=ID,blocksize=blocksize
return

ID='2009_02_25_1412_J57_J58'
shot=20975
channel1='General/_AUG_SXR_J57_time_0.0000-6.0000'
channel2='General/_AUG_SXR_J58_time_0.0000-6.0000'
trange=[3.78, 3.88]
blocksize=10240
gp_analyse,20975,channel1,channel2,trange=trange,ID=ID,blocksize=blocksize

ID='2009_02_25_1413_J57_J58'
shot=20975
channel1='General/_AUG_SXR_J57_time_0.0000-6.0000'
channel2='General/_AUG_SXR_J58_time_0.0000-6.0000'
trange=[1.38,2.55]
blocksize=10240
gp_analyse,20975,channel1,channel2,trange=trange,ID=ID,blocksize=blocksize
return

ID='2009_02_25_1401_J57_J58'
shot=20975
channel1='General/_AUG_SXR_J57_time_0.0000-6.0000'
channel2='General/_AUG_SXR_J58_time_0.0000-6.0000'
trange=[3.78, 3.88]
blocksize=1024
gp_analyse,20975,channel1,channel2,trange=trange,ID=ID,blocksize=blocksize
return

ID='2009_02_25_1400_J57_J58'
shot=20975
channel1='General/_AUG_SXR_J57_time_0.0000-6.0000'
channel2='General/_AUG_SXR_J58_time_0.0000-6.0000'
trange=[1.38,2.55]
blocksize=1024
gp_analyse,20975,channel1,channel2,trange=trange,ID=ID,blocksize=blocksize
return

ID='2009_02_25_1251_J57_SCA'
shot=20975
channel1='General/_AUG_SXR_J57_time_0.0000-6.0000'
trange=[3.78,3.88]
cwt=pg_scalogram([shot],[channel1],order=3,dscale=0.01,plot=1,opt=0.1,/print,/pad,trange=trange,ID=ID)
cwt=pg_scalogram([shot],[channel1],order=6,dscale=0.01,plot=1,opt=0.1,/print,/pad,trange=trange,ID=ID)
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.1,/print,/pad,trange=trange,ID=ID)
gp_sort,ID
return

ID='2009_02_25_1049-20975_J53_D'
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
t_stft=[1.38,2.55]
bands=[5,9,10,17]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93001d0,1.96001d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_02_25_1050-20975_J53_A'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
t_stft=[3.87,4.6]
bands=[4,7,8,15]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(8,2)
trange[0,*]=[3.9d0,3.94d0]
trange[1,*]=[4.0d0,4.04d0]
trange[2,*]=[4.085d0,4.125d0]
trange[3,*]=[4.17d0,4.21d0]
trange[4,*]=[4.25d0,4.29d0]
trange[5,*]=[4.325d0,4.365d0]
trange[6,*]=[4.395d0,4.435d0]
trange[7,*]=[4.455d0,4.495d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_02_25_1051-20974_J53_A'
shot=20974
channel1='General/_AUG_SXR_J53_time_0.0000-6.0000'
t_stft=[1.36,2.54]
bands=[4,9,10,16]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(17,2)
trange[0,*]=[0,1.4145d0]
trange[1,*]=[0,1.505d0]
trange[2,*]=[0,1.5855d0]
trange[3,*]=[0,1.66d0]
trange[4,*]=[0,1.73d0]
trange[5,*]=[0,1.798d0]
trange[6,*]=[0,1.866d0]
trange[7,*]=[0,1.932d0]
trange[8,*]=[0,1.996d0]
trange[9,*]=[0,2.059d0]
trange[10,*]=[0,2.122d0]
trange[11,*]=[0,2.185d0]
trange[12,*]=[0,2.252d0]
trange[13,*]=[0,2.315d0]
trange[14,*]=[0,2.383d0]
trange[15,*]=[0,2.446d0]
trange[16,*]=[0,2.505d0]
dt=0.025
for i=0,16 do trange[i,0]=trange[i,1]-dt

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_02_25_1052-20975_J54_D'
shot=20975
channel1='General/_AUG_SXR_J54_time_0.0000-6.0000'
t_stft=[1.38,2.55]
bands=[5,9,10,17]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93001d0,1.96001d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_02_25_1053-20975_J54_A'
shot=20975
channel1='General/_AUG_SXR_J54_time_0.0000-6.0000'
t_stft=[3.87,4.6]
bands=[4,7,8,15]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(8,2)
trange[0,*]=[3.9d0,3.94d0]
trange[1,*]=[4.0d0,4.04d0]
trange[2,*]=[4.085d0,4.125d0]
trange[3,*]=[4.17d0,4.21d0]
trange[4,*]=[4.25d0,4.29d0]
trange[5,*]=[4.325d0,4.365d0]
trange[6,*]=[4.395d0,4.435d0]
trange[7,*]=[4.455d0,4.495d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_02_25_1054-20974_J54_A'
shot=20974
channel1='General/_AUG_SXR_J54_time_0.0000-6.0000'
t_stft=[1.36,2.54]
bands=[4,9,10,16]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(17,2)
trange[0,*]=[0,1.4145d0]
trange[1,*]=[0,1.505d0]
trange[2,*]=[0,1.5855d0]
trange[3,*]=[0,1.66d0]
trange[4,*]=[0,1.73d0]
trange[5,*]=[0,1.798d0]
trange[6,*]=[0,1.866d0]
trange[7,*]=[0,1.932d0]
trange[8,*]=[0,1.996d0]
trange[9,*]=[0,2.059d0]
trange[10,*]=[0,2.122d0]
trange[11,*]=[0,2.185d0]
trange[12,*]=[0,2.252d0]
trange[13,*]=[0,2.315d0]
trange[14,*]=[0,2.383d0]
trange[15,*]=[0,2.446d0]
trange[16,*]=[0,2.505d0]
dt=0.025
for i=0,16 do trange[i,0]=trange[i,1]-dt

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_02_25_1055-20975_J56_D'
shot=20975
channel1='General/_AUG_SXR_J56_time_0.0000-6.0000'
t_stft=[1.38,2.55]
bands=[5,9,10,17]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93001d0,1.96001d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_02_25_1056-20975_J56_A'
shot=20975
channel1='General/_AUG_SXR_J56_time_0.0000-6.0000'
t_stft=[3.87,4.6]
bands=[4,7,8,15]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(8,2)
trange[0,*]=[3.9d0,3.94d0]
trange[1,*]=[4.0d0,4.04d0]
trange[2,*]=[4.085d0,4.125d0]
trange[3,*]=[4.17d0,4.21d0]
trange[4,*]=[4.25d0,4.29d0]
trange[5,*]=[4.325d0,4.365d0]
trange[6,*]=[4.395d0,4.435d0]
trange[7,*]=[4.455d0,4.495d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_02_25_1057-20974_J56_A'
shot=20974
channel1='General/_AUG_SXR_J56_time_0.0000-6.0000'
t_stft=[1.36,2.54]
bands=[4,9,10,16]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(17,2)
trange[0,*]=[0,1.4145d0]
trange[1,*]=[0,1.505d0]
trange[2,*]=[0,1.5855d0]
trange[3,*]=[0,1.66d0]
trange[4,*]=[0,1.73d0]
trange[5,*]=[0,1.798d0]
trange[6,*]=[0,1.866d0]
trange[7,*]=[0,1.932d0]
trange[8,*]=[0,1.996d0]
trange[9,*]=[0,2.059d0]
trange[10,*]=[0,2.122d0]
trange[11,*]=[0,2.185d0]
trange[12,*]=[0,2.252d0]
trange[13,*]=[0,2.315d0]
trange[14,*]=[0,2.383d0]
trange[15,*]=[0,2.446d0]
trange[16,*]=[0,2.505d0]
dt=0.025
for i=0,16 do trange[i,0]=trange[i,1]-dt

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_02_25_1058-20975_J57_D'
shot=20975
channel1='General/_AUG_SXR_J57_time_0.0000-6.0000'
t_stft=[1.38,2.55]
bands=[5,9,10,17]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93001d0,1.96001d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_02_25_1059-20975_J57_A'
shot=20975
channel1='General/_AUG_SXR_J57_time_0.0000-6.0000'
t_stft=[3.87,4.6]
bands=[4,7,8,15]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(8,2)
trange[0,*]=[3.9d0,3.94d0]
trange[1,*]=[4.0d0,4.04d0]
trange[2,*]=[4.085d0,4.125d0]
trange[3,*]=[4.17d0,4.21d0]
trange[4,*]=[4.25d0,4.29d0]
trange[5,*]=[4.325d0,4.365d0]
trange[6,*]=[4.395d0,4.435d0]
trange[7,*]=[4.455d0,4.495d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_02_25_1100-20974_J57_A'
shot=20974
channel1='General/_AUG_SXR_J57_time_0.0000-6.0000'
t_stft=[1.36,2.54]
bands=[4,9,10,16]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(17,2)
trange[0,*]=[0,1.4145d0]
trange[1,*]=[0,1.505d0]
trange[2,*]=[0,1.5855d0]
trange[3,*]=[0,1.66d0]
trange[4,*]=[0,1.73d0]
trange[5,*]=[0,1.798d0]
trange[6,*]=[0,1.866d0]
trange[7,*]=[0,1.932d0]
trange[8,*]=[0,1.996d0]
trange[9,*]=[0,2.059d0]
trange[10,*]=[0,2.122d0]
trange[11,*]=[0,2.185d0]
trange[12,*]=[0,2.252d0]
trange[13,*]=[0,2.315d0]
trange[14,*]=[0,2.383d0]
trange[15,*]=[0,2.446d0]
trange[16,*]=[0,2.505d0]
dt=0.025
for i=0,16 do trange[i,0]=trange[i,1]-dt

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_02_25_1101-20975_J58_D'
shot=20975
channel1='General/_AUG_SXR_J58_time_0.0000-6.0000'
t_stft=[1.38,2.55]
bands=[5,9,10,17]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93001d0,1.96001d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_02_25_1102-20975_J58_A'
shot=20975
channel1='General/_AUG_SXR_J58_time_0.0000-6.0000'
t_stft=[3.87,4.6]
bands=[4,7,8,15]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(8,2)
trange[0,*]=[3.9d0,3.94d0]
trange[1,*]=[4.0d0,4.04d0]
trange[2,*]=[4.085d0,4.125d0]
trange[3,*]=[4.17d0,4.21d0]
trange[4,*]=[4.25d0,4.29d0]
trange[5,*]=[4.325d0,4.365d0]
trange[6,*]=[4.395d0,4.435d0]
trange[7,*]=[4.455d0,4.495d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_02_25_1103-20974_J58_A'
shot=20974
channel1='General/_AUG_SXR_J58_time_0.0000-6.0000'
t_stft=[1.36,2.54]
bands=[4,9,10,16]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(17,2)
trange[0,*]=[0,1.4145d0]
trange[1,*]=[0,1.505d0]
trange[2,*]=[0,1.5855d0]
trange[3,*]=[0,1.66d0]
trange[4,*]=[0,1.73d0]
trange[5,*]=[0,1.798d0]
trange[6,*]=[0,1.866d0]
trange[7,*]=[0,1.932d0]
trange[8,*]=[0,1.996d0]
trange[9,*]=[0,2.059d0]
trange[10,*]=[0,2.122d0]
trange[11,*]=[0,2.185d0]
trange[12,*]=[0,2.252d0]
trange[13,*]=[0,2.315d0]
trange[14,*]=[0,2.383d0]
trange[15,*]=[0,2.446d0]
trange[16,*]=[0,2.505d0]
dt=0.025
for i=0,16 do trange[i,0]=trange[i,1]-dt

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

return
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************


return

ID='2009_02_24_1943-20975_J51_D'
shot=20975
channel1='General/_AUG_SXR_J51_time_0.0000-6.0000'
t_stft=[1.38,2.55]
bands=[5,9,10,17]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93001d0,1.96001d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_02_24_1944-20975_J51_A'
shot=20975
channel1='General/_AUG_SXR_J51_time_0.0000-6.0000'
t_stft=[3.87,4.6]
bands=[4,7,8,15]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(8,2)
trange[0,*]=[3.9d0,3.94d0]
trange[1,*]=[4.0d0,4.04d0]
trange[2,*]=[4.085d0,4.125d0]
trange[3,*]=[4.17d0,4.21d0]
trange[4,*]=[4.25d0,4.29d0]
trange[5,*]=[4.325d0,4.365d0]
trange[6,*]=[4.395d0,4.435d0]
trange[7,*]=[4.455d0,4.495d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_02_24_1945-20974_J51_A'
shot=20974
channel1='General/_AUG_SXR_J51_time_0.0000-6.0000'
t_stft=[1.36,2.54]
bands=[4,9,10,16]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(17,2)
trange[0,*]=[0,1.4145d0]
trange[1,*]=[0,1.505d0]
trange[2,*]=[0,1.5855d0]
trange[3,*]=[0,1.66d0]
trange[4,*]=[0,1.73d0]
trange[5,*]=[0,1.798d0]
trange[6,*]=[0,1.866d0]
trange[7,*]=[0,1.932d0]
trange[8,*]=[0,1.996d0]
trange[9,*]=[0,2.059d0]
trange[10,*]=[0,2.122d0]
trange[11,*]=[0,2.185d0]
trange[12,*]=[0,2.252d0]
trange[13,*]=[0,2.315d0]
trange[14,*]=[0,2.383d0]
trange[15,*]=[0,2.446d0]
trange[16,*]=[0,2.505d0]
dt=0.025
for i=0,16 do trange[i,0]=trange[i,1]-dt

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_02_20_1405-20974_J58_A'
shot=20974
channel1='General/_AUG_SXR_J58_time_0.0000-6.0000'
t_stft=[1.36,2.54]
bands=[4,9,10,16]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(17,2)
trange[0,*]=[0,1.4145d0]
trange[1,*]=[0,1.505d0]
trange[2,*]=[0,1.5855d0]
trange[3,*]=[0,1.66d0]
trange[4,*]=[0,1.73d0]
trange[5,*]=[0,1.798d0]
trange[6,*]=[0,1.866d0]
trange[7,*]=[0,1.932d0]
trange[8,*]=[0,1.996d0]
trange[9,*]=[0,2.059d0]
trange[10,*]=[0,2.122d0]
trange[11,*]=[0,2.185d0]
trange[12,*]=[0,2.252d0]
trange[13,*]=[0,2.315d0]
trange[14,*]=[0,2.383d0]
trange[15,*]=[0,2.446d0]
trange[16,*]=[0,2.505d0]
dt=0.025
for i=0,16 do trange[i,0]=trange[i,1]-dt

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

return
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************


ID='2009_02_20_1347-20975_J58_A'
shot=20975
channel1='General/_AUG_SXR_J58_time_0.0000-6.0000'
t_stft=[3.87,4.6]
bands=[4,7,8,15]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(8,2)
trange[0,*]=[3.9d0,3.94d0]
trange[1,*]=[4.0d0,4.04d0]
trange[2,*]=[4.085d0,4.125d0]
trange[3,*]=[4.17d0,4.21d0]
trange[4,*]=[4.25d0,4.29d0]
trange[5,*]=[4.325d0,4.365d0]
trange[6,*]=[4.395d0,4.435d0]
trange[7,*]=[4.455d0,4.495d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID
return

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_02_20_20975_J58_A_SPE_64'
print,ID
shot=20975
channel1='General/_AUG_SXR_J58_time_0.0000-6.0000'
times=[3.85,3.948,4.051,4.1345,4.217,4.3013,4.378,4.446,4.507]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
print,trange
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
endfor
gp_sort,ID
return

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************


ID='2009_02_20_1339-20975_J58_D'
shot=20975
channel1='General/_AUG_SXR_J58_time_0.0000-6.0000'
t_stft=[1.38,2.55]
bands=[5,9,10,17]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93001d0,1.96001d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

return
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_02_19_2122-20974_J57_A'
shot=20974
channel1='General/_AUG_SXR_J57_time_0.0000-6.0000'
t_stft=[1.36,2.54]
bands=[4,9,10,16]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(17,2)
trange[0,*]=[0,1.4145d0]
trange[1,*]=[0,1.505d0]
trange[2,*]=[0,1.5855d0]
trange[3,*]=[0,1.66d0]
trange[4,*]=[0,1.73d0]
trange[5,*]=[0,1.798d0]
trange[6,*]=[0,1.866d0]
trange[7,*]=[0,1.932d0]
trange[8,*]=[0,1.996d0]
trange[9,*]=[0,2.059d0]
trange[10,*]=[0,2.122d0]
trange[11,*]=[0,2.185d0]
trange[12,*]=[0,2.252d0]
trange[13,*]=[0,2.315d0]
trange[14,*]=[0,2.383d0]
trange[15,*]=[0,2.446d0]
trange[16,*]=[0,2.505d0]
dt=0.025
for i=0,16 do trange[i,0]=trange[i,1]-dt

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

return
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************


ID='2009_02_19_20975_J54_A_SPE_64'
print,ID
shot=20975
channel1='General/_AUG_SXR_J54_time_0.0000-6.0000'
times=[3.85,3.948,4.051,4.1345,4.217,4.3013,4.378,4.446,4.507]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
print,trange
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
endfor
gp_sort,ID


ID='2009_02_19_20975_J56_A_SPE_64'
print,ID
shot=20975
channel1='General/_AUG_SXR_J56_time_0.0000-6.0000'
times=[3.85,3.948,4.051,4.1345,4.217,4.3013,4.378,4.446,4.507]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
print,trange
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
endfor
gp_sort,ID
return

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************


ID='2009_02_19_20975_J57_A_SPE_64'
print,ID
shot=20975
channel1='General/_AUG_SXR_J57_time_0.0000-6.0000'
times=[3.85,3.948,4.051,4.1345,4.217,4.3013,4.378,4.446,4.507]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
print,trange
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
endfor
gp_sort,ID
return

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_02_19_2122-20974_J56_A'
shot=20974
channel1='General/_AUG_SXR_J56_time_0.0000-6.0000'
t_stft=[1.36,2.54]
bands=[4,9,10,16]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(17,2)
trange[0,*]=[0,1.4145d0]
trange[1,*]=[0,1.505d0]
trange[2,*]=[0,1.5855d0]
trange[3,*]=[0,1.66d0]
trange[4,*]=[0,1.73d0]
trange[5,*]=[0,1.798d0]
trange[6,*]=[0,1.866d0]
trange[7,*]=[0,1.932d0]
trange[8,*]=[0,1.996d0]
trange[9,*]=[0,2.059d0]
trange[10,*]=[0,2.122d0]
trange[11,*]=[0,2.185d0]
trange[12,*]=[0,2.252d0]
trange[13,*]=[0,2.315d0]
trange[14,*]=[0,2.383d0]
trange[15,*]=[0,2.446d0]
trange[16,*]=[0,2.505d0]
dt=0.025
for i=0,16 do trange[i,0]=trange[i,1]-dt

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

return
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_02_19_2106-20974_J54_A'
shot=20974
channel1='General/_AUG_SXR_J54_time_0.0000-6.0000'
t_stft=[1.36,2.54]
bands=[4,9,10,16]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(17,2)
trange[0,*]=[0,1.4145d0]
trange[1,*]=[0,1.505d0]
trange[2,*]=[0,1.5855d0]
trange[3,*]=[0,1.66d0]
trange[4,*]=[0,1.73d0]
trange[5,*]=[0,1.798d0]
trange[6,*]=[0,1.866d0]
trange[7,*]=[0,1.932d0]
trange[8,*]=[0,1.996d0]
trange[9,*]=[0,2.059d0]
trange[10,*]=[0,2.122d0]
trange[11,*]=[0,2.185d0]
trange[12,*]=[0,2.252d0]
trange[13,*]=[0,2.315d0]
trange[14,*]=[0,2.383d0]
trange[15,*]=[0,2.446d0]
trange[16,*]=[0,2.505d0]
dt=0.025
for i=0,16 do trange[i,0]=trange[i,1]-dt

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

return
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_02_19_1529-20975_J56_D'
shot=20975
channel1='General/_AUG_SXR_J56_time_0.0000-6.0000'
t_stft=[1.38,2.55]
bands=[5,9,10,17]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93001d0,1.96001d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID



ID='2009_02_19_1533-20975_J57_D'
shot=20975
channel1='General/_AUG_SXR_J57_time_0.0000-6.0000'
t_stft=[1.38,2.55]
bands=[5,9,10,17]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93001d0,1.96001d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

return
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************


ID='2009_02_19_20975_J54_A_SPE_128'
print,ID
shot=20975
channel1='General/_AUG_SXR_J54_time_0.0000-6.0000'
times=[3.85,3.948,4.051,4.1345,4.217,4.3013,4.378,4.446,4.507]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
print,trange
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
endfor
gp_sort,ID


ID='2009_02_19_20975_J56_A_SPE_128'
print,ID
shot=20975
channel1='General/_AUG_SXR_J56_time_0.0000-6.0000'
times=[3.85,3.948,4.051,4.1345,4.217,4.3013,4.378,4.446,4.507]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
print,trange
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
endfor
gp_sort,ID

ID='2009_02_19_20975_J57_A_SPE_128'
print,ID
shot=20975
channel1='General/_AUG_SXR_J57_time_0.0000-6.0000'
times=[3.85,3.948,4.051,4.1345,4.217,4.3013,4.378,4.446,4.507]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
print,trange
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
endfor
gp_sort,ID
return

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************


ID='2009_02_19_1436-20975_J57_A'
shot=20975
channel1='General/_AUG_SXR_J57_time_0.0000-6.0000'
t_stft=[3.87,4.6]
bands=[4,7,8,15]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(8,2)
trange[0,*]=[3.9d0,3.94d0]
trange[1,*]=[4.0d0,4.04d0]
trange[2,*]=[4.085d0,4.125d0]
trange[3,*]=[4.17d0,4.21d0]
trange[4,*]=[4.25d0,4.29d0]
trange[5,*]=[4.325d0,4.365d0]
trange[6,*]=[4.395d0,4.435d0]
trange[7,*]=[4.455d0,4.495d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************


ID='2009_02_19_1436-20975_J56_A'
shot=20975
channel1='General/_AUG_SXR_J56_time_0.0000-6.0000'
t_stft=[3.87,4.6]
bands=[4,7,8,15]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(8,2)
trange[0,*]=[3.9d0,3.94d0]
trange[1,*]=[4.0d0,4.04d0]
trange[2,*]=[4.085d0,4.125d0]
trange[3,*]=[4.17d0,4.21d0]
trange[4,*]=[4.25d0,4.29d0]
trange[5,*]=[4.325d0,4.365d0]
trange[6,*]=[4.395d0,4.435d0]
trange[7,*]=[4.455d0,4.495d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************


ID='2009_02_19_1428-20974_J53_A'
shot=20974
channel1='General/_AUG_SXR_J53_time_0.0000-6.0000'
t_stft=[1.36,2.54]
bands=[4,9,10,16]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(17,2)
trange[0,*]=[0,1.4145d0]
trange[1,*]=[0,1.505d0]
trange[2,*]=[0,1.5855d0]
trange[3,*]=[0,1.66d0]
trange[4,*]=[0,1.73d0]
trange[5,*]=[0,1.798d0]
trange[6,*]=[0,1.866d0]
trange[7,*]=[0,1.932d0]
trange[8,*]=[0,1.996d0]
trange[9,*]=[0,2.059d0]
trange[10,*]=[0,2.122d0]
trange[11,*]=[0,2.185d0]
trange[12,*]=[0,2.252d0]
trange[13,*]=[0,2.315d0]
trange[14,*]=[0,2.383d0]
trange[15,*]=[0,2.446d0]
trange[16,*]=[0,2.505d0]
dt=0.025
for i=0,16 do trange[i,0]=trange[i,1]-dt

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID


;*****************************************************************************
;*****************************************************************************
;*****************************************************************************


ID='2009_02_19_1421-20975_J54_A'
shot=20975
channel1='General/_AUG_SXR_J54_time_0.0000-6.0000'
t_stft=[3.87,4.6]
bands=[4,7,8,15]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(8,2)
trange[0,*]=[3.9d0,3.94d0]
trange[1,*]=[4.0d0,4.04d0]
trange[2,*]=[4.085d0,4.125d0]
trange[3,*]=[4.17d0,4.21d0]
trange[4,*]=[4.25d0,4.29d0]
trange[5,*]=[4.325d0,4.365d0]
trange[6,*]=[4.395d0,4.435d0]
trange[7,*]=[4.455d0,4.495d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************


ID='2009_02_19_1413-20975_J53_A'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
t_stft=[3.87,4.6]
bands=[4,7,8,15]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(8,2)
trange[0,*]=[3.9d0,3.94d0]
trange[1,*]=[4.0d0,4.04d0]
trange[2,*]=[4.085d0,4.125d0]
trange[3,*]=[4.17d0,4.21d0]
trange[4,*]=[4.25d0,4.29d0]
trange[5,*]=[4.325d0,4.365d0]
trange[6,*]=[4.395d0,4.435d0]
trange[7,*]=[4.455d0,4.495d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

return
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************




ID='2009_02_19_1403-20975_J53_D'
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
t_stft=[1.38,2.55]
bands=[5,9,10,17]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93001d0,1.96001d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

return
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************


ID='2009_02_19_1358-20975_J54_D'
shot=20975
channel1='General/_AUG_SXR_J54_time_0.0000-6.0000'
t_stft=[1.38,2.55]
bands=[5,9,10,17]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93001d0,1.96001d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

return
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************


ID='2009_02_19_1348_TESTING'
shot=20975
channel1='General/_AUG_SXR_J54_time_0.0000-6.0000'
t_stft=[1.38,2.55]
bands=[5,9,10,17]
f_le=40
windowsize=64
masksize=1572
fmax=40
trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93001d0,1.96001d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]

gp_bp_ccf,shot=shot,channel1=channel1,t_stft=t_stft,trange=trange,bands=bands,windowsize=windowsize,masksize=masksize,f_le=f_le,fmax=fmax,ID=ID

return
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************


version=0.01
prog='gp_futtat_d.pro'
ID='2009_02_18_1341_TESTING'
shot=20975
channel1='General/_AUG_SXR_J54_time_0.0000-6.0000'
trange=[1.38,2.55]
b=[5,9,10,17]
f_le=40
windowsize=64
masksize=1572
fmax=40
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=windowsize,masksize=masksize,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=fmax,ID=ID)
timeax2=timeax
winlength=1000.*windowsize*(timeax(2)-timeax(1))
stft2=stft

trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93001d0,1.96001d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]
dt=trange(0,1)-trange(0,0)

size=n_elements(trange[*,0])

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),size)
bpv[*,*,0]=bp
for i=1,size-1 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

;resampling to get rid of the effect of stft windowing
bpv_orig=bpv
timeax_temp=timeax[0:n_elements(bpv[0,*,0])-1]
timeax_temp2=timeax_temp
q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp2,f_le
bpv=dblarr(2,n_elements(q),size)
timeax_temp2=timeax_temp


for i=0,1 do begin
   for j=0,size-1 do begin
      q=bpv_orig[i,*,j]
      gp_resample,q,timeax_temp2,f_le
      timeax_temp2=timeax_temp
      bpv[i,*,j]=q
   endfor
endfor

q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp,f_le

c=dblarr(n_elements(reform(bpv[0,*,0])),size)
impv12=c
impv21=c
t_c=lindgen(n_elements(c(*,0)))-ceil(n_elements(c(*,0))/2.)+1
;t_c=t_c*(timeax[2]-timeax[1])*1000;in ms
t_c=t_c*(timeax_temp[2]-timeax_temp[1])*1000;in ms


for i=0,size-1 do begin
pg_initgraph,/print
c[*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast)
gp_imp,reform(bpv[0,*,i]),reform(bpv[1,*,i]),imp12=imp12,imp21=imp21
impv12[*,i]=imp12
impv21[*,i]=imp21
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_'+pg_num2str(i)+'_ccf.eps'
plot,t_c,c[*,i],title=ID+': '+pg_num2str(i)+'_ccf',thick=3,charthick=3,charsize=2,$
     xtitle='Time delay (ms)',xstyle=1
device,/close
endfor

ccf_mean=dblarr(n_elements(c[*,0]))
ccf_err=dblarr(n_elements(c[*,0]))
imp12_mean=ccf_mean
imp21_mean=imp12_mean
imp12_err=imp12_mean
imp21_err=imp12_mean

datas_prog='shot: '+pg_num2str(shot)+', trange: '+pg_num2str(trange(0),length=4)+'s - '+pg_num2str(trange(1),length=4)+'s'+$
           '!CID:   '+ID+$
           '!CProg: '+prog+', V.: '+pg_num2str(version,length=4)+$
           '!CDate: '+systime()

datas='Ch: '+channel1+$
      '!CWin: '+nti_wavelet_i2str(windowsize)+' ('+pg_num2str(winlength,length=4)+'ms), Mask: '+nti_wavelet_i2str(masksize)+', '+'f_max: '+pg_num2str(fmax)+$
      '!CFqs: '+nti_wavelet_i2str(b(0))+'-'+nti_wavelet_i2str(b(1))+' & '+nti_wavelet_i2str(b(2))+'-'+nti_wavelet_i2str(b(3))+' (kHz), Length: '+pg_num2str(dt,length=5)+'s'+$
      '!CAverages: '+nti_wavelet_i2str(size)+', f_d: '+pg_num2str(f_le)+'kHz, ccf_dt: '+pg_num2str(t_c[1]-t_c[0],length=5)+'ms '+'N: '+nti_wavelet_i2str(n_elements(c[*,0]))

;ccf_title=ID+': ccf-average (#'+nti_wavelet_i2str(shot)+', '+pg_num2str(trange(0),length=4)+'s-'+pg_num2str(trange(1),length=4)+'s)'
ccf_title=ID+': ccf-average'


for i=0,n_elements(ccf_mean)-1 do ccf_mean(i)=mean(c(i,*))
for i=0,n_elements(ccf_err)-1 do ccf_err(i)=stdev(c(i,*))
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_ccf-average.eps'
plot,t_c,ccf_mean,title=ccf_title,thick=4,charthick=3,charsize=2,$
     yrange=[min(ccf_mean-ccf_err),max(ccf_mean+ccf_err)],ystyle=1,xtitle='Time delay (ms)',$
     xstyle=1

oplot,t_c,(ccf_mean-ccf_err),linestyle=5,thick=4
oplot,t_c,(ccf_mean+ccf_err),linestyle=5,thick=4
xyouts,0.99,0.12,datas,/normal,orientation=90,charsize=1.3,charthick=2
xyouts,0.99,0.63,datas_prog,/normal,orientation=90,charsize=1.3,charthick=2
device,/close

for i=0,n_elements(imp12_mean)-1 do imp12_mean(i)=mean(impv12(i,*))
for i=0,n_elements(imp21_mean)-1 do imp21_mean(i)=mean(impv21(i,*))
for i=0,n_elements(imp12_err)-1 do imp12_err(i)=stdev(impv12(i,*))
for i=0,n_elements(imp21_err)-1 do imp21_err(i)=stdev(impv21(i,*))

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp12-average.eps'
plot,t_c,imp12_mean,title=ID+': imp12-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)',$
     yrange=[min(imp12_mean-imp12_err),max(imp12_mean+imp12_err)]

oplot,t_c,(imp12_mean-imp12_err),linestyle=5,thick=4
oplot,t_c,(imp12_mean+imp12_err),linestyle=5,thick=4
device,/close

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp21-average.eps'
plot,t_c,imp21_mean,title=ID+': imp21-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)';,$
     yrange=[min(imp21_mean-imp21_err),max(imp21_mean+imp21_err)]

oplot,t_c,(imp21_mean-imp21_err),linestyle=5,thick=4
oplot,t_c,(imp21_mean+imp21_err),linestyle=5,thick=4
device,/close

save,impv12,impv21,filename='./data/'+ID+'_imp.sav'

pg_initgraph

gp_sort,ID



if 1 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,size*n_elements(bpv[0,*,0]))
timeax_new=timeax[0:size*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
;gp_resample,data_low,timeax_new,2
;gp_resample,data_high,timeax_new2,2

gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0

blocksize=n_elements(data_low)/size
cohphase=gp_cohphasef(data_low,data_high,blocksize,hann=0,meanapsd1=meanapsd1,meanapsd2=meanapsd2,meancpsd=meancpsd,errapsd1=errapsd1,errapsd2=errapsd2,errcpsd=errcpsd)
errphase=1/!PI/(1+cohphase[*,1]^2)*imaginary(meancpsd)/float(meancpsd)*$
	sqrt((Imaginary(errcpsd)/Imaginary(meancpsd))^2+(Float(errcpsd)/Float(meancpsd))^2) ;Gauss
errphase[0]=1e-10

f=findgen(floor(blocksize/2.)+1)
f=f/max(f)
fn=(1/(timeax_new[2]-timeax_new[1])/2.)
faxis=f*fn/1000

pg_initgraph,/print
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'phase-error.eps'
plot,faxis,cohphase[0:blocksize/2-1,1],ystyle=1,thick=4,charthick=3,charsize=2
oplot,faxis,cohphase[0:blocksize/2-1,1]-errphase[0:blocksize/2-1],linestyle=5
oplot,faxis,cohphase[0:blocksize/2-1,1]+errphase[0:blocksize/2-1],linestyle=5

device,/close
pg_initgraph

gp_sort,ID

endif
return
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************



ID='2009_02_18_1111'
shot=20975
channel1='General/_AUG_SXR_J54_time_0.0000-6.0000'
trange=[1.38,2.55]
b=[5,9,10,17]
f_le=2
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=1572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93001d0,1.96001d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]

size=n_elements(trange[*,0])

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),size)
bpv[*,*,0]=bp
for i=1,size-1 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

;resampling to get rid of the effect of stft windowing
bpv_orig=bpv
timeax_temp=timeax[0:n_elements(bpv[0,*,0])-1]
timeax_temp2=timeax_temp
q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp2,f_le
bpv=dblarr(2,n_elements(q),size)
timeax_temp2=timeax_temp


for i=0,1 do begin
   for j=0,size-1 do begin
      q=bpv_orig[i,*,j]
      gp_resample,q,timeax_temp2,f_le
      timeax_temp2=timeax_temp
      bpv[i,*,j]=q
   endfor
endfor

q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp,f_le

c=dblarr(n_elements(reform(bpv[0,*,0])),size)
impv12=c
impv21=c
t_c=lindgen(n_elements(c(*,0)))-ceil(n_elements(c(*,0))/2.)+1
;t_c=t_c*(timeax[2]-timeax[1])*1000;in ms
t_c=t_c*(timeax_temp[2]-timeax_temp[1])*1000;in ms


for i=0,size-1 do begin
pg_initgraph,/print
c[*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast)
gp_imp,reform(bpv[0,*,i]),reform(bpv[1,*,i]),imp12=imp12,imp21=imp21
impv12[*,i]=imp12
impv21[*,i]=imp21
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_'+pg_num2str(i)+'_ccf.eps'
plot,t_c,c[*,i],title=ID+': '+pg_num2str(i)+'_ccf',thick=3,charthick=3,charsize=2,$
     xtitle='Time delay (ms)',xstyle=1
device,/close
endfor

ccf_mean=dblarr(n_elements(c[*,0]))
ccf_err=dblarr(n_elements(c[*,0]))
imp12_mean=ccf_mean
imp21_mean=imp12_mean
imp12_err=imp12_mean
imp21_err=imp12_mean

for i=0,n_elements(ccf_mean)-1 do ccf_mean(i)=mean(c(i,*))
for i=0,n_elements(ccf_err)-1 do ccf_err(i)=stdev(c(i,*))
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_ccf-average.eps'
plot,t_c,ccf_mean,title=ID+': ccf-average',thick=4,charthick=3,charsize=2,$
     yrange=[min(ccf_mean-ccf_err),max(ccf_mean+ccf_err)],ystyle=1,xtitle='Time delay (ms)',$
     xstyle=1

oplot,t_c,(ccf_mean-ccf_err),linestyle=5,thick=4
oplot,t_c,(ccf_mean+ccf_err),linestyle=5,thick=4
device,/close

for i=0,n_elements(imp12_mean)-1 do imp12_mean(i)=mean(impv12(i,*))
for i=0,n_elements(imp21_mean)-1 do imp21_mean(i)=mean(impv21(i,*))
for i=0,n_elements(imp12_err)-1 do imp12_err(i)=stdev(impv12(i,*))
for i=0,n_elements(imp21_err)-1 do imp21_err(i)=stdev(impv21(i,*))

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp12-average.eps'
plot,t_c,imp12_mean,title=ID+': imp12-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)',$
     yrange=[min(imp12_mean-imp12_err),max(imp12_mean+imp12_err)]

oplot,t_c,(imp12_mean-imp12_err),linestyle=5,thick=4
oplot,t_c,(imp12_mean+imp12_err),linestyle=5,thick=4
device,/close

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp21-average.eps'
plot,t_c,imp21_mean,title=ID+': imp21-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)';,$
     yrange=[min(imp21_mean-imp21_err),max(imp21_mean+imp21_err)]

oplot,t_c,(imp21_mean-imp21_err),linestyle=5,thick=4
oplot,t_c,(imp21_mean+imp21_err),linestyle=5,thick=4
device,/close

save,impv12,impv21,filename='./data/'+ID+'_imp.sav'

pg_initgraph

gp_sort,ID



if 1 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,size*n_elements(bpv[0,*,0]))
timeax_new=timeax[0:size*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
;gp_resample,data_low,timeax_new,2
;gp_resample,data_high,timeax_new2,2

gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0

blocksize=n_elements(data_low)/size
cohphase=gp_cohphasef(data_low,data_high,blocksize,hann=0,meanapsd1=meanapsd1,meanapsd2=meanapsd2,meancpsd=meancpsd,errapsd1=errapsd1,errapsd2=errapsd2,errcpsd=errcpsd)
errphase=1/!PI/(1+cohphase[*,1]^2)*imaginary(meancpsd)/float(meancpsd)*$
	sqrt((Imaginary(errcpsd)/Imaginary(meancpsd))^2+(Float(errcpsd)/Float(meancpsd))^2) ;Gauss
errphase[0]=1e-10

f=findgen(floor(blocksize/2.)+1)
f=f/max(f)
fn=(1/(timeax_new[2]-timeax_new[1])/2.)
faxis=f*fn/1000

pg_initgraph,/print
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'phase-error.eps'
plot,faxis,cohphase[0:blocksize/2-1,1],ystyle=1,thick=4,charthick=3,charsize=2
oplot,faxis,cohphase[0:blocksize/2-1,1]-errphase[0:blocksize/2-1],linestyle=5
oplot,faxis,cohphase[0:blocksize/2-1,1]+errphase[0:blocksize/2-1],linestyle=5

device,/close
pg_initgraph

gp_sort,ID

endif
return
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************



ID='2009_02_18_1050'
shot=20975
channel1='General/_AUG_SXR_J54_time_0.0000-6.0000'
trange=[1.38,2.55]
b=[5,9,10,17]
f_le=40
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=1572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(15,2)
trange[0,*]=[1.395d0,1.425d0]
trange[1,*]=[1.48d0,1.51d0]
trange[2,*]=[1.565d0,1.595d0]
trange[3,*]=[1.635d0,1.665d0]
trange[4,*]=[1.71d0,1.74d0]
trange[5,*]=[1.785d0,1.815d0]
trange[6,*]=[1.855d0,1.885d0]
trange[7,*]=[1.93001d0,1.96001d0]
trange[8,*]=[2.07d0,2.10d0]
trange[9,*]=[2.14d0,2.17d0]
trange[10,*]=[2.213d0,2.243d0]
trange[11,*]=[2.28d0,2.31d0]
trange[12,*]=[2.347d0,2.377d0]
trange[13,*]=[2.415d0,2.445d0]
trange[14,*]=[2.485d0,2.515d0]

size=n_elements(trange[*,0])

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),size)
bpv[*,*,0]=bp
for i=1,size-1 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

;resampling to get rid of the effect of stft windowing
bpv_orig=bpv
timeax_temp=timeax[0:n_elements(bpv[0,*,0])-1]
timeax_temp2=timeax_temp
q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp2,f_le
bpv=dblarr(2,n_elements(q),size)
timeax_temp2=timeax_temp


for i=0,1 do begin
   for j=0,size-1 do begin
      q=bpv_orig[i,*,j]
      gp_resample,q,timeax_temp2,f_le
      timeax_temp2=timeax_temp
      bpv[i,*,j]=q
   endfor
endfor

q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp,f_le

c=dblarr(n_elements(reform(bpv[0,*,0])),size)
impv12=c
impv21=c
t_c=lindgen(n_elements(c(*,0)))-ceil(n_elements(c(*,0))/2.)+1
;t_c=t_c*(timeax[2]-timeax[1])*1000;in ms
t_c=t_c*(timeax_temp[2]-timeax_temp[1])*1000;in ms


for i=0,size-1 do begin
pg_initgraph,/print
c[*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast)
gp_imp,reform(bpv[0,*,i]),reform(bpv[1,*,i]),imp12=imp12,imp21=imp21
impv12[*,i]=imp12
impv21[*,i]=imp21
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_'+pg_num2str(i)+'_ccf.eps'
plot,t_c,c[*,i],title=ID+': '+pg_num2str(i)+'_ccf',thick=3,charthick=3,charsize=2,$
     xtitle='Time delay (ms)',xstyle=1
device,/close
endfor

ccf_mean=dblarr(n_elements(c[*,0]))
ccf_err=dblarr(n_elements(c[*,0]))
imp12_mean=ccf_mean
imp21_mean=imp12_mean
imp12_err=imp12_mean
imp21_err=imp12_mean

for i=0,n_elements(ccf_mean)-1 do ccf_mean(i)=mean(c(i,*))
for i=0,n_elements(ccf_err)-1 do ccf_err(i)=stdev(c(i,*))
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_ccf-average.eps'
plot,t_c,ccf_mean,title=ID+': ccf-average',thick=4,charthick=3,charsize=2,$
     yrange=[min(ccf_mean-ccf_err),max(ccf_mean+ccf_err)],ystyle=1,xtitle='Time delay (ms)',$
     xstyle=1

oplot,t_c,(ccf_mean-ccf_err),linestyle=5,thick=4
oplot,t_c,(ccf_mean+ccf_err),linestyle=5,thick=4
device,/close

for i=0,n_elements(imp12_mean)-1 do imp12_mean(i)=mean(impv12(i,*))
for i=0,n_elements(imp21_mean)-1 do imp21_mean(i)=mean(impv21(i,*))
for i=0,n_elements(imp12_err)-1 do imp12_err(i)=stdev(impv12(i,*))
for i=0,n_elements(imp21_err)-1 do imp21_err(i)=stdev(impv21(i,*))

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp12-average.eps'
plot,t_c,imp12_mean,title=ID+': imp12-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)',$
     yrange=[min(imp12_mean-imp12_err),max(imp12_mean+imp12_err)]

oplot,t_c,(imp12_mean-imp12_err),linestyle=5,thick=4
oplot,t_c,(imp12_mean+imp12_err),linestyle=5,thick=4
device,/close

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp21-average.eps'
plot,t_c,imp21_mean,title=ID+': imp21-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)';,$
     yrange=[min(imp21_mean-imp21_err),max(imp21_mean+imp21_err)]

oplot,t_c,(imp21_mean-imp21_err),linestyle=5,thick=4
oplot,t_c,(imp21_mean+imp21_err),linestyle=5,thick=4
device,/close

save,impv12,impv21,filename='./data/'+ID+'_imp.sav'

pg_initgraph

gp_sort,ID



if 1 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,size*n_elements(bpv[0,*,0]))
timeax_new=timeax[0:size*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
;gp_resample,data_low,timeax_new,2
;gp_resample,data_high,timeax_new2,2

gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0

blocksize=n_elements(data_low)/size
cohphase=gp_cohphasef(data_low,data_high,blocksize,hann=0,meanapsd1=meanapsd1,meanapsd2=meanapsd2,meancpsd=meancpsd,errapsd1=errapsd1,errapsd2=errapsd2,errcpsd=errcpsd)
errphase=1/!PI/(1+cohphase[*,1]^2)*imaginary(meancpsd)/float(meancpsd)*$
	sqrt((Imaginary(errcpsd)/Imaginary(meancpsd))^2+(Float(errcpsd)/Float(meancpsd))^2) ;Gauss
errphase[0]=1e-10

f=findgen(floor(blocksize/2.)+1)
f=f/max(f)
fn=(1/(timeax_new[2]-timeax_new[1])/2.)
faxis=f*fn/1000

pg_initgraph,/print
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'phase-error.eps'
plot,faxis,cohphase[0:blocksize/2-1,1],ystyle=1,thick=4,charthick=3,charsize=2
oplot,faxis,cohphase[0:blocksize/2-1,1]-errphase[0:blocksize/2-1],linestyle=5
oplot,faxis,cohphase[0:blocksize/2-1,1]+errphase[0:blocksize/2-1],linestyle=5

device,/close
pg_initgraph

gp_sort,ID

endif
return
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************


ID='2009_02_16_1135_Df_spectrograms_128'
shot=209750
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
times=[1.4366, 1.5235, 1.6045, 1.6776, 1.7531, 1.8243, 1.8968, 1.9689]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
stft=pg_spectrogram(shot,channel1,windowsize=128,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
endfor
gp_sort,ID
return

ID='2009_02_03_1545d'
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
trange=[1.38,2.55]
b=[5,9,35,40]
f_le=40
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=1572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(15,2)
trange[0,*]=[1.395,1.425]
trange[1,*]=[1.48,1.51]
trange[2,*]=[1.565,1.595]
trange[3,*]=[1.635,1.665]
trange[4,*]=[1.71,1.74]
trange[5,*]=[1.785,1.815]
trange[6,*]=[1.855,1.885]
trange[7,*]=[1.93,1.96]
trange[8,*]=[2.07,2.10]
trange[9,*]=[2.14,2.17]
trange[10,*]=[2.213,2.243]
trange[11,*]=[2.28,2.31]
trange[12,*]=[2.347,2.377]
trange[13,*]=[2.415,2.445]
trange[14,*]=[2.485,2.515]

size=n_elements(trange[*,0])

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),size)
bpv[*,*,0]=bp
for i=1,size-1 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

;resampling to get rid of the effect of stft windowing
bpv_orig=bpv
timeax_temp=timeax[0:n_elements(bpv[0,*,0])-1]
timeax_temp2=timeax_temp
q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp2,f_le
bpv=dblarr(2,n_elements(q),size)
timeax_temp2=timeax_temp


for i=0,1 do begin
   for j=0,size-1 do begin
      q=bpv_orig[i,*,j]
      gp_resample,q,timeax_temp2,f_le
      timeax_temp2=timeax_temp
      bpv[i,*,j]=q
   endfor
endfor

q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp,f_le

c=dblarr(n_elements(reform(bpv[0,*,0])),size)
impv12=c
impv21=c
t_c=lindgen(n_elements(c(*,0)))-ceil(n_elements(c(*,0))/2.)+1
;t_c=t_c*(timeax[2]-timeax[1])*1000;in ms
t_c=t_c*(timeax_temp[2]-timeax_temp[1])*1000;in ms


for i=0,size-1 do begin
pg_initgraph,/print
c[*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast)
gp_imp,reform(bpv[0,*,i]),reform(bpv[1,*,i]),imp12=imp12,imp21=imp21
impv12[*,i]=imp12
impv21[*,i]=imp21
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_'+pg_num2str(i)+'_ccf.eps'
plot,t_c,c[*,i],title=ID+': '+pg_num2str(i)+'_ccf',thick=3,charthick=3,charsize=2,$
     xtitle='Time delay (ms)',xstyle=1
device,/close
endfor

ccf_mean=dblarr(n_elements(c[*,0]))
ccf_err=dblarr(n_elements(c[*,0]))
imp12_mean=ccf_mean
imp21_mean=imp12_mean
imp12_err=imp12_mean
imp21_err=imp12_mean

for i=0,n_elements(ccf_mean)-1 do ccf_mean(i)=mean(c(i,*))
for i=0,n_elements(ccf_err)-1 do ccf_err(i)=stdev(c(i,*))
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_ccf-average.eps'
plot,t_c,ccf_mean,title=ID+': ccf-average',thick=4,charthick=3,charsize=2,$
     yrange=[min(ccf_mean-ccf_err),max(ccf_mean+ccf_err)],ystyle=1,xtitle='Time delay (ms)',$
     xstyle=1

oplot,t_c,(ccf_mean-ccf_err),linestyle=5,thick=4
oplot,t_c,(ccf_mean+ccf_err),linestyle=5,thick=4
device,/close

for i=0,n_elements(imp12_mean)-1 do imp12_mean(i)=mean(impv12(i,*))
for i=0,n_elements(imp21_mean)-1 do imp21_mean(i)=mean(impv21(i,*))
for i=0,n_elements(imp12_err)-1 do imp12_err(i)=stdev(impv12(i,*))
for i=0,n_elements(imp21_err)-1 do imp21_err(i)=stdev(impv21(i,*))

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp12-average.eps'
plot,t_c,imp12_mean,title=ID+': imp12-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)',$
     yrange=[min(imp12_mean-imp12_err),max(imp12_mean+imp12_err)]

oplot,t_c,(imp12_mean-imp12_err),linestyle=5,thick=4
oplot,t_c,(imp12_mean+imp12_err),linestyle=5,thick=4
device,/close

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp21-average.eps'
plot,t_c,imp21_mean,title=ID+': imp21-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)';,$
     yrange=[min(imp21_mean-imp21_err),max(imp21_mean+imp21_err)]

oplot,t_c,(imp21_mean-imp21_err),linestyle=5,thick=4
oplot,t_c,(imp21_mean+imp21_err),linestyle=5,thick=4
device,/close

save,impv12,impv21,filename='./data/'+ID+'_imp.sav'

pg_initgraph

gp_sort,ID



if 1 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,size*n_elements(bpv[0,*,0]))
timeax_new=timeax[0:size*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
;gp_resample,data_low,timeax_new,2
;gp_resample,data_high,timeax_new2,2

gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0

blocksize=n_elements(data_low)/size
cohphase=gp_cohphasef(data_low,data_high,blocksize,hann=0,meanapsd1=meanapsd1,meanapsd2=meanapsd2,meancpsd=meancpsd,errapsd1=errapsd1,errapsd2=errapsd2,errcpsd=errcpsd)
errphase=1/!PI/(1+cohphase[*,1]^2)*imaginary(meancpsd)/float(meancpsd)*$
	sqrt((Imaginary(errcpsd)/Imaginary(meancpsd))^2+(Float(errcpsd)/Float(meancpsd))^2) ;Gauss
errphase[0]=1e-10

f=findgen(floor(blocksize/2.)+1)
f=f/max(f)
fn=(1/(timeax_new[2]-timeax_new[1])/2.)
faxis=f*fn/1000

pg_initgraph,/print
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'phase-error.eps'
plot,faxis,cohphase[0:blocksize/2-1,1],ystyle=1,thick=4,charthick=3,charsize=2
oplot,faxis,cohphase[0:blocksize/2-1,1]-errphase[0:blocksize/2-1],linestyle=5
oplot,faxis,cohphase[0:blocksize/2-1,1]+errphase[0:blocksize/2-1],linestyle=5

device,/close
pg_initgraph

gp_sort,ID

endif
return
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************



ID='2009_02_03_1545c'
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
trange=[1.38,2.55]
b=[5,8.5,10.5,17]
f_le=40
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=1572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(15,2)
trange[0,*]=[1.395,1.425]
trange[1,*]=[1.48,1.51]
trange[2,*]=[1.565,1.595]
trange[3,*]=[1.635,1.665]
trange[4,*]=[1.71,1.74]
trange[5,*]=[1.785,1.815]
trange[6,*]=[1.855,1.885]
trange[7,*]=[1.93,1.96]
trange[8,*]=[2.07,2.10]
trange[9,*]=[2.14,2.17]
trange[10,*]=[2.213,2.243]
trange[11,*]=[2.28,2.31]
trange[12,*]=[2.347,2.377]
trange[13,*]=[2.415,2.445]
trange[14,*]=[2.485,2.515]

size=n_elements(trange[*,0])

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),size)
bpv[*,*,0]=bp
for i=1,size-1 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

;resampling to get rid of the effect of stft windowing
bpv_orig=bpv
timeax_temp=timeax[0:n_elements(bpv[0,*,0])-1]
timeax_temp2=timeax_temp
q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp2,f_le
bpv=dblarr(2,n_elements(q),size)
timeax_temp2=timeax_temp


for i=0,1 do begin
   for j=0,size-1 do begin
      q=bpv_orig[i,*,j]
      gp_resample,q,timeax_temp2,f_le
      timeax_temp2=timeax_temp
      bpv[i,*,j]=q
   endfor
endfor

q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp,f_le

c=dblarr(n_elements(reform(bpv[0,*,0])),size)
impv12=c
impv21=c
t_c=lindgen(n_elements(c(*,0)))-ceil(n_elements(c(*,0))/2.)+1
;t_c=t_c*(timeax[2]-timeax[1])*1000;in ms
t_c=t_c*(timeax_temp[2]-timeax_temp[1])*1000;in ms


for i=0,size-1 do begin
pg_initgraph,/print
c[*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast)
gp_imp,reform(bpv[0,*,i]),reform(bpv[1,*,i]),imp12=imp12,imp21=imp21
impv12[*,i]=imp12
impv21[*,i]=imp21
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_'+pg_num2str(i)+'_ccf.eps'
plot,t_c,c[*,i],title=ID+': '+pg_num2str(i)+'_ccf',thick=3,charthick=3,charsize=2,$
     xtitle='Time delay (ms)',xstyle=1
device,/close
endfor

ccf_mean=dblarr(n_elements(c[*,0]))
ccf_err=dblarr(n_elements(c[*,0]))
imp12_mean=ccf_mean
imp21_mean=imp12_mean
imp12_err=imp12_mean
imp21_err=imp12_mean

for i=0,n_elements(ccf_mean)-1 do ccf_mean(i)=mean(c(i,*))
for i=0,n_elements(ccf_err)-1 do ccf_err(i)=stdev(c(i,*))
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_ccf-average.eps'
plot,t_c,ccf_mean,title=ID+': ccf-average',thick=4,charthick=3,charsize=2,$
     yrange=[min(ccf_mean-ccf_err),max(ccf_mean+ccf_err)],ystyle=1,xtitle='Time delay (ms)',$
     xstyle=1

oplot,t_c,(ccf_mean-ccf_err),linestyle=5,thick=4
oplot,t_c,(ccf_mean+ccf_err),linestyle=5,thick=4
device,/close

for i=0,n_elements(imp12_mean)-1 do imp12_mean(i)=mean(impv12(i,*))
for i=0,n_elements(imp21_mean)-1 do imp21_mean(i)=mean(impv21(i,*))
for i=0,n_elements(imp12_err)-1 do imp12_err(i)=stdev(impv12(i,*))
for i=0,n_elements(imp21_err)-1 do imp21_err(i)=stdev(impv21(i,*))

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp12-average.eps'
plot,t_c,imp12_mean,title=ID+': imp12-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)',$
     yrange=[min(imp12_mean-imp12_err),max(imp12_mean+imp12_err)]

oplot,t_c,(imp12_mean-imp12_err),linestyle=5,thick=4
oplot,t_c,(imp12_mean+imp12_err),linestyle=5,thick=4
device,/close

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp21-average.eps'
plot,t_c,imp21_mean,title=ID+': imp21-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)';,$
     yrange=[min(imp21_mean-imp21_err),max(imp21_mean+imp21_err)]

oplot,t_c,(imp21_mean-imp21_err),linestyle=5,thick=4
oplot,t_c,(imp21_mean+imp21_err),linestyle=5,thick=4
device,/close

save,impv12,impv21,filename='./data/'+ID+'_imp.sav'

pg_initgraph

gp_sort,ID



if 1 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,size*n_elements(bpv[0,*,0]))
timeax_new=timeax[0:size*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
;gp_resample,data_low,timeax_new,2
;gp_resample,data_high,timeax_new2,2

gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0

blocksize=n_elements(data_low)/size
cohphase=gp_cohphasef(data_low,data_high,blocksize,hann=0,meanapsd1=meanapsd1,meanapsd2=meanapsd2,meancpsd=meancpsd,errapsd1=errapsd1,errapsd2=errapsd2,errcpsd=errcpsd)
errphase=1/!PI/(1+cohphase[*,1]^2)*imaginary(meancpsd)/float(meancpsd)*$
	sqrt((Imaginary(errcpsd)/Imaginary(meancpsd))^2+(Float(errcpsd)/Float(meancpsd))^2) ;Gauss
errphase[0]=1e-10

f=findgen(floor(blocksize/2.)+1)
f=f/max(f)
fn=(1/(timeax_new[2]-timeax_new[1])/2.)
faxis=f*fn/1000

pg_initgraph,/print
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'phase-error.eps'
plot,faxis,cohphase[0:blocksize/2-1,1],ystyle=1,thick=4,charthick=3,charsize=2
oplot,faxis,cohphase[0:blocksize/2-1,1]-errphase[0:blocksize/2-1],linestyle=5
oplot,faxis,cohphase[0:blocksize/2-1,1]+errphase[0:blocksize/2-1],linestyle=5

device,/close
pg_initgraph

gp_sort,ID

endif
return
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************



ID='2009_02_03_1545b'
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
trange=[1.38,2.55]
b=[5,9,10,17]
f_le=40
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=1572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(15,2)
trange[0,*]=[1.395,1.425]
trange[1,*]=[1.48,1.51]
trange[2,*]=[1.565,1.595]
trange[3,*]=[1.635,1.665]
trange[4,*]=[1.71,1.74]
trange[5,*]=[1.785,1.815]
trange[6,*]=[1.855,1.885]
trange[7,*]=[1.93,1.96]
trange[8,*]=[2.07,2.10]
trange[9,*]=[2.14,2.17]
trange[10,*]=[2.213,2.243]
trange[11,*]=[2.28,2.31]
trange[12,*]=[2.347,2.377]
trange[13,*]=[2.415,2.445]
trange[14,*]=[2.485,2.515]

size=n_elements(trange[*,0])

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),size)
bpv[*,*,0]=bp
for i=1,size-1 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

;resampling to get rid of the effect of stft windowing
bpv_orig=bpv
timeax_temp=timeax[0:n_elements(bpv[0,*,0])-1]
timeax_temp2=timeax_temp
q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp2,f_le
bpv=dblarr(2,n_elements(q),size)
timeax_temp2=timeax_temp


for i=0,1 do begin
   for j=0,size-1 do begin
      q=bpv_orig[i,*,j]
      gp_resample,q,timeax_temp2,f_le
      timeax_temp2=timeax_temp
      bpv[i,*,j]=q
   endfor
endfor

q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp,f_le

c=dblarr(n_elements(reform(bpv[0,*,0])),size)
impv12=c
impv21=c
t_c=lindgen(n_elements(c(*,0)))-ceil(n_elements(c(*,0))/2.)+1
;t_c=t_c*(timeax[2]-timeax[1])*1000;in ms
t_c=t_c*(timeax_temp[2]-timeax_temp[1])*1000;in ms


for i=0,size-1 do begin
pg_initgraph,/print
c[*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast)
gp_imp,reform(bpv[0,*,i]),reform(bpv[1,*,i]),imp12=imp12,imp21=imp21
impv12[*,i]=imp12
impv21[*,i]=imp21
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_'+pg_num2str(i)+'_ccf.eps'
plot,t_c,c[*,i],title=ID+': '+pg_num2str(i)+'_ccf',thick=3,charthick=3,charsize=2,$
     xtitle='Time delay (ms)',xstyle=1
device,/close
endfor

ccf_mean=dblarr(n_elements(c[*,0]))
ccf_err=dblarr(n_elements(c[*,0]))
imp12_mean=ccf_mean
imp21_mean=imp12_mean
imp12_err=imp12_mean
imp21_err=imp12_mean

for i=0,n_elements(ccf_mean)-1 do ccf_mean(i)=mean(c(i,*))
for i=0,n_elements(ccf_err)-1 do ccf_err(i)=stdev(c(i,*))
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_ccf-average.eps'
plot,t_c,ccf_mean,title=ID+': ccf-average',thick=4,charthick=3,charsize=2,$
     yrange=[min(ccf_mean-ccf_err),max(ccf_mean+ccf_err)],ystyle=1,xtitle='Time delay (ms)',$
     xstyle=1

oplot,t_c,(ccf_mean-ccf_err),linestyle=5,thick=4
oplot,t_c,(ccf_mean+ccf_err),linestyle=5,thick=4
device,/close

for i=0,n_elements(imp12_mean)-1 do imp12_mean(i)=mean(impv12(i,*))
for i=0,n_elements(imp21_mean)-1 do imp21_mean(i)=mean(impv21(i,*))
for i=0,n_elements(imp12_err)-1 do imp12_err(i)=stdev(impv12(i,*))
for i=0,n_elements(imp21_err)-1 do imp21_err(i)=stdev(impv21(i,*))

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp12-average.eps'
plot,t_c,imp12_mean,title=ID+': imp12-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)',$
     yrange=[min(imp12_mean-imp12_err),max(imp12_mean+imp12_err)]

oplot,t_c,(imp12_mean-imp12_err),linestyle=5,thick=4
oplot,t_c,(imp12_mean+imp12_err),linestyle=5,thick=4
device,/close

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp21-average.eps'
plot,t_c,imp21_mean,title=ID+': imp21-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)';,$
     yrange=[min(imp21_mean-imp21_err),max(imp21_mean+imp21_err)]

oplot,t_c,(imp21_mean-imp21_err),linestyle=5,thick=4
oplot,t_c,(imp21_mean+imp21_err),linestyle=5,thick=4
device,/close

save,impv12,impv21,filename='./data/'+ID+'_imp.sav'

pg_initgraph

gp_sort,ID



if 1 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,size*n_elements(bpv[0,*,0]))
timeax_new=timeax[0:size*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
;gp_resample,data_low,timeax_new,2
;gp_resample,data_high,timeax_new2,2

gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0

blocksize=n_elements(data_low)/size
cohphase=gp_cohphasef(data_low,data_high,blocksize,hann=0,meanapsd1=meanapsd1,meanapsd2=meanapsd2,meancpsd=meancpsd,errapsd1=errapsd1,errapsd2=errapsd2,errcpsd=errcpsd)
errphase=1/!PI/(1+cohphase[*,1]^2)*imaginary(meancpsd)/float(meancpsd)*$
	sqrt((Imaginary(errcpsd)/Imaginary(meancpsd))^2+(Float(errcpsd)/Float(meancpsd))^2) ;Gauss
errphase[0]=1e-10

f=findgen(floor(blocksize/2.)+1)
f=f/max(f)
fn=(1/(timeax_new[2]-timeax_new[1])/2.)
faxis=f*fn/1000

pg_initgraph,/print
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'phase-error.eps'
plot,faxis,cohphase[0:blocksize/2-1,1],ystyle=1,thick=4,charthick=3,charsize=2
oplot,faxis,cohphase[0:blocksize/2-1,1]-errphase[0:blocksize/2-1],linestyle=5
oplot,faxis,cohphase[0:blocksize/2-1,1]+errphase[0:blocksize/2-1],linestyle=5

device,/close
pg_initgraph

gp_sort,ID

endif
return
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************


ID='2009_02_09_1042b'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[3.87,4.6]
b=[4,7,8,15]
f_le=40
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=1572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(8,2)
trange[0,*]=[3.9d0,3.94d0]
trange[1,*]=[4.0d0,4.04d0]
trange[2,*]=[4.085d0,4.125d0]
trange[3,*]=[4.17d0,4.21d0]
trange[4,*]=[4.25d0,4.29d0]
trange[5,*]=[4.325d0,4.365d0]
trange[6,*]=[4.395d0,4.435d0]
trange[7,*]=[4.455d0,4.495d0]

size=n_elements(trange[*,0])

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),size)
bpv[*,*,0]=bp
for i=1,size-1 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

;resampling to get rid of the effect of stft windowing
bpv_orig=bpv
timeax_temp=timeax[0:n_elements(bpv[0,*,0])-1]
timeax_temp2=timeax_temp
q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp2,f_le
bpv=dblarr(2,n_elements(q),size)
timeax_temp2=timeax_temp


for i=0,1 do begin
   for j=0,size-1 do begin
      q=bpv_orig[i,*,j]
      gp_resample,q,timeax_temp2,f_le
      timeax_temp2=timeax_temp
      bpv[i,*,j]=q
   endfor
endfor

q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp,f_le

c=dblarr(n_elements(reform(bpv[0,*,0])),size)
impv12=c
impv21=c
t_c=lindgen(n_elements(c(*,0)))-ceil(n_elements(c(*,0))/2.)+1
;t_c=t_c*(timeax[2]-timeax[1])*1000;in ms
t_c=t_c*(timeax_temp[2]-timeax_temp[1])*1000;in ms


for i=0,size-1 do begin
pg_initgraph,/print
c[*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast)
gp_imp,reform(bpv[0,*,i]),reform(bpv[1,*,i]),imp12=imp12,imp21=imp21
impv12[*,i]=imp12
impv21[*,i]=imp21
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_'+pg_num2str(i)+'_ccf.eps'
plot,t_c,c[*,i],title=ID+': '+pg_num2str(i)+'_ccf',thick=3,charthick=3,charsize=2,$
     xtitle='Time delay (ms)',xstyle=1
device,/close
endfor

ccf_mean=dblarr(n_elements(c[*,0]))
ccf_err=dblarr(n_elements(c[*,0]))
imp12_mean=ccf_mean
imp21_mean=imp12_mean
imp12_err=imp12_mean
imp21_err=imp12_mean

for i=0,n_elements(ccf_mean)-1 do ccf_mean(i)=mean(c(i,*))
for i=0,n_elements(ccf_err)-1 do ccf_err(i)=stdev(c(i,*))
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_ccf-average.eps'
plot,t_c,ccf_mean,title=ID+': ccf-average',thick=4,charthick=3,charsize=2,$
     yrange=[min(ccf_mean-ccf_err),max(ccf_mean+ccf_err)],ystyle=1,xtitle='Time delay (ms)',$
     xstyle=1

oplot,t_c,(ccf_mean-ccf_err),linestyle=5,thick=4
oplot,t_c,(ccf_mean+ccf_err),linestyle=5,thick=4
device,/close

for i=0,n_elements(imp12_mean)-1 do imp12_mean(i)=mean(impv12(i,*))
for i=0,n_elements(imp21_mean)-1 do imp21_mean(i)=mean(impv21(i,*))
for i=0,n_elements(imp12_err)-1 do imp12_err(i)=stdev(impv12(i,*))
for i=0,n_elements(imp21_err)-1 do imp21_err(i)=stdev(impv21(i,*))

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp12-average.eps'
plot,t_c,imp12_mean,title=ID+': imp12-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)',$
     yrange=[min(imp12_mean-imp12_err),max(imp12_mean+imp12_err)]

oplot,t_c,(imp12_mean-imp12_err),linestyle=5,thick=4
oplot,t_c,(imp12_mean+imp12_err),linestyle=5,thick=4
device,/close

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp21-average.eps'
plot,t_c,imp21_mean,title=ID+': imp21-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)';,$
     yrange=[min(imp21_mean-imp21_err),max(imp21_mean+imp21_err)]

oplot,t_c,(imp21_mean-imp21_err),linestyle=5,thick=4
oplot,t_c,(imp21_mean+imp21_err),linestyle=5,thick=4
device,/close

save,impv12,impv21,filename='./data/'+ID+'_imp.sav'

pg_initgraph

gp_sort,ID



if 1 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,size*n_elements(bpv[0,*,0]))
timeax_new=timeax[0:size*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
;gp_resample,data_low,timeax_new,2
;gp_resample,data_high,timeax_new2,2

gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0

blocksize=n_elements(data_low)/size
cohphase=gp_cohphasef(data_low,data_high,blocksize,hann=0,meanapsd1=meanapsd1,meanapsd2=meanapsd2,meancpsd=meancpsd,errapsd1=errapsd1,errapsd2=errapsd2,errcpsd=errcpsd)
errphase=1/!PI/(1+cohphase[*,1]^2)*imaginary(meancpsd)/float(meancpsd)*$
	sqrt((Imaginary(errcpsd)/Imaginary(meancpsd))^2+(Float(errcpsd)/Float(meancpsd))^2) ;Gauss
errphase[0]=1e-10

f=findgen(floor(blocksize/2.)+1)
f=f/max(f)
fn=(1/(timeax_new[2]-timeax_new[1])/2.)
faxis=f*fn/1000

pg_initgraph,/print
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'phase-error.eps'
plot,faxis,cohphase[0:blocksize/2-1,1],ystyle=1,thick=4,charthick=3,charsize=2
oplot,faxis,cohphase[0:blocksize/2-1,1]-errphase[0:blocksize/2-1],linestyle=5
oplot,faxis,cohphase[0:blocksize/2-1,1]+errphase[0:blocksize/2-1],linestyle=5

device,/close
pg_initgraph

gp_sort,ID

endif
return
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************


ID='2009_02_12_1111b'
shot=20974
channel1='General/_AUG_SXR_J53_time_0.0000-6.0000'
trange=[1.36,2.54]
b=[4,9,10,16]
f_le=40
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=1572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(17,2)
trange[0,*]=[0,1.4145d0]
trange[1,*]=[0,1.505d0]
trange[2,*]=[0,1.5855d0]
trange[3,*]=[0,1.66d0]
trange[4,*]=[0,1.73d0]
trange[5,*]=[0,1.798d0]
trange[6,*]=[0,1.866d0]
trange[7,*]=[0,1.932d0]
trange[8,*]=[0,1.996d0]
trange[9,*]=[0,2.059d0]
trange[10,*]=[0,2.122d0]
trange[11,*]=[0,2.185d0]
trange[12,*]=[0,2.252d0]
trange[13,*]=[0,2.315d0]
trange[14,*]=[0,2.383d0]
trange[15,*]=[0,2.446d0]
trange[16,*]=[0,2.505d0]
dt=0.025
for i=0,16 do trange[i,0]=trange[i,1]-dt

size=n_elements(trange[*,0])

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),size)
bpv[*,*,0]=bp
for i=1,size-1 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

;resampling to get rid of the effect of stft windowing
bpv_orig=bpv
timeax_temp=timeax[0:n_elements(bpv[0,*,0])-1]
timeax_temp2=timeax_temp
q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp2,f_le
bpv=dblarr(2,n_elements(q),size)
timeax_temp2=timeax_temp


for i=0,1 do begin
   for j=0,size-1 do begin
      q=bpv_orig[i,*,j]
      gp_resample,q,timeax_temp2,f_le
      timeax_temp2=timeax_temp
      bpv[i,*,j]=q
   endfor
endfor

q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp,f_le

c=dblarr(n_elements(reform(bpv[0,*,0])),size)
impv12=c
impv21=c
t_c=lindgen(n_elements(c(*,0)))-ceil(n_elements(c(*,0))/2.)+1
;t_c=t_c*(timeax[2]-timeax[1])*1000;in ms
t_c=t_c*(timeax_temp[2]-timeax_temp[1])*1000;in ms
print,'Sampling time of CCF:'
print,t_c[1]-t_c[0]


for i=0,size-1 do begin
pg_initgraph,/print
c[*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast)
gp_imp,reform(bpv[0,*,i]),reform(bpv[1,*,i]),imp12=imp12,imp21=imp21
impv12[*,i]=imp12
impv21[*,i]=imp21
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_'+pg_num2str(i)+'_ccf.eps'
plot,t_c,c[*,i],title=ID+': '+pg_num2str(i)+'_ccf',thick=3,charthick=3,charsize=2,$
     xtitle='Time delay (ms)',xstyle=1
device,/close
endfor

ccf_mean=dblarr(n_elements(c[*,0]))
ccf_err=dblarr(n_elements(c[*,0]))
imp12_mean=ccf_mean
imp21_mean=imp12_mean
imp12_err=imp12_mean
imp21_err=imp12_mean

for i=0,n_elements(ccf_mean)-1 do ccf_mean(i)=mean(c(i,*))
for i=0,n_elements(ccf_err)-1 do ccf_err(i)=stdev(c(i,*))
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_ccf-average.eps'
plot,t_c,ccf_mean,title=ID+': ccf-average',thick=4,charthick=3,charsize=2,$
     yrange=[min(ccf_mean-ccf_err),max(ccf_mean+ccf_err)],ystyle=1,xtitle='Time delay (ms)',$
     xstyle=1
oplot,t_c,(ccf_mean-ccf_err),linestyle=5,thick=4
oplot,t_c,(ccf_mean+ccf_err),linestyle=5,thick=4
device,/close

;Checking ACF
;==============================
ac1=c
ac2=c
for i=0,size-1 do begin
pg_initgraph,/print
ac1[*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[0,*,i]),/fast)
ac2[*,i]=pg_ccorr(reform(bpv[1,*,i]),reform(bpv[1,*,i]),/fast)
endfor

acf_mean1=ccf_mean
acf_mean2=ccf_mean
for i=0,n_elements(ccf_mean)-1 do acf_mean1(i)=mean(ac1(i,*))
for i=0,n_elements(ccf_mean)-1 do acf_mean2(i)=mean(ac2(i,*))

print,'Plotting acf1'
pg_initgraph,/print
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_acf1-average.eps'
plot,t_c,acf_mean1,title=ID+': acf1-average',thick=4,charthick=3,charsize=2,$
    xtitle='Time delay (ms)',xstyle=1
device,/close

print,'plotting acf2'
pg_initgraph,/print
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_acf2-average.eps'
plot,t_c,acf_mean2,title=ID+': acf2-average',thick=4,charthick=3,charsize=2,$
     xtitle='Time delay (ms)',xstyle=1
device,/close



;IMP
for i=0,n_elements(imp12_mean)-1 do imp12_mean(i)=mean(impv12(i,*))
for i=0,n_elements(imp21_mean)-1 do imp21_mean(i)=mean(impv21(i,*))
for i=0,n_elements(imp12_err)-1 do imp12_err(i)=stdev(impv12(i,*))
for i=0,n_elements(imp21_err)-1 do imp21_err(i)=stdev(impv21(i,*))

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp12-average.eps'
plot,t_c,imp12_mean,title=ID+': imp12-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)',$
     yrange=[min(imp12_mean-imp12_err),max(imp12_mean+imp12_err)]

oplot,t_c,(imp12_mean-imp12_err),linestyle=5,thick=4
oplot,t_c,(imp12_mean+imp12_err),linestyle=5,thick=4
device,/close

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp21-average.eps'
plot,t_c,imp21_mean,title=ID+': imp21-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)';,$
     yrange=[min(imp21_mean-imp21_err),max(imp21_mean+imp21_err)]

oplot,t_c,(imp21_mean-imp21_err),linestyle=5,thick=4
oplot,t_c,(imp21_mean+imp21_err),linestyle=5,thick=4
device,/close

save,impv12,impv21,filename='./data/'+ID+'_imp.sav'

pg_initgraph

gp_sort,ID



if 1 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,size*n_elements(bpv[0,*,0]))
timeax_new=timeax[0:size*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
;gp_resample,data_low,timeax_new,2
;gp_resample,data_high,timeax_new2,2

gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0

blocksize=n_elements(data_low)/size
cohphase=gp_cohphasef(data_low,data_high,blocksize,hann=0,meanapsd1=meanapsd1,meanapsd2=meanapsd2,meancpsd=meancpsd,errapsd1=errapsd1,errapsd2=errapsd2,errcpsd=errcpsd)
errphase=1/!PI/(1+cohphase[*,1]^2)*imaginary(meancpsd)/float(meancpsd)*$
	sqrt((Imaginary(errcpsd)/Imaginary(meancpsd))^2+(Float(errcpsd)/Float(meancpsd))^2) ;Gauss
errphase[0]=1e-10

f=findgen(floor(blocksize/2.)+1)
f=f/max(f)
fn=(1/(timeax_new[2]-timeax_new[1])/2.)
faxis=f*fn/1000

pg_initgraph,/print
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_phase-error.eps'
plot,faxis,cohphase[0:blocksize/2-1,1],ystyle=1,thick=4,charthick=3,charsize=2
oplot,faxis,cohphase[0:blocksize/2-1,1]-errphase[0:blocksize/2-1],linestyle=5
oplot,faxis,cohphase[0:blocksize/2-1,1]+errphase[0:blocksize/2-1],linestyle=5

device,/close
pg_initgraph

gp_sort,ID

endif
return
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************



ID='2009_02_12_1111'
shot=20974
channel1='General/_AUG_SXR_J53_time_0.0000-6.0000'
trange=[1.36,2.54]
b=[4,9,10,16]
f_le=1.3
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=1572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(17,2)
trange[0,*]=[0,1.4145d0]
trange[1,*]=[0,1.505d0]
trange[2,*]=[0,1.5855d0]
trange[3,*]=[0,1.66d0]
trange[4,*]=[0,1.73d0]
trange[5,*]=[0,1.798d0]
trange[6,*]=[0,1.866d0]
trange[7,*]=[0,1.932d0]
trange[8,*]=[0,1.996d0]
trange[9,*]=[0,2.059d0]
trange[10,*]=[0,2.122d0]
trange[11,*]=[0,2.185d0]
trange[12,*]=[0,2.252d0]
trange[13,*]=[0,2.315d0]
trange[14,*]=[0,2.383d0]
trange[15,*]=[0,2.446d0]
trange[16,*]=[0,2.505d0]
dt=0.025
for i=0,16 do trange[i,0]=trange[i,1]-dt

size=n_elements(trange[*,0])

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),size)
bpv[*,*,0]=bp
for i=1,size-1 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

;resampling to get rid of the effect of stft windowing
bpv_orig=bpv
timeax_temp=timeax[0:n_elements(bpv[0,*,0])-1]
timeax_temp2=timeax_temp
q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp2,f_le
bpv=dblarr(2,n_elements(q),size)
timeax_temp2=timeax_temp


for i=0,1 do begin
   for j=0,size-1 do begin
      q=bpv_orig[i,*,j]
      gp_resample,q,timeax_temp2,f_le
      timeax_temp2=timeax_temp
      bpv[i,*,j]=q
   endfor
endfor

q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp,f_le

c=dblarr(n_elements(reform(bpv[0,*,0])),size)
impv12=c
impv21=c
t_c=lindgen(n_elements(c(*,0)))-ceil(n_elements(c(*,0))/2.)+1
;t_c=t_c*(timeax[2]-timeax[1])*1000;in ms
t_c=t_c*(timeax_temp[2]-timeax_temp[1])*1000;in ms
print,'Sampling time of CCF:'
print,t_c[1]-t_c[0]


for i=0,size-1 do begin
pg_initgraph,/print
c[*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast)
gp_imp,reform(bpv[0,*,i]),reform(bpv[1,*,i]),imp12=imp12,imp21=imp21
impv12[*,i]=imp12
impv21[*,i]=imp21
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_'+pg_num2str(i)+'_ccf.eps'
plot,t_c,c[*,i],title=ID+': '+pg_num2str(i)+'_ccf',thick=3,charthick=3,charsize=2,$
     xtitle='Time delay (ms)',xstyle=1
device,/close
endfor

ccf_mean=dblarr(n_elements(c[*,0]))
ccf_err=dblarr(n_elements(c[*,0]))
imp12_mean=ccf_mean
imp21_mean=imp12_mean
imp12_err=imp12_mean
imp21_err=imp12_mean

for i=0,n_elements(ccf_mean)-1 do ccf_mean(i)=mean(c(i,*))
for i=0,n_elements(ccf_err)-1 do ccf_err(i)=stdev(c(i,*))
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_ccf-average.eps'
plot,t_c,ccf_mean,title=ID+': ccf-average',thick=4,charthick=3,charsize=2,$
     yrange=[min(ccf_mean-ccf_err),max(ccf_mean+ccf_err)],ystyle=1,xtitle='Time delay (ms)',$
     xstyle=1
oplot,t_c,(ccf_mean-ccf_err),linestyle=5,thick=4
oplot,t_c,(ccf_mean+ccf_err),linestyle=5,thick=4
device,/close

;Checking ACF
;==============================
ac1=c
ac2=c
for i=0,size-1 do begin
pg_initgraph,/print
ac1[*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[0,*,i]),/fast)
ac2[*,i]=pg_ccorr(reform(bpv[1,*,i]),reform(bpv[1,*,i]),/fast)
endfor

acf_mean1=ccf_mean
acf_mean2=ccf_mean
for i=0,n_elements(ccf_mean)-1 do acf_mean1(i)=mean(ac1(i,*))
for i=0,n_elements(ccf_mean)-1 do acf_mean2(i)=mean(ac2(i,*))

print,'Plotting acf1'
pg_initgraph,/print
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_acf1-average.eps'
plot,t_c,acf_mean1,title=ID+': acf1-average',thick=4,charthick=3,charsize=2,$
    xtitle='Time delay (ms)',xstyle=1
device,/close

print,'plotting acf2'
pg_initgraph,/print
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_acf2-average.eps'
plot,t_c,acf_mean2,title=ID+': acf2-average',thick=4,charthick=3,charsize=2,$
     xtitle='Time delay (ms)',xstyle=1
device,/close



;IMP
for i=0,n_elements(imp12_mean)-1 do imp12_mean(i)=mean(impv12(i,*))
for i=0,n_elements(imp21_mean)-1 do imp21_mean(i)=mean(impv21(i,*))
for i=0,n_elements(imp12_err)-1 do imp12_err(i)=stdev(impv12(i,*))
for i=0,n_elements(imp21_err)-1 do imp21_err(i)=stdev(impv21(i,*))

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp12-average.eps'
plot,t_c,imp12_mean,title=ID+': imp12-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)',$
     yrange=[min(imp12_mean-imp12_err),max(imp12_mean+imp12_err)]

oplot,t_c,(imp12_mean-imp12_err),linestyle=5,thick=4
oplot,t_c,(imp12_mean+imp12_err),linestyle=5,thick=4
device,/close

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp21-average.eps'
plot,t_c,imp21_mean,title=ID+': imp21-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)';,$
     yrange=[min(imp21_mean-imp21_err),max(imp21_mean+imp21_err)]

oplot,t_c,(imp21_mean-imp21_err),linestyle=5,thick=4
oplot,t_c,(imp21_mean+imp21_err),linestyle=5,thick=4
device,/close

save,impv12,impv21,filename='./data/'+ID+'_imp.sav'

pg_initgraph

gp_sort,ID



if 1 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,size*n_elements(bpv[0,*,0]))
timeax_new=timeax[0:size*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
;gp_resample,data_low,timeax_new,2
;gp_resample,data_high,timeax_new2,2

gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0

blocksize=n_elements(data_low)/size
cohphase=gp_cohphasef(data_low,data_high,blocksize,hann=0,meanapsd1=meanapsd1,meanapsd2=meanapsd2,meancpsd=meancpsd,errapsd1=errapsd1,errapsd2=errapsd2,errcpsd=errcpsd)
errphase=1/!PI/(1+cohphase[*,1]^2)*imaginary(meancpsd)/float(meancpsd)*$
	sqrt((Imaginary(errcpsd)/Imaginary(meancpsd))^2+(Float(errcpsd)/Float(meancpsd))^2) ;Gauss
errphase[0]=1e-10

f=findgen(floor(blocksize/2.)+1)
f=f/max(f)
fn=(1/(timeax_new[2]-timeax_new[1])/2.)
faxis=f*fn/1000

pg_initgraph,/print
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_phase-error.eps'
plot,faxis,cohphase[0:blocksize/2-1,1],ystyle=1,thick=4,charthick=3,charsize=2
oplot,faxis,cohphase[0:blocksize/2-1,1]-errphase[0:blocksize/2-1],linestyle=5
oplot,faxis,cohphase[0:blocksize/2-1,1]+errphase[0:blocksize/2-1],linestyle=5

device,/close
pg_initgraph

gp_sort,ID

endif
return
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************


return

ID='2009_02_09_1553'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[3.87,4.6]
b=[4,7,8,15]
f_le=1.3
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=1572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(8,2)
trange[0,*]=[3.9d0,3.94d0]
trange[1,*]=[4.0d0,4.04d0]
trange[2,*]=[4.085d0,4.125d0]
trange[3,*]=[4.17d0,4.21d0]
trange[4,*]=[4.25d0,4.29d0]
trange[5,*]=[4.325d0,4.365d0]
trange[6,*]=[4.395d0,4.435d0]
trange[7,*]=[4.455d0,4.495d0]

size=n_elements(trange[*,0])

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),size)
bpv[*,*,0]=bp
for i=1,size-1 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

;resampling to get rid of the effect of stft windowing
bpv_orig=bpv
timeax_temp=timeax[0:n_elements(bpv[0,*,0])-1]
timeax_temp2=timeax_temp
q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp2,f_le
bpv=dblarr(2,n_elements(q),size)
timeax_temp2=timeax_temp


for i=0,1 do begin
   for j=0,size-1 do begin
      q=bpv_orig[i,*,j]
      gp_resample,q,timeax_temp2,f_le
      timeax_temp2=timeax_temp
      bpv[i,*,j]=q
   endfor
endfor

q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp,f_le

c=dblarr(n_elements(reform(bpv[0,*,0])),size)
impv12=c
impv21=c
t_c=lindgen(n_elements(c(*,0)))-ceil(n_elements(c(*,0))/2.)+1
;t_c=t_c*(timeax[2]-timeax[1])*1000;in ms
t_c=t_c*(timeax_temp[2]-timeax_temp[1])*1000;in ms
print,'Sampling time of CCF:'
print,t_c[1]-t_c[0]


for i=0,size-1 do begin
pg_initgraph,/print
c[*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast)
gp_imp,reform(bpv[0,*,i]),reform(bpv[1,*,i]),imp12=imp12,imp21=imp21
impv12[*,i]=imp12
impv21[*,i]=imp21
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_'+pg_num2str(i)+'_ccf.eps'
plot,t_c,c[*,i],title=ID+': '+pg_num2str(i)+'_ccf',thick=3,charthick=3,charsize=2,$
     xtitle='Time delay (ms)',xstyle=1
device,/close
endfor

ccf_mean=dblarr(n_elements(c[*,0]))
ccf_err=dblarr(n_elements(c[*,0]))
imp12_mean=ccf_mean
imp21_mean=imp12_mean
imp12_err=imp12_mean
imp21_err=imp12_mean

for i=0,n_elements(ccf_mean)-1 do ccf_mean(i)=mean(c(i,*))
for i=0,n_elements(ccf_err)-1 do ccf_err(i)=stdev(c(i,*))
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_ccf-average.eps'
plot,t_c,ccf_mean,title=ID+': ccf-average',thick=4,charthick=3,charsize=2,$
     yrange=[min(ccf_mean-ccf_err),max(ccf_mean+ccf_err)],ystyle=1,xtitle='Time delay (ms)',$
     xstyle=1
oplot,t_c,(ccf_mean-ccf_err),linestyle=5,thick=4
oplot,t_c,(ccf_mean+ccf_err),linestyle=5,thick=4
device,/close

;Checking ACF
;==============================
ac1=c
ac2=c
for i=0,size-1 do begin
pg_initgraph,/print
ac1[*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[0,*,i]),/fast)
ac2[*,i]=pg_ccorr(reform(bpv[1,*,i]),reform(bpv[1,*,i]),/fast)
endfor

acf_mean1=ccf_mean
acf_mean2=ccf_mean
for i=0,n_elements(ccf_mean)-1 do acf_mean1(i)=mean(ac1(i,*))
for i=0,n_elements(ccf_mean)-1 do acf_mean2(i)=mean(ac2(i,*))

print,'Plotting acf1'
pg_initgraph,/print
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_acf1-average.eps'
plot,t_c,acf_mean1,title=ID+': acf1-average',thick=4,charthick=3,charsize=2,$
    xtitle='Time delay (ms)',xstyle=1
device,/close

print,'plotting acf2'
pg_initgraph,/print
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_acf2-average.eps'
plot,t_c,acf_mean2,title=ID+': acf2-average',thick=4,charthick=3,charsize=2,$
     xtitle='Time delay (ms)',xstyle=1
device,/close



;IMP
for i=0,n_elements(imp12_mean)-1 do imp12_mean(i)=mean(impv12(i,*))
for i=0,n_elements(imp21_mean)-1 do imp21_mean(i)=mean(impv21(i,*))
for i=0,n_elements(imp12_err)-1 do imp12_err(i)=stdev(impv12(i,*))
for i=0,n_elements(imp21_err)-1 do imp21_err(i)=stdev(impv21(i,*))

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp12-average.eps'
plot,t_c,imp12_mean,title=ID+': imp12-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)',$
     yrange=[min(imp12_mean-imp12_err),max(imp12_mean+imp12_err)]

oplot,t_c,(imp12_mean-imp12_err),linestyle=5,thick=4
oplot,t_c,(imp12_mean+imp12_err),linestyle=5,thick=4
device,/close

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp21-average.eps'
plot,t_c,imp21_mean,title=ID+': imp21-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)';,$
     yrange=[min(imp21_mean-imp21_err),max(imp21_mean+imp21_err)]

oplot,t_c,(imp21_mean-imp21_err),linestyle=5,thick=4
oplot,t_c,(imp21_mean+imp21_err),linestyle=5,thick=4
device,/close

save,impv12,impv21,filename='./data/'+ID+'_imp.sav'

pg_initgraph

gp_sort,ID



if 1 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,size*n_elements(bpv[0,*,0]))
timeax_new=timeax[0:size*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
;gp_resample,data_low,timeax_new,2
;gp_resample,data_high,timeax_new2,2

gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0

blocksize=n_elements(data_low)/size
cohphase=gp_cohphasef(data_low,data_high,blocksize,hann=0,meanapsd1=meanapsd1,meanapsd2=meanapsd2,meancpsd=meancpsd,errapsd1=errapsd1,errapsd2=errapsd2,errcpsd=errcpsd)
errphase=1/!PI/(1+cohphase[*,1]^2)*imaginary(meancpsd)/float(meancpsd)*$
	sqrt((Imaginary(errcpsd)/Imaginary(meancpsd))^2+(Float(errcpsd)/Float(meancpsd))^2) ;Gauss
errphase[0]=1e-10

f=findgen(floor(blocksize/2.)+1)
f=f/max(f)
fn=(1/(timeax_new[2]-timeax_new[1])/2.)
faxis=f*fn/1000

pg_initgraph,/print
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'phase-error.eps'
plot,faxis,cohphase[0:blocksize/2-1,1],ystyle=1,thick=4,charthick=3,charsize=2
oplot,faxis,cohphase[0:blocksize/2-1,1]-errphase[0:blocksize/2-1],linestyle=5
oplot,faxis,cohphase[0:blocksize/2-1,1]+errphase[0:blocksize/2-1],linestyle=5

device,/close
pg_initgraph

gp_sort,ID

endif
return
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************


ID='2009_02_09_1537'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[3.87,4.6]
b=[4,7,8,15]
f_le=1.3
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=1572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(8,2)
trange[0,*]=[3.9d0,3.94d0]
trange[1,*]=[4.0d0,4.04d0]
trange[2,*]=[4.085d0,4.125d0]
trange[3,*]=[4.17d0,4.21d0]
trange[4,*]=[4.25d0,4.29d0]
trange[5,*]=[4.325d0,4.365d0]
trange[6,*]=[4.395d0,4.435d0]
trange[7,*]=[4.455d0,4.495d0]

size=n_elements(trange[*,0])

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),size)
bpv[*,*,0]=bp
for i=1,size-1 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

;resampling to get rid of the effect of stft windowing
bpv_orig=bpv
timeax_temp=timeax[0:n_elements(bpv[0,*,0])-1]
timeax_temp2=timeax_temp
q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp2,f_le
bpv=dblarr(2,n_elements(q),size)
timeax_temp2=timeax_temp


for i=0,1 do begin
   for j=0,size-1 do begin
      q=bpv_orig[i,*,j]
      gp_resample,q,timeax_temp2,f_le
      timeax_temp2=timeax_temp
      bpv[i,*,j]=q
   endfor
endfor

q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp,f_le

c=dblarr(n_elements(reform(bpv[0,*,0])),size)
impv12=c
impv21=c
t_c=lindgen(n_elements(c(*,0)))-ceil(n_elements(c(*,0))/2.)+1
;t_c=t_c*(timeax[2]-timeax[1])*1000;in ms
t_c=t_c*(timeax_temp[2]-timeax_temp[1])*1000;in ms
print,t_c[1]-t_c[0]


for i=0,size-1 do begin
pg_initgraph,/print
c[*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast)
gp_imp,reform(bpv[0,*,i]),reform(bpv[1,*,i]),imp12=imp12,imp21=imp21
impv12[*,i]=imp12
impv21[*,i]=imp21
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_'+pg_num2str(i)+'_ccf.eps'
plot,t_c,c[*,i],title=ID+': '+pg_num2str(i)+'_ccf',thick=3,charthick=3,charsize=2,$
     xtitle='Time delay (ms)',xstyle=1
device,/close
endfor

ccf_mean=dblarr(n_elements(c[*,0]))
ccf_err=dblarr(n_elements(c[*,0]))
imp12_mean=ccf_mean
imp21_mean=imp12_mean
imp12_err=imp12_mean
imp21_err=imp12_mean

for i=0,n_elements(ccf_mean)-1 do ccf_mean(i)=mean(c(i,*))
for i=0,n_elements(ccf_err)-1 do ccf_err(i)=stdev(c(i,*))
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_ccf-average.eps'
plot,t_c,ccf_mean,title=ID+': ccf-average',thick=4,charthick=3,charsize=2,$
     yrange=[min(ccf_mean-ccf_err),max(ccf_mean+ccf_err)],ystyle=1,xtitle='Time delay (ms)',$
     xstyle=1

oplot,t_c,(ccf_mean-ccf_err),linestyle=5,thick=4
oplot,t_c,(ccf_mean+ccf_err),linestyle=5,thick=4
device,/close

for i=0,n_elements(imp12_mean)-1 do imp12_mean(i)=mean(impv12(i,*))
for i=0,n_elements(imp21_mean)-1 do imp21_mean(i)=mean(impv21(i,*))
for i=0,n_elements(imp12_err)-1 do imp12_err(i)=stdev(impv12(i,*))
for i=0,n_elements(imp21_err)-1 do imp21_err(i)=stdev(impv21(i,*))

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp12-average.eps'
plot,t_c,imp12_mean,title=ID+': imp12-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)',$
     yrange=[min(imp12_mean-imp12_err),max(imp12_mean+imp12_err)]

oplot,t_c,(imp12_mean-imp12_err),linestyle=5,thick=4
oplot,t_c,(imp12_mean+imp12_err),linestyle=5,thick=4
device,/close

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp21-average.eps'
plot,t_c,imp21_mean,title=ID+': imp21-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)';,$
     yrange=[min(imp21_mean-imp21_err),max(imp21_mean+imp21_err)]

oplot,t_c,(imp21_mean-imp21_err),linestyle=5,thick=4
oplot,t_c,(imp21_mean+imp21_err),linestyle=5,thick=4
device,/close

save,impv12,impv21,filename='./data/'+ID+'_imp.sav'

pg_initgraph

gp_sort,ID



if 1 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,size*n_elements(bpv[0,*,0]))
timeax_new=timeax[0:size*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
;gp_resample,data_low,timeax_new,2
;gp_resample,data_high,timeax_new2,2

gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0

blocksize=n_elements(data_low)/size
cohphase=gp_cohphasef(data_low,data_high,blocksize,hann=0,meanapsd1=meanapsd1,meanapsd2=meanapsd2,meancpsd=meancpsd,errapsd1=errapsd1,errapsd2=errapsd2,errcpsd=errcpsd)
errphase=1/!PI/(1+cohphase[*,1]^2)*imaginary(meancpsd)/float(meancpsd)*$
	sqrt((Imaginary(errcpsd)/Imaginary(meancpsd))^2+(Float(errcpsd)/Float(meancpsd))^2) ;Gauss
errphase[0]=1e-10

f=findgen(floor(blocksize/2.)+1)
f=f/max(f)
fn=(1/(timeax_new[2]-timeax_new[1])/2.)
faxis=f*fn/1000

pg_initgraph,/print
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'phase-error.eps'
plot,faxis,cohphase[0:blocksize/2-1,1],ystyle=1,thick=4,charthick=3,charsize=2
oplot,faxis,cohphase[0:blocksize/2-1,1]-errphase[0:blocksize/2-1],linestyle=5
oplot,faxis,cohphase[0:blocksize/2-1,1]+errphase[0:blocksize/2-1],linestyle=5

device,/close
pg_initgraph

gp_sort,ID

endif
return
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************


ID='2009_02_09_1220'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[3.87,4.6]
b=[4,7,8,15]
f_le=1.3
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=1572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(8,2)
trange[0,*]=[3.9d0,3.94d0]
trange[1,*]=[4.0d0,4.04d0]
trange[2,*]=[4.085d0,4.125d0]
trange[3,*]=[4.17d0,4.21d0]
trange[4,*]=[4.25d0,4.29d0]
trange[5,*]=[4.325d0,4.365d0]
trange[6,*]=[4.395d0,4.435d0]
trange[7,*]=[4.455d0,4.495d0]

size=n_elements(trange[*,0])

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),size)
bpv[*,*,0]=bp
for i=1,size-1 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

;resampling to get rid of the effect of stft windowing
bpv_orig=bpv
timeax_temp=timeax[0:n_elements(bpv[0,*,0])-1]
timeax_temp2=timeax_temp
q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp2,f_le
bpv=dblarr(2,n_elements(q),size)
timeax_temp2=timeax_temp


for i=0,1 do begin
   for j=0,size-1 do begin
      q=bpv_orig[i,*,j]
      gp_resample,q,timeax_temp2,f_le
      timeax_temp2=timeax_temp
      bpv[i,*,j]=q
   endfor
endfor

q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp,f_le

c=dblarr(n_elements(reform(bpv[0,*,0])),size)
impv12=c
impv21=c
t_c=lindgen(n_elements(c(*,0)))-ceil(n_elements(c(*,0))/2.)+1
;t_c=t_c*(timeax[2]-timeax[1])*1000;in ms
t_c=t_c*(timeax_temp[2]-timeax_temp[1])*1000;in ms


for i=0,size-1 do begin
pg_initgraph,/print
c[*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast)
gp_imp,reform(bpv[0,*,i]),reform(bpv[1,*,i]),imp12=imp12,imp21=imp21
impv12[*,i]=imp12
impv21[*,i]=imp21
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_'+pg_num2str(i)+'_ccf.eps'
plot,t_c,c[*,i],title=ID+': '+pg_num2str(i)+'_ccf',thick=3,charthick=3,charsize=2,$
     xtitle='Time delay (ms)',xstyle=1
device,/close
endfor

ccf_mean=dblarr(n_elements(c[*,0]))
ccf_err=dblarr(n_elements(c[*,0]))
imp12_mean=ccf_mean
imp21_mean=imp12_mean
imp12_err=imp12_mean
imp21_err=imp12_mean

for i=0,n_elements(ccf_mean)-1 do ccf_mean(i)=mean(c(i,*))
for i=0,n_elements(ccf_err)-1 do ccf_err(i)=stdev(c(i,*))
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_ccf-average.eps'
plot,t_c,ccf_mean,title=ID+': ccf-average',thick=4,charthick=3,charsize=2,$
     yrange=[min(ccf_mean-ccf_err),max(ccf_mean+ccf_err)],ystyle=1,xtitle='Time delay (ms)',$
     xstyle=1

oplot,t_c,(ccf_mean-ccf_err),linestyle=5,thick=4
oplot,t_c,(ccf_mean+ccf_err),linestyle=5,thick=4
device,/close

for i=0,n_elements(imp12_mean)-1 do imp12_mean(i)=mean(impv12(i,*))
for i=0,n_elements(imp21_mean)-1 do imp21_mean(i)=mean(impv21(i,*))
for i=0,n_elements(imp12_err)-1 do imp12_err(i)=stdev(impv12(i,*))
for i=0,n_elements(imp21_err)-1 do imp21_err(i)=stdev(impv21(i,*))

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp12-average.eps'
plot,t_c,imp12_mean,title=ID+': imp12-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)',$
     yrange=[min(imp12_mean-imp12_err),max(imp12_mean+imp12_err)]

oplot,t_c,(imp12_mean-imp12_err),linestyle=5,thick=4
oplot,t_c,(imp12_mean+imp12_err),linestyle=5,thick=4
device,/close

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp21-average.eps'
plot,t_c,imp21_mean,title=ID+': imp21-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)';,$
     yrange=[min(imp21_mean-imp21_err),max(imp21_mean+imp21_err)]

oplot,t_c,(imp21_mean-imp21_err),linestyle=5,thick=4
oplot,t_c,(imp21_mean+imp21_err),linestyle=5,thick=4
device,/close

save,impv12,impv21,filename='./data/'+ID+'_imp.sav'

pg_initgraph

gp_sort,ID



if 1 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,size*n_elements(bpv[0,*,0]))
timeax_new=timeax[0:size*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
;gp_resample,data_low,timeax_new,2
;gp_resample,data_high,timeax_new2,2

gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0

blocksize=n_elements(data_low)/size
cohphase=gp_cohphasef(data_low,data_high,blocksize,hann=0,meanapsd1=meanapsd1,meanapsd2=meanapsd2,meancpsd=meancpsd,errapsd1=errapsd1,errapsd2=errapsd2,errcpsd=errcpsd)
errphase=1/!PI/(1+cohphase[*,1]^2)*imaginary(meancpsd)/float(meancpsd)*$
	sqrt((Imaginary(errcpsd)/Imaginary(meancpsd))^2+(Float(errcpsd)/Float(meancpsd))^2) ;Gauss
errphase[0]=1e-10

f=findgen(floor(blocksize/2.)+1)
f=f/max(f)
fn=(1/(timeax_new[2]-timeax_new[1])/2.)
faxis=f*fn/1000

pg_initgraph,/print
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'phase-error.eps'
plot,faxis,cohphase[0:blocksize/2-1,1],ystyle=1,thick=4,charthick=3,charsize=2
oplot,faxis,cohphase[0:blocksize/2-1,1]-errphase[0:blocksize/2-1],linestyle=5
oplot,faxis,cohphase[0:blocksize/2-1,1]+errphase[0:blocksize/2-1],linestyle=5

device,/close
pg_initgraph

gp_sort,ID

endif
return
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************


ID='2009_02_09_1042'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[3.87,4.6]
b=[4,7,8,15]
f_le=1.3
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=1572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(8,2)
trange[0,*]=[3.9d0,3.94d0]
trange[1,*]=[4.0d0,4.04d0]
trange[2,*]=[4.085d0,4.125d0]
trange[3,*]=[4.17d0,4.21d0]
trange[4,*]=[4.25d0,4.29d0]
trange[5,*]=[4.325d0,4.365d0]
trange[6,*]=[4.395d0,4.435d0]
trange[7,*]=[4.455d0,4.495d0]

size=n_elements(trange[*,0])

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),size)
bpv[*,*,0]=bp
for i=1,size-1 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

;resampling to get rid of the effect of stft windowing
bpv_orig=bpv
timeax_temp=timeax[0:n_elements(bpv[0,*,0])-1]
timeax_temp2=timeax_temp
q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp2,f_le
bpv=dblarr(2,n_elements(q),size)
timeax_temp2=timeax_temp


for i=0,1 do begin
   for j=0,size-1 do begin
      q=bpv_orig[i,*,j]
      gp_resample,q,timeax_temp2,f_le
      timeax_temp2=timeax_temp
      bpv[i,*,j]=q
   endfor
endfor

q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp,f_le

c=dblarr(n_elements(reform(bpv[0,*,0])),size)
impv12=c
impv21=c
t_c=lindgen(n_elements(c(*,0)))-ceil(n_elements(c(*,0))/2.)+1
;t_c=t_c*(timeax[2]-timeax[1])*1000;in ms
t_c=t_c*(timeax_temp[2]-timeax_temp[1])*1000;in ms


for i=0,size-1 do begin
pg_initgraph,/print
c[*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast)
gp_imp,reform(bpv[0,*,i]),reform(bpv[1,*,i]),imp12=imp12,imp21=imp21
impv12[*,i]=imp12
impv21[*,i]=imp21
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_'+pg_num2str(i)+'_ccf.eps'
plot,t_c,c[*,i],title=ID+': '+pg_num2str(i)+'_ccf',thick=3,charthick=3,charsize=2,$
     xtitle='Time delay (ms)',xstyle=1
device,/close
endfor

ccf_mean=dblarr(n_elements(c[*,0]))
ccf_err=dblarr(n_elements(c[*,0]))
imp12_mean=ccf_mean
imp21_mean=imp12_mean
imp12_err=imp12_mean
imp21_err=imp12_mean

for i=0,n_elements(ccf_mean)-1 do ccf_mean(i)=mean(c(i,*))
for i=0,n_elements(ccf_err)-1 do ccf_err(i)=stdev(c(i,*))
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_ccf-average.eps'
plot,t_c,ccf_mean,title=ID+': ccf-average',thick=4,charthick=3,charsize=2,$
     yrange=[min(ccf_mean-ccf_err),max(ccf_mean+ccf_err)],ystyle=1,xtitle='Time delay (ms)',$
     xstyle=1

oplot,t_c,(ccf_mean-ccf_err),linestyle=5,thick=4
oplot,t_c,(ccf_mean+ccf_err),linestyle=5,thick=4
device,/close

for i=0,n_elements(imp12_mean)-1 do imp12_mean(i)=mean(impv12(i,*))
for i=0,n_elements(imp21_mean)-1 do imp21_mean(i)=mean(impv21(i,*))
for i=0,n_elements(imp12_err)-1 do imp12_err(i)=stdev(impv12(i,*))
for i=0,n_elements(imp21_err)-1 do imp21_err(i)=stdev(impv21(i,*))

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp12-average.eps'
plot,t_c,imp12_mean,title=ID+': imp12-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)',$
     yrange=[min(imp12_mean-imp12_err),max(imp12_mean+imp12_err)]

oplot,t_c,(imp12_mean-imp12_err),linestyle=5,thick=4
oplot,t_c,(imp12_mean+imp12_err),linestyle=5,thick=4
device,/close

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp21-average.eps'
plot,t_c,imp21_mean,title=ID+': imp21-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)';,$
     yrange=[min(imp21_mean-imp21_err),max(imp21_mean+imp21_err)]

oplot,t_c,(imp21_mean-imp21_err),linestyle=5,thick=4
oplot,t_c,(imp21_mean+imp21_err),linestyle=5,thick=4
device,/close

save,impv12,impv21,filename='./data/'+ID+'_imp.sav'

pg_initgraph

gp_sort,ID



if 1 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,size*n_elements(bpv[0,*,0]))
timeax_new=timeax[0:size*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
;gp_resample,data_low,timeax_new,2
;gp_resample,data_high,timeax_new2,2

gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0

blocksize=n_elements(data_low)/size
cohphase=gp_cohphasef(data_low,data_high,blocksize,hann=0,meanapsd1=meanapsd1,meanapsd2=meanapsd2,meancpsd=meancpsd,errapsd1=errapsd1,errapsd2=errapsd2,errcpsd=errcpsd)
errphase=1/!PI/(1+cohphase[*,1]^2)*imaginary(meancpsd)/float(meancpsd)*$
	sqrt((Imaginary(errcpsd)/Imaginary(meancpsd))^2+(Float(errcpsd)/Float(meancpsd))^2) ;Gauss
errphase[0]=1e-10

f=findgen(floor(blocksize/2.)+1)
f=f/max(f)
fn=(1/(timeax_new[2]-timeax_new[1])/2.)
faxis=f*fn/1000

pg_initgraph,/print
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'phase-error.eps'
plot,faxis,cohphase[0:blocksize/2-1,1],ystyle=1,thick=4,charthick=3,charsize=2
oplot,faxis,cohphase[0:blocksize/2-1,1]-errphase[0:blocksize/2-1],linestyle=5
oplot,faxis,cohphase[0:blocksize/2-1,1]+errphase[0:blocksize/2-1],linestyle=5

device,/close
pg_initgraph

gp_sort,ID

endif
return
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************


ID='2009_02_04_2102_D_spectrograms_128'
shot=20974
channel1='General/_AUG_SXR_J53_time_0.0000-6.0000'
times=[	1.4219, 1.5143, 1.5949, 1.6681, 1.7393, 1.80635, 1.8736,$
	1.9394, 2.0049, 2.0663, 2.1298, 2.1928, 2.25915, 2.3244,$
	2.3899, 2.4543, 2.5136, 2.5725, 2.63595, 2.69765, 2.7596,$
	2.8259, 2.8969, 2.9646, 3.0313, 3.0952, 3.1596, 3.2246,$
	3.2899,$
	3.3733, 3.482, 3.581, 3.66655, 3.74315, 3.8275, 3.9076,$
	3.9765, 4.0459, 4.1157, 4.1794, 4.2355, 4.2855, 4.33285,$
	4.3813, 4.4256, 4.4685, 4.5121,$
	4.5575, 4.6048, 4.6498,$
	4.69475, 4.7412, 4.78635, 4.8293, 4.87335, 4.918, 4.9616,$
	5.0039, 5.0488, 5.0959, 5.1419, 5.187, 5.2301, 5.2727,$
	5.3179, 5.364, 5.40825, 5.4547, 5.50155, 5.5444, 5.5879,$
	5.6323, 5.6735, 5.71615, 5.7541, 5.7892, 5.82255, 5.8543]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
stft=pg_spectrogram(shot,channel1,windowsize=128,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
endfor
gp_sort,ID

ID='2009_02_04_1430_D_spectrograms_128'
shot=20974
channel1='General/_AUG_SXR_J53_time_0.0000-6.0000'
times=[	1.4219, 1.5143, 1.5949, 1.6681, 1.7393, 1.80635, 1.8736,$
	1.9394, 2.0049, 2.0663, 2.1298, 2.1928, 2.25915, 2.3244,$
	2.3899, 2.4543, 2.5136, 2.5725, 2.63595, 2.69765, 2.7596,$
	2.8259, 2.8969, 2.9646, 3.0313, 3.0952, 3.1596, 3.2246,$
	3.2899,$
	3.3733, 3.482, 3.581, 3.66655, 3.74315, 3.8275, 3.9076,$
	3.9765, 4.0459, 4.1157, 4.1794, 4.2355, 4.2855, 4.33285,$
	4.3813, 4.4256, 4.4685, 4.5121,$
	4.5575, 4.6048, 4.6498,$
	4.69475, 4.7412, 4.78635, 4.8293, 4.87335, 4.918, 4.9616,$
	5.0039, 5.0488, 5.0959, 5.1419, 5.187, 5.2301, 5.2727,$
	5.3179, 5.364, 5.40825, 5.4547, 5.50155, 5.5444, 5.5879,$
	5.6323, 5.6735, 5.71615, 5.7541, 5.7892, 5.82255, 5.8543]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
stft=pg_spectrogram(shot,channel1,windowsize=128,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
endfor
gp_sort,ID

end

ID='2009_02_04_1400_D_spectrograms_64'
shot=20974
channel1='General/_AUG_SXR_J53_time_0.0000-6.0000'
times=[	1.4219, 1.5143, 1.5949, 1.6681, 1.7393, 1.80635, 1.8736,$
	1.9394, 2.0049, 2.0663, 2.1298, 2.1928, 2.25915, 2.3244,$
	2.3899, 2.4543, 2.5136, 2.5725, 2.63595, 2.69765, 2.7596,$
	2.8259, 2.8969, 2.9646, 3.0313, 3.0952, 3.1596, 3.2246,$
	3.2899,$
	3.3733, 3.482, 3.581, 3.66655, 3.74315, 3.8275, 3.9076,$
	3.9765, 4.0459, 4.1157, 4.1794, 4.2355, 4.2855, 4.33285,$
	4.3813, 4.4256, 4.4685, 4.5121,$
	4.5575, 4.6048, 4.6498,$
	4.69475, 4.7412, 4.78635, 4.8293, 4.87335, 4.918, 4.9616,$
	5.0039, 5.0488, 5.0959, 5.1419, 5.187, 5.2301, 5.2727,$
	5.3179, 5.364, 5.40825, 5.4547, 5.50155, 5.5444, 5.5879,$
	5.6323, 5.6735, 5.71615, 5.7541, 5.7892, 5.82255, 5.8543]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
stft=pg_spectrogram(shot,channel1,windowsize=64,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
endfor
gp_sort,ID


ID='2009_02_03_1630_D_spectrograms_16'
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
times=[1.4366, 1.5235, 1.6045, 1.6776, 1.7531, 1.8243, 1.8968, 1.9689]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
stft=pg_spectrogram(shot,channel1,windowsize=16,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
endfor
gp_sort,ID

ID='2009_02_03_1630_D_spectrograms_256'
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
times=[1.4366, 1.5235, 1.6045, 1.6776, 1.7531, 1.8243, 1.8968, 1.9689]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
stft=pg_spectrogram(shot,channel1,windowsize=256,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
endfor
gp_sort,ID
return

ID='2009_02_03_1630_D_spectrograms_64'
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
times=[1.4366, 1.5235, 1.6045, 1.6776, 1.7531, 1.8243, 1.8968, 1.9689]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
stft=pg_spectrogram(shot,channel1,windowsize=64,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
endfor
gp_sort,ID

ID='2009_02_03_1640_D_spectrograms_32'
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
times=[1.4366, 1.5235, 1.6045, 1.6776, 1.7531, 1.8243, 1.8968, 1.9689]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
stft=pg_spectrogram(shot,channel1,windowsize=32,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
endfor
gp_sort,ID
return

ID='2009_02_03_1551'
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
trange=[1.38,2.55]
b=[5,9,10,17]
f_le=1.3
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=1572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(15,2)
trange[0,*]=[1.395,1.425]
trange[1,*]=[1.48,1.51]
trange[2,*]=[1.565,1.595]
trange[3,*]=[1.635,1.665]
trange[4,*]=[1.71,1.74]
trange[5,*]=[1.785,1.815]
trange[6,*]=[1.855,1.885]
trange[7,*]=[1.93,1.96]
trange[8,*]=[2.07,2.10]
trange[9,*]=[2.14,2.17]
trange[10,*]=[2.213,2.243]
trange[11,*]=[2.28,2.31]
trange[12,*]=[2.347,2.377]
trange[13,*]=[2.415,2.445]
trange[14,*]=[2.485,2.515]

size=n_elements(trange[*,0])

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),size)
bpv[*,*,0]=bp
for i=1,size-1 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

;resampling to get rid of the effect of stft windowing
bpv_orig=bpv
timeax_temp=timeax[0:n_elements(bpv[0,*,0])-1]
timeax_temp2=timeax_temp
q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp2,f_le
bpv=dblarr(2,n_elements(q),size)
timeax_temp2=timeax_temp


for i=0,1 do begin
   for j=0,size-1 do begin
      q=bpv_orig[i,*,j]
      gp_resample,q,timeax_temp2,f_le
      timeax_temp2=timeax_temp
      bpv[i,*,j]=q
   endfor
endfor

q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp,f_le

c=dblarr(n_elements(reform(bpv[0,*,0])),size)
impv12=c
impv21=c
t_c=lindgen(n_elements(c(*,0)))-ceil(n_elements(c(*,0))/2.)+1
;t_c=t_c*(timeax[2]-timeax[1])*1000;in ms
t_c=t_c*(timeax_temp[2]-timeax_temp[1])*1000;in ms


for i=0,size-1 do begin
pg_initgraph,/print
c[*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast)
gp_imp,reform(bpv[0,*,i]),reform(bpv[1,*,i]),imp12=imp12,imp21=imp21
impv12[*,i]=imp12
impv21[*,i]=imp21
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_'+pg_num2str(i)+'_ccf.eps'
plot,t_c,c[*,i],title=ID+': '+pg_num2str(i)+'_ccf',thick=3,charthick=3,charsize=2,$
     xtitle='Time delay (ms)',xstyle=1
device,/close
endfor

ccf_mean=dblarr(n_elements(c[*,0]))
ccf_err=dblarr(n_elements(c[*,0]))
imp12_mean=ccf_mean
imp21_mean=imp12_mean
imp12_err=imp12_mean
imp21_err=imp12_mean

for i=0,n_elements(ccf_mean)-1 do ccf_mean(i)=mean(c(i,*))
for i=0,n_elements(ccf_err)-1 do ccf_err(i)=stdev(c(i,*))
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_ccf-average.eps'
plot,t_c,ccf_mean,title=ID+': ccf-average',thick=4,charthick=3,charsize=2,$
     yrange=[min(ccf_mean-ccf_err),max(ccf_mean+ccf_err)],ystyle=1,xtitle='Time delay (ms)',$
     xstyle=1

oplot,t_c,(ccf_mean-ccf_err),linestyle=5,thick=4
oplot,t_c,(ccf_mean+ccf_err),linestyle=5,thick=4
device,/close

for i=0,n_elements(imp12_mean)-1 do imp12_mean(i)=mean(impv12(i,*))
for i=0,n_elements(imp21_mean)-1 do imp21_mean(i)=mean(impv21(i,*))
for i=0,n_elements(imp12_err)-1 do imp12_err(i)=stdev(impv12(i,*))
for i=0,n_elements(imp21_err)-1 do imp21_err(i)=stdev(impv21(i,*))

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp12-average.eps'
plot,t_c,imp12_mean,title=ID+': imp12-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)',$
     yrange=[min(imp12_mean-imp12_err),max(imp12_mean+imp12_err)]

oplot,t_c,(imp12_mean-imp12_err),linestyle=5,thick=4
oplot,t_c,(imp12_mean+imp12_err),linestyle=5,thick=4
device,/close

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp21-average.eps'
plot,t_c,imp21_mean,title=ID+': imp21-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)';,$
     yrange=[min(imp21_mean-imp21_err),max(imp21_mean+imp21_err)]

oplot,t_c,(imp21_mean-imp21_err),linestyle=5,thick=4
oplot,t_c,(imp21_mean+imp21_err),linestyle=5,thick=4
device,/close

save,impv12,impv21,filename='./data/'+ID+'_imp.sav'

pg_initgraph

gp_sort,ID



if 1 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,size*n_elements(bpv[0,*,0]))
timeax_new=timeax[0:size*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
;gp_resample,data_low,timeax_new,2
;gp_resample,data_high,timeax_new2,2

gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0

blocksize=n_elements(data_low)/size
cohphase=gp_cohphasef(data_low,data_high,blocksize,hann=0,meanapsd1=meanapsd1,meanapsd2=meanapsd2,meancpsd=meancpsd,errapsd1=errapsd1,errapsd2=errapsd2,errcpsd=errcpsd)
errphase=1/!PI/(1+cohphase[*,1]^2)*imaginary(meancpsd)/float(meancpsd)*$
	sqrt((Imaginary(errcpsd)/Imaginary(meancpsd))^2+(Float(errcpsd)/Float(meancpsd))^2) ;Gauss
errphase[0]=1e-10

f=findgen(floor(blocksize/2.)+1)
f=f/max(f)
fn=(1/(timeax_new[2]-timeax_new[1])/2.)
faxis=f*fn/1000

pg_initgraph,/print
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'phase-error.eps'
plot,faxis,cohphase[0:blocksize/2-1,1],ystyle=1,thick=4,charthick=3,charsize=2
oplot,faxis,cohphase[0:blocksize/2-1,1]-errphase[0:blocksize/2-1],linestyle=5
oplot,faxis,cohphase[0:blocksize/2-1,1]+errphase[0:blocksize/2-1],linestyle=5

device,/close
pg_initgraph

gp_sort,ID

endif
return
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************


ID='2009_02_03_1545'
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
trange=[1.38,2.55]
b=[5,9,10,17]
f_le=1.3
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=1572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(15,2)
trange[0,*]=[1.395,1.425]
trange[1,*]=[1.48,1.51]
trange[2,*]=[1.565,1.595]
trange[3,*]=[1.635,1.665]
trange[4,*]=[1.71,1.74]
trange[5,*]=[1.785,1.815]
trange[6,*]=[1.855,1.885]
trange[7,*]=[1.93,1.96]
trange[8,*]=[2.07,2.10]
trange[9,*]=[2.14,2.17]
trange[10,*]=[2.213,2.243]
trange[11,*]=[2.28,2.31]
trange[12,*]=[2.347,2.377]
trange[13,*]=[2.415,2.445]
trange[14,*]=[2.485,2.515]

size=n_elements(trange[*,0])

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),size)
bpv[*,*,0]=bp
for i=1,size-1 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

;resampling to get rid of the effect of stft windowing
bpv_orig=bpv
timeax_temp=timeax[0:n_elements(bpv[0,*,0])-1]
timeax_temp2=timeax_temp
q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp2,f_le
bpv=dblarr(2,n_elements(q),size)
timeax_temp2=timeax_temp


for i=0,1 do begin
   for j=0,size-1 do begin
      q=bpv_orig[i,*,j]
      gp_resample,q,timeax_temp2,f_le
      timeax_temp2=timeax_temp
      bpv[i,*,j]=q
   endfor
endfor

q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp,f_le

c=dblarr(n_elements(reform(bpv[0,*,0])),size)
impv12=c
impv21=c
t_c=lindgen(n_elements(c(*,0)))-ceil(n_elements(c(*,0))/2.)+1
;t_c=t_c*(timeax[2]-timeax[1])*1000;in ms
t_c=t_c*(timeax_temp[2]-timeax_temp[1])*1000;in ms


for i=0,size-1 do begin
pg_initgraph,/print
c[*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast)
gp_imp,reform(bpv[0,*,i]),reform(bpv[1,*,i]),imp12=imp12,imp21=imp21
impv12[*,i]=imp12
impv21[*,i]=imp21
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_'+pg_num2str(i)+'_ccf.eps'
plot,t_c,c[*,i],title=ID+': '+pg_num2str(i)+'_ccf',thick=3,charthick=3,charsize=2,$
     xtitle='Time delay (ms)',xstyle=1
device,/close
endfor

ccf_mean=dblarr(n_elements(c[*,0]))
ccf_err=dblarr(n_elements(c[*,0]))
imp12_mean=ccf_mean
imp21_mean=imp12_mean
imp12_err=imp12_mean
imp21_err=imp12_mean

for i=0,n_elements(ccf_mean)-1 do ccf_mean(i)=mean(c(i,*))
for i=0,n_elements(ccf_err)-1 do ccf_err(i)=stdev(c(i,*))
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_ccf-average.eps'
plot,t_c,ccf_mean,title=ID+': ccf-average',thick=4,charthick=3,charsize=2,$
     yrange=[min(ccf_mean-ccf_err),max(ccf_mean+ccf_err)],ystyle=1,xtitle='Time delay (ms)',$
     xstyle=1

oplot,t_c,(ccf_mean-ccf_err),linestyle=5,thick=4
oplot,t_c,(ccf_mean+ccf_err),linestyle=5,thick=4
device,/close

for i=0,n_elements(imp12_mean)-1 do imp12_mean(i)=mean(impv12(i,*))
for i=0,n_elements(imp21_mean)-1 do imp21_mean(i)=mean(impv21(i,*))
for i=0,n_elements(imp12_err)-1 do imp12_err(i)=stdev(impv12(i,*))
for i=0,n_elements(imp21_err)-1 do imp21_err(i)=stdev(impv21(i,*))

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp12-average.eps'
plot,t_c,imp12_mean,title=ID+': imp12-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)',$
     yrange=[min(imp12_mean-imp12_err),max(imp12_mean+imp12_err)]

oplot,t_c,(imp12_mean-imp12_err),linestyle=5,thick=4
oplot,t_c,(imp12_mean+imp12_err),linestyle=5,thick=4
device,/close

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp21-average.eps'
plot,t_c,imp21_mean,title=ID+': imp21-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)';,$
     yrange=[min(imp21_mean-imp21_err),max(imp21_mean+imp21_err)]

oplot,t_c,(imp21_mean-imp21_err),linestyle=5,thick=4
oplot,t_c,(imp21_mean+imp21_err),linestyle=5,thick=4
device,/close

save,impv12,impv21,filename='./data/'+ID+'_imp.sav'

pg_initgraph

gp_sort,ID



if 1 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,size*n_elements(bpv[0,*,0]))
timeax_new=timeax[0:size*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
;gp_resample,data_low,timeax_new,2
;gp_resample,data_high,timeax_new2,2

gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0

blocksize=n_elements(data_low)/size
cohphase=gp_cohphasef(data_low,data_high,blocksize,hann=0,meanapsd1=meanapsd1,meanapsd2=meanapsd2,meancpsd=meancpsd,errapsd1=errapsd1,errapsd2=errapsd2,errcpsd=errcpsd)
errphase=1/!PI/(1+cohphase[*,1]^2)*imaginary(meancpsd)/float(meancpsd)*$
	sqrt((Imaginary(errcpsd)/Imaginary(meancpsd))^2+(Float(errcpsd)/Float(meancpsd))^2) ;Gauss
errphase[0]=1e-10

f=findgen(floor(blocksize/2.)+1)
f=f/max(f)
fn=(1/(timeax_new[2]-timeax_new[1])/2.)
faxis=f*fn/1000

pg_initgraph,/print
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'phase-error.eps'
plot,faxis,cohphase[0:blocksize/2-1,1],ystyle=1,thick=4,charthick=3,charsize=2
oplot,faxis,cohphase[0:blocksize/2-1,1]-errphase[0:blocksize/2-1],linestyle=5
oplot,faxis,cohphase[0:blocksize/2-1,1]+errphase[0:blocksize/2-1],linestyle=5

device,/close
pg_initgraph

gp_sort,ID

endif
return
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_02_03_1526_ccf_short'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[2,2.6]
b=[5,9,10,17]
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=1572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(7,2)
trange[0,*]=[2.07,2.10]
trange[1,*]=[2.14,2.17]
trange[2,*]=[2.213,2.243]
trange[3,*]=[2.28,2.31]
trange[4,*]=[2.347,2.377]
trange[5,*]=[2.415,2.445]
trange[6,*]=[2.485,2.515]

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),7)
bpv[*,*,0]=bp
for i=1,6 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

c=dblarr(n_elements(reform(bpv[0,*,0])),7)
t_c=lindgen(n_elements(c(*,0)))-ceil(n_elements(c(*,0))/2.)+1
t_c=t_c*(timeax[2]-timeax[1])*1000;in ms
for i=0,6 do begin
pg_initgraph,/print
c[*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast,/normalize)
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_'+pg_num2str(i)+'_ccf.eps'
plot,t_c,c[*,i],title=ID+': '+pg_num2str(i)+'_ccf',thick=3,charthick=3,charsize=2,$
     xtitle='Time delay (ms)',xstyle=1
device,/close
endfor

ccf_mean=dblarr(n_elements(c[*,0]))
ccf_err=dblarr(n_elements(c[*,0]))

for i=0,n_elements(ccf_mean)-1 do ccf_mean(i)=mean(c(i,*))
for i=0,n_elements(ccf_err)-1 do ccf_err(i)=stdev(c(i,*))
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_ccf-average.eps'
plot,t_c,ccf_mean,title=ID+': ccf-average',thick=4,charthick=3,charsize=2,$
     yrange=[min(ccf_mean-ccf_err),max(ccf_mean+ccf_err)],ystyle=1,xtitle='Time delay (ms)',$
     xstyle=1

oplot,t_c,(ccf_mean-ccf_err),linestyle=5,thick=4
oplot,t_c,(ccf_mean+ccf_err),linestyle=5,thick=4
device,/close


pg_initgraph

gp_sort,ID

;filename='data/'+ID+'.sav'
;save,ID,shot,channel1,trange,stft,timeax,freqax,bpv,b,c,filename=filename

if 1 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,7*n_elements(bp[0,*]))
timeax_new=timeax[0:7*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
gp_resample,data_low,timeax_new,3
gp_resample,data_high,timeax_new2,3


gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0
endif
return

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2008_02_03_1520_ccf_short'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[2,2.6]
b=[5,9,10,17]
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=1572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(7,2)
trange[0,*]=[2.07,2.10]
trange[1,*]=[2.14,2.17]
trange[2,*]=[2.213,2.243]
trange[3,*]=[2.28,2.31]
trange[4,*]=[2.347,2.377]
trange[5,*]=[2.415,2.445]
trange[6,*]=[2.485,2.515]

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),7)
bpv[*,*,0]=bp
for i=1,6 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

c=dblarr(n_elements(reform(bpv[0,*,0])),7)
t_c=lindgen(n_elements(c(*,0)))-ceil(n_elements(c(*,0))/2.)+1
t_c=t_c*(timeax[2]-timeax[1])*1000;in ms
for i=0,6 do begin
pg_initgraph,/print
c[*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast,/normalize)
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_'+pg_num2str(i)+'_ccf.eps'
plot,t_c,c[*,i],title=ID+': '+pg_num2str(i)+'_ccf',thick=3,charthick=3,charsize=2,$
     xtitle='Time delay (ms)',xstyle=1
device,/close
endfor

ccf_mean=dblarr(n_elements(c[*,0]))
ccf_err=dblarr(n_elements(c[*,0]))

for i=0,n_elements(ccf_mean)-1 do ccf_mean(i)=mean(c(i,*))
for i=0,n_elements(ccf_err)-1 do ccf_err(i)=stdev(c(i,*))
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_ccf-average.eps'
plot,t_c,ccf_mean,title=ID+': ccf-average',thick=4,charthick=3,charsize=2,$
     yrange=[min(ccf_mean-ccf_err),max(ccf_mean+ccf_err)],ystyle=1,xtitle='Time delay (ms)',$
     xstyle=1

oplot,t_c,(ccf_mean-ccf_err),linestyle=5,thick=4
oplot,t_c,(ccf_mean+ccf_err),linestyle=5,thick=4
device,/close


pg_initgraph

gp_sort,ID

;filename='data/'+ID+'.sav'
;save,ID,shot,channel1,trange,stft,timeax,freqax,bpv,b,c,filename=filename

if 1 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,7*n_elements(bp[0,*]))
timeax_new=timeax[0:7*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
gp_resample,data_low,timeax_new,3
gp_resample,data_high,timeax_new2,3


gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0
endif
return

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************


ID='2009_02_03_1516'
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
trange=[1.38,2.0]
b=[5,9,10,17]
f_le=1.3
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(8,2)
trange[0,*]=[1.395,1.425]
trange[1,*]=[1.48,1.51]
trange[2,*]=[1.565,1.595]
trange[3,*]=[1.635,1.665]
trange[4,*]=[1.71,1.74]
trange[5,*]=[1.785,1.815]
trange[6,*]=[1.855,1.885]
trange[7,*]=[1.93,1.96]

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),8)
bpv[*,*,0]=bp
for i=1,7 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

;resampling to get rid of the effect of stft windowing
bpv_orig=bpv
timeax_temp=timeax[0:n_elements(bpv[0,*,0])-1]
timeax_temp2=timeax_temp
q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp2,f_le
bpv=dblarr(2,n_elements(q),8)
timeax_temp2=timeax_temp


for i=0,1 do begin
   for j=0,7 do begin
      q=bpv_orig[i,*,j]
      gp_resample,q,timeax_temp2,f_le
      timeax_temp2=timeax_temp
      bpv[i,*,j]=q
   endfor
endfor

q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp,f_le

c=dblarr(n_elements(reform(bpv[0,*,0])),8)
impv12=c
impv21=c
t_c=lindgen(n_elements(c(*,0)))-ceil(n_elements(c(*,0))/2.)+1
;t_c=t_c*(timeax[2]-timeax[1])*1000;in ms
t_c=t_c*(timeax_temp[2]-timeax_temp[1])*1000;in ms


for i=0,7 do begin
pg_initgraph,/print
c[*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast)
gp_imp,reform(bpv[0,*,i]),reform(bpv[1,*,i]),imp12=imp12,imp21=imp21
impv12[*,i]=imp12
impv21[*,i]=imp21
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_'+pg_num2str(i)+'_ccf.eps'
plot,t_c,c[*,i],title=ID+': '+pg_num2str(i)+'_ccf',thick=3,charthick=3,charsize=2,$
     xtitle='Time delay (ms)',xstyle=1
device,/close
endfor

ccf_mean=dblarr(n_elements(c[*,0]))
ccf_err=dblarr(n_elements(c[*,0]))
imp12_mean=ccf_mean
imp21_mean=imp12_mean
imp12_err=imp12_mean
imp21_err=imp12_mean

for i=0,n_elements(ccf_mean)-1 do ccf_mean(i)=mean(c(i,*))
for i=0,n_elements(ccf_err)-1 do ccf_err(i)=stdev(c(i,*))
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_ccf-average.eps'
plot,t_c,ccf_mean,title=ID+': ccf-average',thick=4,charthick=3,charsize=2,$
     yrange=[min(ccf_mean-ccf_err),max(ccf_mean+ccf_err)],ystyle=1,xtitle='Time delay (ms)',$
     xstyle=1

oplot,t_c,(ccf_mean-ccf_err),linestyle=5,thick=4
oplot,t_c,(ccf_mean+ccf_err),linestyle=5,thick=4
device,/close

for i=0,n_elements(imp12_mean)-1 do imp12_mean(i)=mean(impv12(i,*))
for i=0,n_elements(imp21_mean)-1 do imp21_mean(i)=mean(impv21(i,*))
for i=0,n_elements(imp12_err)-1 do imp12_err(i)=stdev(impv12(i,*))
for i=0,n_elements(imp21_err)-1 do imp21_err(i)=stdev(impv21(i,*))

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp12-average.eps'
plot,t_c,imp12_mean,title=ID+': imp12-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)',$
     yrange=[min(imp12_mean-imp12_err),max(imp12_mean+imp12_err)]

oplot,t_c,(imp12_mean-imp12_err),linestyle=5,thick=4
oplot,t_c,(imp12_mean+imp12_err),linestyle=5,thick=4
device,/close

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp21-average.eps'
plot,t_c,imp21_mean,title=ID+': imp21-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)';,$
     yrange=[min(imp21_mean-imp21_err),max(imp21_mean+imp21_err)]

oplot,t_c,(imp21_mean-imp21_err),linestyle=5,thick=4
oplot,t_c,(imp21_mean+imp21_err),linestyle=5,thick=4
device,/close

save,impv12,impv21,filename='./data/'+ID+'_imp.sav'

pg_initgraph

gp_sort,ID



if 1 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,8*n_elements(bpv[0,*,0]))
timeax_new=timeax[0:8*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
;gp_resample,data_low,timeax_new,2
;gp_resample,data_high,timeax_new2,2

gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0

blocksize=n_elements(data_low)/8
cohphase=gp_cohphasef(data_low,data_high,blocksize,hann=0,meanapsd1=meanapsd1,meanapsd2=meanapsd2,meancpsd=meancpsd,errapsd1=errapsd1,errapsd2=errapsd2,errcpsd=errcpsd)
errphase=1/!PI/(1+cohphase[*,1]^2)*imaginary(meancpsd)/float(meancpsd)*$
	sqrt((Imaginary(errcpsd)/Imaginary(meancpsd))^2+(Float(errcpsd)/Float(meancpsd))^2) ;Gauss
errphase[0]=1e-10

f=findgen(floor(blocksize/2.)+1)
f=f/max(f)
fn=(1/(timeax_new[2]-timeax_new[1])/2.)
faxis=f*fn/1000

pg_initgraph,/print
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'phase-error.eps'
plot,faxis,cohphase[0:blocksize/2-1,1],ystyle=1,thick=4,charthick=3,charsize=2
oplot,faxis,cohphase[0:blocksize/2-1,1]-errphase[0:blocksize/2-1],linestyle=5
oplot,faxis,cohphase[0:blocksize/2-1,1]+errphase[0:blocksize/2-1],linestyle=5

device,/close
pg_initgraph

gp_sort,ID

endif
return
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_02_03_1505'
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
trange=[1.38,2.0]
b=[5,9,10,17]
f_le=1.3
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=1572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(8,2)
trange[0,*]=[1.395,1.425]
trange[1,*]=[1.48,1.51]
trange[2,*]=[1.565,1.595]
trange[3,*]=[1.635,1.665]
trange[4,*]=[1.71,1.74]
trange[5,*]=[1.785,1.815]
trange[6,*]=[1.855,1.885]
trange[7,*]=[1.93,1.96]

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),8)
bpv[*,*,0]=bp
for i=1,7 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

;resampling to get rid of the effect of stft windowing
bpv_orig=bpv
timeax_temp=timeax[0:n_elements(bpv[0,*,0])-1]
timeax_temp2=timeax_temp
q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp2,f_le
bpv=dblarr(2,n_elements(q),8)
timeax_temp2=timeax_temp


for i=0,1 do begin
   for j=0,7 do begin
      q=bpv_orig[i,*,j]
      gp_resample,q,timeax_temp2,f_le
      timeax_temp2=timeax_temp
      bpv[i,*,j]=q
   endfor
endfor

q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp,f_le

c=dblarr(n_elements(reform(bpv[0,*,0])),8)
impv12=c
impv21=c
t_c=lindgen(n_elements(c(*,0)))-ceil(n_elements(c(*,0))/2.)+1
;t_c=t_c*(timeax[2]-timeax[1])*1000;in ms
t_c=t_c*(timeax_temp[2]-timeax_temp[1])*1000;in ms


for i=0,7 do begin
pg_initgraph,/print
c[*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast)
gp_imp,reform(bpv[0,*,i]),reform(bpv[1,*,i]),imp12=imp12,imp21=imp21
impv12[*,i]=imp12
impv21[*,i]=imp21
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_'+pg_num2str(i)+'_ccf.eps'
plot,t_c,c[*,i],title=ID+': '+pg_num2str(i)+'_ccf',thick=3,charthick=3,charsize=2,$
     xtitle='Time delay (ms)',xstyle=1
device,/close
endfor

ccf_mean=dblarr(n_elements(c[*,0]))
ccf_err=dblarr(n_elements(c[*,0]))
imp12_mean=ccf_mean
imp21_mean=imp12_mean
imp12_err=imp12_mean
imp21_err=imp12_mean

for i=0,n_elements(ccf_mean)-1 do ccf_mean(i)=mean(c(i,*))
for i=0,n_elements(ccf_err)-1 do ccf_err(i)=stdev(c(i,*))
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_ccf-average.eps'
plot,t_c,ccf_mean,title=ID+': ccf-average',thick=4,charthick=3,charsize=2,$
     yrange=[min(ccf_mean-ccf_err),max(ccf_mean+ccf_err)],ystyle=1,xtitle='Time delay (ms)',$
     xstyle=1

oplot,t_c,(ccf_mean-ccf_err),linestyle=5,thick=4
oplot,t_c,(ccf_mean+ccf_err),linestyle=5,thick=4
device,/close

for i=0,n_elements(imp12_mean)-1 do imp12_mean(i)=mean(impv12(i,*))
for i=0,n_elements(imp21_mean)-1 do imp21_mean(i)=mean(impv21(i,*))
for i=0,n_elements(imp12_err)-1 do imp12_err(i)=stdev(impv12(i,*))
for i=0,n_elements(imp21_err)-1 do imp21_err(i)=stdev(impv21(i,*))

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp12-average.eps'
plot,t_c,imp12_mean,title=ID+': imp12-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)',$
     yrange=[min(imp12_mean-imp12_err),max(imp12_mean+imp12_err)]

oplot,t_c,(imp12_mean-imp12_err),linestyle=5,thick=4
oplot,t_c,(imp12_mean+imp12_err),linestyle=5,thick=4
device,/close

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp21-average.eps'
plot,t_c,imp21_mean,title=ID+': imp21-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)';,$
     yrange=[min(imp21_mean-imp21_err),max(imp21_mean+imp21_err)]

oplot,t_c,(imp21_mean-imp21_err),linestyle=5,thick=4
oplot,t_c,(imp21_mean+imp21_err),linestyle=5,thick=4
device,/close

save,impv12,impv21,filename='./data/'+ID+'_imp.sav'

pg_initgraph

gp_sort,ID



if 1 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,8*n_elements(bpv[0,*,0]))
timeax_new=timeax[0:8*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
;gp_resample,data_low,timeax_new,2
;gp_resample,data_high,timeax_new2,2

gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0

blocksize=n_elements(data_low)/8
cohphase=gp_cohphasef(data_low,data_high,blocksize,hann=0,meanapsd1=meanapsd1,meanapsd2=meanapsd2,meancpsd=meancpsd,errapsd1=errapsd1,errapsd2=errapsd2,errcpsd=errcpsd)
errphase=1/!PI/(1+cohphase[*,1]^2)*imaginary(meancpsd)/float(meancpsd)*$
	sqrt((Imaginary(errcpsd)/Imaginary(meancpsd))^2+(Float(errcpsd)/Float(meancpsd))^2) ;Gauss
errphase[0]=1e-10

f=findgen(floor(blocksize/2.)+1)
f=f/max(f)
fn=(1/(timeax_new[2]-timeax_new[1])/2.)
faxis=f*fn/1000

pg_initgraph,/print
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'phase-error.eps'
plot,faxis,cohphase[0:blocksize/2-1,1],ystyle=1,thick=4,charthick=3,charsize=2
oplot,faxis,cohphase[0:blocksize/2-1,1]-errphase[0:blocksize/2-1],linestyle=5
oplot,faxis,cohphase[0:blocksize/2-1,1]+errphase[0:blocksize/2-1],linestyle=5

device,/close
pg_initgraph

gp_sort,ID

endif
return
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_02_03_1450'
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
trange=[1.38,2.0]
b=[5,9,10,17]
f_le=1.3
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=1572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(8,2)
trange[0,*]=[1.395,1.425]
trange[1,*]=[1.48,1.51]
trange[2,*]=[1.565,1.595]
trange[3,*]=[1.635,1.665]
trange[4,*]=[1.71,1.74]
trange[5,*]=[1.785,1.815]
trange[6,*]=[1.855,1.885]
trange[7,*]=[1.93,1.96]

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),8)
bpv[*,*,0]=bp
for i=1,7 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

;resampling to get rid of the effect of stft windowing
bpv_orig=bpv
timeax_temp=timeax[0:n_elements(bpv[0,*,0])-1]
timeax_temp2=timeax_temp
q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp2,f_le
bpv=dblarr(2,n_elements(q),8)
timeax_temp2=timeax_temp


for i=0,1 do begin
   for j=0,7 do begin
      q=bpv_orig[i,*,j]
      gp_resample,q,timeax_temp2,f_le
      timeax_temp2=timeax_temp
      bpv[i,*,j]=q
   endfor
endfor

q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp,f_le

c=dblarr(n_elements(reform(bpv[0,*,0])),8)
impv12=c
impv21=c
t_c=lindgen(n_elements(c(*,0)))-ceil(n_elements(c(*,0))/2.)+1
;t_c=t_c*(timeax[2]-timeax[1])*1000;in ms
t_c=t_c*(timeax_temp[2]-timeax_temp[1])*1000;in ms


for i=0,7 do begin
pg_initgraph,/print
c[*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast)
gp_imp,reform(bpv[0,*,i]),reform(bpv[1,*,i]),imp12=imp12,imp21=imp21
impv12[*,i]=imp12
impv21[*,i]=imp21
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_'+pg_num2str(i)+'_ccf.eps'
plot,t_c,c[*,i],title=ID+': '+pg_num2str(i)+'_ccf',thick=3,charthick=3,charsize=2,$
     xtitle='Time delay (ms)',xstyle=1
device,/close
endfor

ccf_mean=dblarr(n_elements(c[*,0]))
ccf_err=dblarr(n_elements(c[*,0]))
imp12_mean=ccf_mean
imp21_mean=imp12_mean
imp12_err=imp12_mean
imp21_err=imp12_mean

for i=0,n_elements(ccf_mean)-1 do ccf_mean(i)=mean(c(i,*))
for i=0,n_elements(ccf_err)-1 do ccf_err(i)=stdev(c(i,*))
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_ccf-average.eps'
plot,t_c,ccf_mean,title=ID+': ccf-average',thick=4,charthick=3,charsize=2,$
     yrange=[min(ccf_mean-ccf_err),max(ccf_mean+ccf_err)],ystyle=1,xtitle='Time delay (ms)',$
     xstyle=1

oplot,t_c,(ccf_mean-ccf_err),linestyle=5,thick=4
oplot,t_c,(ccf_mean+ccf_err),linestyle=5,thick=4
device,/close

for i=0,n_elements(imp12_mean)-1 do imp12_mean(i)=mean(impv12(i,*))
for i=0,n_elements(imp21_mean)-1 do imp21_mean(i)=mean(impv21(i,*))
for i=0,n_elements(imp12_err)-1 do imp12_err(i)=stdev(impv12(i,*))
for i=0,n_elements(imp21_err)-1 do imp21_err(i)=stdev(impv21(i,*))

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp12-average.eps'
plot,t_c,imp12_mean,title=ID+': imp12-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)',$
     yrange=[min(imp12_mean-imp12_err),max(imp12_mean+imp12_err)]

oplot,t_c,(imp12_mean-imp12_err),linestyle=5,thick=4
oplot,t_c,(imp12_mean+imp12_err),linestyle=5,thick=4
device,/close

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp21-average.eps'
plot,t_c,imp21_mean,title=ID+': imp21-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)';,$
     yrange=[min(imp21_mean-imp21_err),max(imp21_mean+imp21_err)]

oplot,t_c,(imp21_mean-imp21_err),linestyle=5,thick=4
oplot,t_c,(imp21_mean+imp21_err),linestyle=5,thick=4
device,/close

save,impv12,impv21,filename='./data/'+ID+'_imp.sav'

pg_initgraph

gp_sort,ID



if 1 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,8*n_elements(bpv[0,*,0]))
timeax_new=timeax[0:8*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
;gp_resample,data_low,timeax_new,2
;gp_resample,data_high,timeax_new2,2

gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0

blocksize=n_elements(data_low)/8
cohphase=gp_cohphasef(data_low,data_high,blocksize,hann=0,meanapsd1=meanapsd1,meanapsd2=meanapsd2,meancpsd=meancpsd,errapsd1=errapsd1,errapsd2=errapsd2,errcpsd=errcpsd)
errphase=1/!PI/(1+cohphase[*,1]^2)*imaginary(meancpsd)/float(meancpsd)*$
	sqrt((Imaginary(errcpsd)/Imaginary(meancpsd))^2+(Float(errcpsd)/Float(meancpsd))^2) ;Gauss
errphase[0]=1e-10

f=findgen(floor(blocksize/2.)+1)
f=f/max(f)
fn=(1/(timeax_new[2]-timeax_new[1])/2.)
faxis=f*fn/1000

pg_initgraph,/print
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'phase-error.eps'
plot,faxis,cohphase[0:blocksize/2-1,1],ystyle=1,thick=4,charthick=3,charsize=2
oplot,faxis,cohphase[0:blocksize/2-1,1]-errphase[0:blocksize/2-1],linestyle=5
oplot,faxis,cohphase[0:blocksize/2-1,1]+errphase[0:blocksize/2-1],linestyle=5

device,/close
pg_initgraph

gp_sort,ID

endif
return
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2009_02_02_1540_D_SPE'
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
trange=[1.35,2.55]
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=1572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=30,ID=ID)
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=1572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=30,ID=ID)
gp_sort,ID
return

ID='2009_02_02_1535_D_spectrograms_128'
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
times=[1.4366, 1.5235, 1.6045, 1.6776, 1.7531, 1.8243, 1.8968, 1.9689]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
stft=pg_spectrogram(shot,channel1,windowsize=128,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
endfor
gp_sort,ID
return

ID='2009_02_02_1502_D_spectrograms_128'
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
times=[1.4366, 1.5235, 1.6045, 1.6776, 1.7531, 1.8243, 1.8968, 1.9689]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=572,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
endfor
gp_sort,ID
return


ID='2009_02_02_1435_D_spectrograms_128'
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
times=[1.4366, 1.5235, 1.6045, 1.6776, 1.7531, 1.8243, 1.8968, 1.9689]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=572,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
endfor
gp_sort,ID
return
ID='2009_02_02_1430_D_SPE_128'
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
trange=[1.35,2.55]
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=572,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
gp_sort,ID
return

ID='2009_02_02_1357'
shot=20975
channel1='General/_AUG_SXR_J53_time_0.0000-3.0000'
trange=[1.35,2.55]
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=572,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
gp_sort,ID
return

ID='2009_01_08_1335'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[2,2.6]
b=[5,9,10,17]
f_le=1.3
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(7,2)
trange[0,*]=[2.07,2.10]
trange[1,*]=[2.14,2.17]
trange[2,*]=[2.213,2.243]
trange[3,*]=[2.28,2.31]
trange[4,*]=[2.347,2.377]
trange[5,*]=[2.415,2.445]
trange[6,*]=[2.485,2.515]

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),7)
bpv[*,*,0]=bp
for i=1,6 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

;resampling to get rid of the effect of stft windowing
bpv_orig=bpv
timeax_temp=timeax[0:n_elements(bpv[0,*,0])-1]
timeax_temp2=timeax_temp
q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp2,f_le
bpv=dblarr(2,n_elements(q),7)
timeax_temp2=timeax_temp


for i=0,1 do begin
   for j=0,6 do begin
      q=bpv_orig[i,*,j]
      gp_resample,q,timeax_temp2,f_le
      timeax_temp2=timeax_temp
      bpv[i,*,j]=q
   endfor
endfor

q=bpv_orig[0,*,0]
gp_resample,q,timeax_temp,f_le

c=dblarr(n_elements(reform(bpv[0,*,0])),7)
impv12=c
impv21=c
t_c=lindgen(n_elements(c(*,0)))-ceil(n_elements(c(*,0))/2.)+1
;t_c=t_c*(timeax[2]-timeax[1])*1000;in ms
t_c=t_c*(timeax_temp[2]-timeax_temp[1])*1000;in ms


for i=0,6 do begin
pg_initgraph,/print
c[*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast)
gp_imp,reform(bpv[0,*,i]),reform(bpv[1,*,i]),imp12=imp12,imp21=imp21
impv12[*,i]=imp12
impv21[*,i]=imp21
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_'+pg_num2str(i)+'_ccf.eps'
plot,t_c,c[*,i],title=ID+': '+pg_num2str(i)+'_ccf',thick=3,charthick=3,charsize=2,$
     xtitle='Time delay (ms)',xstyle=1
device,/close
endfor

ccf_mean=dblarr(n_elements(c[*,0]))
ccf_err=dblarr(n_elements(c[*,0]))
imp12_mean=ccf_mean
imp21_mean=imp12_mean
imp12_err=imp12_mean
imp21_err=imp12_mean

for i=0,n_elements(ccf_mean)-1 do ccf_mean(i)=mean(c(i,*))
for i=0,n_elements(ccf_err)-1 do ccf_err(i)=stdev(c(i,*))
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_ccf-average.eps'
plot,t_c,ccf_mean,title=ID+': ccf-average',thick=4,charthick=3,charsize=2,$
     yrange=[min(ccf_mean-ccf_err),max(ccf_mean+ccf_err)],ystyle=1,xtitle='Time delay (ms)',$
     xstyle=1

oplot,t_c,(ccf_mean-ccf_err),linestyle=5,thick=4
oplot,t_c,(ccf_mean+ccf_err),linestyle=5,thick=4
device,/close

for i=0,n_elements(imp12_mean)-1 do imp12_mean(i)=mean(impv12(i,*))
for i=0,n_elements(imp21_mean)-1 do imp21_mean(i)=mean(impv21(i,*))
for i=0,n_elements(imp12_err)-1 do imp12_err(i)=stdev(impv12(i,*))
for i=0,n_elements(imp21_err)-1 do imp21_err(i)=stdev(impv21(i,*))

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp12-average.eps'
plot,t_c,imp12_mean,title=ID+': imp12-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)',$
     yrange=[min(imp12_mean-imp12_err),max(imp12_mean+imp12_err)]

oplot,t_c,(imp12_mean-imp12_err),linestyle=5,thick=4
oplot,t_c,(imp12_mean+imp12_err),linestyle=5,thick=4
device,/close

device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_imp21-average.eps'
plot,t_c,imp21_mean,title=ID+': imp21-average',thick=4,charthick=3,charsize=2,$
     xstyle=1,ystyle=1,xtitle='Time delay (ms)';,$
     yrange=[min(imp21_mean-imp21_err),max(imp21_mean+imp21_err)]

oplot,t_c,(imp21_mean-imp21_err),linestyle=5,thick=4
oplot,t_c,(imp21_mean+imp21_err),linestyle=5,thick=4
device,/close

save,impv12,impv21,filename='./data/'+ID+'_imp.sav'

pg_initgraph

gp_sort,ID



if 1 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,7*n_elements(bpv[0,*,0]))
timeax_new=timeax[0:7*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
;gp_resample,data_low,timeax_new,2
;gp_resample,data_high,timeax_new2,2

gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0

blocksize=n_elements(data_low)/7
cohphase=gp_cohphasef(data_low,data_high,blocksize,hann=0,meanapsd1=meanapsd1,meanapsd2=meanapsd2,meancpsd=meancpsd,errapsd1=errapsd1,errapsd2=errapsd2,errcpsd=errcpsd)
errphase=1/!PI/(1+cohphase[*,1]^2)*imaginary(meancpsd)/float(meancpsd)*$
	sqrt((Imaginary(errcpsd)/Imaginary(meancpsd))^2+(Float(errcpsd)/Float(meancpsd))^2) ;Gauss
errphase[0]=1e-10

f=findgen(floor(blocksize/2.)+1)
f=f/max(f)
fn=(1/(timeax_new[2]-timeax_new[1])/2.)
faxis=f*fn/1000

pg_initgraph,/print
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'phase-error.eps'
plot,faxis,cohphase[0:blocksize/2-1,1],ystyle=1,thick=4,charthick=3,charsize=2
oplot,faxis,cohphase[0:blocksize/2-1,1]-errphase[0:blocksize/2-1],linestyle=5
oplot,faxis,cohphase[0:blocksize/2-1,1]+errphase[0:blocksize/2-1],linestyle=5

device,/close
pg_initgraph

gp_sort,ID

endif
return
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************


ID='2008_12_19_1738_save'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[2,2.6]
b=[5,9,10,17]
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(7,2)
trange[0,*]=[2.07,2.10]
trange[1,*]=[2.14,2.17]
trange[2,*]=[2.213,2.243]
trange[3,*]=[2.28,2.31]
trange[4,*]=[2.347,2.377]
trange[5,*]=[2.415,2.445]
trange[6,*]=[2.485,2.515]

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),7)
bpv[*,*,0]=bp
for i=1,6 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

c=dblarr(n_elements(reform(bpv[0,*,0])),7)
t_c=lindgen(n_elements(c(*,0)))-ceil(n_elements(c(*,0))/2.)+1
t_c=t_c*(timeax[2]-timeax[1])*1000;in ms
for i=0,6 do begin
pg_initgraph,/print
c[*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast)
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_'+pg_num2str(i)+'_ccf.eps'
plot,t_c,c[*,i],title=ID+': '+pg_num2str(i)+'_ccf',thick=3,charthick=3,charsize=2,$
     xtitle='Time delay (ms)',xstyle=1
device,/close
endfor

ccf_mean=dblarr(n_elements(c[*,0]))
ccf_err=dblarr(n_elements(c[*,0]))

for i=0,n_elements(ccf_mean)-1 do ccf_mean(i)=mean(c(i,*))
for i=0,n_elements(ccf_err)-1 do ccf_err(i)=stdev(c(i,*))
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_ccf-average.eps'
plot,t_c,ccf_mean,title=ID+': ccf-average',thick=4,charthick=3,charsize=2,$
     yrange=[min(ccf_mean-ccf_err),max(ccf_mean+ccf_err)],ystyle=1,xtitle='Time delay (ms)',$
     xstyle=1

oplot,t_c,(ccf_mean-ccf_err),linestyle=5,thick=4
oplot,t_c,(ccf_mean+ccf_err),linestyle=5,thick=4
device,/close


pg_initgraph

gp_sort,ID



if 1 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,7*n_elements(bp[0,*]))
timeax_new=timeax[0:7*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
gp_resample,data_low,timeax_new,5
gp_resample,data_high,timeax_new2,5

gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0

blocksize=n_elements(data_low)/7
cohphase=gp_cohphasef(data_low,data_high,blocksize,hann=0,meanapsd1=meanapsd1,meanapsd2=meanapsd2,meancpsd=meancpsd,errapsd1=errapsd1,errapsd2=errapsd2,errcpsd=errcpsd)
errphase=1/!PI/(1+cohphase[*,1]^2)*imaginary(meancpsd)/float(meancpsd)*$
	sqrt((Imaginary(errcpsd)/Imaginary(meancpsd))^2+(Float(errcpsd)/Float(meancpsd))^2) ;Gauss
errphase[0]=1e-10

f=findgen(floor(blocksize/2.)+1)
f=f/max(f)
fn=(1/(timeax_new[2]-timeax_new[1])/2.)
faxis=f*fn/1000

pg_initgraph,/print
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'phase-error.eps'
plot,faxis,cohphase[0:blocksize/2-1,1],ystyle=1,thick=4,charthick=3,charsize=2
oplot,faxis,cohphase[0:blocksize/2-1,1]-errphase[0:blocksize/2-1],linestyle=5
oplot,faxis,cohphase[0:blocksize/2-1,1]+errphase[0:blocksize/2-1],linestyle=5

device,/close
pg_initgraph

gp_sort,ID

filename='data/'+ID+'.sav'
save,/all,filename=filename

endif
return
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2008_12_19_1619_phase'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[2,2.6]
b=[5,9,10,17]
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(7,2)
trange[0,*]=[2.07,2.10]
trange[1,*]=[2.14,2.17]
trange[2,*]=[2.213,2.243]
trange[3,*]=[2.28,2.31]
trange[4,*]=[2.347,2.377]
trange[5,*]=[2.415,2.445]
trange[6,*]=[2.485,2.515]

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),7)
bpv[*,*,0]=bp
for i=1,6 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

c=dblarr(n_elements(reform(bpv[0,*,0])),7)
t_c=lindgen(n_elements(c(*,0)))-ceil(n_elements(c(*,0))/2.)+1
t_c=t_c*(timeax[2]-timeax[1])*1000;in ms
for i=0,6 do begin
pg_initgraph,/print
c[*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast)
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_'+pg_num2str(i)+'_ccf.eps'
plot,t_c,c[*,i],title=ID+': '+pg_num2str(i)+'_ccf',thick=3,charthick=3,charsize=2,$
     xtitle='Time delay (ms)',xstyle=1
device,/close
endfor

ccf_mean=dblarr(n_elements(c[*,0]))
ccf_err=dblarr(n_elements(c[*,0]))

for i=0,n_elements(ccf_mean)-1 do ccf_mean(i)=mean(c(i,*))
for i=0,n_elements(ccf_err)-1 do ccf_err(i)=stdev(c(i,*))
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_ccf-average.eps'
plot,t_c,ccf_mean,title=ID+': ccf-average',thick=4,charthick=3,charsize=2,$
     yrange=[min(ccf_mean-ccf_err),max(ccf_mean+ccf_err)],ystyle=1,xtitle='Time delay (ms)',$
     xstyle=1

oplot,t_c,(ccf_mean-ccf_err),linestyle=5,thick=4
oplot,t_c,(ccf_mean+ccf_err),linestyle=5,thick=4
device,/close


pg_initgraph

gp_sort,ID

;filename='data/'+ID+'.sav'
;save,ID,shot,channel1,trange,stft,timeax,freqax,bpv,b,c,filename=filename

if 1 then begin
print,'Calculating spectral functions of bandpowers...'



bpl=reform(bpv,2,7*n_elements(bp[0,*]))
timeax_new=timeax[0:7*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
;gp_resample,data_low,timeax_new,1.6
;gp_resample,data_high,timeax_new2,1.6


gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0

blocksize=n_elements(data_low)/7
cohphase=gp_cohphasef(data_low,data_high,blocksize,hann=0,meanapsd1=meanapsd1,meanapsd2=meanapsd2,meancpsd=meancpsd,errapsd1=errapsd1,errapsd2=errapsd2,errcpsd=errcpsd)
errphase=1/!PI/(1+cohphase[*,1]^2)*imaginary(meancpsd)/float(meancpsd)*$
	sqrt((Imaginary(errcpsd)/Imaginary(meancpsd))^2+(Float(errcpsd)/Float(meancpsd))^2) ;Gauss
errphase[0]=1e-10

f=findgen(floor(blocksize/2.)+1)
f=f/max(f)
fn=(1/(timeax_new[2]-timeax_new[1])/2.)
faxis=f*fn/1000

pg_initgraph,/print
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'phase-error.eps'
plot,faxis,cohphase[0:blocksize/2-1,1],ystyle=1,thick=4,charthick=3,charsize=2
oplot,faxis,cohphase[0:blocksize/2-1,1]-errphase[0:blocksize/2-1],linestyle=5
oplot,faxis,cohphase[0:blocksize/2-1,1]+errphase[0:blocksize/2-1],linestyle=5

device,/close
pg_initgraph

gp_sort,ID

endif
return
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2008_12_19_1601_phase'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[2,2.6]
b=[5,9,10,17]
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(7,2)
trange[0,*]=[2.07,2.10]
trange[1,*]=[2.14,2.17]
trange[2,*]=[2.213,2.243]
trange[3,*]=[2.28,2.31]
trange[4,*]=[2.347,2.377]
trange[5,*]=[2.415,2.445]
trange[6,*]=[2.485,2.515]

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),7)
bpv[*,*,0]=bp
for i=1,6 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

c=dblarr(n_elements(reform(bpv[0,*,0])),7)
t_c=lindgen(n_elements(c(*,0)))-ceil(n_elements(c(*,0))/2.)+1
t_c=t_c*(timeax[2]-timeax[1])*1000;in ms
for i=0,6 do begin
pg_initgraph,/print
c[*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast)
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_'+pg_num2str(i)+'_ccf.eps'
plot,t_c,c[*,i],title=ID+': '+pg_num2str(i)+'_ccf',thick=3,charthick=3,charsize=2,$
     xtitle='Time delay (ms)',xstyle=1
device,/close
endfor

ccf_mean=dblarr(n_elements(c[*,0]))
ccf_err=dblarr(n_elements(c[*,0]))

for i=0,n_elements(ccf_mean)-1 do ccf_mean(i)=mean(c(i,*))
for i=0,n_elements(ccf_err)-1 do ccf_err(i)=stdev(c(i,*))
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_ccf-average.eps'
plot,t_c,ccf_mean,title=ID+': ccf-average',thick=4,charthick=3,charsize=2,$
     yrange=[min(ccf_mean-ccf_err),max(ccf_mean+ccf_err)],ystyle=1,xtitle='Time delay (ms)',$
     xstyle=1

oplot,t_c,(ccf_mean-ccf_err),linestyle=5,thick=4
oplot,t_c,(ccf_mean+ccf_err),linestyle=5,thick=4
device,/close


pg_initgraph

gp_sort,ID

;filename='data/'+ID+'.sav'
;save,ID,shot,channel1,trange,stft,timeax,freqax,bpv,b,c,filename=filename

if 1 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,7*n_elements(bp[0,*]))
timeax_new=timeax[0:7*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
gp_resample,data_low,timeax_new,5.1
gp_resample,data_high,timeax_new2,5.1


gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0

blocksize=n_elements(data_low)/7
cohphase=gp_cohphasef(data_low,data_high,blocksize,hann=0,meanapsd1=meanapsd1,meanapsd2=meanapsd2,meancpsd=meancpsd,errapsd1=errapsd1,errapsd2=errapsd2,errcpsd=errcpsd)
errphase=1/!PI/(1+cohphase[*,1]^2)*imaginary(meancpsd)/float(meancpsd)*$
	sqrt((Imaginary(errcpsd)/Imaginary(meancpsd))^2+(Float(errcpsd)/Float(meancpsd))^2) ;Gauss
errphase[0]=1e-10

f=findgen(floor(blocksize/2.)+1)
f=f/max(f)
fn=(1/(timeax_new[2]-timeax_new[1])/2.)
faxis=f*fn/1000

pg_initgraph,/print
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'phase-error.eps'
plot,faxis,cohphase[0:blocksize/2-1,1],ystyle=1,thick=4,charthick=3,charsize=2
oplot,faxis,cohphase[0:blocksize/2-1,1]-errphase[0:blocksize/2-1],linestyle=5
oplot,faxis,cohphase[0:blocksize/2-1,1]+errphase[0:blocksize/2-1],linestyle=5

device,/close
pg_initgraph

gp_sort,ID

endif
return
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2008_12_19_1558_phase'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[2,2.6]
b=[5,9,10,17]
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(7,2)
trange[0,*]=[2.07,2.10]
trange[1,*]=[2.14,2.17]
trange[2,*]=[2.213,2.243]
trange[3,*]=[2.28,2.31]
trange[4,*]=[2.347,2.377]
trange[5,*]=[2.415,2.445]
trange[6,*]=[2.485,2.515]

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),7)
bpv[*,*,0]=bp
for i=1,6 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

c=dblarr(n_elements(reform(bpv[0,*,0])),7)
t_c=lindgen(n_elements(c(*,0)))-ceil(n_elements(c(*,0))/2.)+1
t_c=t_c*(timeax[2]-timeax[1])*1000;in ms
for i=0,6 do begin
pg_initgraph,/print
c[*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast)
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_'+pg_num2str(i)+'_ccf.eps'
plot,t_c,c[*,i],title=ID+': '+pg_num2str(i)+'_ccf',thick=3,charthick=3,charsize=2,$
     xtitle='Time delay (ms)',xstyle=1
device,/close
endfor

ccf_mean=dblarr(n_elements(c[*,0]))
ccf_err=dblarr(n_elements(c[*,0]))

for i=0,n_elements(ccf_mean)-1 do ccf_mean(i)=mean(c(i,*))
for i=0,n_elements(ccf_err)-1 do ccf_err(i)=stdev(c(i,*))
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_ccf-average.eps'
plot,t_c,ccf_mean,title=ID+': ccf-average',thick=4,charthick=3,charsize=2,$
     yrange=[min(ccf_mean-ccf_err),max(ccf_mean+ccf_err)],ystyle=1,xtitle='Time delay (ms)',$
     xstyle=1

oplot,t_c,(ccf_mean-ccf_err),linestyle=5,thick=4
oplot,t_c,(ccf_mean+ccf_err),linestyle=5,thick=4
device,/close


pg_initgraph

gp_sort,ID

;filename='data/'+ID+'.sav'
;save,ID,shot,channel1,trange,stft,timeax,freqax,bpv,b,c,filename=filename

if 1 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,7*n_elements(bp[0,*]))
timeax_new=timeax[0:7*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
gp_resample,data_low,timeax_new,2.1
gp_resample,data_high,timeax_new2,2.1


gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0

blocksize=n_elements(data_low)/7
cohphase=gp_cohphasef(data_low,data_high,blocksize,hann=0,meanapsd1=meanapsd1,meanapsd2=meanapsd2,meancpsd=meancpsd,errapsd1=errapsd1,errapsd2=errapsd2,errcpsd=errcpsd)
errphase=1/!PI/(1+cohphase[*,1]^2)*imaginary(meancpsd)/float(meancpsd)*$
	sqrt((Imaginary(errcpsd)/Imaginary(meancpsd))^2+(Float(errcpsd)/Float(meancpsd))^2) ;Gauss
errphase[0]=1e-10

f=findgen(floor(blocksize/2.)+1)
f=f/max(f)
fn=(1/(timeax_new[2]-timeax_new[1])/2.)
faxis=f*fn/1000

pg_initgraph,/print
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'phase-error.eps'
plot,faxis,cohphase[0:blocksize/2-1,1],ystyle=1,thick=4,charthick=3,charsize=2
oplot,faxis,cohphase[0:blocksize/2-1,1]-errphase[0:blocksize/2-1],linestyle=5
oplot,faxis,cohphase[0:blocksize/2-1,1]+errphase[0:blocksize/2-1],linestyle=5

device,/close
pg_initgraph

gp_sort,ID

endif

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2008_12_19_1555_phase'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[2,2.6]
b=[5,9,10,17]
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(7,2)
trange[0,*]=[2.07,2.10]
trange[1,*]=[2.14,2.17]
trange[2,*]=[2.213,2.243]
trange[3,*]=[2.28,2.31]
trange[4,*]=[2.347,2.377]
trange[5,*]=[2.415,2.445]
trange[6,*]=[2.485,2.515]

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),7)
bpv[*,*,0]=bp
for i=1,6 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

c=dblarr(n_elements(reform(bpv[0,*,0])),7)
t_c=lindgen(n_elements(c(*,0)))-ceil(n_elements(c(*,0))/2.)+1
t_c=t_c*(timeax[2]-timeax[1])*1000;in ms
for i=0,6 do begin
pg_initgraph,/print
c[*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast)
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_'+pg_num2str(i)+'_ccf.eps'
plot,t_c,c[*,i],title=ID+': '+pg_num2str(i)+'_ccf',thick=3,charthick=3,charsize=2,$
     xtitle='Time delay (ms)',xstyle=1
device,/close
endfor

ccf_mean=dblarr(n_elements(c[*,0]))
ccf_err=dblarr(n_elements(c[*,0]))

for i=0,n_elements(ccf_mean)-1 do ccf_mean(i)=mean(c(i,*))
for i=0,n_elements(ccf_err)-1 do ccf_err(i)=stdev(c(i,*))
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_ccf-average.eps'
plot,t_c,ccf_mean,title=ID+': ccf-average',thick=4,charthick=3,charsize=2,$
     yrange=[min(ccf_mean-ccf_err),max(ccf_mean+ccf_err)],ystyle=1,xtitle='Time delay (ms)',$
     xstyle=1

oplot,t_c,(ccf_mean-ccf_err),linestyle=5,thick=4
oplot,t_c,(ccf_mean+ccf_err),linestyle=5,thick=4
device,/close


pg_initgraph

gp_sort,ID

;filename='data/'+ID+'.sav'
;save,ID,shot,channel1,trange,stft,timeax,freqax,bpv,b,c,filename=filename

if 1 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,7*n_elements(bp[0,*]))
timeax_new=timeax[0:7*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
;gp_resample,data_low,timeax_new,5
;gp_resample,data_high,timeax_new2,5


gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0

blocksize=n_elements(data_low)/7
cohphase=gp_cohphasef(data_low,data_high,blocksize,hann=0,meanapsd1=meanapsd1,meanapsd2=meanapsd2,meancpsd=meancpsd,errapsd1=errapsd1,errapsd2=errapsd2,errcpsd=errcpsd)
errphase=1/!PI/(1+cohphase[*,1]^2)*imaginary(meancpsd)/float(meancpsd)*$
	sqrt((Imaginary(errcpsd)/Imaginary(meancpsd))^2+(Float(errcpsd)/Float(meancpsd))^2) ;Gauss
errphase[0]=1e-10

f=findgen(floor(blocksize/2.)+1)
f=f/max(f)
fn=(1/(timeax_new[2]-timeax_new[1])/2.)
faxis=f*fn/1000

pg_initgraph,/print
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'phase-error.eps'
plot,faxis,cohphase[0:blocksize/2-1,1],ystyle=1,thick=4,charthick=3,charsize=2
oplot,faxis,cohphase[0:blocksize/2-1,1]-errphase[0:blocksize/2-1],linestyle=5
oplot,faxis,cohphase[0:blocksize/2-1,1]+errphase[0:blocksize/2-1],linestyle=5

device,/close
pg_initgraph

gp_sort,ID

endif
return

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2008_12_19_1439_ccf_short_nonorm'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[2,2.6]
b=[5,9,10,17]
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(7,2)
trange[0,*]=[2.07,2.10]
trange[1,*]=[2.14,2.17]
trange[2,*]=[2.213,2.243]
trange[3,*]=[2.28,2.31]
trange[4,*]=[2.347,2.377]
trange[5,*]=[2.415,2.445]
trange[6,*]=[2.485,2.515]

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),7)
bpv[*,*,0]=bp
for i=1,6 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

c=dblarr(n_elements(reform(bpv[0,*,0])),7)
t_c=lindgen(n_elements(c(*,0)))-ceil(n_elements(c(*,0))/2.)+1
t_c=t_c*(timeax[2]-timeax[1])*1000;in ms
for i=0,6 do begin
pg_initgraph,/print
c[*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast)
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_'+pg_num2str(i)+'_ccf.eps'
plot,t_c,c[*,i],title=ID+': '+pg_num2str(i)+'_ccf',thick=3,charthick=3,charsize=2,$
     xtitle='Time delay (ms)',xstyle=1
device,/close
endfor

ccf_mean=dblarr(n_elements(c[*,0]))
ccf_err=dblarr(n_elements(c[*,0]))

for i=0,n_elements(ccf_mean)-1 do ccf_mean(i)=mean(c(i,*))
for i=0,n_elements(ccf_err)-1 do ccf_err(i)=stdev(c(i,*))
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_ccf-average.eps'
plot,t_c,ccf_mean,title=ID+': ccf-average',thick=4,charthick=3,charsize=2,$
     yrange=[min(ccf_mean-ccf_err),max(ccf_mean+ccf_err)],ystyle=1,xtitle='Time delay (ms)',$
     xstyle=1

oplot,t_c,(ccf_mean-ccf_err),linestyle=5,thick=4
oplot,t_c,(ccf_mean+ccf_err),linestyle=5,thick=4
device,/close


pg_initgraph

gp_sort,ID

;filename='data/'+ID+'.sav'
;save,ID,shot,channel1,trange,stft,timeax,freqax,bpv,b,c,filename=filename

if 1 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,7*n_elements(bp[0,*]))
timeax_new=timeax[0:7*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
gp_resample,data_low,timeax_new,5
gp_resample,data_high,timeax_new2,5


gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0

blocksize=n_elements(data_low)/7
cohphase=gp_cohphasef(data_low,data_high,blocksize,hann=0,meanapsd1=meanapsd1,meanapsd2=meanapsd2,meancpsd=meancpsd,errapsd1=errapsd1,errapsd2=errapsd2,errcpsd=errcpsd)
errphase=1/!PI/(1+cohphase[*,1]^2)*imaginary(meancpsd)/float(meancpsd)*$
	sqrt((Imaginary(errcpsd)/Imaginary(meancpsd))^2+(Float(errcpsd)/Float(meancpsd))^2) ;Gauss
errphase[0]=1e-10

f=findgen(floor(blocksize/2.)+1)
f=f/max(f)
fn=(1/(timeax_new[2]-timeax_new[1])/2.)
faxis=f*fn/1000

pg_initgraph,/print
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'phase-error.eps'
plot,faxis,cohphase[0:blocksize/2-1,1],ystyle=1,thick=4,charthick=3,charsize=2
oplot,faxis,cohphase[0:blocksize/2-1,1]-errphase[0:blocksize/2-1],linestyle=5
oplot,faxis,cohphase[0:blocksize/2-1,1]+errphase[0:blocksize/2-1],linestyle=5

device,/close
pg_initgraph

gp_sort,ID

endif
return

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2008_12_19_1136_ccf_short_nonorm'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[2,2.6]
b=[5,9,10,17]
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(7,2)
trange[0,*]=[2.07,2.10]
trange[1,*]=[2.14,2.17]
trange[2,*]=[2.213,2.243]
trange[3,*]=[2.28,2.31]
trange[4,*]=[2.347,2.377]
trange[5,*]=[2.415,2.445]
trange[6,*]=[2.485,2.515]

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),7)
bpv[*,*,0]=bp
for i=1,6 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

c=dblarr(n_elements(reform(bpv[0,*,0])),7)
t_c=lindgen(n_elements(c(*,0)))-ceil(n_elements(c(*,0))/2.)+1
t_c=t_c*(timeax[2]-timeax[1])*1000;in ms
for i=0,6 do begin
pg_initgraph,/print
c[*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast)
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_'+pg_num2str(i)+'_ccf.eps'
plot,t_c,c[*,i],title=ID+': '+pg_num2str(i)+'_ccf',thick=3,charthick=3,charsize=2,$
     xtitle='Time delay (ms)',xstyle=1
device,/close
endfor

ccf_mean=dblarr(n_elements(c[*,0]))
ccf_err=dblarr(n_elements(c[*,0]))

for i=0,n_elements(ccf_mean)-1 do ccf_mean(i)=mean(c(i,*))
for i=0,n_elements(ccf_err)-1 do ccf_err(i)=stdev(c(i,*))
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_ccf-average.eps'
plot,t_c,ccf_mean,title=ID+': ccf-average',thick=4,charthick=3,charsize=2,$
     yrange=[min(ccf_mean-ccf_err),max(ccf_mean+ccf_err)],ystyle=1,xtitle='Time delay (ms)',$
     xstyle=1

oplot,t_c,(ccf_mean-ccf_err),linestyle=5,thick=4
oplot,t_c,(ccf_mean+ccf_err),linestyle=5,thick=4
device,/close


pg_initgraph

gp_sort,ID

;filename='data/'+ID+'.sav'
;save,ID,shot,channel1,trange,stft,timeax,freqax,bpv,b,c,filename=filename

if 1 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,7*n_elements(bp[0,*]))
timeax_new=timeax[0:7*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
gp_resample,data_low,timeax_new,3
gp_resample,data_high,timeax_new2,3


gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0
endif
return

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2008_12_19_1110_ccf_short'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[2,2.6]
b=[5,9,10,17]
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(7,2)
trange[0,*]=[2.07,2.10]
trange[1,*]=[2.14,2.17]
trange[2,*]=[2.213,2.243]
trange[3,*]=[2.28,2.31]
trange[4,*]=[2.347,2.377]
trange[5,*]=[2.415,2.445]
trange[6,*]=[2.485,2.515]

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),7)
bpv[*,*,0]=bp
for i=1,6 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

c=dblarr(n_elements(reform(bpv[0,*,0])),7)
t_c=lindgen(n_elements(c(*,0)))-ceil(n_elements(c(*,0))/2.)+1
t_c=t_c*(timeax[2]-timeax[1])*1000;in ms
for i=0,6 do begin
pg_initgraph,/print
c[*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast,/normalize)
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_'+pg_num2str(i)+'_ccf.eps'
plot,t_c,c[*,i],title=ID+': '+pg_num2str(i)+'_ccf',thick=3,charthick=3,charsize=2,$
     xtitle='Time delay (ms)',xstyle=1
device,/close
endfor

ccf_mean=dblarr(n_elements(c[*,0]))
ccf_err=dblarr(n_elements(c[*,0]))

for i=0,n_elements(ccf_mean)-1 do ccf_mean(i)=mean(c(i,*))
for i=0,n_elements(ccf_err)-1 do ccf_err(i)=stdev(c(i,*))
device,filename='/home/geri/idl/nicolet/data/output/'+ID+'_ccf-average.eps'
plot,t_c,ccf_mean,title=ID+': ccf-average',thick=4,charthick=3,charsize=2,$
     yrange=[min(ccf_mean-ccf_err),max(ccf_mean+ccf_err)],ystyle=1,xtitle='Time delay (ms)',$
     xstyle=1

oplot,t_c,(ccf_mean-ccf_err),linestyle=5,thick=4
oplot,t_c,(ccf_mean+ccf_err),linestyle=5,thick=4
device,/close


pg_initgraph

gp_sort,ID

;filename='data/'+ID+'.sav'
;save,ID,shot,channel1,trange,stft,timeax,freqax,bpv,b,c,filename=filename

if 1 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,7*n_elements(bp[0,*]))
timeax_new=timeax[0:7*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
gp_resample,data_low,timeax_new,3
gp_resample,data_high,timeax_new2,3


gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0
endif
return

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2008_12_19_1010_ccf_short'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[2,2.6]
b=[5,9,10,17]
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(7,2)
trange[0,*]=[2.07,2.10]
trange[1,*]=[2.14,2.17]
trange[2,*]=[2.213,2.243]
trange[3,*]=[2.28,2.31]
trange[4,*]=[2.347,2.377]
trange[5,*]=[2.415,2.445]
trange[6,*]=[2.485,2.515]

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),7)
bpv[*,*,0]=bp
for i=1,6 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

c=dblarr(3,n_elements(reform(bpv[0,*,0])),7)
for i=0,6 do begin
pg_initgraph,/print
c[0,*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/normalize)
c[1,*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast,/normalize)
c[2,*,i]=c[0,*,i]-c[1,*,i]
device,filename='/home/geri/idl/nicolet/data/output/'+pg_num2str(i)+'_ccf-fft.eps'
plot,c[1,*,i],title=ID+'_'+pg_num2str(i)+'_ccf-fft',thick=3,charthick=3,charsize=3
device,/close
endfor

ccf_mean=dblarr(n_elements(c[0,*,0]))
ccf_err=dblarr(n_elements(c[0,*,0]))

for i=0,n_elements(ccf_mean)-1 do ccf_mean(i)=mean(c(0,i,*))
for i=0,n_elements(ccf_err)-1 do ccf_err(i)=stdev(c(0,i,*))
device,filename='/home/geri/idl/nicolet/data/output/0_ccf-average.eps'
plot,ccf_mean,title=ID+'_ccf-average',thick=4,charthick=3,charsize=2,$
     yrange=[min(ccf_mean-ccf_err),max(ccf_mean+ccf_err)],ystyle=1

print,min(ccf_mean-ccf_err)
print,max(ccf_mean+ccf_err)
oplot,(ccf_mean-ccf_err),linestyle=5,thick=4
oplot,(ccf_mean+ccf_err),linestyle=5,thick=4
device,/close


pg_initgraph

gp_sort,ID

filename='data/'+ID+'.sav'
save,ID,shot,channel1,trange,stft,timeax,freqax,bpv,b,c,filename=filename

if 1 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,7*n_elements(bp[0,*]))
timeax_new=timeax[0:7*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
gp_resample,data_low,timeax_new,3
gp_resample,data_high,timeax_new2,3


gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0
endif
return

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2008_12_18_1500_ccf_boxcar'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[2,2.6]
b=[5,9,10,17]
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=572,freqres=572,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID,windowname='Rectangle',step=32)
timeax2=timeax
stft2=stft

trange=dblarr(7,2)
trange[0,*]=[2.07,2.10]
trange[1,*]=[2.14,2.17]
trange[2,*]=[2.213,2.243]
trange[3,*]=[2.28,2.31]
trange[4,*]=[2.347,2.377]
trange[5,*]=[2.415,2.445]
trange[6,*]=[2.485,2.515]

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),7)
bpv[*,*,0]=bp
for i=1,6 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

c=dblarr(3,n_elements(reform(bpv[0,*,0])),7)
for i=0,6 do begin
pg_initgraph,/print
c[0,*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/normalize)
;device,filename='/home/geri/idl/nicolet/data/output/'+pg_num2str(i)+'_ccf-sum.eps'
;plot,c[0,*,i],title=ID+'_'+pg_num2str(i)+'_ccf-sum',thick=3,charthick=3,charsize=3
;device,/close
c[1,*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast,/normalize)
c[2,*,i]=c[0,*,i]-c[1,*,i]
device,filename='/home/geri/idl/nicolet/data/output/'+pg_num2str(i)+'_ccf-fft.eps'
plot,c[1,*,i],title=ID+'_'+pg_num2str(i)+'_ccf-fft',thick=3,charthick=3,charsize=3
device,/close
;device,filename='/home/geri/idl/nicolet/data/output/'+pg_num2str(i)+'_ccf-dif.eps'
;plot,c[2,*,i],title=ID+'_'+pg_num2str(i)+'_ccf-dif',thick=3,charthick=3,charsize=3
;device,/close
endfor

z=dblarr(n_elements(c[0,*,0]))
for i=0,n_elements(z)-1 do z(i)=mean(c(0,i,*))
device,filename='/home/geri/idl/nicolet/data/output/0_ccf-average.eps'
plot,z,title=ID+'_ccf-average',thick=3,charthick=3,charsize=2
device,/close
;for i=0,n_elements(z)-1 do z(i)=mean(c(2,i,*))
;device,filename='/home/geri/idl/nicolet/data/output/0_ccf-average_dif.eps'
;plot,z,title=ID+'_'+pg_num2str(i)+'_ccf-average_dif',thick=3,charthick=3,charsize=2
;device,/close


pg_initgraph

gp_sort,ID

filename='data/'+ID+'.sav'
save,ID,shot,channel1,trange,stft,timeax,freqax,bpv,b,c,filename=filename

if 1 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,7*n_elements(bp[0,*]))
timeax_new=timeax[0:7*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
;gp_resample,data_low,timeax_new,3
;gp_resample,data_high,timeax_new2,3


gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0
endif
return

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2008_12_18_1450_ccf_gauss'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[2,2.6]
b=[5,9,10,17]
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(7,2)
trange[0,*]=[2.07,2.10]
trange[1,*]=[2.14,2.17]
trange[2,*]=[2.213,2.243]
trange[3,*]=[2.28,2.31]
trange[4,*]=[2.347,2.377]
trange[5,*]=[2.415,2.445]
trange[6,*]=[2.485,2.515]

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),7)
bpv[*,*,0]=bp
for i=1,6 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

c=dblarr(3,n_elements(reform(bpv[0,*,0])),7)
for i=0,6 do begin
pg_initgraph,/print
c[0,*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/normalize)
;device,filename='/home/geri/idl/nicolet/data/output/'+pg_num2str(i)+'_ccf-sum.eps'
;plot,c[0,*,i],title=ID+'_'+pg_num2str(i)+'_ccf-sum',thick=3,charthick=3,charsize=3
;device,/close
c[1,*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast,/normalize)
c[2,*,i]=c[0,*,i]-c[1,*,i]
device,filename='/home/geri/idl/nicolet/data/output/'+pg_num2str(i)+'_ccf-fft.eps'
plot,c[1,*,i],title=ID+'_'+pg_num2str(i)+'_ccf-fft',thick=3,charthick=3,charsize=3
device,/close
;device,filename='/home/geri/idl/nicolet/data/output/'+pg_num2str(i)+'_ccf-dif.eps'
;plot,c[2,*,i],title=ID+'_'+pg_num2str(i)+'_ccf-dif',thick=3,charthick=3,charsize=3
;device,/close
endfor

z=dblarr(n_elements(c[0,*,0]))
for i=0,n_elements(z)-1 do z(i)=mean(c(0,i,*))
device,filename='/home/geri/idl/nicolet/data/output/0_ccf-average.eps'
plot,z,title=ID+'_ccf-average',thick=3,charthick=3,charsize=2
device,/close
;for i=0,n_elements(z)-1 do z(i)=mean(c(2,i,*))
;device,filename='/home/geri/idl/nicolet/data/output/0_ccf-average_dif.eps'
;plot,z,title=ID+'_'+pg_num2str(i)+'_ccf-average_dif',thick=3,charthick=3,charsize=2
;device,/close


pg_initgraph

gp_sort,ID

filename='data/'+ID+'.sav'
save,ID,shot,channel1,trange,stft,timeax,freqax,bpv,b,c,filename=filename

if 1 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,7*n_elements(bp[0,*]))
timeax_new=timeax[0:7*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
;gp_resample,data_low,timeax_new,3
;gp_resample,data_high,timeax_new2,3


gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0
endif
return

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2008_12_18_1355_ccf_boxcar'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[2,2.6]
b=[5,9,10,17]
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID,windowname='Rectangle',step=32)
timeax2=timeax
stft2=stft

trange=dblarr(7,2)
trange[0,*]=[2.07,2.10]
trange[1,*]=[2.14,2.17]
trange[2,*]=[2.213,2.243]
trange[3,*]=[2.28,2.31]
trange[4,*]=[2.347,2.377]
trange[5,*]=[2.415,2.445]
trange[6,*]=[2.485,2.515]

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),7)
bpv[*,*,0]=bp
for i=1,6 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

c=dblarr(3,n_elements(reform(bpv[0,*,0])),7)
for i=0,6 do begin
pg_initgraph,/print
c[0,*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/normalize)
;device,filename='/home/geri/idl/nicolet/data/output/'+pg_num2str(i)+'_ccf-sum.eps'
;plot,c[0,*,i],title=ID+'_'+pg_num2str(i)+'_ccf-sum',thick=3,charthick=3,charsize=3
;device,/close
c[1,*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast,/normalize)
c[2,*,i]=c[0,*,i]-c[1,*,i]
device,filename='/home/geri/idl/nicolet/data/output/'+pg_num2str(i)+'_ccf-fft.eps'
plot,c[1,*,i],title=ID+'_'+pg_num2str(i)+'_ccf-fft',thick=3,charthick=3,charsize=3
device,/close
;device,filename='/home/geri/idl/nicolet/data/output/'+pg_num2str(i)+'_ccf-dif.eps'
;plot,c[2,*,i],title=ID+'_'+pg_num2str(i)+'_ccf-dif',thick=3,charthick=3,charsize=3
;device,/close
endfor

z=dblarr(n_elements(c[0,*,0]))
for i=0,n_elements(z)-1 do z(i)=mean(c(0,i,*))
device,filename='/home/geri/idl/nicolet/data/output/0_ccf-average.eps'
plot,z,title=ID+'_ccf-average',thick=3,charthick=3,charsize=2
device,/close
;for i=0,n_elements(z)-1 do z(i)=mean(c(2,i,*))
;device,filename='/home/geri/idl/nicolet/data/output/0_ccf-average_dif.eps'
;plot,z,title=ID+'_'+pg_num2str(i)+'_ccf-average_dif',thick=3,charthick=3,charsize=2
;device,/close


pg_initgraph

gp_sort,ID

filename='data/'+ID+'.sav'
save,ID,shot,channel1,trange,stft,timeax,freqax,bpv,b,c,filename=filename

if 1 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,7*n_elements(bp[0,*]))
timeax_new=timeax[0:7*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
;gp_resample,data_low,timeax_new,3
;gp_resample,data_high,timeax_new2,3


gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0
endif
return

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2008_12_18_1141_ccf_compare'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[2,2.6]
b=[5,9,10,17]
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(7,2)
trange[0,*]=[2.05,2.10]
trange[1,*]=[2.12,2.17]
trange[2,*]=[2.193,2.243]
trange[3,*]=[2.26,2.31]
trange[4,*]=[2.327,2.377]
trange[5,*]=[2.395,2.445]
trange[6,*]=[2.465,2.515]

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),7)
bpv[*,*,0]=bp
for i=1,6 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

c=dblarr(3,n_elements(reform(bpv[0,*,0])),7)
for i=0,6 do begin
pg_initgraph,/print
c[0,*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/normalize)
device,filename='/home/geri/idl/nicolet/data/output/'+pg_num2str(i)+'_ccf-sum.eps'
plot,c[0,*,i],title=ID+'_'+pg_num2str(i)+'_ccf-sum',thick=3,charthick=3,charsize=3
device,/close
c[1,*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast,/normalize)
c[2,*,i]=c[0,*,i]-c[1,*,i]
device,filename='/home/geri/idl/nicolet/data/output/'+pg_num2str(i)+'_ccf-fft.eps'
plot,c[1,*,i],title=ID+'_'+pg_num2str(i)+'_ccf-fft',thick=3,charthick=3,charsize=3
device,/close
device,filename='/home/geri/idl/nicolet/data/output/'+pg_num2str(i)+'_ccf-dif.eps'
plot,c[2,*,i],title=ID+'_'+pg_num2str(i)+'_ccf-dif',thick=3,charthick=3,charsize=3
device,/close
endfor

z=dblarr(n_elements(c[0,*,0]))
for i=0,n_elements(z)-1 do z(i)=mean(c(0,i,*))
device,filename='/home/geri/idl/nicolet/data/output/0_ccf-average.eps'
plot,z,title=ID+'_'+pg_num2str(i)+'_ccf-average',thick=3,charthick=3,charsize=2
device,/close
for i=0,n_elements(z)-1 do z(i)=mean(c(2,i,*))
device,filename='/home/geri/idl/nicolet/data/output/0_ccf-average_dif.eps'
plot,z,title=ID+'_ccf-average_dif',thick=3,charthick=3,charsize=2
device,/close


pg_initgraph

gp_sort,ID

filename='data/'+ID+'.sav'
save,ID,shot,channel1,trange,stft,timeax,freqax,bpv,b,c,filename=filename

if 1 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,7*n_elements(bp[0,*]))
timeax_new=timeax[0:7*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
gp_resample,data_low,timeax_new,3
gp_resample,data_high,timeax_new2,3


gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0
endif
return

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2008_12_17_1602_ccf_compare'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[2,2.6]
b=[5,9,10,17]
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(7,2)
trange[0,*]=[2.07,2.10]
trange[1,*]=[2.14,2.17]
trange[2,*]=[2.213,2.243]
trange[3,*]=[2.28,2.31]
trange[4,*]=[2.347,2.377]
trange[5,*]=[2.415,2.445]
trange[6,*]=[2.485,2.515]

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),7)
bpv[*,*,0]=bp
for i=1,6 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

c=dblarr(3,n_elements(reform(bpv[0,*,0])),7)
for i=0,6 do begin
pg_initgraph,/print
c[0,*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/normalize)
device,filename='/home/geri/idl/nicolet/data/output/'+pg_num2str(i)+'_ccf-sum.eps'
plot,c[0,*,i],title=ID+'_'+pg_num2str(i)+'_ccf-sum',thick=3,charthick=3,charsize=3
device,/close
c[1,*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast,/normalize)
c[2,*,i]=c[0,*,i]-c[1,*,i]
device,filename='/home/geri/idl/nicolet/data/output/'+pg_num2str(i)+'_ccf-fft.eps'
plot,c[1,*,i],title=ID+'_'+pg_num2str(i)+'_ccf-fft',thick=3,charthick=3,charsize=3
device,/close
device,filename='/home/geri/idl/nicolet/data/output/'+pg_num2str(i)+'_ccf-dif.eps'
plot,c[2,*,i],title=ID+'_'+pg_num2str(i)+'_ccf-dif',thick=3,charthick=3,charsize=3
device,/close
endfor

z=dblarr(n_elements(c[0,*,0]))
for i=0,n_elements(z)-1 do z(i)=mean(c(0,i,*))
device,filename='/home/geri/idl/nicolet/data/output/0_ccf-average.eps'
plot,z,title=ID+'_'+pg_num2str(i)+'_ccf-average',thick=3,charthick=3,charsize=2
device,/close
for i=0,n_elements(z)-1 do z(i)=mean(c(2,i,*))
device,filename='/home/geri/idl/nicolet/data/output/0_ccf-average_dif.eps'
plot,z,title=ID+'_'+pg_num2str(i)+'_ccf-average_dif',thick=3,charthick=3,charsize=2
device,/close


pg_initgraph


gp_sort,ID

if 0 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,7*n_elements(bp[0,*]))
timeax_new=timeax[0:7*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
gp_resample,data_low,timeax_new,3
gp_resample,data_high,timeax_new2,3


gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0
endif
return

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2008_12_17_1121_ccf_compare'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[2,2.6]
b=[5,9,10,17]
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(7,2)
trange[0,*]=[2.07,2.10]
trange[1,*]=[2.14,2.17]
trange[2,*]=[2.213,2.243]
trange[3,*]=[2.28,2.31]
trange[4,*]=[2.347,2.377]
trange[5,*]=[2.415,2.445]
trange[6,*]=[2.485,2.515]

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),7)
bpv[*,*,0]=bp
for i=1,6 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor



c=dblarr(3,n_elements(reform(bpv[0,*,0])),7)
for i=0,6 do begin
pg_initgraph,/print
c[0,*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]))
device,filename='/home/geri/idl/nicolet/data/output/'+pg_num2str(i)+'_ccf-sum.eps'
plot,c[0,*,i],title=ID+'_'+pg_num2str(i)+'_ccf-sum',thick=3,charthick=3,charsize=3
device,/close
c[1,*,i]=pg_ccorr(reform(bpv[0,*,i]),reform(bpv[1,*,i]),/fast)
c[2,*,i]=c[0,*,i]-c[1,*,i]
device,filename='/home/geri/idl/nicolet/data/output/'+pg_num2str(i)+'_ccf-fft.eps'
plot,c[1,*,i],title=ID+'_'+pg_num2str(i)+'_ccf-fft',thick=3,charthick=3,charsize=3
device,/close
device,filename='/home/geri/idl/nicolet/data/output/'+pg_num2str(i)+'_ccf-dif.eps'
plot,c[2,*,i],title=ID+'_'+pg_num2str(i)+'_ccf-dif',thick=3,charthick=3,charsize=3
device,/close
endfor
filename='data/'+ID+'.sav'
save,ID,shot,channel1,trange,stft,timeax,freqax,bpv,b,c,filename=filename


pg_initgraph

gp_sort,ID

if 0 then begin
print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,7*n_elements(bp[0,*]))
timeax_new=timeax[0:7*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
gp_resample,data_low,timeax_new,3
gp_resample,data_high,timeax_new2,3


gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0
endif
return

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************


ID='2008_12_10_1742_average_short'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[2,2.6]
b=[5,9,10,17]
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(7,2)
trange[0,*]=[2.07,2.10]
trange[1,*]=[2.14,2.17]
trange[2,*]=[2.213,2.243]
trange[3,*]=[2.28,2.31]
trange[4,*]=[2.347,2.377]
trange[5,*]=[2.415,2.445]
trange[6,*]=[2.485,2.515]

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),7)
bpv[*,*,0]=bp
for i=1,6 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

gp_sort,ID

print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,7*n_elements(bp[0,*]))
timeax_new=timeax[0:7*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
gp_resample,data_low,timeax_new,3
gp_resample,data_high,timeax_new2,3


if 1 then begin
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0
endif
return

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************


ID='2008_12_10_1552_average_short'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[2,2.6]
b=[5,9,10,17]
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(7,2)
trange[0,*]=[2.07,2.10]
trange[1,*]=[2.14,2.17]
trange[2,*]=[2.213,2.243]
trange[3,*]=[2.28,2.31]
trange[4,*]=[2.347,2.377]
trange[5,*]=[2.415,2.445]
trange[6,*]=[2.485,2.515]

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),7)
bpv[*,*,0]=bp
for i=1,6 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

gp_sort,ID

print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,7*n_elements(bp[0,*]))
timeax_new=timeax[0:7*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
gp_resample,data_low,timeax_new,10
gp_resample,data_high,timeax_new2,10


if 1 then begin
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0
endif
return

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************


ID='2008_12_10_1545_average'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[2,2.6]
b=[5,9,10,17]
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(7,2)
trange[0,*]=[2.05,2.10]
trange[1,*]=[2.12,2.17]
trange[2,*]=[2.193,2.243]
trange[3,*]=[2.26,2.31]
trange[4,*]=[2.327,2.377]
trange[5,*]=[2.395,2.445]
trange[6,*]=[2.465,2.515]

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),7)
bpv[*,*,0]=bp
for i=1,6 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

gp_sort,ID

print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,7*n_elements(bp[0,*]))
timeax_new=timeax[0:7*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
gp_resample,data_low,timeax_new,10
gp_resample,data_high,timeax_new2,10


if 1 then begin
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0
endif
return

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************


ID='2008_12_10_1536_average'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[2,2.6]
b=[5,9,10,17]
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(7,2)
trange[0,*]=[2.05,2.10]
trange[1,*]=[2.12,2.17]
trange[2,*]=[2.19,2.24]
trange[3,*]=[2.26,2.31]
trange[4,*]=[2.325,2.375]
trange[5,*]=[2.395,2.445]
trange[6,*]=[2.46,2.51]

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),7)
bpv[*,*,0]=bp
for i=1,6 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

gp_sort,ID

print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,7*n_elements(bp[0,*]))
timeax_new=timeax[0:7*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
gp_resample,data_low,timeax_new,2
gp_resample,data_high,timeax_new2,2


if 1 then begin
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0
endif
return

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

ID='2008_12_10_1325_average'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[2,2.6]
b=[5,9,10,17]
print,'Calculating spectrogram...'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(7,2)
trange[0,*]=[2.05,2.10]
trange[1,*]=[2.12,2.17]
trange[2,*]=[2.19,2.24]
trange[3,*]=[2.26,2.31]
trange[4,*]=[2.325,2.375]
trange[5,*]=[2.395,2.445]
trange[6,*]=[2.46,2.51]

print,'Calculating and printing bandpowers...'
trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(2,n_elements(bp[0,*]),7)
bpv[*,*,0]=bp
for i=1,6 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpt,timeax=timeax2,freqax=freqax,trange=trange2
bpv[*,*,i]=bpt
endfor

gp_sort,ID

print,'Calculating spectral functions of bandpowers...'
bpl=reform(bpv,2,7*n_elements(bp[0,*]))
timeax_new=timeax[0:7*n_elements(bp[0,*])-1]+10

data_low=bpl[0,*]
data_high=bpl[1,*]
timeax_new2=timeax_new
gp_resample,data_low,timeax_new,10
gp_resample,data_high,timeax_new2,10


if 1 then begin
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),ID=ID,data1=data_low,data2=data_high,timeax1=timeax_new,timeax2=timeax_new2,blocksize=n_elements(data_low)/7,hann=0
gp_analyse,shot,'20975_J53_AVRG_BP_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'20975_J53_AVRG_BP_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),ID=ID,data1=data_high,data2=data_low,timeax1=timeax_new2,timeax2=timeax_new,blocksize=n_elements(data_low)/7,hann=0
endif
return

;*****************************************************************************
;*****************************************************************************
;*****************************************************************************


ID='2008_12_10_20975_B_SPE_128'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
times=[2.0387,2.11,2.1833,2.2523,2.32,2.3868,2.456,2.5235,$
        2.595,2.6565,2.7335,2.8756,2.948,3.019,$
        3.0893,3.1545,3.2174,3.2832]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
print,trange
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
endfor
gp_sort,ID
return

ID='2008_12_10_1000_average'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[2,2.6]
b=[5,9,10,17]
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
timeax2=timeax
stft2=stft

trange=dblarr(5,2)
trange[0,*]=[2.12,2.17]
trange[1,*]=[2.19,2.24]
trange[2,*]=[2.325,2.375]
trange[3,*]=[2.395,2.445]
trange[4,*]=[2.46,2.51]

trange2=trange[0,*]
pg_anal2,stft2,b,plot=3,/print,bp=bp,timeax=timeax2,freqax=freqax,trange=trange2
bpv=dblarr(5,2,n_elements(bp[0,*]))
bpv[0,*,*]=bp
for i=1,4 do begin
timeax2=timeax
stft2=stft
trange2=trange[i,*]
pg_anal2,stft2,b,plot=3,/print,bp=bpv[i,*,*],timeax=timeax2,freqax=freqax,trange=trange2
endfor
gp_sort,ID
return

ID='2008_12_09_1758_20975_A_spectrograms'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[3.78,4.536]
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=30,ID=ID)
gp_sort,ID
filename='data/'+ID+'.sav'
save,ID,shot,channel1,trange,stft,timeax,freqax,filename=filename
return

ID='2008_12_09_1723_20975_B_spectrograms3'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[2,3.313]
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=20,ID=ID)
gp_sort,ID
filename='data/'+ID+'.sav'
save,ID,shot,channel1,trange,stft,timeax,freqax,filename=filename
return

ID='2008_12_09_1723_20975_B_spectrograms2'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[2,3.313]
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=30,ID=ID)
gp_sort,ID
filename='data/'+ID+'.sav'
save,ID,shot,channel1,trange,stft,timeax,freqax,filename=filename
return

ID='2008_12_09_1723_20975_B_spectrograms'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[2,3.313]
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=50,ID=ID)
gp_sort,ID
filename='data/'+ID+'.sav'
save,ID,shot,channel1,trange,stft,timeax,freqax,filename=filename
return

ID='2008_12_09_1641_filter1_SPE_long'
print,ID
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=50,ID=ID)
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000_filtered_1-60'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=50,ID=ID)
gp_sort,ID

ID='2008_12_09_1641_filter1_SCA_long'
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.1,/print,/pad,trange=trange,ID=ID)
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000_filtered_1-60'
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.1,/print,/pad,trange=trange,ID=ID)
gp_sort,ID
return

ID='2008_12_09_1253_filter2_1024'
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
channel2='General/_AUG_SXR_I53_time_2.5000-2.9000_filtered_1-60'
trange=[2.5,2.54]
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID,blocksize=1024
return

ID='2008_12_09_1362_filter2_SPE'
print,ID
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
trange=[2.5,2.54]
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=50,ID=ID)
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000_filtered_1-60'
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=50,ID=ID)
gp_sort,ID
return

ID='2008_12_09_1322_filter2_SCA'
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
trange=[2.501,2.54]
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.1,/print,/pad,trange=trange,ID=ID)
gp_sort,ID
return
;ID='2008_12_09_1322_filter2_SCA'
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000_filtered_1-60'
trange=[2.501,2.54]
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.1,/print,/pad,trange=trange,ID=ID)
gp_sort,ID
return

ID='2008_12_09_1253_filter1'
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
channel2='General/_AUG_SXR_I53_time_2.5000-2.9000_filtered_1-60'
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID

ID='2008_12_09_1253_filter2'
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
channel2='General/_AUG_SXR_I53_time_2.5000-2.9000_filtered_1-60'
trange=[2.5,2.54]
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID
return



ID='2008_12_04_0601'
print,ID
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
channel2='AUG_mirnov/B31-14'
trange=[2.5,2.54]
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=18,dscale=0.01,plot=1,opt=0.15,/print,phaselevel=5,trange=trange)
gp_sort,ID
return

ID='2008_12_04_0600'
print,ID
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
channel2='AUG_mirnov/B31-14'
trange=[2.5,2.54]
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=3,dscale=0.01,plot=1,opt=0.15,/print,phaselevel=5,trange=trange)
gp_sort,ID
return

ID='2008_12_04_0550'
print,ID
shot=23068
channel1='AUG_mirnov/B31-14'
trange=[2.5,2.54]
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=50)
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=50)
gp_sort,ID
return

ID='2008_12_04_0505'
print,ID
shot=22157
channel1='General/_AUG_SXR_I53_time_4.0000-5.0000'
channel2='AUG_mirnov/B31-02'
trange=[4.49,4.5]
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=3,dscale=0.01,plot=1,opt=0.15,/print,phaselevel=5,trange=trange)
gp_sort,ID
return

ID='2008_12_04_0500'
print,ID
shot=22157
channel1='General/_AUG_SXR_I53_time_4.0000-5.0000'
channel2='AUG_mirnov/B31-02'
trange=[4.49,4.5]
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=18,dscale=0.01,plot=1,opt=0.15,/print,phaselevel=5,trange=trange)
gp_sort,ID
return

ID='2008_12_04_0430'
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
b=[7,13,15,20]
trange=[2.504,2.516]
stft=pg_spectrogram(shot,channel1,windowsize=200,masksize=1000,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=200,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0029,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return

ID='2008_12_04_0427'
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
b=[7,13,15,20,50,55,100,105]
trange=[2.504,2.516]
stft=pg_spectrogram(shot,channel1,windowsize=2000,masksize=10000,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=200,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0029,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return

ID='2008_12_02_1349_22375_SCA'
shot=22375
channel1='General/_AUG_SXR_I53_time_4.2000-5.2000'
trange=[4.49,4.54]
cwt=pg_scalogram([shot],[channel1],order=12,dscale=0.01,plot=1,opt=0.1,/print,/pad,trange=trange)
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.1,/print,/pad,trange=trange)
cwt=pg_scalogram([shot],[channel1],order=36,dscale=0.01,plot=1,opt=0.1,/print,/pad,trange=trange)
gp_sort,ID
return


ID='2008_12_02_1342_22375_SPE'
shot=22375
channel1='General/_AUG_SXR_I53_time_4.2000-5.2000'
trange=[4.49,4.54]
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
gp_sort,ID
return

ID='2008_12_02_1340_22375_SPE'
shot=22375
channel1='General/_AUG_SXR_I53_time_4.2000-5.2000'
trange=[4.49,4.54]
stft=pg_spectrogram(shot,channel1,windowsize=32,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
gp_sort,ID
return

ID='2008_12_02_1327_22375_SPE'
shot=22375
channel1='General/_AUG_SXR_I53_time_4.2000-5.2000'
trange=[4.50,4.55]
stft=pg_spectrogram(shot,channel1,windowsize=32,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
gp_sort,ID
return

ID='2008_12_02_1326_22375_SPE'
shot=22375
channel1='General/_AUG_SXR_I53_time_4.2000-5.2000'
trange=[4.50,4.55]
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
gp_sort,ID
return

ID='2008_12_02_1324_22375_SPE'
shot=22375
channel1='General/_AUG_SXR_I53_time_4.2000-5.2000'
trange=[4.51,4.54]
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
gp_sort,ID
return


ID='2008_12_01_1338_full4'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.085,4.134]
b=[4,7,8,11]
window=3200
mask=10000
stft=pg_spectrogram(shot,channel1,windowsize=window,masksize=mask,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax,ID=ID)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=window,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.09,nsegment=1,trange=trange,shotnumber=shot,channel1=channel1,ID=ID,dstep=100
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=78800
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),trange=trange,ID=ID,data1=bp[1,*],data2=bp[0,*],timeax1=timeax,timeax2=timeax,blocksize=78800
gp_sort,ID
return

ID='2008_12_01_1338_full3'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.085,4.134]
b=[4,7,8,11]
window=3200
mask=10000
stft=pg_spectrogram(shot,channel1,windowsize=window,masksize=mask,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax,ID=ID)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=window,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.1,nsegment=1,trange=trange,shotnumber=shot,channel1=channel1,ID=ID,dstep=100
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=39400
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),trange=trange,ID=ID,data1=bp[1,*],data2=bp[0,*],timeax1=timeax,timeax2=timeax,blocksize=39400
gp_sort,ID
return

ID='2008_12_01_1338_full2'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.085,4.134]
b=[4,7,8,11]
window=3200
mask=10000
stft=pg_spectrogram(shot,channel1,windowsize=window,masksize=mask,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax,ID=ID)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=window,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.1,nsegment=2,trange=trange,shotnumber=shot,channel1=channel1,ID=ID,dstep=100
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=19700
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),trange=trange,ID=ID,data1=bp[1,*],data2=bp[0,*],timeax1=timeax,timeax2=timeax,blocksize=19700
gp_sort,ID
return

ID='2008_12_01_1338_full'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.085,4.134]
b=[4,7,8,11]
window=3200
mask=10000
stft=pg_spectrogram(shot,channel1,windowsize=window,masksize=mask,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax,ID=ID)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=window,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.04,nsegment=2,trange=trange,shotnumber=shot,channel1=channel1,ID=ID,dstep=100
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=6400
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),trange=trange,ID=ID,data1=bp[1,*],data2=bp[0,*],timeax1=timeax,timeax2=timeax,blocksize=6400
gp_sort,ID
return

ID='2008_12_01_1338_smooth6400'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.085,4.134]
b=[4,7,8,11]
window=3200
mask=10000
stft=pg_spectrogram(shot,channel1,windowsize=window,masksize=mask,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax,ID=ID)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=window,trange=trange
bp2=bp
bp[0,*]=bp[0,*]-smooth(bp[0,*],6400)
bp[1,*]=bp[1,*]-smooth(bp[1,*],6400)

pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=11,trange=trange,shotnumber=shot,channel1=channel1,ID=ID,dstep=100
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=6400
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),trange=trange,ID=ID,data1=bp[1,*],data2=bp[0,*],timeax1=timeax,timeax2=timeax,blocksize=6400
gp_sort,ID

ID='2008_12_01_1338_smooth6400_substracted'
bp[0,*]=smooth(bp2[0,*],6400)
bp[1,*]=smooth(bp2[1,*],6400)
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=6400

return

ID='2008_12_01_1338_smooth200b'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.085,4.134]
b=[4,7,8,11]
window=3200
mask=10000
stft=pg_spectrogram(shot,channel1,windowsize=window,masksize=mask,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax,ID=ID)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=window,trange=trange
bp[0,*]=smooth(bp[0,*],200)
bp[1,*]=smooth(bp[1,*],200)

pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=11,trange=trange,shotnumber=shot,channel1=channel1,ID=ID,dstep=100
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=2048
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),trange=trange,ID=ID,data1=bp[1,*],data2=bp[0,*],timeax1=timeax,timeax2=timeax,blocksize=2048
gp_sort,ID
return

ID='2008_12_01_1338_smooth200'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.085,4.134]
b=[4,7,8,11]
window=3200
mask=10000
stft=pg_spectrogram(shot,channel1,windowsize=window,masksize=mask,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax,ID=ID)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=window,trange=trange
bp[0,*]=bp[0,*]-smooth(bp[0,*],200)
bp[1,*]=bp[1,*]-smooth(bp[1,*],200)

pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=11,trange=trange,shotnumber=shot,channel1=channel1,ID=ID,dstep=100
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=2048
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),trange=trange,ID=ID,data1=bp[1,*],data2=bp[0,*],timeax1=timeax,timeax2=timeax,blocksize=2048
gp_sort,ID
return

ID='2008_12_01_1338'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.085,4.134]
b=[4,7,8,11]
window=3200
mask=10000
stft=pg_spectrogram(shot,channel1,windowsize=window,masksize=mask,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax,ID=ID)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=window,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=11,trange=trange,shotnumber=shot,channel1=channel1,ID=ID,dstep=100
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=2048
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),trange=trange,ID=ID,data1=bp[1,*],data2=bp[0,*],timeax1=timeax,timeax2=timeax,blocksize=2048
gp_sort,ID
return

ID='2008_12_01_1333'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.09,4.129]
b=[4,7,8,11]
window=3200
mask=10000
stft=pg_spectrogram(shot,channel1,windowsize=window,masksize=mask,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax,ID=ID)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=window,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=11,trange=trange,shotnumber=shot,channel1=channel1,ID=ID,dstep=100
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=2048
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),trange=trange,ID=ID,data1=bp[1,*],data2=bp[0,*],timeax1=timeax,timeax2=timeax,blocksize=2048
gp_sort,ID
return

ID='2008_12_01_1237'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.08,4.12]
b=[4,7,8,11]
window=3200
mask=10000
stft=pg_spectrogram(shot,channel1,windowsize=window,masksize=mask,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax,ID=ID)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=window,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=11,trange=trange,shotnumber=shot,channel1=channel1,ID=ID,dstep=100
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=2048
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),trange=trange,ID=ID,data1=bp[1,*],data2=bp[0,*],timeax1=timeax,timeax2=timeax,blocksize=2048
gp_sort,ID
return

ID='2008_12_01_1103'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.09,4.16]
b=[4,7,8,11]
window=3200
mask=10000
stft=pg_spectrogram(shot,channel1,windowsize=window,masksize=mask,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax,ID=ID)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=window,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=11,trange=trange,shotnumber=shot,channel1=channel1,ID=ID,dstep=100
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=2048
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),trange=trange,ID=ID,data1=bp[1,*],data2=bp[0,*],timeax1=timeax,timeax2=timeax,blocksize=2048
gp_sort,ID
return

ID='2008_12_01_1054'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.09,4.14]
b=[4,7,8,11]
window=3200
mask=10000
stft=pg_spectrogram(shot,channel1,windowsize=window,masksize=mask,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax,ID=ID)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=window,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=8,trange=trange,shotnumber=shot,channel1=channel1,ID=ID,dstep=100
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=2048
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),trange=trange,ID=ID,data1=bp[1,*],data2=bp[0,*],timeax1=timeax,timeax2=timeax,blocksize=2048
gp_sort,ID
return

ID='2008_12_01_1045'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.09,4.125]
b=[4,7,8,11]
window=3200
mask=10000
stft=pg_spectrogram(shot,channel1,windowsize=window,masksize=mask,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax,ID=ID)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=window,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=6,trange=trange,shotnumber=shot,channel1=channel1,ID=ID,dstep=100
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=2048
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),trange=trange,ID=ID,data1=bp[1,*],data2=bp[0,*],timeax1=timeax,timeax2=timeax,blocksize=2048
gp_sort,ID
return

ID='2008_12_01_0506-22036_RAW'
shot=22036
channel1='General/_AUG_SXR_J54_time_3.0000-3.2000'
channel2='General/_AUG_SXR_J54_time_3.0000-3.2000'
trange=[3.08,3.13]
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID


ID='2008_12_01_0506-22036_BP'
shot=22036
channel1='General/_AUG_SXR_J54_time_3.0000-3.2000'
trange=[3.08,3.11]
b=[10,12,13,18]
window=1536
mask=6000
stft=pg_spectrogram(shot,channel1,windowsize=window,masksize=mask,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,ID=ID)
help,stft
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=window,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=8,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=1024
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),trange=trange,ID=ID,data1=bp[1,*],data2=bp[0,*],timeax1=timeax,timeax2=timeax,blocksize=1024
gp_sort,ID
return

ID='2008_11_25_1522_new3'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
b=[4,7,8,12]
trange=[3.315,3.425]
window=3200
mask=12000
stft=pg_spectrogram(shot,channel1,windowsize=window,masksize=mask,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,ID=ID)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=window,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=18,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return

ID='2008_11_25_1522_new2'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
b=[4,7,8,12]
trange=[3.315,3.425]
stft=pg_spectrogram(shot,channel1,windowsize=1280,masksize=12000,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,ID=ID)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=128,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=18,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return

ID='2008_11_25_1522_new'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
b=[4,7,8,12]
trange=[3.315,3.425]
stft=pg_spectrogram(shot,channel1,windowsize=640,masksize=2000,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,ID=ID)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=128,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=18,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return

ID='2008_11_27_0636'
print,ID
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
trange=[2.75,2.85]
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
gp_sort,ID
return

ID='2008_11_27_0634'
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
trange=[2.75,2.85]
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.1,/print,/pad,trange=trange)
gp_sort,ID
return

ID='2008_11_27_0626'
print,ID
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
channel2='General/_AUG_SXR_I54_time_2.5000-2.9000'
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID
return

ID='2008_11_27_0623'
print,ID
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
trange=[2.6,2.68]
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=50,ID=ID)
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=50,ID=ID)
gp_sort,ID
return

ID='2008_11_27_0617_80'
print,ID
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
trange=[2.5,2.518]
b=[7,11,13,19]
stft=pg_spectrogram(shot,channel1,windowsize=80,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,ID=ID)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=80,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
gp_sort,ID
return

ID='2008_11_27_0617'
print,ID
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
trange=[2.5,2.518]
b=[7,11,13,19]
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,ID=ID)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=128,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
gp_sort,ID
return

ID='2008_11_27_0609'
print,ID
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
trange=[2.5,2.54]
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=50,ID=ID)
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=50,ID=ID)
gp_sort,ID
return

ID='2008_11_27_0546'
print,ID
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
trange=[2.69,2.723]
b=[7,10,11,15]
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,ID=ID)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=128,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=5,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return

ID='2008_11_27_0544'
print,ID
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
trange=[2.68,2.75]
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
gp_sort,ID
return

ID='2008_11_27_0542'
print,ID
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
trange=[2.68,2.75]
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100,ID=ID)
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100,ID=ID)
gp_sort,ID
return

ID='2008_11_27_0536'
shot=22036
channel1='General/_AUG_SXR_J54_time_3.0000-3.2000'
trange=[3.08,3.13]
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.1,/print,/pad,trange=trange)
gp_sort,ID
return

ID='2008_11_27_0517_SCA'
shot=22036
channel1='General/_AUG_SXR_J54_time_3.0000-3.2000'
trange=[3.08,3.11]
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.1,/print,/pad,trange=trange)
gp_sort,ID
return



ID='2008_11_27_0517_200'
shot=22036
channel1='General/_AUG_SXR_J54_time_3.0000-3.2000'
trange=[3.08,3.11]
b=[10,12,13,18]
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,ID=ID,fmax=200)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=128,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=8,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return

ID='2008_11_27_0517_40'
shot=22036
channel1='General/_AUG_SXR_J54_time_3.0000-3.2000'
trange=[3.08,3.11]
b=[10,12,13,18]
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,ID=ID,fmax=40)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=128,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=8,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return

ID='2008_11_27_0517'
shot=22036
channel1='General/_AUG_SXR_J54_time_3.0000-3.2000'
trange=[3.08,3.11]
b=[10,12,13,18]
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,ID=ID)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=128,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=8,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return

ID='2008_11_27_0512'
shot=22036
channel1='General/_AUG_SXR_J54_time_3.0000-3.2000'
trange=[3.08,3.13]
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.08,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,plot=1,ID=ID)
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=2572,freqres=1,opt=0.08,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,plot=1,ID=ID)
return




ID='2008_11_25_1522_40'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
b=[4,7,8,12]
trange=[3.315,3.425]
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=128,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=18,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return

ID='2008_11_25_1522'
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
b=[4,7,8,12]
trange=[3.315,3.425]
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,ID=ID)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=128,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=18,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return

ID='2008_11_25_20975_C_SCA_long'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
times=[3.4315,3.591,3.7188]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.17,times(i)+0.03]
print,trange
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.03,plot=1,opt=0.13,/print,/pad,trange=trange)
endfor
gp_sort,ID


ID='2008_11_25_20975_C_SCA'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
times=[3.4315,3.591,3.7188]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
print,trange
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.13,/print,/pad,trange=trange)
endfor
gp_sort,ID
return

ID='2008_11_25_20975_C_RAW_long'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
channel2='General/_AUG_SXR_J53_time_2.0000-6.0000'
times=[3.4315,3.591,3.7188]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.17,times(i)+0.03]
print,trange
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID
endfor
return

ID='2008_11_24_20975_C_SPE_128_long'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
times=[3.4315,3.591,3.7188]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.17,times(i)+0.03]
print,trange
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
endfor
gp_sort,ID
return

ID='2008_11_24_20975_C_SPE_128'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
times=[3.4315,3.591,3.7188]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
print,trange
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
endfor
gp_sort,ID
return

ID='2008_11_25_20975_C_RAW'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
channel2='General/_AUG_SXR_J53_time_2.0000-6.0000'
times=[3.4315,3.591,3.7188]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
print,trange
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID
endfor
return

ID='2008_11_25_20975_B_RAW'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
channel2='General/_AUG_SXR_J53_time_2.0000-6.0000'
times=[2.0387,2.1833,2.2523,2.3868,2.456,2.5235,$
        2.595,2.6565,2.7335,2.8756,2.948,3.019,$
        3.0893,3.1545,3.2174,3.2832]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
print,trange
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID
endfor
return

ID='2008_11_25_20975_A_RAW'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
channel2='General/_AUG_SXR_J53_time_2.0000-6.0000'
times=[3.85,3.948,4.051,4.1345,4.217,4.3013,4.378,4.446,4.507]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
print,trange
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID
endfor
return

ID='2008_11_24_20975_A_SPE_128_hann'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
times=[3.85,3.948,4.051,4.1345,4.217,4.3013,4.378,4.446,4.507]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
print,trange
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID,windowname='Hanning',step=1)
endfor
gp_sort,ID
return

ID='2008_11_24_20975_A_SPE_128_box'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
times=[3.85,3.948,4.051,4.1345,4.217,4.3013,4.378,4.446,4.507]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
print,trange
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID,windowname='Rectangle',step=1)
endfor
gp_sort,ID
return

ID='2008_11_24_20975_A_SPE_200'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
times=[3.85,3.948,4.051,4.1345,4.217,4.3013,4.378,4.446,4.507]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
print,trange
stft=pg_spectrogram(shot,channel1,windowsize=200,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
endfor
gp_sort,ID

ID='2008_11_24_20975_A_SPE_128'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
times=[3.85,3.948,4.051,4.1345,4.217,4.3013,4.378,4.446,4.507]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
print,trange
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
endfor
gp_sort,ID
return

ID='2008_11_24_20975_B_SPE_128'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
times=[2.0387,2.1833,2.2523,2.3868,2.456,2.5235,$
        2.595,2.6565,2.7335,2.8756,2.948,3.019,$
        3.0893,3.1545,3.2174,3.2832]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
print,trange
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
endfor
gp_sort,ID
return

ID='2008_11_19_0716b'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[4.125,4.14]
stft=pg_spectrogram(shot,channel1,windowsize=32,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,ID=ID)
gp_sort,ID
return

ID='2008_11_19_0716'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[4.125,4.14]
stft=pg_spectrogram(shot,channel1,windowsize=32,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,plot=1)
gp_sort,ID
return

ID='2008_11_19_0715'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[4.125,4.14]
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,plot=1)
gp_sort,ID
return

ID='2008_11_19_0700'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
channel2='General/_AUG_SXR_J53_time_2.0000-6.0000'
trange=[4.125,4.14]
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID
return

ID='2008_11_19_0550'
print,ID
shot=22036
channel1='General/_AUG_SXR_J54_time_3.0000-3.2000'
trange=[3.08,3.13]
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,plot=1)
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.09,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,plot=1)
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.08,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,plot=1)
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.07,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,plot=1)

gp_sort,ID
return

ID='2008_11_19_0549'
print,ID
shot=22036
channel1='General/_AUG_SXR_J54_time_3.0000-3.2000'
trange=[3.08,3.13]
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.13,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,plot=1)
gp_sort,ID
return

ID='2008_11_19_0548'
print,ID
shot=22036
channel1='General/_AUG_SXR_J54_time_3.0000-3.2000'
trange=[3.08,3.135]
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,plot=1)
gp_sort,ID
return

ID='2008_11_19_0547'
print,ID
shot=22036
channel1='General/_AUG_SXR_J54_time_3.0000-3.2000'
trange=[3.07,3.135]
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,plot=1)
gp_sort,ID
return

ID='2008_11_19_0546'
print,ID
shot=22036
channel1='General/_AUG_SXR_J54_time_3.0000-3.2000'
trange=[3.05,3.12]
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,plot=1)
gp_sort,ID
return

ID='2008_11_19_0538'
shot=22036
channel1='General/_AUG_SXR_J54_time_3.0000-3.2000'
b=[10,12,13,17]
trange=[3.112,3.118]
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax,plot=1)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=128,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0025,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return

ID='2008_11_19_0536'
print,ID
shot=22036
channel1='General/_AUG_SXR_J54_time_3.0000-3.2000'
trange=[3.08,3.15]
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,plot=1)
gp_sort,ID
return

ID='quicktest'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
times=[3.85,3.948]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
print,trange
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,plot=1)
endfor
gp_sort,ID
return

ID='2008_11_19_0532'
print,ID
shot=22036
channel1='General/_AUG_SXR_J54_time_3.0000-3.2000'
trange=[3.05,3.15]
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,plot=1)
gp_sort,ID
return

ID='2008_11_19_0528'
shot=22036
channel1='General/_AUG_SXR_J54_time_3.0000-3.2000'
b=[10,12,13,17]
trange=[3.082,3.111]
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax,plot=1)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=128,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0025,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return


ID='2008_11_19_0517'
print,ID
shot=22036
channel1='General/_AUG_SXR_J54_time_3.0000-3.2000'
trange=[3.05,3.15]
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=50,plot=1)
gp_sort,ID
return

ID='2008_11_18_1140_A_256'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
times=[3.85,3.948,4.051,4.1345,4.217,4.3013,4.378,4.446,4.507]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
print,trange
stft=pg_spectrogram(shot,channel1,windowsize=256,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,plot=1)
endfor
gp_sort,ID

ID='2008_11_18_1140_A_128'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
times=[3.85,3.948,4.051,4.1345,4.217,4.3013,4.378,4.446,4.507]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
print,trange
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,plot=1)
endfor
gp_sort,ID
return



ID='2008_11_18_0941_B_512'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
times=[2.0387,2.1833,2.2523,2.3868,2.456,2.5235,$
        2.595,2.6565,2.7335,2.8756,2.948,3.019,$
        3.0893,3.1545,3.2174,3.2832]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
print,trange
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40,plot=1)
endfor
gp_sort,ID
return

ID='2008_11_18_0941_B_256'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
times=[2.0387,2.1833,2.2523,2.3868,2.456,2.5235,$
        2.595,2.6565,2.7335,2.8756,2.948,3.019,$
        3.0893,3.1545,3.2174,3.2832]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
print,trange
stft=pg_spectrogram(shot,channel1,windowsize=256,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40)
endfor
gp_sort,ID


ID='2008_11_18_0941_B_128'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
times=[2.0387,2.1833,2.2523,2.3868,2.456,2.5235,$
        2.595,2.6565,2.7335,2.8756,2.948,3.019,$
        3.0893,3.1545,3.2174,3.2832]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
print,trange
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=40)
endfor
gp_sort,ID
return

ID='2008_11_17_1947_B'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
times=[2.0387,2.1833,2.2523,2.3868,2.456,2.5235,$
        2.595,2.6565,2.7335,2.8756,2.948,3.019,$
        3.0893,3.1545,3.2174,3.2832]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
print,trange
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.13,/print,/pad,trange=trange)
endfor
gp_sort,ID
return

ID='2008_11_17_1947_A'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_2.0000-6.0000'
times=[3.85,3.948,4.051,4.1345,4.217,4.3013,4.378,4.446,4.507]
for i=0,n_elements(times)-1 do begin
trange=[times(i)-0.07,times(i)+0.03]
print,trange
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.13,/print,/pad,trange=trange)
endfor
gp_sort,ID
return


ID='2008_11_14_1515'
print,ID
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
trange=[2.5,2.54]
stft=pg_spectrogram(shot,channel1,windowsize=64,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=50)
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=50)
gp_sort,ID
return

ID='2008_11_14_1504'
print,ID
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
trange=[2.5,2.54]
stft=pg_spectrogram(shot,channel1,windowsize=128,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100)
stft=pg_spectrogram(shot,channel1,windowsize=256,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100)
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100)
gp_sort,ID


ID='2008_11_14_1503'
print,ID
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
trange=[2.5,2.54]
stft=pg_spectrogram(shot,channel1,windowsize=256,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=200)
gp_sort,ID
return

ID='2008_11_14_1502'
print,ID
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
trange=[2.5,2.54]
stft=pg_spectrogram(shot,channel1,windowsize=256,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=160)
gp_sort,ID
return

ID='2008_11_14_1455'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.06,4.17]
stft=pg_spectrogram(shot,channel1,windowsize=256,masksize=2572,freqres=1,opt=0.05,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=60)
stft=pg_spectrogram(shot,channel1,windowsize=256,masksize=2572,freqres=1,opt=0.06,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=60)
stft=pg_spectrogram(shot,channel1,windowsize=256,masksize=2572,freqres=1,opt=0.07,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=60)
gp_sort,ID
return

ID='2008_11_14_1448'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.06,4.17]
stft=pg_spectrogram(shot,channel1,windowsize=256,masksize=2572,freqres=1,opt=0.08,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=60)
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.08,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=60)
gp_sort,ID
return

ID='2008_11_14_1438'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.06,4.17]
stft=pg_spectrogram(shot,channel1,windowsize=256,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=60)
gp_sort,ID
return

ID='2008_11_14_1436'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.06,4.17]
stft=pg_spectrogram(shot,channel1,windowsize=1024,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=60)
gp_sort,ID
return

ID='2008_11_14_1430'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.06,4.17]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.1,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100)
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.3,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100)
gp_sort,ID
return

ID='2008_11_14_1425'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.06,4.17]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax,fmax=100)
gp_sort,ID
return

ID='2008_11_12_1519'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.06,4.25]
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.015,plot=1,opt=0.13,/print,/pad,trange=trange)
gp_sort,ID

ID='2008_11_02_1150-opt3'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.06,4.17]
cwt=pg_scalogram([shot],[channel1],order=30,dscale=0.01,plot=1,opt=0.13,/print,/pad,trange=trange)
cwt=pg_scalogram([shot],[channel1],order=24,dscale=0.01,plot=1,opt=0.13,/print,/pad,trange=trange)
gp_sort,ID
return

ID='2008_11_02_1150-opt3'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.06,4.17]
cwt=pg_scalogram([shot],[channel1],order=3,dscale=0.01,plot=1,opt=0.13,/print,/pad,trange=trange)
cwt=pg_scalogram([shot],[channel1],order=6,dscale=0.01,plot=1,opt=0.13,/print,/pad,trange=trange)
cwt=pg_scalogram([shot],[channel1],order=12,dscale=0.01,plot=1,opt=0.13,/print,/pad,trange=trange)
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.13,/print,/pad,trange=trange)
cwt=pg_scalogram([shot],[channel1],order=36,dscale=0.01,plot=1,opt=0.13,/print,/pad,trange=trange)
gp_sort,ID
return

ID='2008_11_11_1506'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.13,4.134]
b=[4,7,8,11]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.002,nsegment=2,trange=trange,shotnumber=shot,channel1=channel1,ID=ID,dstep=100
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=1024
gp_sort,ID
return

ID='2008_11_11_1457'
print,ID
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
channel2='General/_AUG_SXR_I54_time_2.5000-2.9000'
trange=[2.5,2.54]
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID
return

ID='2008_11_11_1432'
print,ID
shot=22375
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.08,4.13]
b=[4,7,9,15]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=8,trange=trange,shotnumber=shot,channel1=channel1,ID=ID,dstep=100
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=1024
gp_sort,ID
return


ID='2008_11_11_1410'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.08,4.13]
b=[4,7,9,15]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=8,trange=trange,shotnumber=shot,channel1=channel1,ID=ID,dstep=100
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=1024
gp_sort,ID
return

ID='2008_11_11_A'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.11,4.13]
b=[4,7,9,15]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID,dstep=100
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=10000
gp_sort,ID
return

ID='2008_11_11_A_Boxcar'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.11,4.13]
b=[4,7,9,15]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID,dstep=100
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=1024,hann=0
gp_sort,ID
return

ID='2008_11_11_A'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.11,4.13]
b=[4,7,9,15]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID,dstep=100
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=1024
gp_sort,ID
return

ID='2008_11_01_2100_NEW8'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.11,4.13]
b=[4,7,9,12]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange

gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=1024
gp_sort,ID
ID='2008_11_01_2100_NEW9'
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=512
ID='2008_11_01_2100_NEW10'
gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=8192


return


ID='2008_11_01_2100_NEW7'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.11,4.13]
b=[4,7,9,12]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange

gp_analyse,shot,'Bp_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bp_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=1024
gp_sort,ID
return

ID='2008_11_01_2100_NEW6'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.11,4.13]
b=[4,7,9,12]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID,dstep=100
gp_sort,ID
return

ID='2008_11_01_2100_NEW5'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.11,4.134]
b=[4,7,9,12]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=4,trange=trange,shotnumber=shot,channel1=channel1,ID=ID,dstep=100
gp_sort,ID


ID='2008_11_01_2100_NEW4'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.06,4.11]
b=[4,7,9,12]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=8,trange=trange,shotnumber=shot,channel1=channel1,ID=ID,dstep=100
gp_sort,ID
return

ID='2008_11_01_2100_NEW3'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.06,4.13]
b=[4,7,9,12]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=8,trange=trange,shotnumber=shot,channel1=channel1,ID=ID,dstep=50
gp_sort,ID
;return

ID='2008_11_01_2100_NEW2'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.06,4.11]
b=[4,7,9,12]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=8,trange=trange,shotnumber=shot,channel1=channel1,ID=ID,dstep=50
gp_sort,ID
return

ID='2008_11_01_2100_NEW'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.06,4.11]
b=[4,7,9,12]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=16,trange=trange,shotnumber=shot,channel1=channel1,ID=ID,dstep=5
gp_sort,ID
return

ID='2008_11_01_2100-BPS2'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.07,4.14]
b=[4,7,9,12]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID,dstep=10
gp_sort,ID
return

ID='2008_11_01_2100-BPS'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.04,4.16]
b=[4,7,9,12]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=2,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return

ID='2008_11_02_1150-opt2'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.06,4.17]
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.05,/print,/pad,trange=trange)
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.06,/print,/pad,trange=trange)
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.07,/print,/pad,trange=trange)
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.08,/print,/pad,trange=trange)
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.09,/print,/pad,trange=trange)
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.10,/print,/pad,trange=trange)
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.11,/print,/pad,trange=trange)
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.12,/print,/pad,trange=trange)
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.13,/print,/pad,trange=trange)
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.14,/print,/pad,trange=trange)
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange)
gp_sort,ID
return

ID='2008_11_02_1150-opt'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.06,4.17]
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.05,/print,/pad,trange=trange)
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.10,/print,/pad,trange=trange)
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange)
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.20,/print,/pad,trange=trange)
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.25,/print,/pad,trange=trange)
gp_sort,ID
return

ID='2008_11_01_2100'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.06,4.11]
b=[4,7,9,12,100,103,500,503]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=2,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return

ID='2008_11_02_1150'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4,4.07]
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange)
trange=[4.06,4.17]
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange)
trange=[4.16,4.25]
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange)
gp_sort,ID
return

ID='2008_11_02_1142'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.06,4.19]
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.15,/print,trange=trange)
gp_sort,ID
return

ID='2008_11_02_1135'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
channel2='General/_AUG_SXR_J54_time_4.0000-4.2500'
trange=[4.06,4.2]
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=18,dscale=0.01,plot=1,opt=0.15,/print,phaselevel=5,trange=trange)
gp_sort,ID
return

ID='2008_11_02_1130'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
channel2='General/_AUG_SXR_J54_time_4.0000-4.2500'
trange=[4.06,4.16]
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=18,dscale=0.01,plot=1,opt=0.15,/print,phaselevel=5,trange=trange)
gp_sort,ID
return

ID='2008_11_02_1114'
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
channel2='General/_AUG_SXR_J54_time_4.0000-4.2500'
trange=[4.06,4.16]
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID
return

ID='2008_11_01_2100'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.06,4.11]
b=[4,7,9,12,100,103,500,503]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=2,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return

ID='2008_10_30_1846'
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
b=[7,13,15,20,50,55,100,105]
trange=[2.505,2.516]
stft=pg_spectrogram(shot,channel1,windowsize=200,masksize=1000,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=200,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0029,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return

ID='2008_10_30_1841'
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
b=[7,13,15,20,50,55,100,105]
trange=[2.5,2.516]
stft=pg_spectrogram(shot,channel1,windowsize=200,masksize=1000,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=200,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0029,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return

ID='2008_10_30_1836'
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
channel2='General/_AUG_SXR_I54_time_2.5000-2.9000'
trange=[2.58,2.64]
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=18,dscale=0.01,plot=1,opt=0.15,/print,phaselevel=5,trange=trange)
gp_sort,ID
return

ID='2008_10_30_1830'
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
channel2='General/_AUG_SXR_I54_time_2.5000-2.9000'
trange=[2.56,2.7]
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=18,dscale=0.01,plot=1,opt=0.15,/print,phaselevel=5,trange=trange)
gp_sort,ID
return

ID='2008_10_30_1830'
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
channel2='General/_AUG_SXR_I54_time_2.5000-2.9000'
trange=[2.5,2.7]
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=18,dscale=0.01,plot=1,opt=0.15,/print,phaselevel=5,trange=trange)
gp_sort,ID
return

ID='2008_10_30_1812'
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
channel2='General/_AUG_SXR_I54_time_2.5000-2.9000'
trange=[2.5,2.6]
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=18,dscale=0.01,plot=1,opt=0.15,/print,phaselevel=5,trange=trange)
gp_sort,ID

return

ID='2008_10_30_1350'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.06,4.11]
b=[4,7,8,11,100,103,500,503]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=2,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return

ID='2008_10_30_1313'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.06,4.12]
b=[4,7,8,11]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=2,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID

ID='2008_10_30_1314'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.06,4.11]
b=[4,7,8,11]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=2,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return

ID='2008_10_30_1309'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
channel2='General/_AUG_SXR_J54_time_4.0000-4.2500'
trange=[4,4.15]
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=18,dscale=0.03,plot=1,opt=0.15,/print,phaselevel=5,trange=trange)
gp_sort,ID
return

ID='2008_10_29_1547'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.07,4.1270]
b=[4,7,8,11]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=2,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return

ID='2008_10_29_1544'
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
b=[7,13,15,20]
trange=[2.5,2.517]
stft=pg_spectrogram(shot,channel1,windowsize=200,masksize=1000,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=200,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0029,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return

ID='2008_10_29_1412'
print,ID
shot=23068
channel1='General/_AUG_SXR_I60_time_2.5000-2.9000'
channel2='General/_AUG_SXR_I61_time_2.5000-2.9000'
trange=[2.5,2.54]
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID
return

ID='2008_10_29_1411'
print,ID
shot=23068
channel1='General/_AUG_SXR_I57_time_2.5000-2.9000'
channel2='General/_AUG_SXR_I53_time_2.5000-2.9000'
trange=[2.5,2.54]
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID
return

ID='2008_10_29_1410'
print,ID
shot=23068
channel1='General/_AUG_SXR_I58_time_2.5000-2.9000'
channel2='General/_AUG_SXR_I59_time_2.5000-2.9000'
trange=[2.5,2.54]
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID
return

ID='2008_10_29_1407'
print,ID
shot=23068
channel1='General/_AUG_SXR_I58_time_2.5000-2.9000'
channel2='General/_AUG_SXR_I59_time_2.5000-2.9000'
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=18,dscale=0.03,plot=1,opt=0.15,/print,phaselevel=5,trange=[2.5,2.54])
;cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=18,dscale=0.03,plot=1,opt=0.15,/print,phaselevel=5,avr=5,trange=[2.5,2.54])
gp_sort,ID
return

ID='2008_10_29_1405'
print,ID
shot=23068
channel1='General/_AUG_SXR_I57_time_2.5000-2.9000'
channel2='General/_AUG_SXR_I53_time_2.5000-2.9000'
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=18,dscale=0.03,plot=1,opt=0.15,/print,phaselevel=5,trange=[2.5,2.54])
;cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=18,dscale=0.03,plot=1,opt=0.15,/print,phaselevel=5,avr=5,trange=[2.5,2.54])
gp_sort,ID
return

ID='2008_07_25_1703-NEW2'
print,ID
shot=22036
channel1='General/_AUG_SXR_J54_time_3.0000-3.2000'
channel2='General/_AUG_SXR_J54_time_3.0000-3.2000'
b=[4,8,10,13]
trange=[3.112,3.1185]
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID
return

ID='2008_07_25_1307-NEW2-RAW'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
channel2='General/_AUG_SXR_J54_time_4.0000-4.2500'
trange=[4.1270,4.1370]
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID
return


ID='2008_10_28_1523'
print,'ID: '+ID
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
shot2=22157
channel2='General/_AUG_SXR_I53_time_4.0000-5.0000'
b=[100,130,200,220]
trange=[2.525,2.555]
trange2=[4.575,4.615]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange

stft2=pg_spectrogram(shot2,channel2,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange2,timeax=timeax,freqax=freqax)
pg_anal2,stft2,b,plot=3,/print,bp=bp2,timeax=timeax,freqax=freqax

gp_sort,ID

gp_analyse,shot,'Bandpower_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bandpower_'+channel2+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp2[1,*],timeax1=timeax,timeax2=timeax,blocksize=2048
gp_analyse,shot,'Bandpower_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'Bandpower_'+channel2+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),trange=trange,ID=ID,data1=bp[1,*],data2=bp2[0,*],timeax1=timeax,timeax2=timeax,blocksize=2048
return

ID='2008_10_28_1520'
print,'ID: '+ID
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
shot2=22157
channel2='General/_AUG_SXR_I53_time_4.0000-5.0000'
b=[40,60,100,130]
trange=[2.525,2.555]
trange2=[4.575,4.615]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange

stft2=pg_spectrogram(shot2,channel2,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange2,timeax=timeax,freqax=freqax)
pg_anal2,stft2,b,plot=3,/print,bp=bp2,timeax=timeax,freqax=freqax

gp_sort,ID

gp_analyse,shot,'Bandpower_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bandpower_'+channel2+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp2[1,*],timeax1=timeax,timeax2=timeax,blocksize=2048
gp_analyse,shot,'Bandpower_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'Bandpower_'+channel2+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),trange=trange,ID=ID,data1=bp[1,*],data2=bp2[0,*],timeax1=timeax,timeax2=timeax,blocksize=2048
return

ID='2008_10_28_1518'
print,'ID: '+ID
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
shot2=22157
channel2='General/_AUG_SXR_I53_time_4.0000-5.0000'
b=[10,20,40,60]
trange=[2.525,2.555]
trange2=[4.575,4.615]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange

stft2=pg_spectrogram(shot2,channel2,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange2,timeax=timeax,freqax=freqax)
pg_anal2,stft2,b,plot=3,/print,bp=bp2,timeax=timeax,freqax=freqax

gp_sort,ID

gp_analyse,shot,'Bandpower_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bandpower_'+channel2+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp2[1,*],timeax1=timeax,timeax2=timeax,blocksize=2048
gp_analyse,shot,'Bandpower_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'Bandpower_'+channel2+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),trange=trange,ID=ID,data1=bp[1,*],data2=bp2[0,*],timeax1=timeax,timeax2=timeax,blocksize=2048
return

ID='2008_10_28_1515'
print,'ID: '+ID
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
shot2=22157
channel2='General/_AUG_SXR_I53_time_4.0000-5.0000'
b=[10,20,40,60]
trange=[2.5,2.530]
trange2=[4.575,4.615]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange

stft2=pg_spectrogram(shot2,channel2,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange2,timeax=timeax,freqax=freqax)
pg_anal2,stft2,b,plot=3,/print,bp=bp2,timeax=timeax,freqax=freqax

gp_sort,ID

gp_analyse,shot,'Bandpower_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bandpower_'+channel2+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp2[1,*],timeax1=timeax,timeax2=timeax,blocksize=2048
gp_analyse,shot,'Bandpower_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'Bandpower_'+channel2+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),trange=trange,ID=ID,data1=bp[1,*],data2=bp2[0,*],timeax1=timeax,timeax2=timeax,blocksize=2048
return

ID='2008_10_28_1504'
print,'ID: '+ID
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
shot2=22157
channel2='General/_AUG_SXR_I64_time_4.0000-5.0000'
b=[10,20,40,60]
trange=[2.5,2.530]
trange2=[4.575,4.615]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange

stft2=pg_spectrogram(shot2,channel2,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange2,timeax=timeax,freqax=freqax)
pg_anal2,stft2,b,plot=3,/print,bp=bp2,timeax=timeax,freqax=freqax

gp_sort,ID

gp_analyse,shot,'Bandpower_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bandpower_'+channel2+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp2[1,*],timeax1=timeax,timeax2=timeax,blocksize=2048
gp_analyse,shot,'Bandpower_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'Bandpower_'+channel2+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),trange=trange,ID=ID,data1=bp[1,*],data2=bp2[0,*],timeax1=timeax,timeax2=timeax,blocksize=2048
return

ID='2008_10_28_1455'
print,'ID: '+ID
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
shot2=22157
channel2='General/_AUG_SXR_I64_time_4.0000-5.0000'
b=[10,20,40,60]
trange=[2.5,2.530]
trange2=[4.6,4.630]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange

stft2=pg_spectrogram(shot2,channel2,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange2,timeax=timeax,freqax=freqax)
pg_anal2,stft2,b,plot=3,/print,bp=bp2,timeax=timeax,freqax=freqax

gp_sort,ID

gp_analyse,shot,'Bandpower_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bandpower_'+channel2+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp2[1,*],timeax1=timeax,timeax2=timeax,blocksize=2048
gp_analyse,shot,'Bandpower_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'Bandpower_'+channel2+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),trange=trange,ID=ID,data1=bp[1,*],data2=bp2[0,*],timeax1=timeax,timeax2=timeax,blocksize=2048
return

ID='2008_10_28_1453'
print,'ID: '+ID
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
shot2=22157
channel2='General/_AUG_SXR_I64_time_4.0000-5.0000'
b=[40,60,180,200]
trange=[2.5,2.530]
trange2=[4.6,4.630]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange

stft2=pg_spectrogram(shot2,channel2,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange2,timeax=timeax,freqax=freqax)
pg_anal2,stft2,b,plot=3,/print,bp=bp2,timeax=timeax,freqax=freqax

gp_sort,ID

gp_analyse,shot,'Bandpower_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bandpower_'+channel2+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp2[1,*],timeax1=timeax,timeax2=timeax,blocksize=2048
gp_analyse,shot,'Bandpower_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'Bandpower_'+channel2+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),trange=trange,ID=ID,data1=bp[1,*],data2=bp2[0,*],timeax1=timeax,timeax2=timeax,blocksize=2048
return

ID='2008_10_28_1451'
print,'ID: '+ID
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
shot2=22157
channel2='General/_AUG_SXR_I64_time_4.0000-5.0000'
b=[40,60,180,200]
trange=[2.5,2.530]
trange2=[4.5,4.530]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange

stft2=pg_spectrogram(shot2,channel2,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange2,timeax=timeax,freqax=freqax)
pg_anal2,stft2,b,plot=3,/print,bp=bp2,timeax=timeax,freqax=freqax

gp_sort,ID

gp_analyse,shot,'Bandpower_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bandpower_'+channel2+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp2[1,*],timeax1=timeax,timeax2=timeax,blocksize=2048
gp_analyse,shot,'Bandpower_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'Bandpower_'+channel2+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),trange=trange,ID=ID,data1=bp[1,*],data2=bp2[0,*],timeax1=timeax,timeax2=timeax,blocksize=2048
return

ID='2008_10_28_1447'
print,'ID: '+ID
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
shot2=22157
channel2='General/_AUG_SXR_I64_time_4.0000-5.0000'
b=[40,60,180,200]
trange=[2.5,2.530]
trange2=[4.5,4.530]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange

stft2=pg_spectrogram(shot2,channel2,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange2,timeax=timeax,freqax=freqax)
pg_anal2,stft2,b,plot=3,/print,bp=bp2,timeax=timeax,freqax=freqax

gp_sort,ID

gp_analyse,shot,'Bandpower_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bandpower_'+channel2+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),trange=trange,ID=ID,data1=bp[0,*],data2=bp2[0,*],timeax1=timeax,timeax2=timeax,blocksize=2048
gp_analyse,shot,'Bandpower_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'Bandpower_'+channel2+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[1,*],data2=bp2[1,*],timeax1=timeax,timeax2=timeax,blocksize=2048
return

ID='2008_10_28_1442'
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
channel2='General/_AUG_SXR_I64_time_2.5000-2.9000'
b=[40,60,180,200]
trange=[2.5,2.530]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange

stft2=pg_spectrogram(shot,channel2,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft2,b,plot=3,/print,bp=bp2,timeax=timeax,freqax=freqax

gp_sort,ID

gp_analyse,shot,'Bandpower_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bandpower_'+channel2+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),trange=trange,ID=ID,data1=bp[0,*],data2=bp2[0,*],timeax1=timeax,timeax2=timeax,blocksize=2048
gp_analyse,shot,'Bandpower_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'Bandpower_'+channel2+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[1,*],data2=bp2[1,*],timeax1=timeax,timeax2=timeax,blocksize=2048
return

ID='2008_10_27_1313-NEW'
print,ID
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
b=[40,60,180,200]
trange=[2.5,2.518]
stft=pg_spectrogram(shot,channel1,windowsize=200,masksize=1000,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=200,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0029,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID

ID='2008_10_27_1311-NEW'
print,ID
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
b=[40,60,80,100]
trange=[2.5,2.518]
stft=pg_spectrogram(shot,channel1,windowsize=200,masksize=1000,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=200,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0029,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID

ID='2008_10_27_1310-NEW'
print,ID
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
b=[15,20,40,60]
trange=[2.5,2.518]
stft=pg_spectrogram(shot,channel1,windowsize=200,masksize=1000,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=200,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0029,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID


ID='2008_10_27_1308-NEW'
print,ID
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
b=[7,13,40,60]
trange=[2.5,2.518]
stft=pg_spectrogram(shot,channel1,windowsize=200,masksize=1000,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=200,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0029,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return


ID='2008_10_27_1343-NEW'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.13,4.1337]
b=[40,45,100,110]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=2,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID

ID='2008_10_27_1335-NEW'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.13,4.1340]
b=[100,120,200,220]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=2,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID

ID='2008_10_27_1334-NEW'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.13,4.1340]
b=[100,120,500,520]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=2,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID


ID='2008_10_27_1320-NEW'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.13,4.1340]
b=[40,45,100,110]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=2,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID

ID='2008_10_27_1318-NEW'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.13,4.1340]
b=[4,7,40,45]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=2,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return

;EDDIG

ID='2008_07_25_1307-NEW2'
print,ID
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.1270,4.1370]
b=[4,7,8,11]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=2,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return

ID='2008_07_25_1419-NEW2'
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
b=[6,11,13,20]
trange=[2.7070,2.73]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.005,nsegment=2,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return

ID='2008_07_25_1703-NEW2'
shot=22036
channel1='General/_AUG_SXR_J54_time_3.0000-3.2000'
b=[4,8,10,13]
trange=[3.112,3.1185]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0025,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return

ID='2008_07_25_1120-NEW4'
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
b=[7,13,15,20]
trange=[2.5,2.5192]
stft=pg_spectrogram(shot,channel1,windowsize=200,masksize=1000,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=200,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0029,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return

ID='2008_07_25_1307-NEW'
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.1270,4.1370]
b=[4,7,8,11]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=2,trange=trange,shotnumber=shot,channel1=channel1
gp_sort,ID
return

ID='2008_07_25_1419-NEW'
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
b=[6,11,13,20]
trange=[2.7070,2.73]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.005,nsegment=2,trange=trange,shotnumber=shot,channel1=channel1
gp_sort,ID
return

ID='2008_07_25_1703-NEW'
shot=22036
channel1='General/_AUG_SXR_J54_time_3.0000-3.2000'
b=[4,8,10,13]
trange=[3.112,3.1185]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=512,trange=trange
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0025,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1
gp_sort,ID
return

ID='2008_07_25_1120-NEW3'
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
b=[7,13,15,20]
trange=[2.480,2.540]
trange2=[2.490,2.518]
stft=pg_spectrogram(shot,channel1,windowsize=200,masksize=1000,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trange=trange2
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0029,nsegment=3,trange=trange2,shotnumber=shot,channel1=channel1
gp_sort,ID
return

ID='2008_07_25_1120-NEW2'
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
b=[7,13,15,20]
trange=[2.480,2.540]
trange2=[2.5,2.518]
stft=pg_spectrogram(shot,channel1,windowsize=200,masksize=1000,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trange=trange2
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0029,nsegment=3,trange=trange2,shotnumber=shot,channel1=channel1
gp_sort,ID
return

ID='2008_07_25_1120-NEW'
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
b=[7,13,15,20]
trange=[2.5,2.518]
stft=pg_spectrogram(shot,channel1,windowsize=200,masksize=1000,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax,trunc=200
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0029,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1
gp_sort,ID
return

ID='2008_09_22_2052'
shot=22375
trange=[4.523,4.5255]
channel1='General/_AUG_SXR_I55_time_4.5230-4.5290'
channel2='General/_AUG_SXR_H54_time_4.5230-4.5290'
gp_analyse,shot,channel1,channel2,trange=trange,ID=ID
return


ID='2008_10_27_1343'
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.13,4.1337]
b=[40,45,100,110]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=2,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return

ID='2008_10_27_1335'
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.13,4.1340]
b=[100,120,200,220]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=2,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return

ID='2008_10_27_1334'
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.13,4.1340]
b=[100,120,500,520]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=2,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return

ID='2008_10_27_1330'
shot=20975
blocksize=512
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
channel2='General/_AUG_SXR_J54_time_4.0000-4.2500'
trange=[4.13,4.1340]
gp_analyse,shot,channel1,channel2,ID=ID,trange=trange,blocksize=blocksize
return

ID='2008_10_27_1323'
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.13,4.1340]
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.03,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
gp_sort,ID
return


ID='2008_10_27_1320'
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.13,4.1340]
b=[40,45,100,110]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=2,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return

ID='2008_10_27_1318'
shot=20975
channel1='General/_AUG_SXR_J53_time_4.0000-4.2500'
trange=[4.13,4.1340]
b=[4,7,40,45]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=2,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return

ID='2008_10_27_1313'
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
b=[40,60,180,200]
trange=[2.5,2.518]
stft=pg_spectrogram(shot,channel1,windowsize=200,masksize=1000,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0029,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return

ID='2008_10_27_1311'
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
b=[40,60,80,100]
trange=[2.5,2.518]
stft=pg_spectrogram(shot,channel1,windowsize=200,masksize=1000,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0029,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return

ID='2008_10_27_1310'
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
b=[15,20,40,60]
trange=[2.5,2.518]
stft=pg_spectrogram(shot,channel1,windowsize=200,masksize=1000,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0029,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return

ID='2008_10_27_1308'
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
b=[7,13,40,60]
trange=[2.5,2.518]
stft=pg_spectrogram(shot,channel1,windowsize=200,masksize=1000,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0029,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return


ID='2008_10_13_1118_MIR-TIME'
shot=22375
trange=[4.523,4.529]
channel1='AUG_mirnov/B31-05'
channel2='AUG_mirnov/B31-10'
b=[6,20,80,300]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID

stft2=pg_spectrogram(shot,channel2,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft2,b,plot=3,/print,bp=bp2,timeax=timeax,freqax=freqax
pg_anal3_gp,bp2,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=3,trange=trange,shotnumber=shot,channel1=channel2,ID=ID

gp_sort,ID

gp_analyse,shot,'Bandpower_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bandpower_'+channel2+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),trange=trange,ID=ID,data1=bp[0,*],data2=bp2[0,*],timeax1=timeax,timeax2=timeax,blocksize=2048
gp_analyse,shot,'Bandpower_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'Bandpower_'+channel2+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[1,*],data2=bp2[1,*],timeax1=timeax,timeax2=timeax,blocksize=2048
return

ID='2008_10_13_1059_MIR-TIME'
shot=22375
trange=[4.523,4.529]
channel1='AUG_mirnov/B31-07'
channel2='AUG_mirnov/B31-08'
b=[6,20,80,300]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID

stft2=pg_spectrogram(shot,channel2,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft2,b,plot=3,/print,bp=bp2,timeax=timeax,freqax=freqax
pg_anal3_gp,bp2,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=3,trange=trange,shotnumber=shot,channel1=channel2,ID=ID

gp_sort,ID

gp_analyse,shot,'Bandpower_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bandpower_'+channel2+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),trange=trange,ID=ID,data1=bp[0,*],data2=bp2[0,*],timeax1=timeax,timeax2=timeax,blocksize=2048
gp_analyse,shot,'Bandpower_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'Bandpower_'+channel2+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[1,*],data2=bp2[1,*],timeax1=timeax,timeax2=timeax,blocksize=2048
return

ID='2008_10_13_1050_MIR-TIME'
shot=22375
trange=[4.523,4.529]
channel1='AUG_mirnov/B31-07'
channel2='AUG_mirnov/B31-08'
b=[6,20,80,300]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID

stft2=pg_spectrogram(shot,channel2,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft2,b,plot=3,/print,bp=bp2,timeax=timeax,freqax=freqax
pg_anal3_gp,bp2,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=3,trange=trange,shotnumber=shot,channel1=channel2,ID=ID

gp_sort,ID

gp_analyse,shot,'Bandpower_'+channel1+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bandpower_'+channel2+'_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),trange=trange,ID=ID,data1=bp[0,*],data2=bp2[0,*],timeax1=timeax,timeax2=timeax,blocksize=4096
gp_analyse,shot,'Bandpower_'+channel1+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),'Bandpower_'+channel2+'_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[1,*],data2=bp2[1,*],timeax1=timeax,timeax2=timeax,blocksize=4096
return

ID='2008_10_13_1033_MIR-TIME'
shot=22375
trange=[4.523,4.529]
channel1='AUG_mirnov/B31-07'
channel2='AUG_mirnov/B31-08'
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.03,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
cwt=pg_scalogram([shot],[channel2],order=18,dscale=0.03,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
gp_sort,ID
return

ID='2008_10_13_1030_MIR-TIME'
shotnumber=22375
trange=[4.523,4.529]
channel1='AUG_mirnov/B31-07'
channel2='AUG_mirnov/B31-08'
blocksize=1024
gp_analyse,shotnumber,channel1,channel2,ID=ID,trange=trange,blocksize=blocksize
return

ID='2008_10_13_1024_MIR-TIME'
shotnumber=22375
trange=[4.523,4.529]
channel1='AUG_mirnov/B31-07'
channel2='AUG_mirnov/B31-08'
blocksize=512
gp_analyse,shotnumber,channel1,channel2,ID=ID,trange=trange,blocksize=blocksize
return

ID='2008_08_01_1005'
shot=22375
trange=[4.514,4.524]
channel1='General/_AUG_SXR_I53_time_4.2000-5.2000'
b=[3.5,5,6,9]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
;cwt=pg_scalogram([shot],[channel1],order=36,dscale=0.001,plot=1,opt=0.15,/print,/pad,trange=trange)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
gp_analyse,shot,'Bandpower_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bandpower_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[1,*],data2=bp[0,*],timeax1=timeax,timeax2=timeax,blocksize=4096
return

ID='2008_08_01_1003'
shot=22375
trange=[4.514,4.524]
channel1='General/_AUG_SXR_I53_time_4.2000-5.2000'
b=[3.5,5,6,9]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
;cwt=pg_scalogram([shot],[channel1],order=36,dscale=0.001,plot=1,opt=0.15,/print,/pad,trange=trange)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
gp_analyse,shot,'Bandpower_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bandpower_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[1,*],data2=bp[0,*],timeax1=timeax,timeax2=timeax,blocksize=1024
return

ID='2008_08_01_1000'
shot=22375
trange=[4.514,4.524]
channel1='General/_AUG_SXR_I53_time_4.2000-5.2000'
b=[3.5,5,6,9]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
;cwt=pg_scalogram([shot],[channel1],order=36,dscale=0.001,plot=1,opt=0.15,/print,/pad,trange=trange)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
gp_analyse,shot,'Bandpower_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bandpower_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=1024
return

ID='2008_08_01_0956'
shot=22375
trange=[4.514,4.524]
channel1='General/_AUG_SXR_I53_time_4.2000-5.2000'
b=[3.5,5,6,9]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
;cwt=pg_scalogram([shot],[channel1],order=36,dscale=0.001,plot=1,opt=0.15,/print,/pad,trange=trange)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
gp_analyse,shot,'Bandpower_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bandpower_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=2048
return

ID='2008_08_01_0954'
shot=22375
trange=[4.51,4.54]
channel1='General/_AUG_SXR_I53_time_4.2000-5.2000'
b=[3.5,5,6,9]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
;cwt=pg_scalogram([shot],[channel1],order=36,dscale=0.001,plot=1,opt=0.15,/print,/pad,trange=trange)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
gp_analyse,shot,'Bandpower_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bandpower_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=2048
return

ID='2008_08_01_0950'
shot=22375
trange=[4.51,4.54]
channel1='General/_AUG_SXR_I53_time_4.2000-5.2000'
b=[3.5,5,6,9]
;stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
cwt=pg_scalogram([shot],[channel1],order=36,dscale=0.001,plot=1,opt=0.15,/print,/pad,trange=trange)
pg_anal2,cwt,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
trange=[4.514,4.524]
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
gp_analyse,shot,'Bandpower_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bandpower_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=2048
return

ID='2008_08_01_0945'
shot=22375
trange=[4.51,4.54]
channel1='General/_AUG_SXR_I53_time_4.2000-5.2000'
b=[3.5,5,6,9]
;stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
cwt=pg_scalogram([shot],[channel1],order=36,dscale=0.001,plot=1,opt=0.15,/print,/pad,trange=trange)
pg_anal2,cwt,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
gp_analyse,shot,'Bandpower_'+pg_num2str(b[0])+'-'+pg_num2str(b[1]),'Bandpower_'+pg_num2str(b[2])+'-'+pg_num2str(b[3]),trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=2048
return

ID='2008_08_01_0922'
shot=22375
trange=[4.51,4.54]
channel1='General/_AUG_SXR_I53_time_4.2000-5.2000'
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
stft=pg_spectrogram(shot,channel1,windowsize=200,masksize=1000,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
gp_sort,ID
return

ID='2008_08_01_0915'
shot=22375
trange=[4.51,4.54]
channel1='General/_AUG_SXR_I53_time_4.2000-5.2000'
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.001,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
cwt=pg_scalogram([shot],[channel1],order=36,dscale=0.001,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
gp_sort,ID
return

ID='2008_07_31_1615'
shot=71464
channel1='General/_JET_SXR_S4_010_time_15.5000_15.7000'
b=[5,8,10,13]
trange=[15.63,15.656]
;stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
cwt=pg_scalogram([shot],[channel1],order=36,dscale=0.001,plot=1,opt=0.15,/print,/pad,trange=trange)
pg_anal2,cwt,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
gp_analyse,shot,'JET_S4_010_Bandpower_5-8','JET_S4_010_Bandpower_10-13',trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=2048
return

ID='2008_07_31_1612'
shot=71464
channel1='General/_JET_SXR_S4_010_time_15.5000_15.7000'
b=[5,8,10,13]
trange=[15.63,15.656]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
gp_analyse,shot,'JET_S4_010_Bandpower_5-8','JET_S4_010_Bandpower_10-13',trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=2048
return

ID='2008_07_31_1606'
shot=71464
channel1='General/_JET_SXR_S4_010_time_15.5000_15.7000'
b=[5,8,10,13]
trange=[15.63,15.656]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
gp_analyse,shot,'JET_S4_010_Bandpower_5-8','JET_S4_010_Bandpower_10-13',trange=trange,ID=ID,data1=bp[1,*],data2=bp[0,*],timeax1=timeax,timeax2=timeax,blocksize=4096
return

ID='2008_07_31_1601'
shot=71464
channel1='General/_JET_SXR_S4_010_time_15.5000_15.7000'
b=[5,8,10,13]
trange=[15.64,15.68]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2600,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
gp_analyse,shot,'JET_S4_010_Bandpower_5-8','JET_S4_010_Bandpower_10-13',trange=trange,ID=ID,data1=bp[1,*],data2=bp[0,*],timeax1=timeax,timeax2=timeax,blocksize=4096
return

ID='2008_07_31_1539'
shot=71464
channel1='General/_JET_SXR_S4_010_time_15.5000_15.7000'
trange=[15.64,15.68]
cwt=pg_scalogram([shot],[channel1],order=36,dscale=0.001,plot=1,opt=0.15,/print,/pad,trange=trange)
gp_sort,ID
return

ID='2008_07_31_1537'
shot=71464
channel1='General/_JET_SXR_S4_010_time_15.5000_15.7000'
trange=[15.64,15.68]
cwt=pg_scalogram([shot],[channel1],order=36,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange)
gp_sort,ID
return

ID='2008_07_31_1534'
shot=71464
channel1='General/_JET_SXR_S4_010_time_15.5000_15.7000'
trange=[15.64,15.68]
cwt=pg_scalogram([shot],[channel1],order=36,dscale=0.03,plot=1,opt=0.15,/print,/pad,trange=trange)
gp_sort,ID
return

print,'ID=2008_07_31_1524'
shot=71464
channel1='General/_JET_SXR_S4_010_time_15.5000_15.7000'
trange=[15.6,15.8]
cwt=pg_scalogram([shot],[channel1],order=36,dscale=0.03,plot=1,opt=0.15,/print,/pad,trange=trange)
return

print,'ID=2008_07_31_1524'
shot=71464
channel1='General/_JET_SXR_S4_010_time_15.5000_15.7000'
trange=[15.6,15.8]
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.03,plot=1,opt=0.15,/print,/pad,trange=trange)
return

ID='2008_07_31_1354'
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
b=[7,13,15,20]
trange=[2.5,2.518]
stft=pg_spectrogram(shot,channel1,windowsize=200,masksize=1000,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0029,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
gp_analyse,shot,'I53_Bandpower_7-13','I53_Bandpower_15-20',trange=trange,ID=ID,data1=bp[1,*],data2=bp[0,*],timeax1=timeax,timeax2=timeax,blocksize=4096
return

ID='2008_07_31_1353'
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
b=[7,13,15,20]
trange=[2.5,2.518]
stft=pg_spectrogram(shot,channel1,windowsize=200,masksize=1000,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0029,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
gp_analyse,shot,'I53_Bandpower_7-13','I53_Bandpower_15-20',trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=2048
return

ID='2008_07_31_1352'
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
b=[7,13,15,20]
trange=[2.5,2.518]
stft=pg_spectrogram(shot,channel1,windowsize=200,masksize=1000,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0029,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
gp_analyse,shot,'I53_Bandpower_7-13','I53_Bandpower_15-20',trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=1024
return

ID='2008_07_31_1351'
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
b=[7,13,15,20]
trange=[2.5,2.518]
stft=pg_spectrogram(shot,channel1,windowsize=200,masksize=1000,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0029,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
gp_analyse,shot,'I53_Bandpower_7-13','I53_Bandpower_15-20',trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax,blocksize=512
return

ID='2008_07_31_1346'
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
b=[7,13,15,20]
trange=[2.5,2.518]
stft=pg_spectrogram(shot,channel1,windowsize=200,masksize=1000,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0029,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
gp_analyse,shot,'I53_Bandpower_7-13','I53_Bandpower_15-20',trange=trange,ID=ID,data1=bp[0,*],data2=bp[1,*],timeax1=timeax,timeax2=timeax
return

ID='2008_07_31_1337'
shot=20975
channel1='General/_AUG_ECE_52'
b=[5,8,10,13]
trange=[4.06,4.16]
;cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
trange=[4.13,4.134]
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0025,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1,ID=ID
gp_sort,ID
return


ID='2008_07_30_1928'
shot=20974
trange=[1.85,1.88]
channel1='General/_AUG_ECE_52'
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
;trange=[1.865,1.875]
;cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
gp_sort,ID
return

ID='2008_07_30_1928'
shot=20974
trange=[1.865,1.875]
channel1='General/_AUG_ECE_52'
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
;trange=[1.865,1.875]
;cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
gp_sort,ID
return

ID='2008_07_30_1926'
shot=20975
channel1='General/_AUG_ECE_52'
b=[5,8,10,13]
trange=[4.06,4.16]
;cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
trange=[4.13,4.134]
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0025,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1
gp_sort,ID
return

ID='2008_07_30_1924'
shot=20975
trange=[1.865,1.875]
channel1='General/_AUG_ECE_52'
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
;trange=[1.865,1.875]
;cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
gp_sort,ID
return

ID='2008_07_30_1921'
shot=20975
trange=[4.06,4.16]
channel1='General/_AUG_ECE_52'
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
;trange=[1.865,1.875]
;cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
gp_sort,ID
return

ID='2008_07_30_1900'
shot=20974
channel1='General/_AUG_SXR_I53_time_1.0000-2.0000'
b=[5,8,10,13]
trange=[1.865,1.875]
;cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
trange=[1.868,1.873]
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0025,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1
gp_sort,ID
return

ID='2008_07_30_1851'
shot=20974
channel1='General/_AUG_SXR_J53_time_1.0000-2.0000'
b=[5,8,10,13]
trange=[1.865,1.875]
;cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
trange=[1.868,1.873]
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0025,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1
gp_sort,ID
return

ID='2008_07_30_1850'
shot=20974
channel1='General/_AUG_SXR_J53_time_1.0000-2.0000'
b=[5,8,10,13]
trange=[1.865,1.875]
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
;stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,cwt,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
trange=[1.868,1.873]
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0025,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1
gp_sort,ID
return

ID='2008_07_30_1847'
shot=20974
channel1='General/_AUG_SXR_I53_time_1.0000-2.0000'
b=[5,8,10,13]
trange=[1.865,1.875]
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
;stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,cwt,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
trange=[1.868,1.873]
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0025,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1
gp_sort,ID
return

ID='2008_07_30_1846'
shot=20974
channel1='General/_AUG_SXR_I53_time_1.0000-2.0000'
b=[5,8,10,13]
trange=[1.865,1.875]
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.03,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
;stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,cwt,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
trange=[1.868,1.873]
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=5,trange=trange,shotnumber=shot,channel1=channel1
gp_sort,ID
return

ID='2008_07_30_1843'
shot=20974
channel1='General/_AUG_SXR_I53_time_1.0000-2.0000'
b=[5,8,10,13]
trange=[1.865,1.875]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
trange=[1.868,1.873]
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0025,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1
gp_sort,ID
return

ID='2008_07_30_1841'
shot=20974
channel1='General/_AUG_SXR_I53_time_1.0000-2.0000'
b=[5,8,10,13]
trange=[1.865,1.875]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
trange=[1.866,1.873]
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0025,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1
gp_sort,ID
return

ID='2008_07_30_1837'
shot=20974
trange=[1.85,1.88]
channel1='General/_AUG_SXR_I53_time_1.0000-2.0000'
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
trange=[1.865,1.875]
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
gp_sort,ID
return

ID='2008_07_30_1828'
shot=20974
channel1='General/_AUG_SXR_J53_time_1.0000-2.0000'
b=[6,7,10,13]
trange=[1.865,1.875]
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.03,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
;stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,cwt,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
;trange=[1.866,1.872]
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=5,trange=trange,shotnumber=shot,channel1=channel1
gp_sort,ID
return

;ID=2008_07_25_1431
shot=23068
channel1='General/_AUG_SXR_I53_time_2.5000-2.9000'
b=[3,5,6,11,13,20]
trange=[2.71,2.727]
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.03,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
;stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,cwt,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.01,nsegment=2,trange=trange,shotnumber=shot,channel1=channel1
return

ID='2008_07_30_1825'
shot=20974
channel1='General/_AUG_SXR_J53_time_1.0000-2.0000'
b=[6,7,10,13]
trange=[1.865,1.875]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
;trange=[1.866,1.872]
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=5,trange=trange,shotnumber=shot,channel1=channel1
gp_sort,ID
return

ID='2008_07_30_1820'
shot=20974
channel1='General/_AUG_SXR_J53_time_1.0000-2.0000'
b=[4,8,10,14]
trange=[1.865,1.875]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
trange=[1.866,1.872]
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0025,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1
gp_sort,ID
return

ID='2008_07_30_1820'
shot=20974
channel1='General/_AUG_SXR_J53_time_1.0000-2.0000'
b=[5,8,10,14]
trange=[1.865,1.875]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
trange=[1.866,1.872]
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0025,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1
gp_sort,ID
return

ID='2008_07_30_1757'
shot=20974
trange=[1.85,1.88]
channel1='General/_AUG_SXR_J53_time_1.0000-2.0000'
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
trange=[1.865,1.875]
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
gp_sort,ID
return

ID='2008_07_30_1745'
shot=20974
trange=[1.85,1.88]
channel1='General/_AUG_SXR_J54_time_1.0000-2.0000'
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
trange=[1.865,1.875]
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
gp_sort,ID
return

ID='2008_07_30_1125'
shotnumber=22157
blocksize=256
trange=[4.4849,4.491]
channel1='General/_AUG_SXR_I54_time_4.0000-5.0000'
channel2='AUG_mirnov/B31-02'
gp_analyse,shotnumber,channel1,channel2,ID=ID,trange=trange,blocksize=blocksize
channel1='General/_AUG_SXR_I58_time_4.0000-5.0000'
gp_analyse,shotnumber,channel1,channel2,ID=ID,trange=trange,blocksize=blocksize
return

ID='2008_07_29_1747'
shot=22157
trange=[4.4747,4.4947]
channel1='AUG_mirnov/B31-02'
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
channel1='General/_AUG_SXR_I54_time_4.0000-5.0000'
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
channel1='General/_AUG_SXR_I58_time_4.0000-5.0000'
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
gp_sort,ID
return


ID='2008_07_29_1352'
shotnumber=22157
blocksize=256
trange=[4.49,4.5]
channel1='General/_AUG_SXR_H51_time_4.0000-5.0000'
channel2='General/_AUG_SXR_K52_time_4.0000-5.0000'
gp_analyse,shotnumber,channel1,channel2,ID=ID,trange=trange,blocksize=blocksize
return

ID='2008_07_29_1352'
shotnumber=22157
blocksize=256
trange=[4.49,4.5]
channel1='General/_AUG_SXR_H51_time_4.0000-5.0000'
channel2='AUG_mirnov/B31-11'
gp_analyse,shotnumber,channel1,channel2,ID=ID,trange=trange,blocksize=blocksize
channel1='General/_AUG_SXR_K52_time_4.0000-5.0000'
gp_analyse,shotnumber,channel1,channel2,ID=ID,trange=trange,blocksize=blocksize
return

ID='2008_07_29_1314'
shotnumber=22157
blocksize=256
trange=[4.49,4.5]
channel1='General/_AUG_SXR_I54_time_4.0000-5.0000'
channel2='AUG_mirnov/B31-02'
gp_analyse,shotnumber,channel1,channel2,ID=ID,trange=trange,blocksize=blocksize
channel1='General/_AUG_SXR_I58_time_4.0000-5.0000'
gp_analyse,shotnumber,channel1,channel2,ID=ID,trange=trange,blocksize=blocksize
return

ID='2008_07_29_1155'
shotnumber=22157
blocksize=256
trange=[4.4848,4.4948]
channel1='General/_AUG_SXR_I58_time_4.0000-5.0000'
channel2='AUG_mirnov/B31-02'
gp_analyse,shotnumber,channel1,channel2,ID=ID,trange=trange,blocksize=blocksize
return

ID='2008_07_29_1155'
shotnumber=22157
blocksize=256
trange=[4.4848,4.4948]
channel1='General/_AUG_SXR_I54_time_4.0000-5.0000'
channel2='AUG_mirnov/B31-02'
gp_analyse,shotnumber,channel1,channel2,ID=ID,trange=trange,blocksize=blocksize
return


ID='2008_07_29_1152'
shotnumber=22157
blocksize=256
trange=[4.4747,4.4847]
channel1='General/_AUG_SXR_I54_time_4.0000-5.0000'
channel2='AUG_mirnov/B31-02'
gp_analyse,shotnumber,channel1,channel2,ID=ID,trange=trange,blocksize=blocksize
return

ID='2008_07_29_1152'
shotnumber=22157
blocksize=256
trange=[4.4747,4.4847]
channel1='General/_AUG_SXR_I58_time_4.0000-5.0000'
channel2='AUG_mirnov/B31-02'
gp_analyse,shotnumber,channel1,channel2,ID=ID,trange=trange,blocksize=blocksize
return

ID='2008_07_29_1115'
shotnumber=22157
blocksize=256
trange=[4.48,4.49]
channel1='General/_AUG_SXR_I58_time_4.0000-5.0000'
channel2='AUG_mirnov/B31-02'
gp_analyse,shotnumber,channel1,channel2,ID=ID,trange=trange,blocksize=blocksize
return

ID='2008_07_29_1112'
shotnumber=22157
blocksize=256
trange=[4.48,4.49]
channel1='General/_AUG_SXR_I64_time_4.0000-5.0000'
channel2='AUG_mirnov/B31-02'
gp_analyse,shotnumber,channel1,channel2,ID=ID,trange=trange,blocksize=blocksize
return

ID='2008_07_29_1111'
shotnumber=22157
blocksize=256
trange=[4.48,4.49]
channel1='General/_AUG_SXR_I55_time_4.0000-5.0000'
channel2='AUG_mirnov/B31-02'
gp_analyse,shotnumber,channel1,channel2,ID=ID,trange=trange,blocksize=blocksize
return

ID='2008_07_29_1110'
shotnumber=22157
blocksize=256
trange=[4.48,4.49]
channel1='General/_AUG_SXR_I54_time_4.0000-5.0000'
channel2='AUG_mirnov/B31-02'
gp_analyse,shotnumber,channel1,channel2,ID=ID,trange=trange,blocksize=blocksize
return

ID='2008_07_29_1052'
shotnumber=22157
blocksize=256
trange=[4.485,4.495]
channel1='General/_AUG_SXR_I54_time_4.0000-5.0000'
channel2='AUG_mirnov/B31-02'
gp_analyse,shotnumber,channel1,channel2,ID=ID,trange=trange,blocksize=blocksize
return

ID='2008_07_29_1050'
shotnumber=22157
blocksize=256
trange=[4.485,4.495]
channel1='General/_AUG_SXR_I54_time_4.0000-5.0000'
channel2='AUG_mirnov/B31-02'
gp_analyse,shotnumber,channel1,channel2,ID=ID,trange=trange,blocksize=blocksize
return

ID='2008_07_29_ccf_test'
shotnumber=22157
blocksize=64
trange=[4.47,4.49]
channel1='General/_AUG_ECE_55'
channel2='AUG_mirnov/B31-02'
gp_analyse,shotnumber,channel1,channel2,ID=ID,trange=trange,blocksize=blocksize
return

ID='2008_07_29_ccf_test'
shotnumber=22157
blocksize=256
trange=[4.48,4.49]
channel1='General/_AUG_SXR_I54_time_4.0000-5.0000'
channel2='AUG_mirnov/B31-02'
gp_analyse,shotnumber,channel1,channel2,ID=ID,trange=trange,blocksize=blocksize
return


ID='2008_07_28_1742'
shot=23068
trange=[2.50,2.54]
for i=53,60 do begin
channel1='General/_AUG_SXR_I'+pg_num2str(i)+'_time_2.5000-2.9000'
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
endfor
gp_sort,ID
return

ID='2008_07_28_1638'
shot=22375
trange=[4.51,4.54]
for i=56,62 do begin
channel1='General/_AUG_SXR_K'+pg_num2str(i)+'_time_4.0000-5.0000'
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
endfor
gp_sort,ID
return

ID='2008_07_28_1557'
shot=22375
trange=[4.51,4.54]
for i=53,60 do begin
channel1='General/_AUG_SXR_H'+pg_num2str(i)+'_time_4.2000-5.2000'
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
endfor
gp_sort,ID
return

ID='2008_07_28_1545'
shot=22375
trange=[4.51,4.54]
for i=53,64 do begin
channel1='General/_AUG_SXR_I'+pg_num2str(i)+'_time_4.2000-5.2000'
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
endfor
gp_sort,ID
return

;ID=2008_07_28_1523
shot=22375
trange=[4.51,4.54]
channel1='General/_AUG_SXR_I53_time_4.2000-5.2000'
cwt=pg_scalogram([shot],[channel1],order=6,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
channel1='General/_AUG_SXR_I54_time_4.2000-5.2000'
cwt=pg_scalogram([shot],[channel1],order=6,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
channel1='General/_AUG_SXR_I58_time_4.2000-5.2000'
cwt=pg_scalogram([shot],[channel1],order=6,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
channel1='General/_AUG_SXR_I59_time_4.2000-5.2000'
cwt=pg_scalogram([shot],[channel1],order=6,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
return

;ID=2008_07_28_1515
shot=22375
trange=[4.51,4.54]
channel1='General/_AUG_SXR_I53_time_4.2000-5.2000'
cwt=pg_scalogram([shot],[channel1],order=24,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
channel1='General/_AUG_SXR_I54_time_4.2000-5.2000'
cwt=pg_scalogram([shot],[channel1],order=24,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
channel1='General/_AUG_SXR_I58_time_4.2000-5.2000'
cwt=pg_scalogram([shot],[channel1],order=24,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
channel1='General/_AUG_SXR_I59_time_4.2000-5.2000'
cwt=pg_scalogram([shot],[channel1],order=24,dscale=0.01,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
return

;ID=2008_07_28_1508
shot=22375
trange=[4.52,4.53]
channel1='General/_AUG_SXR_I53_time_4.2000-5.2000'
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.03,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
channel1='General/_AUG_SXR_I54_time_4.2000-5.2000'
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.03,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
channel1='General/_AUG_SXR_I58_time_4.2000-5.2000'
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.03,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
channel1='General/_AUG_SXR_I59_time_4.2000-5.2000'
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.03,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)


return

;ID=2008_07_28_1503
shot=22375
channel1='General/_AUG_SXR_I53_time_4.2000-5.2000'
channel2='General/_AUG_SXR_I58_time_4.2000-5.2000'
trange=[4.52,4.53]
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.03,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
cwt=pg_scalogram([shot],[channel2],order=18,dscale=0.03,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
return

;ID=2008_07_28_1500
shot=22375
channel1='General/_AUG_SXR_I53_time_4.2000-5.2000'
channel2='General/_AUG_SXR_I58_time_4.2000-5.2000'
trange=[4.524,4.528]
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.03,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
cwt=pg_scalogram([shot],[channel2],order=18,dscale=0.03,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
return

;ID=2008_07_28_1454
shot=22375
channel1='General/_AUG_SXR_I53_time_4.2000-5.2000'
channel2='General/_AUG_SXR_I58_time_4.2000-5.2000'
trange=[4.24,4.28]
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.03,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
cwt=pg_scalogram([shot],[channel2],order=18,dscale=0.03,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
return

ID='2008_07_28_1052_GAM_test'
shotnumber=22243
channel1='General/_AUG_SXR_G17_time_1.0000-2.0000'
channel2='General/_AUG_SXR_G24_time_1.0000-2.0000'
blocksize=2048
trange=[1,2]
gp_analyse,shotnumber,channel1,channel2,ID=ID,trange=trange,blocksize=blocksize
return

ID='2008_07_28_1037_GAM_test'
shotnumber=22243
channel1='General/_AUG_SXR_G22_time_1.0000-2.0000'
channel2='General/_AUG_SXR_G24_time_1.0000-2.0000'
blocksize=512
trange=[1,2]
gp_analyse,shotnumber,channel1,channel2,ID=ID,trange=trange,blocksize=blocksize
return

ID='2008_07_28_1032_GAM_test'
shotnumber=22243
channel1='General/_AUG_SXR_G23_time_1.0000-2.0000'
channel2='General/_AUG_SXR_G24_time_1.0000-2.0000'
blocksize=512
trange=[1,2]
gp_analyse,shotnumber,channel1,channel2,ID=ID,trange=trange,blocksize=blocksize
return

ID='2008_07_28_1007_GAM_test'
shotnumber=22267
channel1='General/_AUG_SXR_F16_time_0.0000-5.0000'
channel2='General/_AUG_SXR_F18_time_0.0000-5.0000'
blocksize=512
trange=[2.5,3]
gp_analyse,shotnumber,channel1,channel2,ID=ID,trange=trange,blocksize=blocksize
return

ID='2008_07_28_0958_GAM_test'
shotnumber=22267
channel1='General/_AUG_SXR_F16_time_0.0000-5.0000'
channel2='General/_AUG_SXR_F18_time_0.0000-5.0000'
blocksize=512
trange=[2,3]
gp_analyse,shotnumber,channel1,channel2,ID=ID,trange=trange,blocksize=blocksize
return

ID='2008_07_28_0950_GAM_test'
shotnumber=22267
channel1='General/_AUG_SXR_F12_time_0.0000-5.0000'
channel2='General/_AUG_SXR_F24_time_0.0000-5.0000'
blocksize=512
gp_analyse,shotnumber,channel1,channel2,ID=ID,trange=trange,blocksize=blocksize
return

;ID=2008_07_25_1705
shot=22036
channel1='General/_AUG_SXR_J54_time_3.0000-3.2000'
trange=[3.112,3.1185]
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.03,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
return

;ID=2008_07_25_1703
shot=22036
channel1='General/_AUG_SXR_J54_time_3.0000-3.2000'
b=[4,8,10,13]
trange=[3.112,3.1185]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0025,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1
return

;ID=2008_07_25_1654
shot=22036
channel1='General/_AUG_SXR_J54_time_3.0000-3.2000'
trange=[3.08,3.12]
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.03,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
return

;ID=2008_07_25_1644
shot=22036
channel1='General/_AUG_SXR_J54_time_3.0000-3.2000'
b=[3,6,8,12,14,20]
trange=[3.112,3.118]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.0025,nsegment=3,trange=trange,shotnumber=shot,channel1=channel1
return

;ID=2008_07_25_1641
shot=22036
channel1='General/_AUG_SXR_J54_time_3.0000-3.2000'
b=[3,6,8,12,14,20]
trange=[3.112,3.118]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=2,trange=trange,shotnumber=shot,channel1=channel1
return

;ID=2008_07_25_1636
shot=22036
channel1='General/_AUG_SXR_J54_time_3.0000-3.2000'
b=[3,6,8,11,13,20]
trange=[3.112,3.117]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=2,trange=trange,shotnumber=shot,channel1=channel1
return

;ID=2008_07_25_1633
shot=22036
channel1='General/_AUG_SXR_J54_time_3.0000-3.2000'
b=[3,6,8,11,13,20]
trange=[3.113,3.116]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.003,nsegment=2,trange=trange,shotnumber=shot,channel1=channel1
return

;ID=2008_07_25_1630
shot=22036
channel1='General/_AUG_SXR_J54_time_3.0000-3.2000'
b=[3,6,8,11,13,20]
trange=[3.116,3.1185]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.005,nsegment=2,trange=trange,shotnumber=shot,channel1=channel1
return

;ID=2008_07_25_1624
shot=22036
channel1='General/_AUG_SXR_J54_time_3.0000-3.2000'
b=[3,6,8,11,13,20]
trange=[3.112,3.1185]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.005,nsegment=2,trange=trange,shotnumber=shot,channel1=channel1
return



;ID=2008_07_25_1605
shot=22036
channel1='General/_AUG_SXR_J54_time_3.0000-3.2000'
b=[3,6,8,11,13,20]
trange=[3.08,3.115]
stft=pg_spectrogram(shot,channel1,windowsize=512,masksize=2572,freqres=1,opt=0.2,/print,trange=trange,timeax=timeax,freqax=freqax)
pg_anal2,stft,b,plot=3,/print,bp=bp,timeax=timeax,freqax=freqax
pg_anal3_gp,bp,b,timeax=timeax,/print,plot=2,corrlength=0.005,nsegment=2,trange=trange,shotnumber=shot,channel1=channel1
return

;ID=2008_07_25_1559
shot=22036
channel1='General/_AUG_SXR_J54_time_3.0000-3.2000'
trange=[3.08,3.115]
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.03,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
return


;ID=2008_07_25_1548
shot=22036
channel1='General/_AUG_SXR_J54_time_3.0000-3.2000'
cwt=pg_scalogram([shot],[channel1],order=18,dscale=0.03,plot=1,opt=0.15,/print,/pad,trange=trange,timeax=timeax,freqax=freqax)
return
end
