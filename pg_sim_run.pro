;+
; Name: pg_sim_run
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2008.04.22.
;
; Purpose: Run programs on simulated data
;
; Calling sequence:
;	pg_sim_run
;
; Input:
;
; Output:
;-

pro pg_sim_run

; 2008.06.04.

pg_gp_sim2,number=10006,realgeometry=1,snr=1,modenumber=19
shot=10006
trange=[0.5,0.6]
pg_probe_sets,11,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],$
	windowsize=100, masksize=400,freqres=1,step=20,plot=1,/print,cohlim=0.4,powlim=0.1,$
	opt=0.25,avr=5,filterparam3=50,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/10006_modenumbers_11_q.sav'

return

pg_gp_sim2,number=10005,realgeometry=1,snr=0.1
shot=10005
trange=[0.5,0.6]
pg_probe_sets,11,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],$
	windowsize=100, masksize=400,freqres=1,step=20,plot=1,/print,cohlim=0.4,powlim=0.1,$
	opt=0.25,avr=5,filterparam3=50,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/10004_modenumbers_11_q.sav'

return

; 2008.04.23.

pg_gp_sim2,number=10004,realgeometry=0,snr=0.1
shot=10004
trange=[0.5,0.51]
pg_probe_sets,11,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=3,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.15,avr=2,filterparam3=60,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/10004_modenumbers_11_short_q.sav'

return

shot=10003
trange=[0.5,0.51]
pg_probe_sets,11,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=3,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.15,avr=2,filterparam3=60,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/10003_modenumbers_11_short_q.sav'

return

pg_gp_sim2,number=10003,realgeometry=0,snr=10
shot=10003
trange=[0.5,0.51]
pg_probe_sets,11,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=3,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.15,avr=2,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/10003_modenumbers_11_short_q.sav'

return

pg_gp_sim2,number=10002,realgeometry=0,snr=2
shot=10002
trange=[0.5,0.51]
pg_probe_sets,11,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=3,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.15,avr=2,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/10001_modenumbers_11_short_q.sav'

return

pg_gp_sim2,number=10001,realgeometry=0,snr=1000
shot=10001
trange=[0.5,0.51]
pg_probe_sets,11,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=3,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.15,avr=2,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/10001_modenumbers_11_short_q.sav'

return

shot=10001
trange=[0.5,0.51]
pg_probe_sets,11,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=12,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=5,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/10001_modenumbers_11_long_q.sav'

return

; 2008.04.22.

shot=10000
trange=[0.5,0.51]
pg_probe_sets,11,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=12,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=5,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/SIMsimp_modenumbers_11_long_q.sav'

return

shot=47941
trange=[0.5,0.51]
pg_probe_sets,11,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=12,dscale=0.2,plot=1,/print,cohlim=0.5,powlim=0.2,$
	opt=0.25,avr=5,filterparam3=10,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/SIM_modenumbers_11_long_q.sav'

return

end
