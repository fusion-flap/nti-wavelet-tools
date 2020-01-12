;+
; Name: pg_cspectrogram_sim
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2007.01.16.
;
; Purpose: Plot the spectrograms, cross-spectrogram, cross-phase and cross-coherence
;	 of two 1D data vectors. Optional averaging id done by smoothing.
;
; Calling sequence:
;	ccwt=pg_cspectrogram_sim( data1, data2, timeax0 [,shots] [,channels] [,trange] $
;		[,windowsize] [,masksize] [,step] [,freqres] [,plot] [,avr] [,phaselevel] $
;		[,/print] [,/log] [,opt] [,freqax=freqax])
;
; Inputs:
;	data1: signal 1
;	data2: signal 2
;	timeax0: time axis
;	shots(optional): shot numbers
;	channels(optional): channel numbers
;	trange (optional): timerange to view, 2 element vector; default: whole range
;	windowsize (optional): length of window (standard deviation *2 for Gauss window); default: length of data / 10
;	masksize (optional): length of mask vector; default: all nonzero values
;	windowname (optional): shape of the window (available: see in pg_gen_win.pro)
;	step (optional): time steps of FFT; default: 1
;	freqres (optional): frequency resolution; default: length of data
;	plot (optional): display mode (available:
;										 0:All; default: 0
;	avr (optional): number of independent averages (0 switches averaging off); default: 0
;	opt (optional): exponent for opimized scale visualization
;	phaselevel (optional): plot phase above a critical cross spectrum level (in %); default: 1
;	/print (optional): Print to file instead of plotting
;	/log (optional): visualize on log scale (except for Phase)
;
; Output:
;	cspectr: cross-spectrogram of signals
;	freqax (optional): Frequency scale
;-


function pg_cspectrogram_sim, data1, data2, timeax0, shots=shots, channels=channels, trange=trange, $
	windowname=windowname, windowsize=windowsize, masksize=masksize, step=step, freqres=freqres, $
	plot=plot, avr=avr, print=print, log=log, opt=opt, $
	phaselevel=phaselevel, double=double, freqax=freqax

compile_opt defint32 ; 32 bit integers


; Set defaults
print=keyword_set(print)
log=keyword_set(log)
if not(keyword_set(shots)) then shots=[0,0]
if not(keyword_set(channels)) then channels=['SIMULATED','SIMULATED']
if not(keyword_set(windowname)) then windowname='Gauss'
if not(keyword_set(windowsize)) then windowsize=50
if not(keyword_set(masksize)) then masksize=500
if not(keyword_set(step)) then step=1
if not(keyword_set(freqres)) then freqres=1
if not(keyword_set(plot)) then plot=0
if not(keyword_set(opt)) then opt=1
if not(keyword_set(avr)) then avr=0
if not(keyword_set(phaselevel)) then phaselevel=1

; Calculate STFT-s
timeax=timeax0
stft1=pg_spectrogram_sim(data1,timeax,shot=shots(0),channel=channels(0),trange=trange,windowname=windowname, $
	windowsize=windowsize,masksize=masksize,step=step, $
	freqres=freqres, plot=1, print=print, log=log, opt=opt, freqax=freqax)
timeax=timeax0
stft2=pg_spectrogram_sim(data2,timeax,shot=shots(1),channel=channels(1),trange=trange,windowname=windowname, $
	windowsize=windowsize,masksize=masksize,step=step, $
	freqres=freqres, plot=1, print=print, log=log, opt=opt, freqax=freqax)
stftsize=size(stft1)

; Calculate CPSD
cpsd=conj(stft1)*stft2

; Calculate APSDs
apsd1=float(conj(stft1)*stft1)
apsd2=float(conj(stft2)*stft2)

inttime=avr*windowsize/step
if inttime GT 0 then begin

	; Time intergration
	for i=0,stftsize[2]-1 do cpsd[*,i]=smooth(cpsd[*,i],inttime, /EDGE_TRUNCATE)
	for i=0,stftsize[2]-1 do apsd1[*,i]=smooth(apsd1[*,i],inttime, /EDGE_TRUNCATE)
	for i=0,stftsize[2]-1 do apsd2[*,i]=smooth(apsd2[*,i],inttime, /EDGE_TRUNCATE)

	; Calculate Cross Coherence
	coh=float(abs(cpsd)/sqrt(apsd1*apsd2))
	timeax=timeax
endif

; Initialize graphics
pg_initgraph,print=print
title0=' of shot: '+pg_num2str(shots[0])+' '+channels[0]+' and shot: '+pg_num2str(shots[1])+' '+channels[1]

datas='shot1: '+nti_wavelet_i2str(shots[0])+$
	'!C'+channels[0]+$
	'!Cshot2: '+nti_wavelet_i2str(shots[1])+$
	'!C'+channels[1]+$
	'!Cwin.: '+windowname+$
	'!Cwinsize: '+nti_wavelet_i2str(windowsize)+'!C '+pg_num2str((timeax[1]-timeax[0])*windowsize/step)+'s'+$
	'!Cmasksize: '+nti_wavelet_i2str(masksize)+$
	'!Cfreqres: '+nti_wavelet_i2str(freqres)+$
	'!Cstep: '+nti_wavelet_i2str(step)+$
	'!Cintegration time: '+nti_wavelet_i2str(inttime*step)+'!C '+pg_num2str((timeax[1]-timeax[0])*inttime*step)+'s'

; Plot the results
if (plot EQ 0) OR (plot EQ 1) then begin

	ploted=abs(cpsd[*,0:stftsize(2)/2])*2

	;Plot
	title='Cross-spectrogram'+title0
	if print then device,filename=pg_filename(title) else window,/free
	pg_plot4,ploted,ct=5,xrange=[min(timeax),max(timeax)],yrange=[min(freqax),max(freqax)]$
		,xtitle='Time (s)',ytitle='Frequency (kHz)',title=title,data=datas, poster=poster,opt=opt

endif
if (plot EQ 0) AND (inttime GT 0) then begin
	ploted=coh[*,0:stftsize(2)/2]

	;Plot
	title='Cross-coherence'+title0
	if print then device,filename=pg_filename(title) else window,/free
	pg_plot4,ploted,ct=5,xrange=[min(timeax),max(timeax)],yrange=[min(freqax),max(freqax)]$
		,xtitle='Time (s)',ytitle='Frequency (kHz)',title=title,data=datas, poster=poster

endif

;Compute Phase
ploted=atan(imaginary(cpsd[*,0:stftsize(2)/2]),float(cpsd[*,0:stftsize(2)/2]))
if (plot EQ 0) then begin

	;Plot
	title='Cross-spectrogram phase'+title0
	if print then device,filename=pg_filename(title) else window,/free
	pg_plot4,ploted,ct=6,xrange=[min(timeax),max(timeax)],yrange=[min(freqax),max(freqax)]$
		,xtitle='Time (s)',ytitle='Frequency (kHz)',zrange=[-!PI,!PI],title=title,data=datas, poster=poster

endif

if phaselevel NE 0 then begin
	print,'phaselevel'
	if inttime GT 0 then wherephase=where(coh[*,0:stftsize(2)/2] LT 1/100.*phaselevel) $
		else wherephase=where(abs(cpsd[*,0:stftsize(2)/2]) LT max(abs(cpsd[*,0:stftsize(2)/2]))/100.*phaselevel)
	ploted[wherephase]=(257/255)*!PI
	if (plot EQ 0) then begin

		;Plot
		title='Cross-spectrogram phaselevel'+title0
		if print then device,filename=pg_filename(title) else window,/free
		pg_plot4,ploted,ct=41,xrange=[min(timeax),max(timeax)],yrange=[min(freqax),max(freqax)] $
			,xtitle='Time (s)',ytitle='Frequency (kHz)',zrange=[-!PI,!PI],title=title $
			,data=datas+'!C phaselevel: '+pg_num2str(phaselevel,length=3)+'%', poster=poster

	endif
endif

freqax=freqax
cspectr=cpsd

if print then device,/close

return, cspectr

end
