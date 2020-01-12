;+
; Name: pg_ballooning
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2007.03.09.
;
; Purpose: Plot time-frequency transform amplitudes at given time and frequency
;				as a function of probe position
;
; Calling sequence:
;	amplitudes=pg_ballooning(transforms, chpos, timeax, freqax, timea, freq [,weights] [,shot] [,channels] [,plot] [,/print])
;
; Inputs:
;		transforms: time-frequency transrofms
;		chpos: channel positions in degrees; default: W7-AS Mirnov/MIR-1 coils
;		timeax: Time axis
;		freqax: Frequency axis
;		time: Time of phase diagram
;		freq: Frequency of phase diagram
;		weights (optional): Normalization coefficients of probe sensitivity
;		shot (optional): shot number
;		channels (optional): channel numbers; default: W7-AS Mirnov/MIR-1 coils
;		plot (optional): display mode (available:
;										0:Plot amplitudes in polar plot
;										1:0+Plot amplitudes in simple plot
;										-1:None; default: 0
;		/print (optional): Print to file instead of plotting
;-


function pg_ballooning, transforms, chpos, timeax, freqax, time, freq, weights=weights,$
	shot=shot, channels=channels, plot=plot, print=print

compile_opt defint32 ; 32 bit integers

; Set defaults
print=keyword_set(print)
if not(keyword_set(shot)) then shot=0
channelssize=n_elements(chpos)
if not(keyword_set(weights)) then weights=fltarr(channelssize)+1
if not(keyword_set(channels)) then channels=pg_num2str(indgen(channelssize))
if channelssize NE n_elements(transforms(*,0,0)) then begin
	print,'Wrong input data dimensions!'
	exit
endif
if not(keyword_set(plot)) then plot=0
if plot GE 0 then polarplot=1 else polarplot=0
if plot GE 1 then simpleplot=1 else simpleplot=0

; Extract amplitudes at given time and frequency
freqpos=where(abs(freqax-freq) EQ min(abs(freqax-freq)))
freq=freqax(freqpos)
timepos=where(abs(timeax-time) EQ min(abs(timeax-time)))
time=timeax(timepos)
amplitudes=abs(transforms(*,timepos,freqpos))*weights

; Initialize graphics
pg_initgraph,print=print
title0='Amplitudes: #'+nti_wavelet_i2str(shot)+' '+pg_num2str(time)+'s '+pg_num2str(freq,length=4)+'kHz'
printdatas='shot: '+nti_wavelet_i2str(shot)
for i=0,channelssize-1 do printdatas=printdatas+'!C'+channels[i]
printdatas=printdatas+$
	'!Ctime: '+pg_num2str(time)+' s'+$
	'!Ctime: '+pg_num2str(freq)+' kHz'

; Plot of amplitudes in polar plot
if polarplot then begin
	title=title0+' p'
	if print then device,filename=pg_filename(title) else window,/free
	plot,/polar,[amplitudes,amplitudes(0)],[chpos,chpos(0)]/360.*2*!PI,xstyle=4,ystyle=4,$
		xrange=[-max(amplitudes),max(amplitudes)],yrange=[-max(amplitudes),max(amplitudes)],$
		title=title0,charsize=3.,thick=2.
	oplot,/polar,fltarr(360)+max(amplitudes),findgen(360)/360.*2*!PI
	oplot,/polar,fltarr(360)+min(amplitudes),findgen(360)/360.*2*!PI
	axis,0,0,/xaxis
	axis,0,0,/yaxis
	xyouts,-0.13,0.9,printdatas,/normal
	;for i=0,channelssize-1 do xyouts,amplitudes(i),chpos(i)/360.*2*!PI,channels(i)
endif

; Plot of amplitudes in simple plot
if simpleplot then begin
	title=title0+' s'
	if print then device,filename=pg_filename(title) else window,/free
	plot,chpos,amplitudes,xstyle=1,ystyle=1,xrange=[0,360],xtitle='Probe position [Deg]',$
		yrange=[0,max(amplitudes)],ytitle='Amplitude [a.u.]',title=title0,charsize=3.,thick=2.
	xyouts,-0.13,0.9,printdatas,/normal
endif

if print then device,/close

return, amplitudes

end