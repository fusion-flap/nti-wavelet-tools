;+
; Name: pg_aug_run
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2008.01.02.
;
; Purpose: Run programs on AUG data
;
; Calling sequence:
;	pg_aug_run
;
; Input:
;
; Output:
;-

pro pg_aug_run

; 2009.07.24.

shot=56800
trange=[0.33,0.55]
pg_probe_sets,10,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[-1],$
  windowsize=50,masksize=500,freqres=1,step=10,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=10,filterparam3=30)
return

shot=56800
trange=[0.32,0.55]
pg_probe_sets,10,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[-1],$
  windowsize=50,masksize=1000,freqres=1,step=5,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=10,filterparam3=30)
shot=56800
trange=[0.32,0.55]
pg_probe_sets,10,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=30,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/W7-AS_modenumbers_cwt_56800_10_032.sav'

return

; 2009.06.18.

stft=pg_scalogram(20040,'AUG_mirnov/B31-01',trange=[2.951,2.956],order=12,dscale=0.02,$
  /print,/pad,plot=1,opt=0.25)
return

; 2009.06.17.

stft=pg_scalogram(20040,'AUG_mirnov/B31-01',trange=[2.951,2.956],order=12,dscale=0.02,$
  /print,plot=1,opt=0.25)
return

stft=pg_spectrogram(20040,'AUG_mirnov/B31-01',trange=[2.951,2.956],windowsize=100,masksize=1600,freqres=1,$
  /print,plot=1,opt=0.2)
return

; 2009.06.05.

shot=20975
trange=[1.399,1.404]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=50.,filters=[2],/cwt,$
  order=3,dscale=0.02,plot=3,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=3,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_20975_3_1399.sav'

return

shot=20975
trange=[1.399,1.404]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=300.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=3,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_20975_3_1399.sav'

return

; 2009.03.05.

shot=22188
trange=[2.556,2.566]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=300.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=3,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_22188_4_2556.sav'

return

shot=20040
trange=[2.615,2.625]
pg_probe_sets,7,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=300.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=3,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

return

shot=20040
trange=[2.615,2.625]
pg_probe_sets,5,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=300.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=3,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

return

; 2009.03.03.

shot=22265
trange=[2.2865,2.2915]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=300.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=3,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_22265_4_22865.sav'

return

shot=20040
trange=[2.615,2.625]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=300.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=3,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

return

restore, 'data/AUG_modenumbers_22310_4_202.sav'
pg_phasediagram, cphases, chpos, timeax, freqax, 2.024, 150, shot=shot, channels=channels, filters=[8],$
   filterparam1=1, filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs

return

shot=20040
trange=[2.615,2.625]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=300.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=3,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

return

restore, 'data/AUG_modenumbers_20040_4_2615.sav'
pg_phasediagram, cphases, chpos, timeax, freqax, 2.024, 150, shot=shot, channels=channels, filters=[8],$
   filterparam1=1, filterparam2=[-10,10], /print, cpows=cpows, cohs=cohs

return

shot=20040
trange=[2.615,2.625]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=300.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=3,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_20040_4_2615.sav'

return

shot=22265
trange=[2.2865,2.2915]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=300.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=3,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_22265_4_22865.sav'

return

; 2009.03.02.

shot=20040
trange=[2.435,2.445]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=300.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=3,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_20040_4_2435.sav'

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

shot=22268
trange=[2.2865,2.2915]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=300.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=3,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_22268_4_22865.sav'

shot=22310
trange=[2.02,2.03]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=300.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=3,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_22310_4_202.sav'

shot=20040
trange=[2.617,2.621]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=300.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=3,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_20040_4_2617.sav'

return

shot=20040
trange=[2.617,2.621]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=300.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=3,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

return

; 2009.02.27.

shot=20040
trange=[2.617,2.621]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=300.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=3,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

return

shot=22268
trange=[2.2865,2.2915]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=300.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=3,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

return

shot=22310
trange=[2.02,2.03]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=300.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=3,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

shot=20040
trange=[2.617,2.621]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=300.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=3,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

return

shot=20040
trange=[2.435,2.445]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=300.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=3,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

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

shot=22265
trange=[2.2865,2.2915]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=300.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=3,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

shot=22310
trange=[2.02,2.03]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=300.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=3,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

shot=20040
trange=[2.617,2.621]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=300.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=3,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

return

; 2009.02.26.

shot=20040
trange=[2.617,2.621]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=300.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=3,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

return

; 2009.02.06.

shot=20040
trange=[2.617,2.621]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=300.,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=2,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

return

shot=20040
trange=[2.617,2.621]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=300.,filters=[2],/cwt,$
  order=12,dscale=0.02,nscale=100,plot=2,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

return

; 2009.01.29.

shot=20040
trange=[2.617,2.621]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=300.,filters=[2],/cwt,$
  order=12,dscale=0.02,nscale=100,plot=2,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

stop
return

; 2009.01.29.

shot=20040
trange=[2.617,2.621]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,fmax=300.,filters=[2],/cwt,$
  order=12,dscale=0.02,nscale=100,plot=2,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

stop
return

; 2008.12.19.

shot=20040
trange=[2.617,2.621]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

shot=20040
trange=[2.617,2.621]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[2],fmax=300,$
  windowsize=30,masksize=600,freqres=1,step=5,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=2,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

shot=20040
trange=[2.617,2.621]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[2],fmax=300,$
  windowsize=60,masksize=600,freqres=1,step=10,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=3,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

shot=20040
trange=[3.119,3.124]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

shot=20040
trange=[3.119,3.124]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[2],fmax=300,$
  windowsize=30,masksize=600,freqres=1,step=5,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=2,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

shot=20040
trange=[3.119,3.124]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[2],fmax=300,$
  windowsize=60,masksize=600,freqres=1,step=10,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=3,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

return

; 2008.12.10.

shot=20040
trange=[5.123,5.128]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[2],fmax=300,$
  windowsize=30,masksize=600,freqres=1,step=5,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=2,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

return

shot=20040
trange=[5.123,5.128]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[2],fmax=300,$
  windowsize=60,masksize=600,freqres=1,step=10,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=3,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

return

; 2008.12.09.

shot=20040
trange=[5.123,5.128]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=5,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
  
shot=20040
trange=[5.123,5.128]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=2,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )

return

; 2008.12.05.
shot=18931
trange=[1.91,1.96]
pg_probe_sets,6,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.05,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=3,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_18931_191_6_long_q.sav'

shot=18931
trange=[2.64,2.69]
pg_probe_sets,6,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.05,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=3,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_18931_264_6_long_q.sav'

shot=18931
trange=[2.84,2.89]
pg_probe_sets,6,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.05,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=3,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_18931_284_6_long_q.sav'

shot=18931
trange=[3.04,3.09]
pg_probe_sets,6,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.05,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=3,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_18931_304_6_long_q.sav'

shot=18931
trange=[3.24,3.29]
pg_probe_sets,6,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[2],/cwt,$
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
  chpos=chpos,trange=trange,filters=[2],/cwt,$
  order=12,dscale=0.05,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=3,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_18931_328_6_long_q.sav'

return

; 2008.12.03.

shot=22310
trange=[2.02,2.03]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1,2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=3,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_22310_3_202_cq.sav'

shot=22310
trange=[2.02,2.03]
pg_probe_sets,3,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1,2],$
  windowsize=200,masksize=800,freqres=1,step=20,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=3,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_22310_3_202_stft_cq.sav'

shot=20040
trange=[3.9325,3.9375]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1,2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=3,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_20040_4_39325_cq.sav'

shot=20040
trange=[3.9325,3.9375]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1,2],$
  windowsize=200,masksize=800,freqres=1,step=20,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=3,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_20040_4_39325_cq.sav'

shot=20040
trange=[5.123,5.128]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1,2],/cwt,$
  order=12,dscale=0.02,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=3,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_20040_4_5123_cq.sav'

shot=20040
trange=[5.123,5.128]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1,2],$
  windowsize=200,masksize=800,freqres=1,step=20,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=3,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_20040_4_5123_cq.sav'

shot=23068
trange=[2.5,2.54]
pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
modenum=pg_modenumber_full(shot,channels=channels,$
  chpos=chpos,trange=trange,filters=[1,2],/cwt,$
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
  chpos=chpos,trange=trange,filters=[1,2],/cwt,$
  order=18,dscale=0.05,plot=1,/print,cohlim=0.5,powlim=0.2,$
  opt=0.25,avr=3,filterparam3=10,$
  timeax=timeax, freqax=freqax,$
  cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
  cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
  )
save,/all,filename='data/AUG_modenumbers_22375_449_5_q.sav'

return

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
