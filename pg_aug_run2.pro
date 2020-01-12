;+
; Name: pg_aug_run2
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2008.12.03.
;
; Purpose: Run programs on AUG data if pg_aug_run is busy
;
; Calling sequence:
;	pg_aug_run2
;
; Input:
;
; Output:
;-

pro pg_aug_run2

;2011.07.21. Lazanyi Nora

;shift FILD-08 signal --> FILD-20
get_rawsignal,26941,'AUG_FILD/08',timeax, data

shift_data=data[7168:*]   ;shifting the data with 7168 data points

tmp_data=fltarr(n_elements(timeax))  ;make an array for the data

tmp_data[0:15992831]=shift_data

data=tmp_data

starttime=0.00
endtime=8.00
dim='V           '

save, starttime, endtime, data, filename='data/26941_AUG_FILD_20.sav'
print, n_elements(timeax)
print, n_elements(data)

return

;2011.07.20. Lazanyi Nora

;Run FILD-magnetics wavelet coherence
;In shot #26941 the data vector should be shifted with 7168 data points

;restore, filename='data/26941_AUG_FILD_09.sav'
;
;print, endtime
;
;return

get_rawsignal,26941,'AUG_FILD/09',timeax, data


shift_data=data[7168:*]   ;shifting the data with 7168 data points

tmp_data=fltarr(n_elements(timeax))  ;make an array for the data

tmp_data[0:15992831]=shift_data

data=tmp_data

starttime=0.00
endtime=8.00
dim='V           '

save, starttime, endtime, data, filename='data/26941_AUG_FILD_01.sav'
print, n_elements(timeax)
print, n_elements(data)

return

;get_rawsignal, 26941,'AUG_FILD/08',timeax,data, trange=[0.00,0.0045]
;print, data
;
;return

get_rawsignal,26941,'AUG_FILD/08',timeax, data, trange=[0.0,0.1]
i=0
x=0
while data[i] LE -0.00001 do begin
x=i
i=i+1
end
print, x

return

get_rawsignal,26941,'AUG_FILD/09',timeax,data, trange=[0.,0.1]
i=0
x=0
while data[i] GT 0 do begin
x=i
i=i+1
end
print, x

return





;2011.06.23. Lazanyi Nora

;Poloidal mode numbers
;camera J
shot=25845
chpos=[85.150,89.077,90.765,140.091,143.435,141.306,145.123]
trange=[1.93,2.03]
channels=['AUG_SXR/J_020','AUG_SXR/I_021','AUG_SXR/I_046','AUG_SXR/I_059',$
'AUG_SXR/I_060','AUG_SXR/I_084','AUG_SXR/I_085']
modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,$
  fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,paircoh=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_pol_cam_J_SXR_25845_1930_order_12_avr_5.sav'

return


;camera I
shot=25845
chpos=[52.103,55.265,58.609,62.128,$
291.097,294.074,296.866]
trange=[1.93,2.03]
channels=['AUG_SXR/I_045','AUG_SXR/I_046','AUG_SXR/I_047','AUG_SXR/I_048',$
'AUG_SXR/I_061','AUG_SXR/I_062','AUG_SXR/I_063']
modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,$
  fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,paircoh=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_pol_ch_I_SXR_25845_1930_order_12_avr_5.sav'

return

;2011.06.22. Lazanyi Nora

;Toroidal mode numbers
shot=25845
chpos=[[1.,136.45],[1.,136.45],[1.,136.45],[1.,136.45]]
trange=[1.93,2.03]
channels=[['AUG_SXR/F_016','AUG_SXR/G_016'],$
['AUG_SXR/F_017','AUG_SXR/G_017'],$
['AUG_SXR/F_018','AUG_SXR/G_018'],$
['AUG_SXR/F_019','AUG_SXR/G_019']]
modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,$
  fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_tor_SXR_25845_1930_order_12_avr_5.sav'

return

;2011.04.19. Lazanyi Nora

shot=22265
chpos=[[1.,136.45],[1.,136.45]]
trange=[1.18,1.225]
channels=[['AUG_SXR/F_018','AUG_SXR/G_018'],$
['AUG_SXR/F_020','AUG_SXR/G_020']]
modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,$
  fmax=50.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_SXR_22265_1180_order_12_avr_5.sav'

return

shot=22265
chpos=[[1.,136.45],[1.,136.45],[1.,136.45],[1.,136.45]]
trange=[1.18,1.225]
channels=[['AUG_SXR/F_018','AUG_SXR/G_018'],$
['AUG_SXR/F_020','AUG_SXR/G_020'],$
['AUG_SXR/F_021','AUG_SXR/G_021'],$
['AUG_SXR/F_022','AUG_SXR/G_022']]
modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,$
  fmax=50.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_SXR_22265_1180_order_12_avr_5.sav'

return


;2011.02.18. Lazanyi Nora

shot=23824
channels=['AUG_SXR/J_053','AUG_SXR/H_053','AUG_SXR/I_054', 'AUG_SXR/K_058',$
 'AUG_FILD/13','AUG_FILD/14','AUG_FILD/15']
chpos=[0.,0.,0.,0.,1.,1.,1.]
trange=[1.3,1.4]
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=200.,filters=[2],/cwt,$
  order=12,dscale=0.2,plot=1,paircoh=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_pairs_23824_1300_order_12_avr_5.sav'

return
;2010.10.20. Lazanyi Nora

;22265 ELMs
shot=22265
trange=[1.22,1.25]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_22265_1220_order_24_avr_5.sav'

shot=22265
trange=[1.415,1.433]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_22265_1415_order_24_avr_5.sav'

shot=22265
trange=[5.92,5.94]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_22265_5920_order_24_avr_5.sav'

;22265 pellets
shot=22265
trange=[1.18,1.225]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_22265_1180_order_24_avr_5.sav'

shot=22265
trange=[1.8915,1.899]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_22265_18915_order_24_avr_5.sav'

shot=22265
trange=[1.99,2.008]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_22265_1990_order_24_avr_5.sav'

shot=22265
trange=[2.005,2.015]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_22265_2005_order_24_avr_5.sav'

return

modenum_approx, 22188, trange=[1.864,1.873],fmax=200., /cwt, order=24, pitch_angle=0.1898, /print
save, /all, filename='data/AUG_modenum_approx_22188_1864_ord_24_10.sav'

modenum_approx, 22188, trange=[2.04,2.065],fmax=200., /cwt, order=24, pitch_angle=0.1898, /print
save, /all, filename='data/AUG_modenum_approx_22188_2040_ord_24_10.sav'

modenum_approx, 22188, trange=[2.145,2.170],fmax=200., /cwt, order=24, pitch_angle=0.1898, /print
save, /all, filename='data/AUG_modenum_approx_22188_2145_ord_24_10.sav'

modenum_approx, 22188, trange=[2.31,2.33],fmax=200., /cwt, order=24, pitch_angle=0.1898, /print
save, /all, filename='data/AUG_modenum_approx_22188_2310_ord_24_10.sav'

modenum_approx, 22188, trange=[2.358,2.37],fmax=200., /cwt, order=24, pitch_angle=0.1898, /print
save, /all, filename='data/AUG_modenum_approx_22188_2358_ord_24_10.sav'

modenum_approx, 22188, trange=[3.735,3.785],fmax=200., /cwt, order=24, pitch_angle=0.1898, /print
save, /all, filename='data/AUG_modenum_approx_22188_3735_ord_24_10.sav'

modenum_approx, 22188, trange=[3.82,3.87],fmax=200., /cwt, order=24, pitch_angle=0.1898, /print
save, /all, filename='data/AUG_modenum_approx_22188_3820_ord_24_10.sav'

modenum_approx, 22188, trange=[4.055,4.085],fmax=200., /cwt, order=24, pitch_angle=0.1898, /print
save, /all, filename='data/AUG_modenum_approx_22188_4055_ord_24_10.sav'

modenum_approx, 22188, trange=[4.395,4.415],fmax=200., /cwt, order=24, pitch_angle=0.1898, /print
save, /all, filename='data/AUG_modenum_approx_22188_4395_ord_24_10.sav'

modenum_approx, 22188, trange=[4.85,4.872],fmax=200., /cwt, order=24, pitch_angle=0.1898, /print
save, /all, filename='data/AUG_modenum_approx_22188_4850_ord_24_10.sav'

return

;2010.10.19. night Lazanyi Nora

;22188 pellets
shot=22188
trange=[1.864,1.873]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_22188_1864_order_24_avr_5.sav'

shot=22188
trange=[2.358,2.370]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_22188_2358_order_24_avr_5.sav'

shot=22188
trange=[3.735,3.785]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_22188_3735_order_24_avr_5.sav'

shot=22188
trange=[3.82,3.87]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_22188_3820_order_24_avr_5.sav'

return

;2010.10.19. Lazanyi Nora

restore, 'data/AUG_modenumbers_22188_4395_order_24_avr_5.sav'
pg_phasediagram,cphases, chpos, timeax, freqax, 4.4065, 90, shot=22188, channels=channels, filters=[8],$
filterparam1=1.,filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs
return

modenum_approx, 22188, trange=[4.395,4.415],fmax=200., /cwt, order=12, pitch_angle=0.1898, /print
save, /all, filename='data/AUG_modenum_approx_22188_4.395_ord_12.sav'

return

;2010.10.18. Lazanyi Nora

;Modenumber_slices

restore, 'data/AUG_modenumbers_19807_1770_order_24_avr_5.sav'
modenum_slices, modenum, timeax, freqax, time=1.784, freq=95,shot=19807, /print
restore,'data/AUG_modenumbers_19807_1990_order_24_avr_5.sav'
modenum_slices, modenum, timeax, freqax, time=2.004, freq=60,shot=19807, /print
restore,'data/AUG_modenumbers_19807_2175_order_24_avr_5.sav'
modenum_slices, modenum, timeax, freqax, time=2.18, freq=100,shot=19807, /print
modenum_slices, modenum, timeax, freqax, time=2.188, freq=80,shot=19807, /print
;restore,'data/AUG_modenumbers_19807_2325_order_24_avr_5.sav'
;modenum_slices, modenum, timeax, freqax, time=1.69, freq=84,shot=19807, /print
;restore,'data/AUG_modenumbers_19807_2485_order_24_avr_5.sav'
;modenum_slices, modenum, timeax, freqax, time=1.69, freq=84,shot=19807, /print
;restore,'data/AUG_modenumbers_19807_2565_order_24_avr_5.sav'
;modenum_slices, modenum, timeax, freqax, time=1.69, freq=84,shot=19807, /print
;restore,'data/AUG_modenumbers_19807_2595_order_24_avr_5.sav'
;modenum_slices, modenum, timeax, freqax, time=1.69, freq=84,shot=19807, /print
;restore, 'data/AUG_modenumbers_19807_1685_order_24_avr_5.sav'
;modenum_slices, modenum, timeax, freqax, time=1.69, freq=84,shot=19807, /print

;22188 ELMs
shot=22188
trange=[2.04,2.065]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_22188_2040_order_24_avr_5.sav'

shot=22188
trange=[2.145,2.170]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_22188_2145_order_24_avr_5.sav'

shot=22188
trange=[2.31,2.33]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_22188_2310_order_24_avr_5.sav'

shot=22188
trange=[4.055,4.085]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_22188_4055_order_24_avr_5.sav'

shot=22188
trange=[4.395,4.415]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_22188_4395_order_24_avr_5.sav'

shot=22188
trange=[4.85,4.872]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_22188_4850_order_24_avr_5.sav'

return

shot=19807
trange=[1.685,1.705]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_19807_1685_order_24_avr_5.sav'

shot=19807
trange=[1.770,1.795]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_19807_1770_order_24_avr_5.sav'

shot=19807
trange=[1.99,2.02]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_19807_1990_order_24_avr_5.sav'

shot=19807
trange=[2.175,2.195]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_19807_2175_order_24_avr_5.sav'

shot=19807
trange=[2.325,2.345]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_19807_2325_order_24_avr_5.sav'

shot=19807
trange=[2.485,2.515]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_19807_2485_order_24_avr_5.sav'

shot=19807
trange=[2.565,2.595]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_19807_2565_order_24_avr_5.sav'

shot=19807
trange=[2.595,2.62]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_19807_2595_order_24_avr_5.sav'

return

;2010.10.17. Lazanyi Nora

shot=19821
trange=[1.57,1.585]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=10.,filters=[2],/cwt,$
  order=3,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=3,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_19807_1570_order_3_avr_3_fmax_10.sav'

shot=19807
trange=[1.57,1.585]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=10.,filters=[2],/cwt,$
  order=3,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=3,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_19807_1570_order_3_avr_3_fmax_10.sav'

shot=19807
trange=[1.565,1.59]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_19807_1565_order_24_avr_5.sav'

return

;2010.09.26. Lazanyi Nora

shot=19821
trange=[1.638,1.678]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=200.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_19821_1638_order_24_avr_5.sav'

return

shot=19821
trange=[1.78,1.82]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=200.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_19821_1780_order_24_avr_5.sav'

shot=19821
trange=[2.04,2.08]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=200.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_19821_2040_order_24_avr_5.sav'

shot=19821
trange=[2.31,2.35]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=200.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_19821_2310_order_24_avr_5.sav'

shot=19821
trange=[3.39,3.43]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=200.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_19821_3390_order_24_avr_5.sav'

return



;2010.09.22. Lazanyi Nora

shot=19821
trange=[1.648,1.668]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=200.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_19821_1648_order_24_avr_5.sav'

shot=19821
trange=[1.79,1.81]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=200.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_19821_1790_order_24_avr_5.sav'

shot=19821
trange=[2.05,2.07]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=200.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_19821_2050_order_24_avr_5.sav'

shot=19821
trange=[2.32,2.34]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=200.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_19821_2320_order_24_avr_5.sav'

shot=19821
trange=[3.40,3.42]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=200.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_19821_3400_order_24_avr_5.sav'

return

shot=19821
trange=[3.17,3.19]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=200.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_19821_3170__order_24_avr_5.sav'

return

;2010.08.04. Pokol Gergo

shot=25665
trange=[3.48,3.545]
channels=['AUG_SXR/G_019','AUG_SXR/H_051','AUG_SXR/H_055','AUG_SXR/I_055',$
'AUG_SXR/J_026','AUG_SXR/J_051','AUG_SXR/J_055','AUG_SXR/K_054','AUG_SXR/K_057']
chpos=[172.021,31.4556,245.705,284.351,100.841,104.021,322.823,156.160,352.481]
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_25665_348_pol_thetastar_order_12_avr_5_pol.sav'

shot=25665
trange=[3.48,3.545]
channels=['AUG_SXR/G_019','AUG_SXR/H_051','AUG_SXR/H_055','AUG_SXR/I_055',$
'AUG_SXR/J_026','AUG_SXR/J_051','AUG_SXR/J_055','AUG_SXR/K_054','AUG_SXR/K_057']
chpos=[172.945,45.750,241.850,269.650,106.597,109.050,305.150,155.845,347.594]
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_25665_348_pol_theta_order_12_avr_5_pol.sav'

return

shot=20975
theta=[130.135-90,139.755+90,159.623-90,175.645+90,199.050-90,211.145+90]
theta_star=[30.6398,228.523,60.5352,274.379,108.996,314.719]
chpos=theta
trange=[4.09,4.19]
channels=['AUG_SXR/H_051','AUG_SXR/H_054','AUG_SXR/I_051','AUG_SXR/I_055',$
'AUG_SXR/J_051','AUG_SXR/J_054']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,$
  fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
  
save,/all,filename='data/AUG_SXR_20975_409_pol_theta_order_12_avr_5.sav'

shot=20975
theta=[130.135-90,139.755+90,159.623-90,175.645+90,199.050-90,211.145+90]
theta_star=[30.6398,228.523,60.5352,274.379,108.996,314.719]
chpos=theta_star
trange=[4.09,4.19]
channels=['AUG_SXR/H_051','AUG_SXR/H_054','AUG_SXR/I_051','AUG_SXR/I_055',$
'AUG_SXR/J_051','AUG_SXR/J_054']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,$
  fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
  
save,/all,filename='data/AUG_SXR_20975_409_pol_thetastar_order_12_avr_5.sav'

return

;2010.07.28. Lazanyi Nora

;Futtatni reggel!! Letöltés kell!!
shot=23476
trange=[3.0,3.05]
channels=['AUG_SXR/G_019','AUG_SXR/H_052','AUG_SXR/H_055','AUG_SXR/I_056',$
'AUG_SXR/J_027','AUG_SXR/J_054']
chpos=[172.945,49.755,241.850,273.577,109.574,301.145]
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=100.,filters=[2],/cwt,$
  order=6,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=3,filterparam2=[5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_pol_modenumbers_23476_3000_order_6_avr_3_pol.sav'

return

shot=23476
chpos=[[1.,136.45],[1.,136.45]]
trange=[3.0,3.05]
channels=[['AUG_SXR/F_017','AUG_SXR/G_017'],$
['AUG_SXR/F_018','AUG_SXR/G_018']]

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,$
  fmax=100.,filters=[2],/cwt,$
  order=6,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_modenumbers_23476_3000_order_6_avr_5.sav'

shot=23476
chpos=[[1.,136.45],[1.,136.45]]
trange=[3.85,3.90]
channels=[['AUG_SXR/F_017','AUG_SXR/G_017'],$
['AUG_SXR/F_018','AUG_SXR/G_018']]

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,$
  fmax=100.,filters=[2],/cwt,$
  order=6,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_modenumbers_23476_3850_order_6_avr_5.sav'

shot=23476
chpos=[[1.,136.45],[1.,136.45]]
trange=[3.0,3.05]
channels=[['AUG_SXR/F_017','AUG_SXR/G_017'],$
['AUG_SXR/F_018','AUG_SXR/G_018']]

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,$
  fmax=100.,filters=[2],/cwt,$
  order=6,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=3,filterparam2=[1,5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_modenumbers_23476_3000_order_6_avr_5.sav'

shot=23476
chpos=[[1.,136.45],[1.,136.45]]
trange=[3.85,3.90]
channels=[['AUG_SXR/F_017','AUG_SXR/G_017'],$
['AUG_SXR/F_018','AUG_SXR/G_018']]

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,$
  fmax=100.,filters=[2],/cwt,$
  order=6,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=3,filterparam2=[1,5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_modenumbers_23476_3850_order_6_avr_3.sav'

return

shot=23476
chpos=[[1.,136.45],[1.,136.45]]
trange=[3.0,3.05]
channels=[['AUG_SXR/F_017','AUG_SXR/G_017'],$
['AUG_SXR/F_018','AUG_SXR/G_018']]

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,$
  fmax=250.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_modenumbers_23476_3000_order_12_avr_5.sav'

shot=23476
chpos=[[1.,136.45],[1.,136.45]]
trange=[3.85,3.90]
channels=[['AUG_SXR/F_017','AUG_SXR/G_017'],$
['AUG_SXR/F_018','AUG_SXR/G_018']]

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,$
  fmax=250.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_modenumbers_23476_3850_order_12_avr_5.sav'

return

shot=25665
trange=[3.48,3.545]
channels=['AUG_SXR/G_019','AUG_SXR/H_051','AUG_SXR/H_055','AUG_SXR/I_055',$
'AUG_SXR/J_026','AUG_SXR/J_051','AUG_SXR/J_055','AUG_SXR/K_054','AUG_SXR/K_057']
chpos=[172.945,45.750,241.850,269.650,106.597,109.050,305.150,155.845,347.594]
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_25665_34800_order_12_avr_5_pol.sav'

return

shot=19821
trange=[3.05,3.08]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=200.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=3,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_19821_30500_pairs_order_24_avr_5_lin.sav'

shot=19821
trange=[3.07,3.098]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=200.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=3,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_19821_30700_pairs_order_24_avr_5_lin.sav'

return

shot=19821
trange=[3.05,3.08]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=24,dscale=0.05,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_19821_30500_pairs_order_24_avr_5.sav'

shot=19821
trange=[3.07,3.098]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=24,dscale=0.05,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_19821_30700_pairs_order_24_avr_5.sav'

return

restore,'data/AUG_modenumbers_23418_33200_pairs_order_3_avr_3_mn_frac_without_02_03.sav'
pg_phasediagram,cphases, chpos, timeax, freqax, 3.324, 1.8, shot=23418, channels=channels, filters=[8],$
filterparam1=0.1,filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.324, 2, shot=23418, channels=channels, filters=[8],$
filterparam1=0.1,filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.324, 2.5, shot=23418, channels=channels, filters=[8],$
filterparam1=0.1,filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.326, 1.8, shot=23418, channels=channels, filters=[8],$
filterparam1=0.1,filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.326, 2, shot=23418, channels=channels, filters=[8],$
filterparam1=0.1,filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.326, 2.5, shot=23418, channels=channels, filters=[8],$
filterparam1=0.1,filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
return

shot=23418
trange=[3.32,3.33]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=10.,filters=[2],/cwt,$
  order=3,dscale=0.02,plot=1,/print,cohlim=0.4,powlim=0.2,$
  opt=0.25,avr=3,filterparam1=0.1,filterparam2=[5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_23418_33200_pairs_order_3_avr_3_mn_frac_without_02_03.sav'

return

restore,'data/AUG_modenumbers_23418_33200_pairs_order_3_avr_3_mn_frac.sav'
modenum_slices, modenum, timeax, freqax, time=3.324, freq=1.8, shot=23418, /print
return

restore,'data/AUG_modenumbers_23418_33200_pairs_order_3_avr_3_mn_frac.sav'
pg_phasediagram, modenum, cphases, chpos, timeax, freqax, 3.324, 1.8, shot=23418, channels=channels, filters=[8],$
filterparam1=0.1,filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
return

restore,'data/AUG_modenumbers_23418_33200_pairs_order_3_avr_3_mn_frac.sav'
pg_phasediagram,cphases, chpos, timeax, freqax, 3.324, 1.8, shot=23418, channels=channels, filters=[8],$
filterparam1=0.1,filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.324, 2, shot=23418, channels=channels, filters=[8],$
filterparam1=0.1,filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.324, 2.5, shot=23418, channels=channels, filters=[8],$
filterparam1=0.1,filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.326, 1.8, shot=23418, channels=channels, filters=[8],$
filterparam1=0.1,filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.326, 2, shot=23418, channels=channels, filters=[8],$
filterparam1=0.1,filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.326, 2.5, shot=23418, channels=channels, filters=[8],$
filterparam1=0.1,filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
return

shot=23418
trange=[3.32,3.33]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=10.,filters=[2],/cwt,$
  order=3,dscale=0.02,plot=1,/print,cohlim=0.4,powlim=0.2,$
  opt=0.25,avr=3,filterparam1=0.1,filterparam2=[5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_23418_33200_pairs_order_3_avr_3_mn_frac.sav'

return

;2010.07.27. Lazanyi Nora

shot=19821
trange=[3.05,3.08]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.05,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_19821_30500_pairs_order_12_avr_5.sav'

shot=19821
trange=[3.07,3.098]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.05,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_19821_30700_pairs_order_12_avr_5.sav'

return

restore,'data/AUG_modenumbers_23418_33200_pairs_order_3_avr_3.sav'
pg_phasediagram,cphases, chpos, timeax, freqax, 3.324, 1.8, shot=23418, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.324, 2, shot=23418, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.324, 2.5, shot=23418, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.326, 1.8, shot=23418, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.326, 2, shot=23418, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.326, 2.5, shot=23418, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
return

restore, 'data/AUG_SXR_22036_2220_pol_order_12_avr_5.sav'
pg_phasediagram,cphases, chpos, timeax, freqax, 2.245, 12, shot=22036, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 2.255, 8, shot=22036, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 2.265, 5, shot=22036, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 2.265, 13, shot=22036, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 2.27, 7, shot=22036, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 2.25, 27, shot=22036, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 2.26, 25, shot=22036, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 2.27, 28, shot=22036, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 2.28, 22, shot=22036, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 2.285, 22, shot=22036, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs

return

;First poloidal mode numbers
shot=22036
chpos=[45.750,245.777, 73.550,273.577,109.050,109.574,309.077,156.777]
trange=[2.22,2.30]
channels=['AUG_SXR/H_051','AUG_SXR/H_056','AUG_SXR/I_051','AUG_SXR/I_056',$
'AUG_SXR/J_051','AUG_SXR/J_027','AUG_SXR/J_056','AUG_SXR/K_058']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,$
  fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
  
save,/all,filename='data/AUG_SXR_22036_2220_pol_order_12_avr_5.sav'

return

;2010.07.26. Lazanyi Nora

shot=19821
trange=[3.0568,3.0758]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.05,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_19821_30568_pairs_order_12_avr_5.sav'

return

shot=19821
trange=[3.0568,3.0758]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=3,dscale=0.02,plot=1,/print,cohlim=0.4,powlim=0.2,$
  opt=0.25,avr=3,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_19821_30568_pairs_order_3_avr_3.sav'

return

shot=19821
trange=[3.0658,3.0668]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=250.,filters=[2],/cwt,$
  order=3,dscale=0.02,plot=1,/print,cohlim=0.4,powlim=0.2,$
  opt=0.25,avr=3,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_19821_30658_pairs_order_3_avr_3.sav'

return

shot=23418
trange=[3.32,3.33]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=10.,filters=[2],/cwt,$
  order=3,dscale=0.02,plot=1,/print,cohlim=0.4,powlim=0.2,$
  opt=0.25,avr=3,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_23418_33200_pairs_order_3_avr_3.sav'

return

shot=23418
trange=[3.3235,3.3265]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=100.,filters=[2],/cwt,$
  order=3,dscale=0.02,plot=1,/print,cohlim=0.4,powlim=0.2,$
  opt=0.25,avr=3,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_23418_33235_pairs_order_3_avr_3.sav'

return

shot=23418
trange=[3.3235,3.3265]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=100.,filters=[2],/cwt,$
  order=6,dscale=0.02,plot=1,/print,cohlim=0.4,powlim=0.2,$
  opt=0.25,avr=3,filterparam2=[5,10,20],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_23418_33235_pairs.sav'

return

shot=23418
trange=[3.3239,3.3256]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=100.,filters=[2],/cwt,$
  order=6,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=3,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_23418_33239_test2.sav'

return

;2010.07.23. Lazanyi Nora

shot=23418
trange=[3.3234,3.3244]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=100.,filters=[2],/cwt,$
  order=6,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=3,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_23418_33234.sav'

return

restore, 'data/AUG_SXR_F17_G17_modenumbers_22036_2220_ord_12_avr_5_mode_6_Q_1_5_10_20.sav'
pg_phasediagram,cphases, chpos, timeax, freqax, 2.26, 8, shot=22036, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 2.26, 11, shot=22036, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 2.27, 10, shot=22036, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs

return

;2010.07.22. Lazanyi Nora

shot=23068
chpos=[[1.,136.45],[1.,136.45]]
trange=[2.48,2.54]
channels=[['General/_AUG_SXR_F_017','General/_AUG_SXR_G_017'],$
['General/_AUG_SXR_F_018','General/_AUG_SXR_G_018']]

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,$
  fmax=250.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
return

;2010.07.19. Lazanyi Nora

restore, 'data/AUG_SXR_F17_G17_modenumbers_22036_3180_ord_12_avr_5_mode_6_Q_5_10_20.sav'
pg_phasediagram,cphases, chpos, timeax, freqax, 3.2, 6, shot=22036, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs

return

restore, 'data/AUG_SXR_F17_G17_modenumbers_22036_2220_ord_12_avr_5_mode_6_Q_1_5_10_20.sav'
pg_phasediagram,cphases, chpos, timeax, freqax, 2.26, 28, shot=22036, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 2.265, 27, shot=22036, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 2.27, 30, shot=22036, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs

return

;2010.07.16. Lazanyi Nora

shot=22036
chpos=[1.,136.45]
trange=[2.95,3.05]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22036_2950_ord_12_avr_5_mode_6_Q_1_5_10_20.sav'

shot=22036
chpos=[1.,136.45]
trange=[3.04,3.14]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22036_3040_ord_12_avr_5_mode_6_Q_1_5_10_20.sav'

shot=22036
chpos=[1.,136.45]
trange=[3.22,3.32]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22036_3220_ord_12_avr_5_mode_6_Q_1_5_10_20.sav'

shot=22036
chpos=[1.,136.45]
trange=[3.32,3.41]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22036_3320_ord_12_avr_5_mode_6_Q_1_5_10_20.sav'

return

;2010.07.07. Lazanyi Nora

shot=25665
chpos=[[1.,136.45],[1.,136.45],[1.,136.45]]
trange=[2.22,2.30]
channels=[['General/_AUG_SXR_F17_time_2.0000-4.0000','General/_AUG_SXR_G17_time_2.0000-4.0000'],$
['General/_AUG_SXR_F18_time_2.0000-4.0000','General/_AUG_SXR_G18_time_2.0000-4.0000'],$
['General/_AUG_SXR_F19_time_2.0000-4.0000','General/_AUG_SXR_G19_time_2.0000-4.0000']]

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,$
  fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=3,filterparam2=[1,5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F_G_17-19_modenumbers_25665_2220_ord_12_avr_3_mode_6_Q_1_5_10_20.sav'

shot=25665
chpos=[[1.,136.45],[1.,136.45],[1.,136.45]]
trange=[2.35,2.42]
channels=[['General/_AUG_SXR_F17_time_2.0000-4.0000','General/_AUG_SXR_G17_time_2.0000-4.0000'],$
['General/_AUG_SXR_F18_time_2.0000-4.0000','General/_AUG_SXR_G18_time_2.0000-4.0000'],$
['General/_AUG_SXR_F19_time_2.0000-4.0000','General/_AUG_SXR_G19_time_2.0000-4.0000']]

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,$
  fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=3,filterparam2=[5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F_G_17-19_modenumbers_25665_2350_ord_12_avr_3_mode_6_Q_1_5_10_20.sav'

shot=25665
chpos=[[1.,136.45],[1.,136.45],[1.,136.45]]
trange=[3.40,3.47]
channels=[['General/_AUG_SXR_F17_time_2.0000-4.0000','General/_AUG_SXR_G17_time_2.0000-4.0000'],$
['General/_AUG_SXR_F18_time_2.0000-4.0000','General/_AUG_SXR_G18_time_2.0000-4.0000'],$
['General/_AUG_SXR_F19_time_2.0000-4.0000','General/_AUG_SXR_G19_time_2.0000-4.0000']]

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,$
  fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=3,filterparam2=[5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F_G_17-19_modenumbers_25665_3400_ord_12_avr_3_mode_6_Q_1_5_10_20.sav'

shot=25665
chpos=[[1.,136.45],[1.,136.45],[1.,136.45]]
trange=[3.32,3.42]
channels=[['General/_AUG_SXR_F17_time_2.0000-4.0000','General/_AUG_SXR_G17_time_2.0000-4.0000'],$
['General/_AUG_SXR_F18_time_2.0000-4.0000','General/_AUG_SXR_G18_time_2.0000-4.0000'],$
['General/_AUG_SXR_F19_time_2.0000-4.0000','General/_AUG_SXR_G19_time_2.0000-4.0000']]

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,$
  fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=3,filterparam2=[5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F_G_17-19_modenumbers_25665_3320_ord_12_avr_3_mode_6_Q_1_5_10_20.sav'

return

shot=22036
chpos=[1.,136.45]
trange=[2.0,2.09]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22036_2000_ord_12_avr_5_mode_6_Q_1_5_10_20.sav'

shot=22036
chpos=[1.,136.45]
trange=[2.08,2.20]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22036_2080_ord_12_avr_5_mode_6_Q_1_5_10_20.sav'

shot=22036
chpos=[1.,136.45]
trange=[2.16,2.23]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22036_2160_ord_12_avr_5_mode_6_Q_1_5_10_20.sav'

shot=22036
chpos=[1.,136.45]
trange=[2.22,2.3]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22036_2220_ord_12_avr_5_mode_6_Q_1_5_10_20.sav'

shot=22036
chpos=[1.,136.45]
trange=[3.74,3.84]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22036_3740_ord_12_avr_5_mode_6_Q_1_5_10_20.sav'

return


;2010.07.06. Lazanyi Nora

shot=25740
trange=[2.75,2.8]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_25740_2750_2800.sav'

return

shot=25740
trange=[2.94,2.975]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_25740_2940.sav'

return

;2010.06.04. Lazanyi Nora

restore,'data/AUG_SXR_F17_G17_modenumbers_22036_3180_ord_12_avr_5_mode_6_Q_5_10_20.sav
pg_phasediagram,cphases, chpos, timeax, freqax, 3.208, 14, shot=22036, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.208, 25, shot=22036, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.208, 40, shot=22036, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.20, 5, shot=22036, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.203, 4.4, shot=22036, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
return

shot=22036
chpos=[1.,136.45]
trange=[3.18,3.22]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22036_3180_ord_12_avr_5_mode_6_Q_5_10_20.sav'

return

shot=22382
chpos=[[1.,136.45],[1.,136.45]]
trange=[2.395,2.435]
channels=[['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000'],$
['General/_AUG_SXR_F18_time_0.0000-6.0000','General/_AUG_SXR_G18_time_0.0000-6.0000']]

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_F18_G18_modenumbers_22382_2395_ord_12.sav'

return


;2010.06.03. Lazanyi Nora

shot=25665
chpos=[[1.,136.45],[1.,136.45],[1.,136.45]]
trange=[3.48,3.545]
channels=[['General/_AUG_SXR_F17_time_2.0000-4.0000','General/_AUG_SXR_G17_time_2.0000-4.0000'],$
['General/_AUG_SXR_F18_time_2.0000-4.0000','General/_AUG_SXR_G18_time_2.0000-4.0000'],$
['General/_AUG_SXR_F19_time_2.0000-4.0000','General/_AUG_SXR_G19_time_2.0000-4.0000']]

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,$
  fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=3,filterparam2=[5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F_G_17_18_19_modenumbers_25665_3480_ord_12_Q_5_10_20_avr_3.sav'

return


shot=25665
chpos=[[1.,136.45],[1.,136.45],[1.,136.45]]
trange=[3.48,3.545]
channels=[['General/_AUG_SXR_F17_time_2.0000-4.0000','General/_AUG_SXR_G17_time_2.0000-4.0000'],$
['General/_AUG_SXR_F18_time_2.0000-4.0000','General/_AUG_SXR_G18_time_2.0000-4.0000'],$
['General/_AUG_SXR_F19_time_2.0000-4.0000','General/_AUG_SXR_G19_time_2.0000-4.0000']]

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,$
  fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F_G_17_18_19_modenumbers_25665_3480_ord_12_Q_5_10_20.sav'

return


shot=25665
chpos=[[1.,136.45],[1.,136.45],[1.,136.45]]
trange=[3.48,3.545]
channels=[['General/_AUG_SXR_F17_time_2.0000-4.0000','General/_AUG_SXR_G17_time_2.0000-4.0000'],$
['General/_AUG_SXR_F18_time_2.0000-4.0000','General/_AUG_SXR_G18_time_2.0000-4.0000'],$
['General/_AUG_SXR_F19_time_2.0000-4.0000','General/_AUG_SXR_G19_time_2.0000-4.0000']]

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,$
  fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[5],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F_G_17_18_19_modenumbers_25665_3480_ord_12.sav'

return

shot=25665
chpos=[[1.,136.45],[1.,136.45]]
trange=[3.48,3.545]
channels=[['General/_AUG_SXR_F17_time_2.0000-4.0000','General/_AUG_SXR_G17_time_2.0000-4.0000'],$
['General/_AUG_SXR_F18_time_2.0000-4.0000','General/_AUG_SXR_G18_time_2.0000-4.0000']]

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,$
  fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[5],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F_G_17_18_modenumbers_25665_3480_ord_12.sav'

return

shot=25665
chpos=[[1.,136.45],[1.,136.45],[1.,136.45],[1.,136.45],[1.,136.45]]
trange=[3.48,3.545]
channels=[['General/_AUG_SXR_F16_time_2.0000-4.0000','General/_AUG_SXR_G16_time_2.0000-4.0000'],$
['General/_AUG_SXR_F17_time_2.0000-4.0000','General/_AUG_SXR_G17_time_2.0000-4.0000'],$
['General/_AUG_SXR_F18_time_2.0000-4.0000','General/_AUG_SXR_G18_time_2.0000-4.0000'],$
['General/_AUG_SXR_F19_time_2.0000-4.0000','General/_AUG_SXR_G19_time_2.0000-4.0000'],$
['General/_AUG_SXR_F20_time_2.0000-4.0000','General/_AUG_SXR_G20_time_2.0000-4.0000']]

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,$
  fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[5],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F_G_16_20_modenumbers_25665_3480_ord_12.sav'

return

shot=22036
chpos=[1.,136.45]
trange=[3.18,3.22]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[5],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22036_3180_ord_12_avr_5_mode_6.sav'

return

shot=22377
trange=[3.50,3.545]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_22377_sawtooth_3500.sav'

return

shot=25665
chpos=[[136.45,1.],[136.45,1.],[136.45,1.],[136.45,1.],[136.45,1.]]
trange=[3.455,3.535]
channels=[['General/_AUG_SXR_F16_time_2.0000-4.0000','General/_AUG_SXR_G16_time_2.0000-4.0000'],$
['General/_AUG_SXR_F17_time_2.0000-4.0000','General/_AUG_SXR_G17_time_2.0000-4.0000'],$
['General/_AUG_SXR_F18_time_2.0000-4.0000','General/_AUG_SXR_G18_time_2.0000-4.0000'],$
['General/_AUG_SXR_F19_time_2.0000-4.0000','General/_AUG_SXR_G19_time_2.0000-4.0000'],$
['General/_AUG_SXR_F20_time_2.0000-4.0000','General/_AUG_SXR_G20_time_2.0000-4.0000']]

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[5],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F_G_16_20_modenumbers_25665_3.455_ord_12.sav'

return

;2010.05.26. Lazanyi Nora

shot=22377
chpos=[[136.45,1.],[136.45,1.]]
trange=[3.50,3.545]
channels=[['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000'],$
['General/_AUG_SXR_F18_time_0.0000-6.0000','General/_AUG_SXR_G18_time_0.0000-6.0000']]

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=3,filterparam2=[1,5,10,20],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_F18_G18_modenumbers_22377_3500_deg_ok_ord_12_avr_3_Q_1_5_10_20.sav'

return

restore,'data/AUG_SXR_F17_G17_F18_G18_modenumbers_22377_3500_deg_ok_ord_12_avr_3.sav'

pg_phasediagram,cphases, chpos, timeax, freqax, 3.52, 7, shot=22377, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.53, 4, shot=22377, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.511, 3.8, shot=22377, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.515, 3.8, shot=22377, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.516, 3.7, shot=22377, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
return

;2010.04.21. Lazanyi Nora

shot=22036
chpos=[136.45,1.]
trange=[3.18,3.22]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[5],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22036_3180_deg_ok_ord_12_avr_5_mode_6.sav'

shot=22382
chpos=[[136.45,1.],[136.45,1.]]
trange=[2.395,2.43]
channels=[['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000'],$
['General/_AUG_SXR_F18_time_0.0000-6.0000','General/_AUG_SXR_G18_time_0.0000-6.0000']]

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[5],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_F18_G18_modenumbers_22382_2395_deg_ok_ord_12.sav'

return

shot=22036
chpos=[136.45,1.]
trange=[3.18,3.22]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange, fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[5],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22036_3180_deg_ok_ord_12_avr_5_mode_6.sav'

return

;2010.04.18. Lazanyi Nora

shot=22377
chpos=[[136.45,1.],[136.45,1.]]
trange=[3.50,3.545]
channels=[['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000'],$
['General/_AUG_SXR_F18_time_0.0000-6.0000','General/_AUG_SXR_G18_time_0.0000-6.0000']]

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=3,filterparam2=[1,5],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_F18_G18_modenumbers_22377_3500_deg_ok_ord_12_avr_3.sav'

return

shot=22377
chpos=[[136.45,1.],[136.45,1.]]
trange=[3.50,3.545]
channels=[['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000'],$
['General/_AUG_SXR_F18_time_0.0000-6.0000','General/_AUG_SXR_G18_time_0.0000-6.0000']]

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=6,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_F18_G18_modenumbers_22377_3500_deg_ok_ord_6.sav'

return

;2010.04.15. Lazanyi Nora

shot=22375
chpos=[[136.45,1.],[136.45,1.]]
trange=[3.50,3.555]
channels=[['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000'],$
['General/_AUG_SXR_F18_time_0.0000-6.0000','General/_AUG_SXR_G18_time_0.0000-6.0000']]

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_F18_G18_modenumbers_22375_3500_deg_ok_ord_12.sav'

shot=22374
chpos=[[136.45,1.],[136.45,1.]]
trange=[3.285,3.37]
channels=[['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000'],$
['General/_AUG_SXR_F18_time_0.0000-6.0000','General/_AUG_SXR_G18_time_0.0000-6.0000']]

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_F18_G18_modenumbers_22374_3285_deg_ok_ord_12.sav'

shot=22374
chpos=[[136.45,1.],[136.45,1.]]
trange=[3.42,3.50]
channels=[['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000'],$
['General/_AUG_SXR_F18_time_0.0000-6.0000','General/_AUG_SXR_G18_time_0.0000-6.0000']]

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_F18_G18_modenumbers_22374_3420_deg_ok_ord_12.sav'

shot=22377
chpos=[[136.45,1.],[136.45,1.]]
trange=[3.50,3.545]
channels=[['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000'],$
['General/_AUG_SXR_F18_time_0.0000-6.0000','General/_AUG_SXR_G18_time_0.0000-6.0000']]

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_F18_G18_modenumbers_22377_3500_deg_ok_ord_12.sav'

return

shot=22382
chpos=[[136.45,1.],[136.45,1.]]
trange=[2.395,2.43]
channels=[['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000'],$
['General/_AUG_SXR_F18_time_0.0000-6.0000','General/_AUG_SXR_G18_time_0.0000-6.0000']]

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_F18_G18_modenumbers_22382_2395_deg_135.45_ord_12.sav'

return

shot=22382
chpos=[136.45,1.]
trange=[2.395,2.43]
channels=[['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000'],['General/_AUG_SXR_F18_time_0.0000-6.0000','General/_AUG_SXR_G18_time_0.0000-6.0000']]

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange, fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_F18_G17_G18_modenumbers_22382_2395_deg_ok_ord_12_avr_5_mode_6.sav'

return

shot=22382
chpos=[136.45,1.]
trange=[2.395,2.43]
channels=['General/_AUG_SXR_F18_time_0.0000-6.0000','General/_AUG_SXR_G18_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange, fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F18_G18_modenumbers_22382_2395_deg_ok_ord_12_avr_5_mode_6.sav'

return

shot=22382
chpos=[136.45,1.]
trange=[2.395,2.43]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange, fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22382_2395_deg_ok_ord_12_avr_5_mode_6.sav'

return

shot=22377
chpos=[136.45,1.]
trange=[3.50,3.54]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange, fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22377_3500_deg_ok_ord_12_avr_5_mode_6.sav'

return

shot=22377
chpos=[136.45,1.]
trange=[3.50,3.54]
channels=['General/_AUG_SXR_F18_time_0.0000-6.0000','General/_AUG_SXR_G18_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange, fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F18_G18_modenumbers_22377_3500_deg_ok_ord_12_avr_5_mode_6.sav'

return

;2010.04.09. Lazanyi Nora

restore, 'data/AUG_SXR_F17_G17_modenumbers_22036_3180_deg_ok_ord_12_avr_5_mode_6.sav'
pg_phasediagram,cphases, chpos, timeax, freqax, 3.208, 11, shot=22036, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.208, 22, shot=22036, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.208, 35, shot=22036, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.20, 5, shot=22036, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.203, 5.5, shot=22036, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
return

shot=22036
chpos=[136.45,1.]
trange=[3.18,3.22]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange, fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22036_3180_deg_ok_ord_12_avr_5_mode_6.sav'

return

restore, 'data/AUG_SXR_F17_G17_modenumbers_22375_3500_deg_ok_ord_12_avr_10.sav'
pg_phasediagram,cphases, chpos, timeax, freqax, 3.54, 6, shot=22375, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.54, 12, shot=22375, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.54, 18, shot=22375, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.54, 7, shot=22375, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.54, 13, shot=22375, channels=channels, filters=[8],$
filterparam2=[-6,6], /print, cpows=cpows, cohs=cohs
return

restore, 'data/AUG_SXR_F17_G17_modenumbers_22375_3500_deg_ok_ord_12_avr_10.sav'
pg_phasediagram,cphases, chpos, timeax, freqax, 3.54, 6, shot=22375, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.54, 12, shot=22375, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.54, 18, shot=22375, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.54, 7, shot=22375, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.54, 13, shot=22375, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs

return

shot=22375
chpos=[136.45,1.]
trange=[3.50,3.55]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=6,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=10,filterparam2=[1],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22375_3500_deg_ok_ord_6_avr_10_mode_6.sav'

shot=22375
chpos=[136.45,1.]
trange=[3.50,3.55]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=3,filterparam2=[1],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22375_3500_deg_ok_ord_12_avr_5_mode_6.sav'

return

;2010.04.08. Lazanyi Nora

shot=22375
chpos=[136.45,1.]
trange=[3.50,3.55]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=10,filterparam2=[1],filterparam3=6,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22375_3500_deg_ok_ord_12_avr_10_mode_6.sav'

return

restore,'data/AUG_SXR_F18_G18_modenumbers_22375_3500_deg_ok_ord_12_avr_10.sav'
pg_phasediagram,cphases, chpos, timeax, freqax, 3.528, 10, shot=22375, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.53, 9, shot=22375, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.528, 8, shot=22375, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.53, 20, shot=22375, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.52, 5.5, shot=22375, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.514, 5.5, shot=22375, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs
return

restore, 'data/AUG_SXR_F17_G17_modenumbers_22375_3500_deg_ok_ord_12_avr_10.sav'
pg_phasediagram,cphases, chpos, timeax, freqax, 3.517, 6, shot=22375, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.512, 6, shot=22375, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs
return

restore, 'data/AUG_SXR_F17_G17_modenumbers_22375_3500_deg_ok_ord_12_avr_10.sav'
pg_phasediagram,cphases, chpos, timeax, freqax, 3.511, 120, shot=22375, channels=channels, filters=[8],$
filterparam1=0.1, filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs
return

restore, 'data/AUG_SXR_F17_G17_modenumbers_22375_3500_deg_ok_ord_12_avr_10.sav'
pg_phasediagram,cphases, chpos, timeax, freqax, 3.53, 20, shot=22375, channels=channels, filters=[8],$
filterparam1=0.1, filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs
return

restore, 'data/AUG_SXR_F17_G17_modenumbers_22375_3500_deg_ok_ord_12_avr_10.sav'

pg_phasediagram,cphases, chpos, timeax, freqax, 3.528, 10, shot=22375, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.53, 9, shot=22375, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.534, 20, shot=22375, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.53, 20, shot=22375, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.511, 120, shot=22375, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.511, 130, shot=22375, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs

shot=22375
chpos=[136.45,1.]
trange=[3.50,3.55]
channels=['General/_AUG_SXR_F18_time_0.0000-6.0000','General/_AUG_SXR_G18_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=10,filterparam2=[1],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F18_G18_modenumbers_22375_3500_deg_ok_ord_12_avr_10.sav'

return

shot=22375
chpos=[136.45,1.]
trange=[3.50,3.55]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=10,filterparam2=[1],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22375_3500_deg_ok_ord_12_avr_10.sav'

return

;shot=22374
;chpos=[136.45,1.]
;trange=[3.42,3.50]
;channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

;modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,filters=[2],/cwt,$
;  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
;  opt=0.1,avr=5,filterparam2=[1,5],filterparam3=10,$
;  timeax=timeax, freqax=freqax,$
;  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
;  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
;  )
;
;save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22375_3500_deg_ok_ord_12.sav'

;return

shot=22375
chpos=[136.45,1.]
trange=[3.50,3.55]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22375_3500_deg_ok_ord_12.sav'

return

;2010.04.04. Lazanyi Nora

shot=22375
chpos=[1.,2.]
trange=[3.74,3.765]
channels=['General/_AUG_SXR_G17_time_0.0000-6.0000','General/_AUG_SXR_G18_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_G17_G18_modenumbers_22375_3740_deg_1_ord_12_all_fq.sav'

return

shot=22375
chpos=[1.,2.]
trange=[3.74,3.765]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_F18_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_F18_modenumbers_22375_3740_deg_1_ord_12_all_fq.sav'

return

shot=22375
chpos=[1.,2.]
trange=[3.50,3.55]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_F18_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_F18_modenumbers_22375_3525_deg_1_ord_12_all_fq.sav'

return

shot=22375
chpos=[1.,2.]
trange=[3.525,3.55]
channels=['General/_AUG_SXR_G17_time_0.0000-6.0000','General/_AUG_SXR_G18_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_G17_G18_modenumbers_22375_3525_deg_1_ord_12_all_fq.sav'

return

shot=22374
chpos=[1.,2.]
trange=[3.47,3.49]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_F18_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_F18_modenumbers_22374_3470_deg_1_ord_12_all_fq.sav'

return

shot=22374
chpos=[1.,2.]
trange=[3.47,3.49]
channels=['General/_AUG_SXR_G17_time_0.0000-6.0000','General/_AUG_SXR_G18_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_G17_G18_modenumbers_22374_3470_deg_1_ord_12_all_fq.sav'

return

shot=22374
chpos=[1.,2.]
trange=[3.335,3.355]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_F18_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_F18_modenumbers_22374_3335_deg_1_ord_12_all_fq.sav'

return

shot=22374
chpos=[1.,2.]
trange=[3.335,3.355]
channels=['General/_AUG_SXR_G17_time_0.0000-6.0000','General/_AUG_SXR_G18_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_G17_G18_modenumbers_22374_3335_deg_1_ord_12_all_fq.sav'

return


;2010.04.01. Lazanyi Nora

shot=22374
chpos=[1.,2.]
trange=[3.28,3.36]
channels=['General/_AUG_SXR_G17_time_0.0000-6.0000','General/_AUG_SXR_G18_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_G17_G18_modenumbers_22374_3328_deg_1_ord_12_all_fq.sav'

return

shot=22374
chpos=[1.,136.45]
trange=[3.28,3.36]
channels=['General/_AUG_SXR_F18_time_0.0000-6.0000','General/_AUG_SXR_G18_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange, fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F18_G18_modenumbers_22374_3328_deg_135.45_ord_12_old.sav'

return

;2010.03.31. Lazanyi Nora

shot=22374
chpos=[1.,136.45]
trange=[3.28,3.36]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange, fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22374_3328_deg_135.45_ord_12.sav'

shot=22374
chpos=[1.,136.45]
trange=[3.28,3.36]
channels=['General/_AUG_SXR_F18_time_0.0000-6.0000','General/_AUG_SXR_G18_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange, fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F18_G18_modenumbers_22374_3328_deg_135.45_ord_12.sav'

return

;2010.03.29. Lazanyi Nora

shot=22374
chpos=[1.,136.45]
trange=[3.28,3.36]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_F18_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_F18_modenumbers_22374_3328_deg_135.45_ord_12_fmax_250.sav'

return

shot=22374
chpos=[1.,136.45]
trange=[3.28,3.36]
channels=['General/_AUG_SXR_G17_time_0.0000-6.0000','General/_AUG_SXR_G18_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange, fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_G17_G18_modenumbers_22374_3328_deg_135.45_ord_12.sav'

return

shot=22374
chpos=[1.,136.45]
trange=[3.28,3.36]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_F18_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange, fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_F18_modenumbers_22374_3328_deg_135.45_ord_12.sav'

return

;2010.03.26 Lazanyi Nora

restore,'data/AUG_SXR_F17_G17_F18_G18_modenumbers_22374_3328_deg_135.45_ord_24.sav'

pg_phasediagram,cphases, chpos, timeax, freqax, 3.31, 120, shot=22374, channels=channels, filters=[8],$
filterparam2=[-20,20], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.325, 130, shot=22374, channels=channels, filters=[8],$
filterparam2=[-20,20], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.30, 41, shot=22374, channels=channels, filters=[8],$
filterparam2=[-20,20], /print, cpows=cpows, cohs=cohs
pg_phasediagram,cphases, chpos, timeax, freqax, 3.31, 42, shot=22374, channels=channels, filters=[8],$
filterparam2=[-20,20], /print, cpows=cpows, cohs=cohs

shot=22375
chpos=[[1.,136.45],[1.,136.45]]
trange=[3.50,3.55]
channels=[['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000'],$
['General/_AUG_SXR_F18_time_0.0000-6.0000','General/_AUG_SXR_G18_time_0.0000-6.0000']]

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange, fmax=250.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.15,avr=5,filterparam2=[1,5],filterparam3=15,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_F18_G18_modenumbers_22375_3500_deg_135.45_ord_12.sav'

return

;2010.03.25. Lazanyi Nora

restore,'data/AUG_SXR_F17_G17_F18_G18_modenumbers_22374_3328_deg_135.45_ord_24.sav'

pg_phasediagram,cphases, chpos, timeax, freqax, 3.338, 120, shot=22374, channels=channels, filters=[8],$
filterparam2=[-20,20], /print, cpows=cpows, cohs=cohs

return

shot=22374
chpos=[[1.,136.45],[1.,136.45]]
trange=[3.28,3.36]
channels=[['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000'],$
['General/_AUG_SXR_F18_time_0.0000-6.0000','General/_AUG_SXR_G18_time_0.0000-6.0000']]

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange, fmax=250.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.15,avr=5,filterparam2=[1,5],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_F18_G18_modenumbers_22374_3328_deg_135.45_ord_24.sav'

return

shot=22374
chpos=[[1.,136.45],[1.,136.45]]
trange=[3.28,3.36]
channels=[['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000'],$
['General/_AUG_SXR_F18_time_0.0000-6.0000','General/_AUG_SXR_G18_time_0.0000-6.0000']]

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange, fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_F18_G18_modenumbers_22374_3328_deg_135.45_ord_12.sav'

return

shot=22374
chpos=[[1.,136.45],[1.,136.45]]
trange=[3.28,3.36]
channels=[['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000'],$
['General/_AUG_SXR_F18_time_0.0000-6.0000','General/_AUG_SXR_G18_time_0.0000-6.0000']]

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange, fmax=100.,filters=[2],/cwt,$
  order=6,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_F18_G18_modenumbers_22374_3328_deg_135.45_ord_6_new.sav'

return

shot=22377
trange=[4.31,4.32]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=150.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_22377_4310.sav'

return

restore, 'data/AUG_SXR_F17_G17_F18_G18_modenumbers_22374_3330_deg_135.45_ord_6.sav'

pg_phasediagram,cphases, chpos, timeax, freqax, 3.34, 12, shot=22374, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs

return

;2010.03.24. Lazanyi Nora

restore, 'data/AUG_SXR_F17_G17_F18_G18_modenumbers_22374_3330_deg_135.45_ord_6.sav'

pg_phasediagram,cphases, chpos, timeax, freqax, 3.342, 4, shot=22374, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs

return

shot=22374
chpos=[[1.,136.45],[1.,136.45]]
trange=[3.33,3.355]
channels=[['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000'],$
['General/_AUG_SXR_F18_time_0.0000-6.0000','General/_AUG_SXR_G18_time_0.0000-6.0000']]

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange, fmax=100.,filters=[2],/cwt,$
  order=6,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_F18_G18_modenumbers_22374_3330_deg_135.45_ord_6.sav'

return


;2010.02.25. Lazanyi Nora

shot=22377
trange=[4.305,4.325]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_22377_4305.sav'

shot=22377
trange=[4.54,4.56]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_22377_4540.sav'

shot=22377
trange=[4.907,4.927]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_22377_4907.sav'

return

;2010.02.12. Lazanyi Nora

restore, 'data/AUG_SXR_F17_G17_modenumbers_22036_3190_deg_135.45_ord_6.sav'

pg_phasediagram,cphases, chpos, timeax, freqax, 3.2, 18, shot=22036, channels=channels, filters=[8],$
filterparam1=0.1,filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs

pg_phasediagram,cphases, chpos, timeax, freqax, 3.203, 6, shot=22036, channels=channels, filters=[8],$
filterparam1=0.1,filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs

return

shot=22036
chpos=[1.,136.45]
trange=[3.19,3.21]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange, fmax=100.,filters=[2],/cwt,$
  order=6,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22036_3190_deg_135.45_ord_6.sav'

return

restore, 'data/AUG_SXR_F17_G17_modenumbers_22036_3190_deg_136.45.sav'

pg_phasediagram,cphases, chpos, timeax, freqax, 3.2, 18, shot=22036, channels=channels, filters=[8],$
filterparam1=0.1,filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs

pg_phasediagram,cphases, chpos, timeax, freqax, 3.203, 6, shot=22036, channels=channels, filters=[8],$
filterparam1=0.1,filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs

return

;2010.02.11. Lazanyi Nora

shot=22036
chpos=[1.,137.45]
trange=[3.19,3.21]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange, fmax=100.,filters=[2],/cwt,$
  order=6,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[1,5],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22036_3190_deg_136.45.sav'

return

shot=22036
chpos=[1.,138.45]
trange=[3.13,3.23]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange, fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[0.1,1,5],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22036_3130_deg_137.45.sav'

shot=22036
chpos=[1.,135.45]
trange=[3.13,3.23]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange, fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[0.1,1,5],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22036_3130_deg_134.45.sav'

return


shot=22036
chpos=[1.,137.45]
trange=[3.13,3.23]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange, fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam2=[0.1,1,5],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22036_3130_deg_136.45.sav'

return

shot=22036
chpos=[1.,136.57]
trange=[3.13,3.23]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange, fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[1,5],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22036_4370_deg_135.57.sav'

shot=22036
chpos=[1.,136.37]
trange=[3.13,3.23]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange, fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[1,5],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22036_4370_deg_135.37.sav'

return

restore, 'data/AUG_SXR_F17_G17_modenumbers_22036_4370_deg_135.77.sav'

pg_phasediagram,cphases, chpos, timeax, freqax, 3.195, 7, shot=22036, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs

pg_phasediagram,cphases, chpos, timeax, freqax, 3.2, 6, shot=22036, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs

pg_phasediagram,cphases, chpos, timeax, freqax, 3.183, 30, shot=22036, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs

return

shot=22036
chpos=[1.,136.77]
trange=[3.13,3.23]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange, fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam2=[1,5],filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22036_4370_deg_135.77.sav'

return

restore, 'data/AUG_SXR_F17_G17_modenumbers_22036_4370_avr_5.sav'

pg_phasediagram,cphases, chpos, timeax, freqax, 3.195, 7, shot=22036, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs

pg_phasediagram,cphases, chpos, timeax, freqax, 3.2, 6, shot=22036, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs

pg_phasediagram,cphases, chpos, timeax, freqax, 3.183, 30, shot=22036, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs

return

shot=22036
chpos=[1.,136.7]
trange=[3.13,3.23]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange, fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22036_4370_avr_5.sav'

return

;2010.02.09. Lazanyi Nora

restore, 'data/AUG_SXR_F17_G17_modenumbers_22036_3130_avr_5.sav'

pg_phasediagram,cphases, chpos, timeax, freqax, 3.183, 6.5, shot=22036, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs

return

;2010.02.08. Lazanyi Nora

restore, 'data/AUG_SXR_F17_G17_modenumbers_22036_3198_avr_5.sav'

pg_phasediagram,cphases, chpos, timeax, freqax, 3.208, 25, shot=22036, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs

pg_phasediagram,cphases, chpos, timeax, freqax, 3.208, 40, shot=22036, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs

restore, 'data/AUG_SXR_F17_G17_modenumbers_22036_3130_avr_5.sav'

pg_phasediagram,cphases, chpos, timeax, freqax, 3.208, 12, shot=22036, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs

pg_phasediagram,cphases, chpos, timeax, freqax, 3.208, 30, shot=22036, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs

shot=22036
chpos=[1.,136.45]
trange=[3.875,3.895]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange, fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.04,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.5,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22036_3875_avr_5.sav'

shot=22036
chpos=[1.,136.45]
trange=[4.37,4.39]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange, fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.04,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.5,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22036_4370_avr_5.sav'

return

restore, 'data/AUG_SXR_F17_G17_modenumbers_22036_3198_avr_5.sav'

pg_phasediagram,cphases, chpos, timeax, freqax, 3.208, 12, shot=22036, channels=channels, filters=[8],$
filterparam2=[-20,20], /print, cpows=cpows, cohs=cohs

return

shot=22036
chpos=[1.,136.45]
trange=[3.13,3.23]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange, fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.04,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.5,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22036_3130_avr_5.sav'

return


shot=22036
chpos=[1.,136.45]
trange=[3.198,3.218]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange, fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.04,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.5,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22036_3198_avr_5.sav'

return

;2010.02.02. Lazanyi Nora

shot=22036
chpos=[1.,136.45]
trange=[3.,3.5]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange, fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.04,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.5,avr=3,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22036_300_avr_3.sav'

return


shot=22036
chpos=[1.,136.45]
trange=[3.13,3.25]
channels=['General/_AUG_SXR_F17_time_0.0000-6.0000','General/_AUG_SXR_G17_time_0.0000-6.0000']

modenum=pg_modenumber_full(shot, channels=channels, chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_SXR_F17_G17_modenumbers_22036_313.sav'

return


;2009.12.07. Lazanyi Nora

restore, 'data/AUG_modenumbers_22375_4516_probe_12_13.sav'

pg_phasediagram,cphases, chpos, timeax, freqax, 4.525, 9, shot=22375, channels=channels, filters=[8],$
filterparam2=[-20,20], /print, cpows=cpows, cohs=cohs

return

shot=22375
trange=[4.516,4.536]
pg_probe_sets,8,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_22375_4516_probe_12_13.sav'

return

restore, 'data/AUG_modenumbers_22375_4516_probe_12_13.sav'

pg_phasediagram,cphases, chpos, timeax, freqax, 4.525, 9, shot=22375, channels=channels, filters=[8],$
filterparam2=[-20,20], /print, cpows=cpows, cohs=cohs

return

shot=22375
trange=[4.516,4.536]
pg_probe_sets,8,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=100.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

save,/all,filename='data/AUG_modenumbers_22375_4516_probe_12_13.sav'

;pg_phasediagram,cphases, chpos, timeax, freqax, t, f, shot=22375, channels=channels, filters=[8],$
;filterparam2=[-20,20], /print, cpows=cpows, cohs=cohs
return

;2009.11.02. Lazanyi Nora

shot=22382
trange=[4.375,4.395]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=3,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
  
save,/all,filename='data/AUG_modenumbers_22382_4385_probe_03_avr_3.sav'

shot=22382
trange=[4.375,4.395]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=10,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
  
save,/all,filename='data/AUG_modenumbers_22382_4385_probe_03_avr_10.sav'

shot=22382
trange=[4.375,4.395]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=6,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
  
save,/all,filename='data/AUG_modenumbers_22382_4385_probe_03_order_6.sav'

shot=22382
trange=[4.375,4.395]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=24,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
  
save,/all,filename='data/AUG_modenumbers_22382_4385_probe_03_order_24.sav'

return

;2009.09.20. Lazanyi Nora

restore, 'data/AUG_modenumbers_22382_4773_probe_03.sav'

for i=107,118 do begin
f=(107+i)/2.0
for j=75,99 do begin
t=4.77+j/10000.0

pg_phasediagram,cphases, chpos, timeax, freqax, t, f, shot=22382, channels=channels, filters=[8],$
filterparam2=[-20,20], /print, cpows=cpows, cohs=cohs

endfor
endfor
return

pg_phasediagram,cphases, chpos, timeax, freqax, 4.7792, 110, shot=22382, channels=channels, filters=[8],$
filterparam2=[-20,20], /print, cpows=cpows, cohs=cohs

;2009.09.10. Lazanyi Nora

restore, 'data/AUG_modenumbers_22382_4773_probe_03.sav'

pg_phasediagram,cphases, chpos, timeax, freqax, 4.7837, 80, shot=22382, channels=channels, filters=[8],$
filterparam2=[-20,20], /print, cpows=cpows, cohs=cohs

return

pg_phasediagram,cphases, chpos, timeax, freqax, 4.7837, 90, shot=22382, channels=channels, filters=[8],$
filterparam2=[-20,20], /print, cpows=cpows, cohs=cohs

pg_phasediagram,cphases, chpos, timeax, freqax, 4.7792, 110, shot=22382, channels=channels, filters=[8],$
filterparam2=[-20,20], /print, cpows=cpows, cohs=cohs

return

;2009.08.28. Lazanyi Nora

restore, 'data/AUG_modenumbers_22382_4773_probe_03.sav'

pg_phasediagram,cphases, chpos, timeax, freqax, 4.7792, 111.5, shot=22382, channels=channels, filters=[8],$
filterparam2=[-20,20], /print, cpows=cpows, cohs=cohs

return

restore, 'data/AUG_modenumbers_22382_4773_probe_03.sav'

amplitudes=pg_ballooning(transforms, chpos,timeax, freqax, 4.7837, 90, shot=22382,$
channels=channels,plot=1,/print)

amplitudes=pg_ballooning(transforms, chpos,timeax, freqax, 4.7792, 110, shot=22382,$
channels=channels,plot=1,/print)

restore, 'data/AUG_modenumbers_22382_4773_probe_03.sav'

pg_phasediagram,cphases, chpos, timeax, freqax, 4.7837, 90, shot=22382, channels=channels, filters=[8],$
filterparam2=[-20,20], /print, cpows=cpows, cohs=cohs

pg_phasediagram,cphases, chpos, timeax, freqax, 4.7792, 110, shot=22382, channels=channels, filters=[8],$
filterparam2=[-20,20], /print, cpows=cpows, cohs=cohs

return

restore, 'data/AUG_modenumbers_22382_4385_probe_03.sav'

pg_phasediagram,cphases, chpos, timeax, freqax, 4.3847, 100, shot=22382, channels=channels, filters=[8],$
filterparam2=[-20,20], /print, cpows=cpows, cohs=cohs

pg_phasediagram,cphases, chpos, timeax, freqax, 4.381, 60, shot=22382, channels=channels, filters=[8],$
filterparam2=[-20,20], /print, cpows=cpows, cohs=cohs

restore, 'data/AUG_modenumbers_22382_4385_probe_03.sav'

amplitudes=pg_ballooning(transforms, chpos,timeax, freqax, 4.3847, 100, shot=22382,$
channels=channels,plot=1,/print)

amplitudes=pg_ballooning(transforms, chpos,timeax, freqax, 4.381, 60, shot=22382,$
channels=channels,plot=1,/print)

return

;2009.08.18. Lazanyi Nora

restore,'data/AUG_modenumbers_22375_4504_probe_03.sav'

pg_phasediagram,cphases, chpos, timeax, freqax, 4.514, 100, shot=22375, channels=channels, filters=[8],$
filterparam2=[-20,20], /print, cpows=cpows, cohs=cohs

restore,'data/AUG_modenumbers_22375_4504_probe_03.sav'

amplitudes=pg_ballooning(transforms, chpos,timeax, freqax, 4.514, 100, shot=22375,$
channels=channels,plot=1,/print)

return

shot=22382
trange=[4.375,4.395]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
  
save,/all,filename='data/AUG_modenumbers_22382_4385_probe_03.sav'

shot=22382
trange=[4.972,4.992]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
  
save,/all,filename='data/AUG_modenumbers_22382_4972_probe_03.sav'

return

restore, 'data/AUG_modenumbers_22382_4773_probe_03.sav'

pg_phasediagram,cphases, chpos, timeax, freqax, 4.790, 10.4, shot=22382, channels=channels, filters=[8],$
filterparam2=[-20,20], /print, cpows=cpows, cohs=cohs

return

restore, 'data/AUG_modenumbers_22382_4773_probe_03.sav'

amplitudes=pg_ballooning(transforms, chpos,timeax, freqax, 4.779, 110, shot=22382,$
channels=channels,plot=1,/print)

amplitudes=pg_ballooning(transforms, chpos,timeax, freqax, 4.786, 80, shot=22382,$
channels=channels,plot=1,/print)

amplitudes=pg_ballooning(transforms, chpos,timeax, freqax, 4.777, 80, shot=22382,$
channels=channels,plot=1,/print)

amplitudes=pg_ballooning(transforms, chpos,timeax, freqax, 4.788, 10.2, shot=22382,$
channels=channels,plot=1,/print)

amplitudes=pg_ballooning(transforms, chpos,timeax, freqax, 4.783, 90, shot=22382,$
channels=channels,plot=1,/print)

return

restore, 'data/AUG_modenumbers_22382_4773_probe_03.sav'

pg_phasediagram,cphases, chpos, timeax, freqax, 4.779, 110, shot=22382, channels=channels, filters=[8],$
filterparam2=[-20,20], /print, cpows=cpows, cohs=cohs

pg_phasediagram,cphases, chpos, timeax, freqax, 4.786, 80, shot=22382, channels=channels, filters=[8],$
filterparam2=[-20,20], /print, cpows=cpows, cohs=cohs

pg_phasediagram,cphases, chpos, timeax, freqax, 4.777, 80, shot=22382, channels=channels, filters=[8],$
filterparam2=[-20,20], /print, cpows=cpows, cohs=cohs

pg_phasediagram,cphases, chpos, timeax, freqax, 4.788, 10.2, shot=22382, channels=channels, filters=[8],$
filterparam2=[-20,20], /print, cpows=cpows, cohs=cohs

pg_phasediagram,cphases, chpos, timeax, freqax, 4.783, 90, shot=22382, channels=channels, filters=[8],$
filterparam2=[-20,20], /print, cpows=cpows, cohs=cohs

return

restore,'data/AUG_modenumbers_22375_4504_probe_03.sav'

amplitudes=pg_ballooning(transforms, chpos,timeax, freqax, 4.514, 100, shot=22375,$
channels=channels,plot=1,/print)

return

;2009.08.13. Lazanyi Nora

shot=22382
trange=[4.773,4.793]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
  
save,/all,filename='data/AUG_modenumbers_22382_4773_probe_03.sav'

return

restore,'data/AUG_modenumbers_22375_4504_probe_03.sav'

pg_phasediagram,cphases, chpos, timeax, freqax, 4.521, 90, shot=22375, channels=channels, filters=[8],$
filterparam2=[-20,20], /print, cpows=cpows, cohs=cohs

return

restore,'data/AUG_modenumbers_22375_4504_probe_03.sav'

pg_phasediagram,cphases, chpos, timeax, freqax, 4.514, 100, shot=22375, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs
amplitudes=pg_ballooning(transforms, chpos,timeax, freqax, 4.514, 100, shot=22375,$
channels=channels,plot=1,/print)

pg_phasediagram,cphases, chpos, timeax, freqax, 4.511, 80, shot=22375, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs
amplitudes=pg_ballooning(transforms, chpos,timeax, freqax, 4.511, 80, shot=22375,$
channels=channels,plot=1,/print)

pg_phasediagram,cphases, chpos, timeax, freqax, 4.519, 10.4, shot=22375, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs
amplitudes=pg_ballooning(transforms, chpos,timeax, freqax, 4.519, 10.4, shot=22375,$
channels=channels,plot=1,/print)


return

shot=22375
trange=[4.504,4.524]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
  
save,/all,filename='data/AUG_modenumbers_22375_4504_probe_03.sav'

return

;2009.08.12. Lazanyi Nora

shot=22375
trange=[4.307,4.319]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=20,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
  
save,/all,filename='data/AUG_modenumbers_22375_4307_probe_03.sav'

shot=22375
trange=[4.507,4.521]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=20,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
  
save,/all,filename='data/AUG_modenumbers_22375_4507_probe_03.sav'

shot=22375
trange=[4.707,4.721]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=20,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
  
save,/all,filename='data/AUG_modenumbers_22375_4707_probe_03.sav'

shot=22375
trange=[4.908,4.922]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=20,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
  
save,/all,filename='data/AUG_modenumbers_22375_4908_probe_03.sav'

return

;2009.08.11. Lazanyi Nora

shot=22382
trange=[4.765,4.78]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=48,dscale=0.1,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=20,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
  
save,/all,filename='data/AUG_modenumbers_22382_4765_probe_03_order_48.sav'

return


shot=22382
trange=[4.765,4.78]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=24,dscale=0.1,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.1,avr=5,filterparam3=20,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
  
save,/all,filename='data/AUG_modenumbers_22382_4765_probe_03_order_24.sav'

return

restore, 'data/AUG_modenumbers_22375_4484_probe_03_avr_10.sav'

pg_phasediagram,cphases, chpos, timeax, freqax, 4.490, 90, shot=22375, channels=channels, filters=[8],$
filterparam2=[-20,20], /print, cpows=cpows, cohs=cohs
amplitudes=pg_ballooning(transforms, chpos,timeax, freqax, 4.490, 90, shot=22375,$
channels=channels,plot=1,/print)

pg_phasediagram,cphases, chpos, timeax, freqax, 4.499, 84, shot=22375, channels=channels, filters=[8],$
filterparam2=[-20,20], /print, cpows=cpows, cohs=cohs
amplitudes=pg_ballooning(transforms, chpos,timeax, freqax, 4.499, 84, shot=22375,$
channels=channels,plot=1,/print)


shot=22382
trange=[4.765,4.78]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=6,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=20,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
  
save,/all,filename='data/AUG_modenumbers_22382_4765_probe_03_order_6.sav'

shot=22382
trange=[4.765,4.78]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=3,filterparam3=20,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
  
save,/all,filename='data/AUG_modenumbers_22382_4765_probe_03_avr_3.sav'

shot=22382
trange=[4.765,4.78]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=10,filterparam3=20,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
  
save,/all,filename='data/AUG_modenumbers_22382_4765_probe_03_avr_10.sav'

return

;2009.08.09. Lazanyi Nora

shot=22375
trange=[4.484,4.504]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=6,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=20,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_22375_4484_probe_03_order_6.sav'

shot=22375
trange=[4.484,4.504]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=3,filterparam3=20,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_22375_4484_probe_03_avr_3.sav'

shot=22375
trange=[4.484,4.504]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=10,filterparam3=20,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_22375_4484_probe_03_avr_10.sav'

return

restore, 'data/AUG_modenumbers_22375_4484_probe_03.sav'

amplitudes=pg_ballooning(transforms, chpos,timeax, freqax, 4.495, 90, shot=22375,$
channels=channels,plot=1,/print)

restore, 'data/AUG_modenumbers_22382_4765.sav'

amplitudes=pg_ballooning(transforms, chpos,timeax, freqax, 4.772, 80, shot=22382,$
channels=channels,plot=1,/print)

amplitudes=pg_ballooning(transforms, chpos,timeax, freqax, 4.7695, 6, shot=22382,$
channels=channels,plot=1,/print)

return

shot=22375
trange=[4.484,4.504]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=20,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_22375_4484_probe_03.sav'

return

;2009.08.04. Lazanyi Nora

shot=22382
trange=[4.765,4.78]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
  
save,/all,filename='data/AUG_modenumbers_22382_4765_probe_03.sav'


return


restore, 'data/AUG_modenumbers_22382_4765.sav'

amplitudes=pg_ballooning(transforms, chpos,timeax, freqax, 4.768, 6, shot=22382,$
channels=channels,plot=1,/print)
return

pg_phasediagram,cphases, chpos, timeax, freqax, 4.768, 6, shot=22382, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs

pg_phasediagram,cphases, chpos, timeax, freqax, 4.77, 8, shot=22382, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs

pg_phasediagram,cphases, chpos, timeax, freqax, 4.772, 6, shot=22382, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs

pg_phasediagram,cphases, chpos, timeax, freqax, 4.774, 7, shot=22382, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs

pg_phasediagram,cphases, chpos, timeax, freqax, 4.767, 80, shot=22382, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs

pg_phasediagram,cphases, chpos, timeax, freqax, 4.7695, 80, shot=22382, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs

pg_phasediagram,cphases, chpos, timeax, freqax, 4.777, 80, shot=22382, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs

restore, 'data/AUG_modenumbers_22375_4484.sav'
pg_phasediagram,cphases, chpos, timeax, freqax, 4.495, 90, shot=22375, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs

pg_phasediagram,cphases, chpos, timeax, freqax, 4.494, 92, shot=22375, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs

pg_phasediagram,cphases, chpos, timeax, freqax, 4.491, 90, shot=22375, channels=channels, filters=[8],$
filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs

return

;2009.08.03. Lazanyi Nora

shot=22375
trange=[4.484,4.504]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_22375_4484.sav'

return

restore, 'data/AUG_modenumbers_22382_4765.sav'

pg_phasediagram,cphases, chpos, timeax, freqax, 4.767, 80, shot=22382, channels=channels, filters=[8],$
filterparam2=[-7,7], /print, cpows=cpows, cohs=cohs

pg_phasediagram,cphases, chpos, timeax, freqax, 4.7695, 80, shot=22382, channels=channels, filters=[8],$
filterparam2=[-7,7], /print, cpows=cpows, cohs=cohs

pg_phasediagram,cphases, chpos, timeax, freqax, 4.777, 80, shot=22382, channels=channels, filters=[8],$
filterparam2=[-7,7], /print, cpows=cpows, cohs=cohs

return

pg_phasediagram,cphases, chpos, timeax, freqax, 4.768, 6, shot=22382, channels=channels, filters=[8],$
filterparam1=filterparam1, filterparam2=filterparam2, /print, cpows=cpows, cohs=cohs

pg_phasediagram,cphases, chpos, timeax, freqax, 4.77, 8, shot=22382, channels=channels, filters=[8],$
filterparam1=filterparam1, filterparam2=filterparam2, /print, cpows=cpows, cohs=cohs

pg_phasediagram,cphases, chpos, timeax, freqax, 4.772, 6, shot=22382, channels=channels, filters=[8],$
filterparam1=filterparam1, filterparam2=filterparam2, /print, cpows=cpows, cohs=cohs

pg_phasediagram,cphases, chpos, timeax, freqax, 4.774, 7, shot=22382, channels=channels, filters=[8],$
filterparam1=filterparam1, filterparam2=filterparam2, /print, cpows=cpows, cohs=cohs

pg_phasediagram,cphases, chpos, timeax, freqax, 4.767, 80, shot=22382, channels=channels, filters=[8],$
filterparam1=filterparam1, filterparam2=filterparam2, /print, cpows=cpows, cohs=cohs

pg_phasediagram,cphases, chpos, timeax, freqax, 4.7695, 80, shot=22382, channels=channels, filters=[8],$
filterparam1=filterparam1, filterparam2=filterparam2, /print, cpows=cpows, cohs=cohs

pg_phasediagram,cphases, chpos, timeax, freqax, 4.777, 80, shot=22382, channels=channels, filters=[8],$
filterparam1=filterparam1, filterparam2=filterparam2, /print, cpows=cpows, cohs=cohs

return

;2009.08.01. Lazanyi Nora

shot=22382
trange=[4.765,4.78]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_22382_4765.sav'

return


shot=22375
trange=[4.486,4.502]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_22375_4486.sav'

return

restore, 'data/AUG_modenumbers_22375_490.sav'
pg_phasediagram,cphases, chpos, timeax, freqax, 4.495, 90, shot=22375, channels=channels, filters=[8],$
filterparam1=filterparam1, filterparam2=filterparam2, /print, cpows=cpows, cohs=cohs
amplitudes=pg_ballooning(transforms, chpos,timeax, freqax, 4.495, 90, shot=22375,$
channels=channels,plot=1,/print)

pg_phasediagram,cphases, chpos, timeax, freqax, 4.494, 92, shot=22375, channels=channels, filters=[8],$
filterparam1=filterparam1, filterparam2=filterparam2, /print, cpows=cpows, cohs=cohs
amplitudes=pg_ballooning(transforms, chpos,timeax, freqax, 4.494, 92, shot=22375,$
channels=channels,plot=1,/print)

pg_phasediagram,cphases, chpos, timeax, freqax, 4.491, 90, shot=22375, channels=channels, filters=[8],$
filterparam1=filterparam1, filterparam2=filterparam2, /print, cpows=cpows, cohs=cohs
amplitudes=pg_ballooning(transforms, chpos,timeax, freqax, 4.491, 90, shot=22375,$
channels=channels,plot=1,/print)

return

shot=22375
trange=[4.49,4.498]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_22375_490.sav'

return


;2009.07.28. Lazanyi Nora

restore, 'data/AUG_modenumbers_22375_4518.sav'
pg_phasediagram,cphases, chpos, timeax, freqax, 4.524, 10, shot=22375, channels=channels, filters=[8,9],$
filterparam1=filterparam1, filterparam2=filterparam2, /print, cpows=cpows, cohs=cohs
amplitudes=pg_ballooning(transforms, chpos,timeax, freqax, 4.524, 10, shot=22375,$
channels=channels,plot=1,/print)

return

shot=22375
trange=[4.518,4.533]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_22375_4518.sav'


return

shot=22375
trange=[4.522,4.529]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=600.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_22375_4522.sav'

return


;2009.07.27. Lazanyi Nora

shot=22375
trange=[4.5125,4.515]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_22375_451.sav'

return


;2009.07.21. Lazanyi Nora

shot=20040
trange=[2.918,2.92]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=500.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=2,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_20040_2918.sav'

return

shot=20040
trange=[2.951,2.956]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=300.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=3,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_20040_4_2951.sav'

return

; 2008.12.03.

shot=23068
trange=[2.5,2.54]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1],/cwt,$
  order=18,dscale=0.05,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=3,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_23068_4_254_q.sav'

shot=22375
trange=[4.49,4.54]
pg_probe_sets,5,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1],/cwt,$
  order=18,dscale=0.05,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=3,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_22375_449_5_q.sav'

return

; 2008.12.02.

shot=23068
trange=[2.5,2.54]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1],/cwt,$
  order=18,dscale=0.1,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_23068_4_254_q.sav'

shot=23068
trange=[2.5,2.54]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1],/cwt,$
  order=36,dscale=0.1,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_23068_4_254_long_q.sav'

return

shot=23068
trange=[2.5,2.54]
pg_probe_sets,5,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1],/cwt,$
  order=18,dscale=0.1,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_23068_25_254_q.sav'

shot=23068
trange=[2.5,2.54]
pg_probe_sets,5,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1],/cwt,$
  order=36,dscale=0.1,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_23068_25_254_long_q.sav'

return

shot=22375
trange=[4.49,4.54]
pg_probe_sets,5,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1],/cwt,$
  order=36,dscale=0.1,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_22375_449_5_long_q.sav'

shot=22375
trange=[4.49,4.54]
pg_probe_sets,5,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1],/cwt,$
  order=12,dscale=0.1,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=2,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_22375_449_5_q.sav'

return

; 2008.11.28.
shot=18931
trange=[3.24,3.29]
pg_probe_sets,6,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1],/cwt,$
  order=12,dscale=0.1,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=30,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_18931_324_6_long_q_modes30.sav'

shot=18931
trange=[3.24,3.29]
pg_probe_sets,6,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1],/cwt,$
  order=12,dscale=0.1,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=2,filterparam3=30,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_18931_324_6_q_modes30.sav'

return

; 2008.11.27.
shot=18931
trange=[1.91,1.96]
pg_probe_sets,6,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1],/cwt,$
  order=12,dscale=0.1,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_18931_191_6_long_q.sav'

shot=18931
trange=[2.64,2.69]
pg_probe_sets,6,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1],/cwt,$
  order=12,dscale=0.1,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_18931_264_6_long_q.sav'

shot=18931
trange=[2.84,2.89]
pg_probe_sets,6,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1],/cwt,$
  order=12,dscale=0.1,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_18931_284_6_long_q.sav'

shot=18931
trange=[3.04,3.09]
pg_probe_sets,6,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1],/cwt,$
  order=12,dscale=0.1,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_18931_304_6_long_q.sav'

shot=18931
trange=[3.24,3.29]
pg_probe_sets,6,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1],/cwt,$
  order=12,dscale=0.1,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_18931_324_6_long_q.sav'

shot=18931
trange=[3.28,3.33]
pg_probe_sets,6,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1],/cwt,$
  order=12,dscale=0.1,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_18931_328_6_long_q.sav'

return

; 2008.11.25.
shot=18931
trange=[1.94,1.95]
pg_probe_sets,6,channels=channels,chpos=chpos,shot=18931
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1],/cwt,$
  order=12,dscale=0.1,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_18931_194_3_long_q.sav'

shot=18931
trange=[1.94,1.95]
pg_probe_sets,6,channels=channels,chpos=chpos,shot=18931
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1],/cwt,$
  order=12,dscale=0.1,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_18931_194_3_long_q.sav'

shot=18931
trange=[2.66,2.67]
pg_probe_sets,6,channels=channels,chpos=chpos,shot=18931
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1],/cwt,$
  order=12,dscale=0.1,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_18931_266_3_long_q.sav'

shot=18931
trange=[3.35,3.36]
pg_probe_sets,6,channels=channels,chpos=chpos,shot=18931
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1],/cwt,$
  order=12,dscale=0.1,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_18931_335_3_long_q.sav'

return

shot=23913
trange=[2.842,2.852]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=23913
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1],/cwt,$
  order=12,dscale=0.1,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_23913_2842_3_long_q.sav'

shot=23913
trange=[2.853,2.863]
pg_probe_sets,4,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1],/cwt,$
  order=12,dscale=0.1,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_23913_2853_3_long_q.sav'

shot=23913
trange=[3.339,3.349]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=23913
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1],/cwt,$
  order=12,dscale=0.1,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_23913_3339_3_long_q.sav'

shot=18931
trange=[1.94,1.95]
pg_probe_sets,6,channels=channels,chpos=chpos,shot=18931
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1],/cwt,$
  order=12,dscale=0.1,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_18931_194_3_long_q.sav'

shot=18931
trange=[1.94,1.95]
pg_probe_sets,6,channels=channels,chpos=chpos,shot=18931
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1],/cwt,$
  order=12,dscale=0.1,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_18931_194_3_long_q.sav'

shot=18931
trange=[2.66,2.67]
pg_probe_sets,6,channels=channels,chpos=chpos,shot=18931
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1],/cwt,$
  order=12,dscale=0.1,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_18931_266_3_long_q.sav'

shot=18931
trange=[3.35,3.36]
pg_probe_sets,6,channels=channels,chpos=chpos,shot=18931
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1],/cwt,$
  order=12,dscale=0.1,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_18931_335_3_long_q.sav'

return

shot=23913
trange=[2.842,2.852]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=23913
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1],/cwt,$
  order=12,dscale=0.1,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_23913_2842_3_long_q.sav'

shot=23913
trange=[2.853,2.863]
pg_probe_sets,3,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1],/cwt,$
  order=12,dscale=0.1,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_23913_2853_3_long_q.sav'

shot=23913
trange=[3.339,3.349]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=23913
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1],/cwt,$
  order=12,dscale=0.1,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_23913_3339_3_long_q.sav'

shot=18931
trange=[1.94,1.95]
pg_probe_sets,3,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1],/cwt,$
  order=12,dscale=0.1,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_18931_194_3_long_q.sav'

shot=18931
trange=[1.94,1.95]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=18931
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1],/cwt,$
  order=12,dscale=0.1,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_18931_194_3_long_q.sav'

shot=18931
trange=[2.66,2.67]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=18931
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1],/cwt,$
  order=12,dscale=0.1,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_18931_266_3_long_q.sav'

shot=18931
trange=[3.35,3.36]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=18931
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1],/cwt,$
  order=12,dscale=0.1,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_18931_335_3_long_q.sav'

return

; 2008.07.03.

shot=20040
trange=[2.45,2.46]
pg_probe_sets,0,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=12,dscale=0.15,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=5,filterparam3=10,filterparam1=0.5,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_20040_245_0_long_q.sav'

return

shot=22310
trange=[2.02,2.03]
pg_probe_sets,0,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=12,dscale=0.15,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=5,filterparam3=20, filterparam1=0.5,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_22310_202_0_long_q.sav'

return

; 2008.05.27.

shot=20040
trange=[2.435,2.445]
pg_probe_sets,4,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=12,dscale=0.05,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=5,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_20040_2435_4_long_q.sav'

shot=20040
trange=[2.45,2.46]
pg_probe_sets,4,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=12,dscale=0.05,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=5,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_20040_245_4_long_q.sav'

shot=22188
trange=[2.555,2.565]
pg_probe_sets,3,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=12,dscale=0.05,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=5,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_22188_2555_3_long_q.sav'

return

; 2008.05.23.

shot=22310
trange=[2.02,2.03]
pg_probe_sets,3,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=12,dscale=0.05,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=5,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_22310_202_3_long_q.sav'

return

; 2008.05.22.

shot=22188
trange=[2.555,2.565]
pg_probe_sets,3,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=6,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=3,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_22188_2555_3_mid_q.sav'

shot=22268
trange=[2.256,2.266]
pg_probe_sets,3,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=6,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=3,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_22268_2556_3_mid_q.sav'

return

; 2008.05.21.

shot=22188
trange=[2.555,2.565]
pg_probe_sets,3,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=12,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=5,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_22188_2555_3_long_q.sav'

modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=3,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=2,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_22188_2555_3_q.sav'

shot=22268
trange=[2.256,2.266]
pg_probe_sets,3,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=12,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=5,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_22268_2556_3_long_q.sav'

modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=3,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=2,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_22268_2556_3_q.sav'

shot=22188
trange=[2.555,2.565]
pg_probe_sets,4,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=12,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=5,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_22188_2555_4_long_q.sav'

modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=3,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=2,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_22188_2555_4_q.sav'

shot=22268
trange=[2.256,2.266]
pg_probe_sets,4,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=12,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=5,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_22268_2556_4_long_q.sav'

modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=3,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=2,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_22268_2556_4_q.sav'

return

shot=22310
trange=[2.02,2.03]
pg_probe_sets,5,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=12,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=5,filterparam3=100,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)

return

shot=22188
trange=[2.555,2.565]
pg_probe_sets,5,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=3,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=2,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_22188_2555_5_q.sav'

shot=22268
trange=[2.256,2.266]
pg_probe_sets,5,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=3,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=2,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_22268_2266_5_q.sav'

shot=22310
trange=[2.02,2.03]
pg_probe_sets,5,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=12,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=5,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_22310_202_5_long_q.sav'

modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=3,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=2,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_22310_202_5_q.sav'

return

shot=22188
trange=[2.555,2.565]
pg_probe_sets,5,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=12,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=5,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_22188_2555_5_long_q.sav'

shot=22268
trange=[2.256,2.266]
pg_probe_sets,5,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=12,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=5,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_22268_2266_5_long_q.sav'

return

; 2008.04.11.

shot=20040
trange=[2.435,2.445]
pg_probe_sets,4,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=12,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=5,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_20040_2435_4_long_q.sav'

modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=3,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=2,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_20040_2435_4_q.sav'

shot=20040
trange=[2.93,2.94]
pg_probe_sets,4,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=12,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=5,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_20040_293_4_long_q.sav'

modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=3,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=2,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_20040_293_4_q.sav'

return

; 2008.04.08.

shot=20040
trange=[2.45,2.46]
pg_probe_sets,4,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=12,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=5,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_20040_245_4_long_q.sav'

modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=3,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=2,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_20040_245_4_q.sav'

shot=20040
trange=[2.95,2.96]
pg_probe_sets,4,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=12,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=5,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_20040_295_4_long_q.sav'

modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=3,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=2,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_20040_295_4_q.sav'

return

shot=20040
trange=[2.45,2.46]
pg_probe_sets,3,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=12,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=5,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_20040_245_4_long_q.sav'

modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=3,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=2,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_20040_245_4_q.sav'

shot=20040
trange=[2.95,2.96]
pg_probe_sets,3,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=12,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=5,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_20040_295_4_long_q.sav'

modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=3,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=2,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_20040_295_4_q.sav'

return

shot=20040
trange=[2.45,2.46]
pg_probe_sets,4,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=12,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=5,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_20040_245_4_long_q.sav'

modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=3,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=2,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_20040_245_4_q.sav'

shot=20040
trange=[2.95,2.96]
pg_probe_sets,4,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=12,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=5,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_20040_295_4_long_q.sav'

modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=3,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=2,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_20040_295_4_q.sav'

return

; 2008.04.07.

shot=20040
trange=[2.45,2.46]
pg_probe_sets,3,channels=channels,chpos=chpos
modenum=pg_modenumber(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=12,dscale=0.2,plot=1,/print,$
	opt=0.25,avr=5$
	)

modenum=pg_modenumber(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=3,dscale=0.2,plot=1,/print,$
	opt=0.25$
	)

shot=20040
trange=[2.95,2.96]
pg_probe_sets,3,channels=channels,chpos=chpos
modenum=pg_modenumber(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=12,dscale=0.2,plot=1,/print,$
	opt=0.25,avr=5$
	)

modenum=pg_modenumber(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=3,dscale=0.2,plot=1,/print,$
	opt=0.25$
	)

return

; 2008.04.03.

shot=20040
trange=[2.45,2.46]
pg_probe_sets,3,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=12,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=5,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_20040_245_3_long_q.sav'

modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=3,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=2,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_20040_245_3_q.sav'

shot=20040
trange=[2.95,2.96]
pg_probe_sets,3,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=12,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=5,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_20040_295_3_long_q.sav'

modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=3,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=2,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_20040_295_3_q.sav'

return

; 2008.03.27.

shot=22377
channel1='General/_AUG_SXR_I56_time_4.5300-4.5500
channel2='General/_AUG_SXR_I57_time_4.5300-4.5500
stft=pg_cspectrogram([shot,shot],[channel1,channel2],windowsize=50,masksize=1000,freqres=1,opt=0.2,/print,phaselevel=5)
stft=pg_cspectrogram([shot,shot],[channel1,channel2],windowsize=50,masksize=1000,freqres=1,opt=0.2,/print,phaselevel=5,avr=5)
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=6,dscale=0.05,plot=1,opt=0.15,/print,phaselevel=5)
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=6,dscale=0.05,plot=1,opt=0.15,/print,phaselevel=5,avr=5)

shot=22764
channel1='General/_AUG_SXR_I53_time_2.1600-2.1800
channel2='General/_AUG_SXR_I55_time_2.1600-2.1800
stft=pg_cspectrogram([shot,shot],[channel1,channel2],windowsize=50,masksize=1000,freqres=1,opt=0.2,/print,phaselevel=5)
stft=pg_cspectrogram([shot,shot],[channel1,channel2],windowsize=50,masksize=1000,freqres=1,opt=0.2,/print,phaselevel=5,avr=5)
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=6,dscale=0.05,plot=1,opt=0.15,/print,phaselevel=5)
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=6,dscale=0.05,plot=1,opt=0.15,/print,phaselevel=5,avr=5)

return

; 2008.03.25.

shot=22243
channel1='General/_AUG_SXR_I56_time_1.3540-1.3740
channel2='General/_AUG_SXR_I57_time_1.3540-1.3740
stft=pg_cspectrogram([shot,shot],[channel1,channel2],windowsize=50,masksize=1000,freqres=1,opt=0.2,/print,phaselevel=5)
stft=pg_cspectrogram([shot,shot],[channel1,channel2],windowsize=50,masksize=1000,freqres=1,opt=0.2,/print,phaselevel=5,avr=5)
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=6,dscale=0.05,plot=1,opt=0.15,/print,phaselevel=5)
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=6,dscale=0.05,plot=1,opt=0.15,/print,phaselevel=5,avr=5)

shot=22377
channel1='General/_AUG_SXR_I56_time_4.3040-4.3240
channel2='General/_AUG_SXR_I57_time_4.3040-4.3240
stft=pg_cspectrogram([shot,shot],[channel1,channel2],windowsize=50,masksize=1000,freqres=1,opt=0.2,/print,phaselevel=5)
stft=pg_cspectrogram([shot,shot],[channel1,channel2],windowsize=50,masksize=1000,freqres=1,opt=0.2,/print,phaselevel=5,avr=5)
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=6,dscale=0.05,plot=1,opt=0.15,/print,phaselevel=5)
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=6,dscale=0.05,plot=1,opt=0.15,/print,phaselevel=5,avr=5)

shot=22243110254
channel1='General/_AUG_SXR_I56_time_1.3540-1.3740
channel2='General/_AUG_SXR_I57_time_1.3540-1.3740
stft=pg_cspectrogram([shot,shot],[channel1,channel2],windowsize=50,masksize=1000,freqres=1,opt=0.2,/print,phaselevel=5)
stft=pg_cspectrogram([shot,shot],[channel1,channel2],windowsize=50,masksize=1000,freqres=1,opt=0.2,/print,phaselevel=5,avr=5)
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=6,dscale=0.05,plot=1,opt=0.15,/print,phaselevel=5)
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=6,dscale=0.05,plot=1,opt=0.15,/print,phaselevel=5,avr=5)

shot=22377110254
channel1='General/_AUG_SXR_I56_time_4.3040-4.3240
channel2='General/_AUG_SXR_I57_time_4.3040-4.3240
stft=pg_cspectrogram([shot,shot],[channel1,channel2],windowsize=50,masksize=1000,freqres=1,opt=0.2,/print,phaselevel=5)
stft=pg_cspectrogram([shot,shot],[channel1,channel2],windowsize=50,masksize=1000,freqres=1,opt=0.2,/print,phaselevel=5,avr=5)
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=6,dscale=0.05,plot=1,opt=0.15,/print,phaselevel=5)
cwt=pg_cscalogram_pg([shot,shot],[channel1,channel2],order=6,dscale=0.05,plot=1,opt=0.15,/print,phaselevel=5,avr=5)


return

shot=22243
channel='General/_AUG_SXR_I56_time_1.3540-1.3740
stft=pg_spectrogram(shot,channel,windowsize=100,masksize=1000,freqres=1,plot=1,opt=0.2,/print)
cwt=pg_scalogram(shot,channel,order=12,dscale=0.05,plot=1,opt=0.15,/print)

return

; 2008.03.15.

shot=20040
trange=[2.45,2.46]
pg_probe_sets,3,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=12,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=5,filterparam3=30,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_20040_245_3_long_q.sav'

modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=3,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=2,filterparam3=30,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_20040_245_3_q.sav'

shot=20040
trange=[2.95,2.96]
pg_probe_sets,3,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=12,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=5,filterparam3=30,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_20040_295_3_long_q.sav'

modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=3,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=2,filterparam3=30,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_20040_295_3_q.sav'

return


shot=22310
trange=[2.02,2.03]
pg_probe_sets,3,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=12,dscale=0.2,plot=1,/print,$
	opt=0.25,avr=5,filterparam3=30,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/AUG_modenumbers_22310_3_long_q.sav'

return


shot=22310
trange=[2.02,2.03]
pg_probe_sets,0,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,/cwt,$
	order=12,dscale=0.2,cohlim=0.5,powlim=0.2,plot=1,/print,$
	opt=0.25,avr=5,filterparam2=1,filterparam3=30,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$	c
pows=cpows, cohs=cohs $
	)
save,/all,filename='data/AUG_modenumbers_22310_0_long.sav'
pg_probe_sets,1,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,/cwt,$
	order=12,dscale=0.2,cohlim=0.5,powlim=0.2,plot=1,/print,$
	opt=0.25,avr=5,filterparam2=1,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs $
	)
save,/all,filename='data/AUG_modenumbers_22310_1_long.sav'
pg_probe_sets,3,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,/cwt,$
	order=12,dscale=0.2,cohlim=0.5,powlim=0.2,plot=1,/print,$
	opt=0.25,avr=5,filterparam2=1,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs $
	)
save,/all,filename='data/AUG_modenumbers_22310_3_long.sav'
trange=[2.025144,2.025775]
pg_probe_sets,2,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,/cwt,$
	order=6,dscale=0.2,cohlim=0.5,powlim=0.2,plot=1,/print,$
	opt=0.25,avr=3,filterparam2=1,filterparam3=30,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs $
	)
save,/all,filename='data/AUG_modenumbers_22310_2_long.sav'


shot=21089
trange=[3.5,3.55]
pg_probe_sets,0,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,/cwt,$
	order=12,dscale=0.2,cohlim=0.5,powlim=0.2,plot=1,/print,$
	opt=0.25,avr=5,filterparam2=1,filterparam3=30,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs $
	)
save,/all,filename='data/AUG_modenumbers_22310_0_long.sav'


;shot=21089
;trange=[1.800,1.81]
;pg_probe_sets,0,channels=channels,chpos=chpos
;modenum=pg_modenumber_full(shot,channels=channels,$
;	chpos=chpos,trange=trange,/cwt,$
;	order=6,dscale=0.1,cohlim=0.5,powlim=0.2,plot=1,/print,$
;	opt=0.4,avr=10,filterparam2=1,filterparam3=6$
	;timeax=timeax, freqax=freqax,$
	;cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	;cpows=cpows, cohs=cohs$
;	)
;pg_probe_sets,1,channels=channels,chpos=chpos
;modenum=pg_modenumber_full(shot,channels=channels,$
;	chpos=chpos,trange=trange,/cwt,$
;	order=6,dscale=0.1,cohlim=0.5,powlim=0.2,plot=1,/print,$
;	opt=0.4,avr=3,filterparam2=1,filterparam3=6$
	;timeax=timeax, freqax=freqax,$
	;cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	;cpows=cpows, cohs=cohs$
;	)
;trange=[1.800,1.8003]
;pg_probe_sets,2,channels=channels,chpos=chpos
;modenum=pg_modenumber_full(shot,channels=channels,$
;	chpos=chpos,trange=trange,/cwt,$
;	order=6,dscale=0.1,cohlim=0.5,powlim=0.2,plot=1,/print,$
;	opt=0.4,avr=0.5,filterparam2=1,filterparam3=6$
	;timeax=timeax, freqax=freqax,$
	;cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	;cpows=cpows, cohs=cohs$
;	)

;trange=[3.500,3.51]
;pg_probe_sets,0,channels=channels,chpos=chpos
;modenum=pg_modenumber_full(shot,channels=channels,$
;	chpos=chpos,trange=trange,/cwt,$
;	order=6,dscale=0.1,cohlim=0.5,powlim=0.2,plot=1,/print,$
;	opt=0.4,avr=3,filterparam2=1,filterparam3=6$
	;timeax=timeax, freqax=freqax,$
	;cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	;cpows=cpows, cohs=cohs$
;	)
;pg_probe_sets,1,channels=channels,chpos=chpos
;modenum=pg_modenumber_full(shot,channels=channels,$
;	chpos=chpos,trange=trange,/cwt,$
;	order=6,dscale=0.1,cohlim=0.5,powlim=0.2,plot=1,/print,$
;	opt=0.4,avr=3,filterparam2=1,filterparam3=6$
	;timeax=timeax, freqax=freqax,$
	;cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	;cpows=cpows, cohs=cohs$
;	)
;trange=[3.500,3.5003]
;pg_probe_sets,2,channels=channels,chpos=chpos
;modenum=pg_modenumber_full(shot,channels=channels,$
;	chpos=chpos,trange=trange,/cwt,$
;	order=6,dscale=0.1,cohlim=0.5,powlim=0.2,plot=1,/print,$
;	opt=0.4,avr=0.5,filterparam2=1,filterparam3=6$
	;timeax=timeax, freqax=freqax,$
	;cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	;cpows=cpows, cohs=cohs$
;	)

;trange=[4.500,4.51]
;pg_probe_sets,0,channels=channels,chpos=chpos
;modenum=pg_modenumber_full(shot,channels=channels,$
;	chpos=chpos,trange=trange,/cwt,$
;	order=6,dscale=0.1,cohlim=0.5,powlim=0.2,plot=1,/print,$
;	opt=0.4,avr=3,filterparam2=1,filterparam3=6$
	;timeax=timeax, freqax=freqax,$
	;cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	;cpows=cpows, cohs=cohs$
;	)
;pg_probe_sets,1,channels=channels,chpos=chpos
;modenum=pg_modenumber_full(shot,channels=channels,$
;	chpos=chpos,trange=trange,/cwt,$
;	order=6,dscale=0.1,cohlim=0.5,powlim=0.2,plot=1,/print,$
;	opt=0.4,avr=3,filterparam2=1,filterparam3=6$
	;timeax=timeax, freqax=freqax,$
	;cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	;cpows=cpows, cohs=cohs$
;	)
;trange=[4.500,4.5003]
;pg_probe_sets,2,channels=channels,chpos=chpos
;modenum=pg_modenumber_full(shot,channels=channels,$
;	chpos=chpos,trange=trange,/cwt,$
;	order=6,dscale=0.1,cohlim=0.5,powlim=0.2,plot=1,/print,$
;	opt=0.4,avr=0.5,filterparam2=1,filterparam3=6$
	;timeax=timeax, freqax=freqax,$
	;cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	;cpows=cpows, cohs=cohs$
;	)



end
