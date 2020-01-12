;+
; Name: pg_cspectrogram
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2007.01.16.
;
; Purpose: Plot the spectrograms, cross-spectrogram, cross-phase and cross-coherence
;			 of measurements in the Nicolet system
;
; Calling sequence:
;	cspectr=pg_cscalogram( shots, channels [,trange] [,windowname] [,windowsize] [,masksize] [,step] $
;		[,freqres] [,plot] [,avr] [,phaselevel] [,/print] [,/log] [,opt] [,/double] [,timeax=timeax] [,freqax=freqax])
;
; Inputs:
;	shots: shot numbers
;	channels: channel numbers
;	trange (optional): timerange to view, 2 element vector; default: whole range
;	windowsize (optional): length of window (standard deviation *2 for Gauss window); default: 50
;	masksize (optional): length of mask vector; default: 500
;	windowname (optional): shape of the window (available: see in pg_gen_win.pro); default: 'Gaussian'
;	step (optional): time steps of FFT; default: 10
;	freqres (optional): frequency resolution; default: 250
;	plot (optional): display mode (available:
;										 0:All; default: 0
;	avr (optional): number of independent averages (0 switches averaging off); default: 0
;	opt (optional): exponent for opimized scale visualization
;	phaselevel (optional): plot phase above a critical cross spectrum level (in %); default: 0
;	/print (optional): Print to file instead of plotting
;	/log (optional): visualize on log scale (except for Phase)
;	/double (optional): double precision
;
; Output:
;	cspectr: cross-spectrogram of signals
;	timeax (optional): Time axis
;	freqax (optional): Frequency axis
;-


function pg_cspectrogram, shots, channels, trange=trange, windowname=windowname, windowsize=windowsize,$
	masksize=masksize, step=step, freqres=freqres, plot=plot, print=print, log=log, opt=opt, $
	phaselevel=phaselevel, double=double, avr=avr, timeax=timeax, freqax=freqax

compile_opt defint32 ; 32 bit integers

; Read data
get_rawsignal,shots(0),channels(0),timeax1,data1,trange=trange
get_rawsignal,shots(1),channels(1),timeax2,data2,trange=trange

if NOT (norm(timeax1-timeax2) EQ 0) then begin
	timesize=n_elements(timeax1)
	stime=timeax2(1)-timeax2(0)
	shift=(timeax2(0)-timeax1(0))/stime
	data2=pg_retrigger(data2,shift)
	data2=pg_resample(data2,timesize)
endif

cspectr=pg_cspectrogram_sim(data1,data2,timeax1,shots=shots,channels=channels,trange=trange,windowname=windowname,$
	windowsize=windowsize, masksize=masksize, step=step, freqres=freqres, plot=plot, avr=avr, print=print, $
	log=log, opt=opt, phaselevel=phaselevel, double=double, freqax=freqax)

timeax=timeax1
freqax=freqax

return, cspectr

end
