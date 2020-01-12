;+
; Name: pg_spectrogram
;
; Written by: Gergo Pokol (lokop@uze.net) 2002.07.16. - 2002.07.17.
;
; Purpose: Plot the Spectrogram or the Phase of the Short Time Fourier Transform of a measurement in the Nicolet system
;
; Calling sequence:
;	stft=pg_spectrogram( shot, channel [,trange] [,fmax] [,windowname] [,windowsize] [,masksize] [,step] $
;		[,freqres] [,plot] [,/print] [,/poster] [,/dc] [,/log] [,opt] [,/double] [,timeax=timeax] [,freqax=freqax])
;
; Inputs:
;	shot: shot number
;	channel: channel number
;	trange (optional): timerange to view, 2 element vector; default: whole range
; fmax (optional): frequency maximum of spectrogram (in kHz), resampled with pg_resample, Downsamples time axis!
;	windowsize (optional): length of window (standard deviation *2 for Gauss window); default: length of data / 10
;	masksize (optional): length of mask vector; default: all nonzero values
;	windowname (optional): shape of the window (available: see in pg_gen_win.pro)
;	step (optional): time steps of FFT; default: 1
;	freqres (optional): frequency resolution; default: length of data
;	plot (optional): display mode (available: 0:All, 1:Spectrogram, 2:Phase, other:None); default: 0
;	opt (optional): exponent for opimized scale visualization
;	/print (optional): Print to file instead of plotting
;	/poster (optional): Print in poster form
;	/dc (optional): without mean subtraction
;	/log (optional): visualize on log scale (except for Phase)
;	/double (optional): double precision
;
; Output:
;	stft: STFT of signal
;	timeax (optional): Time axis
;	freqax (optional): Frequency axis
;
; Modification:
;	Gergo Pokol 2002.07.18: Title added
;	Gergo Pokol 2003.03.25: Changes in title
;				Changes in the use of pg_stft
;	Gergo Pokol 2003.03.31: Output added
;	Gergo Pokol 2003.04.15: Frequency resolution added
;	Gergo Pokol 2003.05.22: dt output added
;	Gergo Pokol 2003.06.12: Moved to pg_spectrogram_sim
;       Gergely Papp 2008.11.14: added fmax switch - frequency maximum
;       	of spectrogram, resampled with pg_resample, fmax is in kHz!!
;       Gergely Papp 2008.11.24: added ID as optional parameter, for
;       	better identification
;-

function pg_spectrogram, shot, channel, trange=trange, windowname=windowname, $
	windowsize=windowsize, masksize=masksize, step=step, $
	freqres=freqres, plot=plot, print=print, poster=poster, dc=dc, log=log, opt=opt, double=double, $
	timeax=timeax, freqax=freqax, fmax=fmax, ID=ID

compile_opt defint32 ; 32 bit integers

;; Set defaults
;size=n_elements(data)
;double=keyword_set(double)
;print=keyword_set(print)
;if not(keyword_set(plot)) then plot=0

; Read data
get_rawsignal,shot,channel,timeax,data;,trange=trange
stft=pg_spectrogram_sim( data, timeax, shot=shot,channel=channel,trange=trange, windowname=windowname, $
	windowsize=windowsize, masksize=masksize, step=step, $
	freqres=freqres, plot=plot, print=print, poster=poster, dc=dc, log=log, opt=opt, double=double, $
	freqax=freqax, fmax=fmax, ID=ID)


;if not(keyword_set(trange)) then trange=[min(time),max(time)]
;ind=where((time ge trange(0)) and (time le trange(1)))
;time=time(ind)
;data=data(ind)
;
;; Compute STFT
;stft=pg_stft(data,windowsize=windowsize,masksize=masksize,windowname=windowname,$
;	step=step,freqres=freqres,dc=dc,double=double)
;
;; Compute axis
;freqax=findgen(freqres/2+1)/(freqres/2)/(time[1]-time[0])/2/1000
;timeax=pg_downsample(time,step=step)
;;timeax=findgen(n_elements(time)/step)*(time[1]-time[0])*step+time[0]
;sizestft=size(stft)
;
;; Initialize graphics
;pg_initgraph,print=print
;title0=' of shot: '+pg_num2str(shot)+' '+channel+' using window type: '+windowname+$
;		' size: '+pg_num2str((time[1]-time[0])*windowsize)+'s ('+pg_num2str(windowsize)+')'
;if step NE 1 then title0=title0+' step: '+pg_num2str(step)
;if freqres NE size then title0=title0+' frequency resolution: '+pg_num2str(freqres)
;
;; Plot the results
;if (plot EQ 0) OR (plot EQ 1) then begin
;
;	;Compute Power Density Distribution
;	ploted=abs(stft[*,0:sizestft(2)/2])^2
;
;	;Plot as bitmap
;	title='Spectrogram'+title0
;	if print then device,filename=pg_filename(title) else window,/free
;	pg_plot,ploted,ct=5,xrange=[min(timeax),max(timeax)],yrange=[min(freqax),max(freqax)]$
;		,xtitle='Time (s)',ytitle='Frequency (kHz)',title=title,log=log,/norm
;	if print then device,/close
;;	loadct,5
;;	ploted=ploted/max(max(ploted))*256
;;	!x.range=[min(timeax),max(timeax)]
;;	!x.ticklen=-0.01
;;	!x.title='Time (s)'
;;	!x.margin=[10,3]
;;	!y.range=[min(freqax),max(freqax)]
;;	!y.ticklen=-0.01
;;	!y.title='Frequency (kHz)'
;;	!y.margin=[5,3]
;;	!p.title='Spectrogram'+title
;;	plot,timeax,/nodata,xstyle=1,ystyle=1
;;	nti_wavelet_otv,ploted
;;	!x.range=[0,0]
;;	!x.ticklen=0
;;	!x.title=''
;;	!x.margin=[10,3]
;;	!y.range=[0,0]
;;	!y.ticklen=0
;;	!y.title=''
;;	!y.margin=[4,2]
;;	!p.title=''
;
;;	;Plot as contour plot
;;	loadct,5
;;	colors_scale_exponent=2.5
;;	levels=findgen(60)^colors_scale_exponent
;;	levels=levels/max(levels)*(max(ploted)-min(ploted))+min(ploted)
;;	CONTOUR, ploted, timeax, freqax, /FILL, XSTYLE=1, YSTYLE=1, XTITLE='Time (s)', YTITLE='Frequency (kHz)',$
;;		 levels=levels,title='Spectrogram'+title
;
;endif
;if (plot EQ 0) OR (plot EQ 2) then begin
;
;	;Compute Phase
;	ploted=atan(float(stft[*,0:sizestft(2)/2]),imaginary(stft[*,0:sizestft(2)/2]))
;
;	;Plot as bitmap
;	title='STFT phase'+title0
;	if print then device,filename=pg_filename(title) else window,/free
;	pg_plot,ploted,ct=0,xrange=[min(timeax),max(timeax)],yrange=[min(freqax),max(freqax)]$
;		,xtitle='Time (s)',ytitle='Frequency (kHz)',title=title,/norm
;;	loadct,0
;;	ploted=ploted/max(max(ploted))*256
;;	!x.range=[min(timeax),max(timeax)]
;;	!x.ticklen=-0.01
;;	!x.title='Time (s)'
;;	!x.margin=[10,3]
;;	!y.range=[min(freqax),max(freqax)]
;;	!y.ticklen=-0.01
;;	!y.title='Frequency (kHz)'
;;	!y.margin=[5,3]
;;	!p.title='Spectrogram'+title
;;	window,/free
;;	plot,timeax,/nodata,xstyle=1
;;	nti_wavelet_otv,ploted
;;	!x.range=[0,0]
;;	!x.ticklen=0
;;	!x.title=''
;;	!x.margin=[10,3]
;;	!y.range=[0,0]
;;	!y.ticklen=0
;;	!y.title=''
;;	!y.margin=[4,2]
;;	!p.title=''
;
;;	;Plot as contour plot
;;	loadct,0
;;	CONTOUR, ploted, timeax, freqax,  /FILL, XSTYLE=1, YSTYLE=1, XTITLE='Time', YTITLE='Frequency (kHz)',$
;;		nlevels=60,title='STFT phase'+title
;
;endif
;
;dt=step*(time[1]-time[0])
;t0=time[0]

timeax=timeax
freqax=freqax

return, stft

if print then device,/close

end
