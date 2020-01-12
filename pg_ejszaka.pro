pro pg_ejszaka

;2008.06.03.

shot=55262
trange=[0.5,0.6]
pg_probe_sets,10,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],$
	windowsize=100, masksize=400,freqres=1,step=20,plot=1,/print,cohlim=0.4,powlim=0.1,$
	opt=0.25,avr=5,filterparam3=50,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/W7_modenumbers_55262_05_10_q.sav'

shot=55261
trange=[0.5,0.6]
pg_probe_sets,10,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],$
	windowsize=100, masksize=400,freqres=1,step=20,plot=1,/print,cohlim=0.4,powlim=0.1,$
	opt=0.25,avr=5,filterparam3=50,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/W7_modenumbers_55261_05_10_q.sav'

shot=55248
trange=[0.44,0.5]
pg_probe_sets,10,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],$
	windowsize=100, masksize=400,freqres=1,step=20,plot=1,/print,cohlim=0.4,powlim=0.1,$
	opt=0.25,avr=5,filterparam3=50,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/W7_modenumbers_55248_045_10_q.sav'

shot=55250
trange=[0.45,0.5]
pg_probe_sets,10,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],$
	windowsize=100, masksize=400,freqres=1,step=20,plot=1,/print,cohlim=0.4,powlim=0.1,$
	opt=0.25,avr=5,filterparam3=50,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/W7_modenumbers_55250_045_10_q.sav'

shot=55252
trange=[0.3,0.4]
pg_probe_sets,10,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],$
	windowsize=100, masksize=400,freqres=1,step=20,plot=1,/print,cohlim=0.4,powlim=0.1,$
	opt=0.25,avr=5,filterparam3=50,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/W7_modenumbers_55252_03_10_q.sav'

shot=56800
trange=[0.4,0.6]
pg_probe_sets,10,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],$
	windowsize=100, masksize=400,freqres=1,step=20,plot=1,/print,cohlim=0.4,powlim=0.1,$
	opt=0.25,avr=5,filterparam3=50,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/W7_modenumbers_56800_04_10_q.sav'


return

;2008.05.29.

shot=56800
trange=[0.52,0.54]
pg_probe_sets,10,channels=channels,chpos=chpos
modenum=pg_modenumber_full(shot,channels=channels,$
	chpos=chpos,trange=trange,filters=[1],/cwt,$
	order=36,dscale=0.15,plot=1,/print,cohlim=0.4,powlim=0.2,$
	opt=0.25,avr=5,filterparam3=50,$
	timeax=timeax, freqax=freqax,$
	cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds,$
	cpows=cpows, cohs=cohs, qmin=qmin, qavr=qavr $
	)
save,/all,filename='data/W7_modenumbers_56800_052_10_cwt_q.sav'

return


channels=['W7-AS Mirnov/MIR-1-1',$
															'W7-AS Mirnov/MIR-1-2',$
															'W7-AS Mirnov/MIR-1-3',$
															'W7-AS Mirnov/MIR-1-4',$
															'W7-AS Mirnov/MIR-1-5',$
															'W7-AS Mirnov/MIR-1-6',$
															'W7-AS Mirnov/MIR-1-7',$
															'W7-AS Mirnov/MIR-1-8',$
															'W7-AS Mirnov/MIR-1-9',$
															'W7-AS Mirnov/MIR-1-10',$
															'W7-AS Mirnov/MIR-1-11',$
															'W7-AS Mirnov/MIR-1-12',$
															'W7-AS Mirnov/MIR-1-13',$
															'W7-AS Mirnov/MIR-1-14',$
															'W7-AS Mirnov/MIR-1-15',$
															'W7-AS Mirnov/MIR-1-16']
chpos=[10,30,50,85,100,120,145,165,185,200,220,255,275,305,340,355]
shot=52141
trange=[0.5,0.55]
modes=pg_modenumber_full(shot,trange=trange,/cwt,modescale=[-10,10],filters=[0],filterparam2=4.,/print,opt=0.4,plot=1,cohlim=0.3,powlim=0.1,avr=5)
shot=52147
trange=[0.5,0.55]
modes=pg_modenumber_full(shot,trange=trange,/cwt,modescale=[-10,10],filters=[0],filterparam2=4.,/print,opt=0.4,plot=1,cohlim=0.3,powlim=0.1,avr=5)
shot=52153
trange=[0.5,0.55]
modes=pg_modenumber_full(shot,trange=trange,/cwt,modescale=[-10,10],filters=[0],filterparam2=4.,/print,opt=0.4,plot=1,cohlim=0.3,powlim=0.1,avr=5)
shot=52164
trange=[0.5,0.55]
modes=pg_modenumber_full(shot,trange=trange,/cwt,modescale=[-10,10],filters=[0],filterparam2=4.,/print,opt=0.4,plot=1,cohlim=0.3,powlim=0.1,avr=5)
shot=52170
trange=[0.5,0.55]
modes=pg_modenumber_full(shot,trange=trange,/cwt,modescale=[-10,10],filters=[0],filterparam2=4.,/print,opt=0.4,plot=1,cohlim=0.3,powlim=0.1,avr=5)
shot=47940
trange=[0.4,0.45]
channels=['W7-AS Mirnov/MIR-1-1',$
															'W7-AS Mirnov/MIR-1-2',$
															'W7-AS Mirnov/MIR-1-3',$
															'W7-AS Mirnov/MIR-1-4',$
															'W7-AS Mirnov/MIR-1-5',$
															'W7-AS Mirnov/MIR-1-6',$
															'W7-AS Mirnov/MIR-1-7',$
															'W7-AS Mirnov/MIR-1-8',$
															'W7-AS Mirnov/MIR-1-9',$
															'W7-AS Mirnov/MIR-1-10',$
															'W7-AS Mirnov/MIR-1-11',$
															'W7-AS Mirnov/MIR-1-12',$
															'W7-AS Mirnov/MIR-1-13',$
															'W7-AS Mirnov/MIR-1-14',$
															'W7-AS Mirnov/MIR-1-15',$
															'W7-AS Mirnov/MIR-1-16']
chpos=[10,30,50,85,100,120,145,165,185,200,220,255,275,305,340,355]
modes=pg_modenumber(shot,trange=trange,/cwt,modescale=[-10,10],filters=[4],filterparam2=4.,/print,opt=0.4,plot=1,cohlim=0.3,powlim=0.1)
shot=47940
trange=[0.45,0.5]
modes=pg_modenumber(shot,trange=trange,/cwt,modescale=[-10,10],filters=[4],filterparam2=4.,/print,opt=0.4,plot=1,cohlim=0.3,powlim=0.1)
shot=47940
trange=[0.5,0.6]
modes=pg_modenumber(shot,trange=trange,/cwt,modescale=[-10,10],filters=[4],filterparam2=4.,/print,opt=0.4,plot=1,cohlim=0.3,powlim=0.1)
shot=47940
trange=[0.8,0.85]
modes=pg_modenumber(shot,trange=trange,/cwt,modescale=[-10,10],filters=[4],filterparam2=4.,/print,opt=0.4,plot=1,cohlim=0.3,powlim=0.1)
shot=47940
trange=[0.85,0.9]
modes=pg_modenumber(shot,trange=trange,/cwt,modescale=[-10,10],filters=[4],filterparam2=4.,/print,opt=0.4,plot=1,cohlim=0.3,powlim=0.1)
shot=47940
trange=[0.9,0.99]
modes=pg_modenumber(shot,trange=trange,/cwt,modescale=[-10,10],filters=[4],filterparam2=4.,/print,opt=0.4,plot=1,cohlim=0.3,powlim=0.1)
shot=47941
trange=[0.4,0.45]
modes=pg_modenumber(shot,trange=trange,/cwt,modescale=[-10,10],filters=[4],filterparam2=4.,/print,opt=0.4,plot=1,cohlim=0.3,powlim=0.1)
shot=47942
trange=[0.4,0.45]
modes=pg_modenumber(shot,trange=trange,/cwt,modescale=[-10,10],filters=[4],filterparam2=4.,/print,opt=0.4,plot=1,cohlim=0.3,powlim=0.1)
shot=47943
trange=[0.4,0.45]
modes=pg_modenumber(shot,trange=trange,/cwt,modescale=[-10,10],filters=[4],filterparam2=4.,/print,opt=0.4,plot=1,cohlim=0.3,powlim=0.1)
shot=47944
trange=[0.4,0.45]
modes=pg_modenumber(shot,trange=trange,/cwt,modescale=[-10,10],filters=[4],filterparam2=4.,/print,opt=0.4,plot=1,cohlim=0.3,powlim=0.1)
shot=47945
trange=[0.4,0.45]
modes=pg_modenumber(shot,trange=trange,/cwt,modescale=[-10,10],filters=[4],filterparam2=4.,/print,opt=0.4,plot=1,cohlim=0.3,powlim=0.1)
shot=47946
trange=[0.4,0.45]
modes=pg_modenumber(shot,trange=trange,/cwt,modescale=[-10,10],filters=[4],filterparam2=4.,/print,opt=0.4,plot=1,cohlim=0.3,powlim=0.1)
shot=52123
trange=[0.5,0.55]
modes=pg_modenumber(shot,trange=trange,/cwt,modescale=[-10,10],filters=[4],filterparam2=4.,/print,opt=0.4,plot=1,cohlim=0.3,powlim=0.1)
shot=52129
trange=[0.5,0.55]
modes=pg_modenumber(shot,trange=trange,/cwt,modescale=[-10,10],filters=[4],filterparam2=4.,/print,opt=0.4,plot=1,cohlim=0.3,powlim=0.1)
shot=52135
trange=[0.5,0.55]
modes=pg_modenumber(shot,trange=trange,/cwt,modescale=[-10,10],filters=[4],filterparam2=4.,/print,opt=0.4,plot=1,cohlim=0.3,powlim=0.1)
shot=52141
trange=[0.5,0.55]
modes=pg_modenumber(shot,trange=trange,/cwt,modescale=[-10,10],filters=[4],filterparam2=4.,/print,opt=0.4,plot=1,cohlim=0.3,powlim=0.1)
shot=52147
trange=[0.5,0.55]
modes=pg_modenumber(shot,trange=trange,/cwt,modescale=[-10,10],filters=[4],filterparam2=4.,/print,opt=0.4,plot=1,cohlim=0.3,powlim=0.1)
shot=52153
trange=[0.5,0.55]
modes=pg_modenumber(shot,trange=trange,/cwt,modescale=[-10,10],filters=[4],filterparam2=4.,/print,opt=0.4,plot=1,cohlim=0.3,powlim=0.1)
shot=52164
trange=[0.5,0.55]
modes=pg_modenumber(shot,trange=trange,/cwt,modescale=[-10,10],filters=[4],filterparam2=4.,/print,opt=0.4,plot=1,cohlim=0.3,powlim=0.1)
shot=52170
trange=[0.5,0.55]
modes=pg_modenumber(shot,trange=trange,/cwt,modescale=[-10,10],filters=[4],filterparam2=4.,/print,opt=0.4,plot=1,cohlim=0.3,powlim=0.1)
;shot=52170
;trange=[0.5,0.55]
;modes=pg_modenumber(shot,trange=trange,modescale=[-10,10],filters=[4],filterparam2=4.,/print,opt=0.4,plot=1,powlim=0.1,step=5)
;shot=52170
;trange=[0.5,0.55]
;modes=pg_modenumber_full(shot,trange=trange,modescale=[-10,10],filters=[0],filterparam2=4.,/print,opt=0.4,plot=1,cohlim=0.3,powlim=0.1,step=10,avr=5)
;shot=47941
;trange=[0.4,0.48]
;channels=['W7-AS Mirnov/MIR-1-1',$
;															'W7-AS Mirnov/MIR-1-2',$
;															'W7-AS Mirnov/MIR-1-3',$
;															'W7-AS Mirnov/MIR-1-4',$
;															'W7-AS Mirnov/MIR-1-5',$
;															'W7-AS Mirnov/MIR-1-6',$
;															'W7-AS Mirnov/MIR-1-7',$
;															'W7-AS Mirnov/MIR-1-8',$
;															'W7-AS Mirnov/MIR-1-9',$
;															'W7-AS Mirnov/MIR-1-10',$
;															'W7-AS Mirnov/MIR-1-11',$
;															'W7-AS Mirnov/MIR-1-12',$
;															'W7-AS Mirnov/MIR-1-13',$
;															'W7-AS Mirnov/MIR-1-14',$
;															'W7-AS Mirnov/MIR-1-15',$
;															'W7-AS Mirnov/MIR-1-16']
;chpos=[10,30,50,85,100,120,145,165,185,200,220,255,275,305,340,355]
;modes=pg_modenumber(shot,trange=trange,modescale=[-6,6],filters=[0,1],/print,opt=0.4,plot=1,powlim=0.1,step=10)
;modes=pg_modenumber(shot,trange=trange,modescale=[-6,6],filters=[4],filterparam2=1.,/print,opt=0.4,plot=0,powlim=0.1,step=10)
;modes=pg_modenumber(shot,trange=trange,modescale=[-6,6],filters=[4],filterparam2=2.,/print,opt=0.4,plot=0,powlim=0.1,step=10)
;modes=pg_modenumber(shot,trange=trange,modescale=[-6,6],filters=[0,1],/print,opt=0.4,plot=1,avr=5,cohlim=0.4,powlim=0.1,step=10)
;modes=pg_modenumber(shot,trange=trange,modescale=[-6,6],filters=[4],filterparam2=1.,/print,opt=0.4,plot=0,avr=5,cohlim=0.4,powlim=0.1,step=10)
;modes=pg_modenumber(shot,trange=trange,modescale=[-6,6],filters=[4],filterparam2=2.,/print,opt=0.4,plot=0,avr=5,cohlim=0.4,powlim=0.1,step=10)
;modes=pg_modenumber(shot,trange=trange,modescale=[-10,10],filters=[0,1],/print,opt=0.4,plot=1,powlim=0.1,step=10)
;modes=pg_modenumber(shot,trange=trange,modescale=[-10,10],filters=[4],filterparam2=1.,/print,opt=0.4,plot=0,powlim=0.1,step=10)
;modes=pg_modenumber(shot,trange=trange,modescale=[-10,10],filters=[4],filterparam2=2.,/print,opt=0.4,plot=0,powlim=0.1,step=10)
;modes=pg_modenumber(shot,trange=trange,modescale=[-10,10],filters=[0,1],/print,opt=0.4,plot=1,avr=5,cohlim=0.4,powlim=0.1,step=10)
;modes=pg_modenumber(shot,trange=trange,modescale=[-10,10],filters=[4],filterparam2=1.,/print,opt=0.4,plot=0,avr=5,cohlim=0.4,powlim=0.1,step=10)
;modes=pg_modenumber(shot,trange=trange,modescale=[-10,10],filters=[4],filterparam2=2.,/print,opt=0.4,plot=0,avr=5,cohlim=0.4,powlim=0.1,step=10)

;shot=52123
;trange=[0.548,0.556]
;channels=['W7-AS Mirnov/MIR-1-1',$
;															'W7-AS Mirnov/MIR-1-2',$
;															'W7-AS Mirnov/MIR-1-3',$
;															'W7-AS Mirnov/MIR-1-4',$
;															'W7-AS Mirnov/MIR-1-5',$
;															'W7-AS Mirnov/MIR-1-6',$
;															'W7-AS Mirnov/MIR-1-7',$
;															'W7-AS Mirnov/MIR-1-8',$
;															'W7-AS Mirnov/MIR-1-9',$
;															'W7-AS Mirnov/MIR-1-10',$
;															'W7-AS Mirnov/MIR-1-11',$
;															'W7-AS Mirnov/MIR-1-12',$
;															'W7-AS Mirnov/MIR-1-13',$
;															'W7-AS Mirnov/MIR-1-14',$
;															'W7-AS Mirnov/MIR-1-15',$
;															'W7-AS Mirnov/MIR-1-16']
;chpos=[10,30,50,85,100,120,145,165,185,200,220,255,275,305,340,355]
;modes=pg_modenumber(shot,trange=trange,modescale=[-6,6],filters=[0,1],/print,opt=0.4,plot=1,powlim=0.1,step=5)
;modes=pg_modenumber(shot,trange=trange,modescale=[-6,6],filters=[4],filterparam2=0.5,/print,opt=0.4,plot=0,powlim=0.1,step=5)
;modes=pg_modenumber(shot,trange=trange,modescale=[-6,6],filters=[0,1],/print,opt=0.4,plot=1,avr=5,cohlim=0.4,powlim=0.1,step=5)
;modes=pg_modenumber(shot,trange=trange,modescale=[-6,6],filters=[4],filterparam2=0.5,/print,opt=0.4,plot=0,avr=5,cohlim=0.4,powlim=0.1,step=5)
;modes=pg_modenumber(shot,trange=trange,modescale=[-6,6],filters=[0,1],/print,/cwt,order=24,dscale=0.05,opt=0.4,plot=1,powlim=0.1)
;modes=pg_modenumber(shot,trange=trange,modescale=[-6,6],filters=[4],filterparam2=0.5,/print,/cwt,order=24,dscale=0.05,opt=0.4,plot=0,powlim=0.1)
;modes=pg_modenumber(shot,trange=trange,modescale=[-6,6],filters=[0,1],/print,/cwt,order=24,dscale=0.05,opt=0.4,plot=1,avr=5,cohlim=0.4,powlim=0.1)
;modes=pg_modenumber(shot,trange=trange,modescale=[-6,6],filters=[4],filterparam2=0.5,/print,/cwt,order=24,dscale=0.05,opt=0.4,plot=0,avr=5,cohlim=0.4,powlim=0.1)

;shot=47940
;trange=[0.4,0.5]
;channels=['W7-AS Mirnov/MIR-1-1',$
;															'W7-AS Mirnov/MIR-1-2',$
;															'W7-AS Mirnov/MIR-1-3',$
;															'W7-AS Mirnov/MIR-1-4',$
;															'W7-AS Mirnov/MIR-1-5',$
;															'W7-AS Mirnov/MIR-1-6',$
;															'W7-AS Mirnov/MIR-1-7',$
;															'W7-AS Mirnov/MIR-1-8',$
;															'W7-AS Mirnov/MIR-1-9',$
;															'W7-AS Mirnov/MIR-1-10',$
;															'W7-AS Mirnov/MIR-1-11',$
;															'W7-AS Mirnov/MIR-1-12',$
;															'W7-AS Mirnov/MIR-1-13',$
;															'W7-AS Mirnov/MIR-1-14',$
;															'W7-AS Mirnov/MIR-1-15',$
;															'W7-AS Mirnov/MIR-1-16']
;chpos=[10,30,50,85,100,120,145,165,185,200,220,255,275,305,340,355]
;modes=pg_modenumber(shot,trange=trange,modescale=[-6,6],filters=[0,1],/print,opt=0.4,plot=1,powlim=0.1,step=10)
;modes=pg_modenumber(shot,trange=trange,modescale=[-6,6],filters=[4],filterparam2=1.,/print,opt=0.4,plot=0,powlim=0.1,step=10)
;modes=pg_modenumber(shot,trange=trange,modescale=[-6,6],filters=[4],filterparam2=2.,/print,opt=0.4,plot=0,powlim=0.1,step=10)
;modes=pg_modenumber(shot,trange=trange,modescale=[-6,6],filters=[0,1],/print,opt=0.4,plot=1,avr=5,cohlim=0.4,powlim=0.1,step=10)
;modes=pg_modenumber(shot,trange=trange,modescale=[-6,6],filters=[4],filterparam2=1.,/print,opt=0.4,plot=0,avr=5,cohlim=0.4,powlim=0.1,step=10)
;modes=pg_modenumber(shot,trange=trange,modescale=[-6,6],filters=[4],filterparam2=2.,/print,opt=0.4,plot=0,avr=5,cohlim=0.4,powlim=0.1,step=10)
;modes=pg_modenumber(shot,trange=trange,modescale=[-10,10],filters=[0,1],/print,opt=0.4,plot=1,powlim=0.1,step=10)
;modes=pg_modenumber(shot,trange=trange,modescale=[-10,10],filters=[4],filterparam2=1.,/print,opt=0.4,plot=0,powlim=0.1,step=10)
;modes=pg_modenumber(shot,trange=trange,modescale=[-10,10],filters=[4],filterparam2=2.,/print,opt=0.4,plot=0,powlim=0.1,step=10)
;modes=pg_modenumber(shot,trange=trange,modescale=[-10,10],filters=[0,1],/print,opt=0.4,plot=1,avr=5,cohlim=0.4,powlim=0.1,step=10)
;modes=pg_modenumber(shot,trange=trange,modescale=[-10,10],filters=[4],filterparam2=1.,/print,opt=0.4,plot=0,avr=5,cohlim=0.4,powlim=0.1,step=10)
;modes=pg_modenumber(shot,trange=trange,modescale=[-10,10],filters=[4],filterparam2=2.,/print,opt=0.4,plot=0,avr=5,cohlim=0.4,powlim=0.1,step=10)

;shot=56800
;trange=[0.44,0.452]
;channels=['W7-AS Mirnov/MIR-1-1',$
;															'W7-AS Mirnov/MIR-1-2',$
;															'W7-AS Mirnov/MIR-1-3',$
;															'W7-AS Mirnov/MIR-1-4',$
;															'W7-AS Mirnov/MIR-1-5',$
;															'W7-AS Mirnov/MIR-1-6',$
;															'W7-AS Mirnov/MIR-1-7',$
;															'W7-AS Mirnov/MIR-1-8',$
;															'W7-AS Mirnov/MIR-1-9',$
;															'W7-AS Mirnov/MIR-1-10',$
;															'W7-AS Mirnov/MIR-1-11',$
;															'W7-AS Mirnov/MIR-1-12',$
;															'W7-AS Mirnov/MIR-1-13',$
;															'W7-AS Mirnov/MIR-1-14',$
;															'W7-AS Mirnov/MIR-1-15',$
;															'W7-AS Mirnov/MIR-1-16']
;chpos=[10,30,50,85,100,120,145,165,185,200,220,255,275,305,340,355]
;modes=pg_modenumber(shot,trange=trange,filters=[4],/print,opt=0.4,plot=0,step=5,timeax=timeax, freqax=freqax, cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds)
;modes=pg_modenumber(shot,trange=trange,filters=[0,1],/print,opt=0.4,plot=1,cohlim=0.4,avr=5,step=5,timeax=timeax, freqax=freqax, cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds)
;modes=pg_modenumber(shot,trange=trange,filters=[2],/print,opt=0.4,plot=1,cohlim=0.4,avr=5,timeax=timeax, freqax=freqax, cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds)
;modes=pg_modenumber(shot,trange=trange,filters=[4],/print,opt=0.4,plot=0,cohlim=0.4,avr=5,step=5,timeax=timeax, freqax=freqax, cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds)
;pg_phasediagram,cphases,chpos,timeax,freqax,0.2041,8,shot=shot,channels=channels,filters=[0,1,2,3,4,5,6,8],/print
;pg_phasediagram,cphases,chpos,timeax,freqax,0.2025,50,shot=shot,channels=channels,filters=[0,1,2,3,4,5,6,8],/print
;pg_phasediagram,cphases,chpos,timeax,freqax,0.2039,152,shot=shot,channels=channels,filters=[0,1,2,3,4,8],/print

;shot=19821
;trange=[3.075,3.08]
;channels=['AUG_mirnov/ch1','AUG_mirnov/ch2','AUG_mirnov/ch3','AUG_mirnov/ch4','AUG_mirnov/ch5','AUG_mirnov/ch6','AUG_mirnov/ch7']
;chpos=[-0.5996133,-0.3948667,-0.1871677,0.0148528,0.2401990,0.4343090,0.6222068]/2./!PI*360
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,windowsize=500,masksize=4000,freqres=1,step=200,filters=[4],/print,opt=0.2,avr=0,plot=0)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,windowsize=500,masksize=4000,freqres=1,step=200,filters=[4],/print,opt=0.2,avr=3,plot=1)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,windowsize=500,masksize=4000,freqres=1,step=200,filters=[4],/print,opt=0.2,avr=3,plot=0,filterparam2=2)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,/cwt,order=48,dscale=0.04,filters=[4],/print,opt=0.2,avr=0,plot=0)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,/cwt,order=48,dscale=0.04,filters=[4],/print,opt=0.2,avr=3,plot=1)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,/cwt,order=48,dscale=0.04,filters=[4],/print,opt=0.2,avr=3,plot=0,filterparam2=2)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,/cwt,order=48,dscale=0.04,filters=[4],/print,opt=0.2,avr=3,plot=0,filterparam2=2,filterparam1=0.1)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,/cwt,order=6,dscale=0.04,filters=[4],/print,opt=0.2,avr=0,plot=1)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,/cwt,order=6,dscale=0.04,filters=[4],/print,opt=0.2,avr=3,plot=1)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,/cwt,order=6,dscale=0.04,filters=[4],/print,opt=0.2,avr=3,plot=0,filterparam2=2)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,/cwt,order=6,dscale=0.04,filters=[4],/print,opt=0.2,avr=3,plot=0,filterparam2=2,filterparam1=0.1)

;shot=19821
;trange=[3.075,3.08]
;channels=['AUG_mirnov/ch38','AUG_mirnov/ch39','AUG_mirnov/ch40','AUG_mirnov/ch41','AUG_mirnov/ch42']
;chpos=[3.5964979,4.7430956,5.1837727,5.7474260,6.7532993]/2./!PI*360
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,windowsize=500,masksize=4000,freqres=1,step=200,filters=[4],/print,opt=0.2,avr=0,plot=0)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,windowsize=500,masksize=4000,freqres=1,step=200,filters=[4],/print,opt=0.2,avr=3,plot=1)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,windowsize=500,masksize=4000,freqres=1,step=200,filters=[4],/print,opt=0.2,avr=3,plot=0,filterparam2=2)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,/cwt,order=48,dscale=0.04,filters=[4],/print,opt=0.2,avr=0,plot=0)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,/cwt,order=48,dscale=0.04,filters=[4],/print,opt=0.2,avr=3,plot=1)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,/cwt,order=48,dscale=0.04,filters=[4],/print,opt=0.2,avr=3,plot=0,filterparam2=2)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,/cwt,order=48,dscale=0.04,filters=[4],/print,opt=0.2,avr=3,plot=0,filterparam2=2,filterparam1=0.1)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,/cwt,order=6,dscale=0.04,filters=[4],/print,opt=0.2,avr=0,plot=1)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,/cwt,order=6,dscale=0.04,filters=[4],/print,opt=0.2,avr=3,plot=1)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,/cwt,order=6,dscale=0.04,filters=[4],/print,opt=0.2,avr=3,plot=0,filterparam2=2)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,/cwt,order=6,dscale=0.04,filters=[4],/print,opt=0.2,avr=3,plot=0,filterparam2=2,filterparam1=0.1)

;shots=[54857]
;for i=0,n_elements(shots)-1 do modes=pg_modenumber(shots(i),/print,opt=0.2,avr=10,step=10,plot=1,/nophase)
;for i=0,n_elements(shots)-1 do modes=pg_modenumber(shots(i),/print,opt=0.2,avr=20,step=10,plot=1,/nophase)
;for i=0,n_elements(shots)-1 do modes=pg_modenumber(shots(i),/print,opt=0.2,avr=40,step=10,plot=1,/nophase)

;shot=56800
;trange=[0.20,0.21]
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[0,1],/print,opt=0.4,avr=0,step=5,plot=1)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[4],/print,opt=0.4,avr=0,step=5,plot=0)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[0,1],/print,opt=0.4,avr=2,step=5,plot=1)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[4],/print,opt=0.4,avr=2,step=5,plot=0)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[4],/print,opt=0.4,avr=2,step=5,plot=0,filterparam2=3,modescale=[-6,6])

;shot=56800
;trange=[0.35,0.36]
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[0,1],/print,opt=0.4,avr=0,step=5,plot=1)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[4],/print,opt=0.4,avr=0,step=5,plot=0)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[0,1],/print,opt=0.4,avr=2,step=5,plot=1)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[4],/print,opt=0.4,avr=2,step=5,plot=0)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[4],/print,opt=0.4,avr=2,step=5,plot=0,filterparam2=3,modescale=[-6,6])

;shot=56800
;trange=[0.43,0.44]
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[0,1],/print,opt=0.4,avr=0,step=5,plot=1)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[4],/print,opt=0.4,avr=0,step=5,plot=0)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[0,1],/print,opt=0.4,avr=2,step=5,plot=1)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[4],/print,opt=0.4,avr=2,step=5,plot=0)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[4],/print,opt=0.4,avr=2,step=5,plot=0,filterparam2=3,modescale=[-6,6])

;shot=55252
;trange=[0.33,0.34]
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[0,1],/print,opt=0.4,avr=0,step=5,plot=1)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[4],/print,opt=0.4,avr=0,step=5,plot=0)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[0,1],/print,opt=0.4,avr=2,step=5,plot=1)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[4],/print,opt=0.4,avr=2,step=5,plot=0)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[4],/print,opt=0.4,avr=2,step=5,plot=0,filterparam2=3,modescale=[-6,6])

;shot=55248
;trange=[0.43,0.44]
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[0,1],/print,opt=0.4,avr=0,step=5,plot=1)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[4],/print,opt=0.4,avr=0,step=5,plot=0)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[0,1],/print,opt=0.4,avr=2,step=5,plot=1)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[4],/print,opt=0.4,avr=2,step=5,plot=0)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[4],/print,opt=0.4,avr=2,step=5,plot=0,filterparam2=3,modescale=[-6,6])

;shot=55261
;trange=[0.18,0.19]
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[0,1],/print,opt=0.4,avr=0,step=5,plot=1)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[4],/print,opt=0.4,avr=0,step=5,plot=0)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[0,1],/print,opt=0.4,avr=2,step=5,plot=1)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[4],/print,opt=0.4,avr=2,step=5,plot=0)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[4],/print,opt=0.4,avr=2,step=5,plot=0,filterparam2=3,modescale=[-6,6])

;shot=55261
;trange=[0.38,0.39]
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[0,1],/print,opt=0.4,avr=0,step=5,plot=1)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[4],/print,opt=0.4,avr=0,step=5,plot=0)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[0,1],/print,opt=0.4,avr=2,step=5,plot=1)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[4],/print,opt=0.4,avr=2,step=5,plot=0)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[4],/print,opt=0.4,avr=2,step=5,plot=0,filterparam2=3,modescale=[-6,6])

;shot=55262
;trange=[0.43,0.44]
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[0,1],/print,opt=0.4,avr=0,step=5,plot=1)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[4],/print,opt=0.4,avr=0,step=5,plot=0)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[0,1],/print,opt=0.4,avr=2,step=5,plot=1)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[4],/print,opt=0.4,avr=2,step=5,plot=0)
;modes=pg_modenumber(shot,channels=channels,chpos=chpos,trange=trange,filters=[4],/print,opt=0.4,avr=2,step=5,plot=0,filterparam2=3,modescale=[-6,6])


;shots=[55230,55237,55262,55261,55245,55250,55248,55252,55256,$
;	51307,51884,51898,50770,50769,51048,51062,51061,$
;	55561,55563,55564,55565,55569,$
;	56796,56799,56800,56801,56802,56808,56809]
;for i=0,n_elements(shots)-1 do modes=pg_modenumber(shots(i),/print,opt=0.2,avr=10,step=10,plot=1,/nophase)

;for shot=56800,56800 do begin
;	for ch=3,3 do begin
;		coh=pg_cscalogram([shot,shot],['W7-AS Mirnov/MIR-1-1','W7-AS Mirnov/MIR-1-'+nti_wavelet_i2str(ch)],trange=[0.45,0.55],order=36,dscale=0.05,plot=1,inttime=1,opt=0.2,phaselevel=3,/print,/pad)
;	endfor
;endfor

;for shot=56796,56796 do begin
;	for ch=1,16 do begin
;		stft=pg_spectrogram(shot,'W7-AS Mirnov/MIR-1-'+nti_wavelet_i2str(ch),windowsize=100,masksize=600,step=20,freqres=1,plot=1,/print,opt=0.12)
;	endfor
;endfor

;for shot=56799,56802 do begin
;	for ch=1,16 do begin
;		stft=pg_spectrogram(shot,'W7-AS Mirnov/MIR-1-'+nti_wavelet_i2str(ch),windowsize=100,masksize=600,step=20,freqres=1,plot=1,/print,opt=0.12)
;	endfor
;endfor

;for shot=56808,56809 do begin
;	for ch=1,16 do begin
;		stft=pg_spectrogram(shot,'W7-AS Mirnov/MIR-1-'+nti_wavelet_i2str(ch),windowsize=100,masksize=600,step=20,freqres=1,plot=1,/print,opt=0.12)
;	endfor
;endfor

;for shot=56796,56796 do begin
;	for ch=1,16 do begin
;		stft=pg_spectrogram(shot,'W7-AS Mirnov/MIR-1-'+nti_wavelet_i2str(ch),trange=[0.32,0.6],windowsize=100,masksize=600,step=20,freqres=1,plot=1,/print,opt=0.25)
;	endfor
;endfor

;for shot=56799,56802 do begin
;	for ch=1,16 do begin
;		stft=pg_spectrogram(shot,'W7-AS Mirnov/MIR-1-'+nti_wavelet_i2str(ch),trange=[0.32,0.6],windowsize=100,masksize=600,step=20,freqres=1,plot=1,/print,opt=0.25)
;	endfor
;endfor

;for shot=56808,56809 do begin
;	for ch=1,16 do begin
;		stft=pg_spectrogram(shot,'W7-AS Mirnov/MIR-1-'+nti_wavelet_i2str(ch),trange=[0.32,0.6],windowsize=100,masksize=600,step=20,freqres=1,plot=1,/print,opt=0.25)
;	endfor
;endfor

;for shot=56808,56809 do begin
;coh=pg_cscalogram([shot,shot],['W7-AS Mirnov/MIR-1-1','W7-AS Mirnov/MIR-1-2'],trange=[0.4,0.5],order=24,dscale=0.05,plot=1,inttime=1,opt=0.2,phaselevel=1,/print,/pad)
;coh=pg_cscalogram([shot,shot],['W7-AS Mirnov/MIR-1-1','W7-AS Mirnov/MIR-1-3'],trange=[0.4,0.5],order=24,dscale=0.05,plot=1,inttime=1,opt=0.2,phaselevel=1,/print,/pad)
;coh=pg_cscalogram([shot,shot],['W7-AS Mirnov/MIR-1-1','W7-AS Mirnov/MIR-1-4'],trange=[0.4,0.5],order=24,dscale=0.05,plot=1,inttime=1,opt=0.2,phaselevel=1,/print,/pad)
;coh=pg_cscalogram([shot,shot],['W7-AS Mirnov/MIR-1-1','W7-AS Mirnov/MIR-1-5'],trange=[0.4,0.5],order=24,dscale=0.05,plot=1,inttime=1,opt=0.2,phaselevel=1,/print,/pad)
;coh=pg_cscalogram([shot,shot],['W7-AS Mirnov/MIR-1-1','W7-AS Mirnov/MIR-1-6'],trange=[0.4,0.5],order=24,dscale=0.05,plot=1,inttime=1,opt=0.2,phaselevel=1,/print,/pad)
;coh=pg_cscalogram([shot,shot],['W7-AS Mirnov/MIR-1-1','W7-AS Mirnov/MIR-1-7'],trange=[0.4,0.5],order=24,dscale=0.05,plot=1,inttime=1,opt=0.2,phaselevel=1,/print,/pad)
;coh=pg_cscalogram([shot,shot],['W7-AS Mirnov/MIR-1-1','W7-AS Mirnov/MIR-1-8'],trange=[0.4,0.5],order=24,dscale=0.05,plot=1,inttime=1,opt=0.2,phaselevel=1,/print,/pad)
;coh=pg_cscalogram([shot,shot],['W7-AS Mirnov/MIR-1-1','W7-AS Mirnov/MIR-1-9'],trange=[0.4,0.5],order=24,dscale=0.05,plot=1,inttime=1,opt=0.2,phaselevel=1,/print,/pad)
;coh=pg_cscalogram([shot,shot],['W7-AS Mirnov/MIR-1-1','W7-AS Mirnov/MIR-1-10'],trange=[0.4,0.5],order=24,dscale=0.05,plot=1,inttime=1,opt=0.2,phaselevel=1,/print,/pad)
;coh=pg_cscalogram([shot,shot],['W7-AS Mirnov/MIR-1-1','W7-AS Mirnov/MIR-1-11'],trange=[0.4,0.5],order=24,dscale=0.05,plot=1,inttime=1,opt=0.2,phaselevel=1,/print,/pad)
;coh=pg_cscalogram([shot,shot],['W7-AS Mirnov/MIR-1-1','W7-AS Mirnov/MIR-1-12'],trange=[0.4,0.5],order=24,dscale=0.05,plot=1,inttime=1,opt=0.2,phaselevel=1,/print,/pad)
;coh=pg_cscalogram([shot,shot],['W7-AS Mirnov/MIR-1-1','W7-AS Mirnov/MIR-1-13'],trange=[0.4,0.5],order=24,dscale=0.05,plot=1,inttime=1,opt=0.2,phaselevel=1,/print,/pad)
;coh=pg_cscalogram([shot,shot],['W7-AS Mirnov/MIR-1-1','W7-AS Mirnov/MIR-1-14'],trange=[0.4,0.5],order=24,dscale=0.05,plot=1,inttime=1,opt=0.2,phaselevel=1,/print,/pad)
;coh=pg_cscalogram([shot,shot],['W7-AS Mirnov/MIR-1-1','W7-AS Mirnov/MIR-1-15'],trange=[0.4,0.5],order=24,dscale=0.05,plot=1,inttime=1,opt=0.2,phaselevel=1,/print,/pad)
;coh=pg_cscalogram([shot,shot],['W7-AS Mirnov/MIR-1-1','W7-AS Mirnov/MIR-1-16'],trange=[0.4,0.5],order=24,dscale=0.05,plot=1,inttime=1,opt=0.2,phaselevel=1,/print,/pad)
;endfor


;for shot=56789,56791 do begin
;	cwt=pg_scalogram(shot,'W7-AS Mirnov/MIR-1-1',order=12,dscale=0.1,opt=0.2,/print,/pad,plot=1)
;	cwt=pg_scalogram(shot,'W7-AS Mirnov/MIR-1-5',order=12,dscale=0.1,opt=0.2,/print,/pad,plot=1)
;	cwt=pg_scalogram(shot,'W7-AS Mirnov/MIR-1-10',order=12,dscale=0.1,opt=0.2,/print,/pad,plot=1)
;endfor
;for shot=56794,56796 do begin
;	cwt=pg_scalogram(shot,'W7-AS Mirnov/MIR-1-1',order=12,dscale=0.1,opt=0.2,/print,/pad,plot=1)
;	cwt=pg_scalogram(shot,'W7-AS Mirnov/MIR-1-5',order=12,dscale=0.1,opt=0.2,/print,/pad,plot=1)
;	cwt=pg_scalogram(shot,'W7-AS Mirnov/MIR-1-10',order=12,dscale=0.1,opt=0.2,/print,/pad,plot=1)
;endfor
;for shot=56798,56809 do begin
;	cwt=pg_scalogram(shot,'W7-AS Mirnov/MIR-1-1',order=12,dscale=0.1,opt=0.2,/print,/pad,plot=1)
;	cwt=pg_scalogram(shot,'W7-AS Mirnov/MIR-1-5',order=12,dscale=0.1,opt=0.2,/print,/pad,plot=1)
;	cwt=pg_scalogram(shot,'W7-AS Mirnov/MIR-1-10',order=12,dscale=0.1,opt=0.2,/print,/pad,plot=1)
;endfor

;filens=[$
;'exp1-100_filenames.dat',$
;'exp2-100_filenames.dat',$
;'exp3-100_filenames.dat',$
;'exp4-100_filenames.dat',$
;'exp5-100_filenames.dat',$
;'exp6-100_filenames.dat',$
;'exp7-100_filenames.dat',$
;'exp8-100_filenames.dat'
;]

;for i=0,n_elements(filens)-1 do begin
;restore,dir_f_name('data',filens[i])
;	pg_exp_saved2,filenames,corrlength=0.003,plot=2,err=1,/print
;endfor

;shot=47940
;trange=[0.400355,0.419715]
;pg_limirrawtr_coh,shot,trange,/print,/plot2d
;trange=[0.425355,0.444715]
;pg_limirrawtr_coh,shot,trange,/print,/plot2d
;trange=[0.450355,0.469715]
;pg_limirrawtr_coh,shot,trange,/print,/plot2d
;trange=[0.475355,0.494715]
;pg_limirrawtr_coh,shot,trange,/print,/plot2d
;trange=[0.500355,0.519715]
;pg_limirrawtr_coh,shot,trange,/print,/plot2d
;trange=[0.525355,0.544715]
;pg_limirrawtr_coh,shot,trange,/print,/plot2d
;trange=[0.550355,0.563835]
;pg_limirrawtr_coh,shot,trange,/print,/plot2d
;trange=[0.800355,0.819715]
;pg_limirrawtr_coh,shot,trange,/print,/plot2d
;trange=[0.825355,0.844715]
;pg_limirrawtr_coh,shot,trange,/print,/plot2d
;trange=[0.850355,0.869715]
;pg_limirrawtr_coh,shot,trange,/print,/plot2d
;trange=[0.875355,0.894715]
;pg_limirrawtr_coh,shot,trange,/print,/plot2d
;trange=[0.900355,0.919715]
;pg_limirrawtr_coh,shot,trange,/print,/plot2d
;trange=[0.925355,0.944715]
;pg_limirrawtr_coh,shot,trange,/print,/plot2d
;trange=[0.950355,0.963835]
;pg_limirrawtr_coh,shot,trange,/print,/plot2d

;shot=47939
;trange=[0.400355,0.419715]
;pg_limirrawtr_coh,shot,trange,/print,/plot2d
;trange=[0.425355,0.444715]
;pg_limirrawtr_coh,shot,trange,/print,/plot2d
;trange=[0.450355,0.469715]
;pg_limirrawtr_coh,shot,trange,/print,/plot2d
;trange=[0.475355,0.494715]
;pg_limirrawtr_coh,shot,trange,/print,/plot2d
;trange=[0.500355,0.519715]
;pg_limirrawtr_coh,shot,trange,/print,/plot2d
;trange=[0.525355,0.544715]
;pg_limirrawtr_coh,shot,trange,/print,/plot2d
;trange=[0.550355,0.563835]
;pg_limirrawtr_coh,shot,trange,/print,/plot2d

;trange=[0.4,0.56]
;shot=52123
;pg_limirrawtr_coh,shot,trange,/print,/plot2d
;shot=52129
;pg_limirrawtr_coh,shot,trange,/print,/plot2d
;shot=52135
;pg_limirrawtr_coh,shot,trange,/print,/plot2d
;shot=52141
;pg_limirrawtr_coh,shot,trange,/print,/plot2d
;shot=52147
;pg_limirrawtr_coh,shot,trange,/print,/plot2d
;shot=52153
;pg_limirrawtr_coh,shot,trange,/print,/plot2d
;shot=52164
;pg_limirrawtr_coh,shot,trange,/print,/plot2d
;shot=52170
;pg_limirrawtr_coh,shot,trange,/print,/plot2d



;restore,dir_f_name('data','47190-47192_stft20_filenames.dat')
;pg_exp_saved2,filenames,plot=3,/freq,/print,blocksize=2048,maxf=24000,fitmaxf=4500
;restore,dir_f_name('data','47193-47198_stft20_filenames.dat')
;pg_exp_saved2,filenames,plot=3,/freq,/print,blocksize=2048,maxf=24000,fitmaxf=6000
;restore,dir_f_name('data','47941-47943_stft20_filenames.dat')
;pg_exp_saved2,filenames,plot=3,/freq,/print,blocksize=2048,maxf=24000,fitmaxf=6000
;restore,dir_f_name('data','47944-47946_stft20_filenames.dat')
;pg_exp_saved2,filenames,plot=3,/freq,/print,blocksize=2048,maxf=24000,fitmaxf=3000
;restore,dir_f_name('data','exp1-100_filenames.dat')
;pg_exp_saved2,filenames,plot=3,/freq,/print,blocksize=8192,maxf=8000,fitmaxf=3000
;restore,dir_f_name('data','exp2-100_filenames.dat')
;pg_exp_saved2,filenames,plot=3,/freq,/print,blocksize=8192,maxf=8000,fitmaxf=6000
;restore,dir_f_name('data','exp3-100_filenames.dat')
;pg_exp_saved2,filenames,plot=3,/freq,/print,blocksize=8192,maxf=8000,fitmaxf=4000
;restore,dir_f_name('data','exp4-100_filenames.dat')
;pg_exp_saved2,filenames,plot=3,/freq,/print,blocksize=8192,maxf=8000,fitmaxf=500
;restore,dir_f_name('data','exp5-100_filenames.dat')
;pg_exp_saved2,filenames,plot=3,/freq,/print,blocksize=8192,maxf=8000,fitmaxf=1000
;restore,dir_f_name('data','exp6-100_filenames.dat')
;pg_exp_saved2,filenames,plot=3,/freq,/print,blocksize=8192,maxf=8000,fitmaxf=3000
;restore,dir_f_name('data','exp7-100_filenames.dat')
;pg_exp_saved2,filenames,plot=3,/freq,/print,blocksize=8192,maxf=8000,fitmaxf=4000
;restore,dir_f_name('data','exp8-100_filenames.dat')
;pg_exp_saved2,filenames,plot=3,/freq,/print,blocksize=8192,maxf=8000,fitmaxf=4000


;filens=[$
;'47190-47192_stft20_filenames.dat',$
;'47193-47198_stft20_filenames.dat',$
;'47941-47943_stft20_filenames.dat',$
;'47944-47946_stft20_filenames.dat']
;for i=0,n_elements(filens)-1 do begin
;	restore,dir_f_name('data',filens[i])
;	pg_exp_saved2,filenames,plot=3,/freq,/print,blocksize=2048,maxf=24000
;endfor

;filens=[$
;'exp1-100_filenames.dat',$
;'exp2-100_filenames.dat',$
;'exp3-100_filenames.dat',$
;'exp4-100_filenames.dat',$
;'exp5-100_filenames.dat',$
;'exp6-100_filenames.dat',$
;'exp7-100_filenames.dat',$
;'exp6-100_filenames.dat']

;for i=0,n_elements(filens)-1 do begin
;	restore,dir_f_name('data',filens[i])
;	pg_exp_saved2,filenames,plot=3,/freq,/print, blocksize=8192,maxf=8000
;endfor

;for i=0,n_elements(filens)-1 do begin
;	restore,dir_f_name('data',filens[i])
;	for j=0,n_elements(filenames)-1 do begin
;		temp=strsplit(filenames[j],'/',/extract)
;		temp=strsplit(temp[n_elements(temp)-1],'\',/extract)
;		filenames[j]=temp[n_elements(temp)-1]
;	endfor
;	save,filenames,filename=filens[i]
;endfor


;filens=[$
;'exp7-20_filenames.dat',$
;'exp8-20_filenames.dat']

;for i=0,n_elements(filens)-1 do begin
;	restore,dir_f_name('data',filens[i])
;	for j=0,n_elements(filenames)-1 do begin
;		if strpos(filenames[j],'/') NE -1 then filenames[j]=strmid(filenames[j],strpos(filenames[j],'/')+1)
;		if strpos(filenames[j],'\') NE -1 then filenames[j]=strmid(filenames[j],strpos(filenames[j],'\')+1)
;	endfor
;	for j=0,n_elements(filenames)-1 do pg_ccorrplot_saved, filenames[j], corrlength=0.003, plot=1, /print, ct=1
;endfor

;pg_bps,[47941,47943],[0,100,15,25,43,47,57,60,80,90],trange=[0.4,0.59],windowsize=100,$
;	masksize=1000,freqres=1,plot=2,/print
;pg_bps,[47944,47946],[0,100,15,20,25,28,34,37,80,90],trange=[0.4,0.563836],windowsize=100,$;
;	masksize=1000,freqres=1,plot=2,/print
;pg_bps,[47190,47192],[0,100,20,30,43,47,57,60,80,90],trange=[0.3,0.4],windowsize=20,$
;	masksize=800,freqres=1,/print,plot=2
;pg_bps,[47193,47198],[0,100,15,25,35,45,80,90],trange=[0.3,0.4],windowsize=20,$
;	masksize=800,freqres=1,/print,plot=2

;for i=2,16 do begin
;	cwt=pg_cscalogram([52153,52153],['W7-AS Mirnov/MIR-1-1','W7-AS Mirnov/MIR-1-'+nti_wavelet_i2str(i)],trange=[0.4,0.6],order=10,$
;		dscale=0.2,inttime=5000,/pad,/print,opt=0.2)
;endfor

;filens=[$
;'47944-46_stft20_filenames.dat']

;corrlength=0.002
;plot=1
;ct=1

;for i=0,n_elements(filens)-1 do begin
;	restore,dir_f_name('data',filens[i])
;	for i=0,n_elements(filenames)-1 do pg_ccorrplot_saved, filenames[i], corrlength=corrlength, plot=plot, /print, ct=ct
;endfor

;pg_ecemirband,47941,[0,100,15,25,43,47,57,60,80,90],/print,plot=2,trange=[0.4,0.6],mirfilt=800e-6,mirwin='Rectangle'
;pg_ecemirband,47942,[0,100,15,25,43,47,57,60,80,90],/print,plot=2,trange=[0.4,0.6],mirfilt=800e-6,mirwin='Rectangle'
;pg_ecemirband,47943,[0,100,15,25,43,47,57,60,80,90],/print,plot=2,trange=[0.4,0.6],mirfilt=800e-6,mirwin='Rectangle'
;pg_ecemirband,47944,[0,100,15,20,25,28,34,37,80,90],/print,plot=2,trange=[0.4,0.6],mirfilt=800e-6,mirwin='Rectangle'
;pg_ecemirband,47945,[0,100,15,20,25,28,34,37,80,90],/print,plot=2,trange=[0.4,0.6],mirfilt=800e-6,mirwin='Rectangle'
;pg_ecemirband,47946,[0,100,15,20,25,28,34,37,80,90],/print,plot=2,trange=[0.4,0.8],mirfilt=800e-6,mirwin='Rectangle'
;pg_ecemirband,47940,[0,100,15,20,80,90],/print,plot=2,trange=[0.85,1.],mirfilt=800e-6,mirwin='Rectangle'
;pg_ecemirband,47940,[0,100,15,20,80,90],/print,plot=2,trange=[0.8,0.85],mirfilt=800e-6,mirwin='Rectangle'
;pg_ecemirband,47940,[0,100,15,25,43,47,57,60,80,90],/print,plot=2,trange=[0.4,0.5],mirfilt=800e-6,mirwin='Rectangle'

;mirfilt=[0,10e-6,100e-6,800e-6,1600e-6]
;mirfilt=[10e-6,100e-6,800e-6,1600e-6]

;for i=0,n_elements(mirfilt)-1 do begin
;	pg_ecemirband,47944,[0,100,15,20,25,28,34,37,80,90],/print,plot=2,trange=[0.4,0.6],mirfilt=mirfilt[i],mirwin='Rectangle'
;endfor
;for i=0,n_elements(mirfilt)-1 do begin
;	pg_ecemirband,47944,[0,100,15,20,25,28,34,37,80,90],/print,plot=2,trange=[0.4,0.6],mirfilt=mirfilt[i]
;endfor

;pg_bps,[47190,47190],[0,100,20,30,43,47,57,60,80,90],trange=[0.3,0.4],windowsize=20,masksize=800,freqres=1,/print,plot=2
;pg_bps,[47192,47192],[0,100,20,30,43,47,57,60,80,90],trange=[0.3,0.4],windowsize=20,masksize=800,freqres=1,/print,plot=2
;pg_bps,[47193,47198],[0,100,15,25,35,45,80,90],trange=[0.3,0.4],windowsize=20,masksize=800,freqres=1,/print,plot=2

;pg_crosscorrplot_ece, 47941, trange=[0.4,0.55],/print, ct=5
;pg_crosscorrplot_ece, 47942, trange=[0.4,0.55],/print, ct=5
;pg_crosscorrplot_ece, 47943, trange=[0.4,0.55],/print, ct=5
;pg_crosscorrplot_ece, 47944, trange=[0.4,0.55],/print, ct=5
;pg_crosscorrplot_ece, 47945, trange=[0.4,0.55],/print, ct=5
;pg_crosscorrplot_ece, 47946, trange=[0.4,0.75],/print, ct=5
;pg_crosscorrplot_ece, 47190, trange=[0.3,0.4],/print, ct=5
;pg_crosscorrplot_ece, 47192, trange=[0.3,0.4],/print, ct=5
;pg_crosscorrplot_ece, 47193, trange=[0.3,0.4],/print, ct=5
;pg_crosscorrplot_ece, 47194, trange=[0.3,0.4],/print, ct=5
;pg_crosscorrplot_ece, 47195, trange=[0.3,0.4],/print, ct=5
;pg_crosscorrplot_ece, 47196, trange=[0.3,0.4],/print, ct=5
;pg_crosscorrplot_ece, 47197, trange=[0.3,0.4],/print, ct=5
;pg_crosscorrplot_ece, 47198, trange=[0.3,0.4],/print, ct=5

;pg_ecemirband,47190,[0,100,20,30,43,47,57,60,80,90],/print,plot=2,trange=[0.3,0.4],mirfilt=800e-6,mirwin='Rectangle'
;pg_ecemirband,47192,[0,100,20,30,43,47,57,60,80,90],/print,plot=2,trange=[0.3,0.4],mirfilt=800e-6,mirwin='Rectangle'
;pg_ecemirband,47193,[0,100,15,25,35,45,80,90],/print,plot=2,trange=[0.3,0.4],mirfilt=800e-6,mirwin='Rectangle'
;pg_ecemirband,47194,[0,100,15,25,35,45,80,90],/print,plot=2,trange=[0.3,0.4],mirfilt=800e-6,mirwin='Rectangle'
;pg_ecemirband,47195,[0,100,15,25,35,45,80,90],/print,plot=2,trange=[0.3,0.4],mirfilt=800e-6,mirwin='Rectangle'
;pg_ecemirband,47196,[0,100,15,25,35,45,80,90],/print,plot=2,trange=[0.3,0.4],mirfilt=800e-6,mirwin='Rectangle'
;pg_ecemirband,47197,[0,100,15,25,35,45,80,90],/print,plot=2,trange=[0.3,0.4],mirfilt=800e-6,mirwin='Rectangle'
;pg_ecemirband,47198,[0,100,15,25,35,45,80,90],/print,plot=2,trange=[0.3,0.4],mirfilt=800e-6,mirwin='Rectangle'

;pg_lasmirbandtr,47942,[0,100,15,25,43,47,57,60,80,90],[0.41,0.55],/print
;pg_lasmirbandtr,47943,[0,100,15,25,43,47,57,60,80,90],[0.41,0.55],/print
;pg_lasmirbandtr,47944,[0,100,15,20,25,28,34,37,80,90],[0.41,0.55],/print
;pg_lasmirbandtr,47945,[0,100,15,20,25,28,34,37,80,90],[0.41,0.55],/print
;pg_lasmirbandtr,47946,[0,100,15,20,25,28,34,37,80,90],[0.41,0.55],/print

;pg_limirbandtr,47940,[0,100,15,25,43,47,57,60,80,90],[0.400355,0.419715],/print
;pg_limirbandtr,47940,[0,100,15,25,43,47,57,60,80,90],[0.450355     ,0.469715],/print
;pg_limirbandtr,47940,[0,100,15,25,43,47,57,60,80,90],[0.475355     ,0.494715],/print
;pg_limirbandtr,47940,[0,100,15,25,43,47,57,60,80,90],[0.500355     ,0.519715],/print
;pg_limirbandtr,47940,[0,100,15,25,43,47,57,60,80,90],[0.525355     ,0.544715],/print
;pg_limirbandtr,47940,[0,100,15,30,45,50,70,80],[0.800355     ,0.819715],/print
;pg_limirbandtr,47940,[0,100,15,30,45,50,70,80],[0.825355     ,0.844715],/print
;pg_limirbandtr,47940,[0,100,15,30,45,50,70,80],[0.850355     ,0.869715],/print
;pg_limirbandtr,47940,[0,100,15,30,45,50,70,80],[0.875355     ,0.894715],/print
;pg_limirbandtr,47940,[0,100,15,30,45,50,70,80],[0.900355     ,0.919715],/print
;pg_limirbandtr,47940,[0,100,15,30,45,50,70,80],[0.925355     ,0.944715],/print
;pg_limirbandtr,47940,[0,100,15,30,45,50,70,80],[0.950355     ,0.963],/print

;pg_lasmirbandtr,47940,[0,100,15,25,43,47,57,60,80,90],[0.42,0.56],/print
;pg_lasmirbandtr,47940,[0,100,15,30,45,50,70,80],[0.8,0.9],/print
;pg_lasmirbandtr,47940,[0,100,15,30,45,50,70,80],[0.9,0.96],/print

;pg_limirbandtr,47939,[0,100,15,25,43,47,57,60,80,90],[0.400355,0.419715],/print
;pg_limirbandtr,47939,[0,100,15,25,43,47,57,60,80,90],[0.450355     ,0.469715],/print
;pg_limirbandtr,47939,[0,100,15,25,43,47,57,60,80,90],[0.475355     ,0.494715],/print
;pg_limirbandtr,47939,[0,100,15,25,43,47,57,60,80,90],[0.500355     ,0.519715],/print
;pg_limirbandtr,47939,[0,100,15,25,43,47,57,60,80,90],[0.525355     ,0.544715],/print
;pg_limirbandtr,47939,[0,100,15,30,45,50,70,80],[0.800355     ,0.819715],/print
;pg_limirbandtr,47939,[0,100,15,30,45,50,70,80],[0.825355     ,0.844715],/print
;pg_limirbandtr,47939,[0,100,15,30,45,50,70,80],[0.850355     ,0.869715],/print
;pg_limirbandtr,47939,[0,100,15,30,45,50,70,80],[0.875355     ,0.894715],/print
;pg_limirbandtr,47939,[0,100,15,30,45,50,70,80],[0.900355     ,0.919715],/print
;pg_limirbandtr,47939,[0,100,15,30,45,50,70,80],[0.925355     ,0.944715],/print
;pg_limirbandtr,47939,[0,100,15,30,45,50,70,80],[0.950355     ,0.963],/print





end
