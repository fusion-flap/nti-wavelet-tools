;+
; Name: pg_loadwav
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2004.04.28.
;
; Purpose: Load signal from wav file
;
; Calling sequence:
;	data=pg_loadwav(filename [,time] [,trange])
;
; Input:
;	filename: Name of wav file
;	trange (optional): Time range of the signal (s); default: whole range
;
; Output:
;	time (optional): Time scale
;
;-

function pg_loadwav, filename, trange=trange, time=time, plot=plot

compile_opt defint32 ; 32 bit integers

plot=keyword_set(plot)

data=read_wav(filename,rate)
time=findgen(n_elements(data))/rate

if not(keyword_set(trange)) then trange=[min(time),max(time)]
ind=where((time ge trange(0)) and (time le trange(1)))
time=time(ind)
data=data(ind)

pg_initgraph

if plot then begin
	window,/free
	plot,time,data,xstyle=1
endif

return,data

end
