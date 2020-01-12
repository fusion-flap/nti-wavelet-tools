;+
; Name: pg_phase
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2003.05.26.
;
; Purpose: Plot crosscorrelations between the band power of one selected channel and the other channels
;		of the shot
;
; Calling sequence:
;	pg_phase, shot [,b] [,startch] [,trange] [,windowname] [,windowsize] [,masksize] [,step] [,freqres] $
;		[,corrlength] [,plot] [,/rawsignal] [,/print] [,ccorr=ccorr]
;
; Input:
;	shot: Shot number
;	b (optional): One frequency band (kHz); default: whole range
;	startch (optional): phase=0 channel; default: 1
;	corrlength (optional): Maximum correlation length plotted (s); default whole time intervall
;	trange (optional): timerange to view (s), 2 element vector; default: whole range
;	windowsize (optional): length of window (standard deviation /2 for Gauss window); default: 50
;	masksize (optional): length of mask vector; default: all nonzero values
;	windowname (optional): shape of the window (available: see in pg_gen_win.pro)
;	step (optional): time steps of FFT; default: 1
;	freqres (optional): frequency resolution; default: length of data
;	plot (optional): Display mode (available: 0: Plot crosscorrelations
;						  1: 0+STFT spectra
;						  2: 1+band powers)
;						  ; default: 0
;	/rawsignal (optional): Calculate crosscorrelations for the rawsignal
;	/print (optional): Produce ps files
;
; Output:
;	ccorr (optional): Crosscorrelations of the band power of different channels
;
;-


pro pg_phase, shot, b=b, startch=startch, trange=trange, windowname=windowname, windowsize=windowsize, masksize=masksize, $
	step=step, freqres=freqres, corrlength=corrlength, plot=plot, rawsignal=rawsignal,print=print, $
	ccorr=ccorr

compile_opt defint32 ; 32 bit integers

; Set defaults, constants
stftsize=size(stft)
rawsignal=keyword_set(rawsignal)
print=keyword_set(print)
if not(keyword_set(windowsize)) then windowsize=50
if not(keyword_set(startch)) then startch=1
if not(keyword_set(plot)) then plot=0
if plot GE 0 then cplot=1 else cplot=0 		; Plot crosscorrelations
if plot GE 1 then stftplot=1 else stftplot=-1 	; Plot STFT spectra
if plot GE 2 then bpplot=1 else bpplot=0 	; Plot band powers

; Initialize graphics
pg_initgraph,print=print

; Calculate reference STFT
channel='W7-AS Mirnov/Mir-1-'+nti_wavelet_i2str(startch)
if rawsignal then begin
	get_rawsignal,shot,channel,timeax,d,trange=trange
	bp1=d^2
endif else begin
	stft1=pg_spectrogram(shot, channel, trange=trange, windowname=windowname, $
		windowsize=windowsize, masksize=masksize, step=step, $
		freqres=freqres, plot=stftplot, print=print, timeax=timeax, freqax=freqax)
	stftsize=size(stft1)

	; Generate strings for titles
	if not(keyword_set(b)) then b=[min(freqax),max(freqax)]
	b=reform(b,2,n_elements(b)/2)
	bsize=size(b)
	str=strarr(bsize[2])
	for i=0,bsize[2]-1 do str[i]=' '+pg_num2str(b[0,i])+' kHz - '+pg_num2str(b[1,i])+' kHz'


	; Calculate reference band power
	;bp1=total(abs(stft1(*,bx[0]:bx[1]))^2,2)
	find=where((freqax ge b[0]) and (freqax le b[1]))
	bp1=total(abs(stft1[*,find])^2,2)
	if bpplot then begin
		title='Band power '+str[0]
		if print then device,filename=pg_filename(title) else window,/free
		plot, x, bp[i,*], title=title, xstyle=1, xtitle='Time (s)'
	endif
endelse

; Initialize arrays
ccorr=dblarr(16,n_elements(bp1))
;sfreq=1/dt*step/1000
;bx=fix(double(b)/sfreq*stftsize[2])

; Calculate x axis for correlation plotting
x=lindgen(n_elements(bp1))-ceil(n_elements(bp1)/2.)+1
x=x*(timeax[2]-timeax[1])

; Calculate plotted range from corrlength
if not(keyword_set(corrlength)) then corrlength=max(x)+1
ind=where((x ge -corrlength) and (x le corrlength))

; Calculate segmentation
;segment=floor(corrlength*2/(timeax[2]-timeax[1])) ; Length of segments
segment=n_elements(ind) ; Length of segments
nsegment=floor(n_elements(bp1)/segment) ; Number of segments

for j=1,16 do begin
	channel='W7-AS Mirnov/Mir-1-'+nti_wavelet_i2str(j)

	; Progress indicator
	print,channel

	if rawsignal then begin
		get_rawsignal,shot,channel,timeax,d,trange=trange
		bp=d^2
	endif else begin
		; Calculate STFT spectrum
		stft=pg_spectrogram(shot, channel, trange=trange, windowname=windowname, $
			windowsize=windowsize, masksize=masksize, step=step, $
			freqres=freqres, plot=stftplot, print=print)

		bp=total(abs(stft[*,find])^2,2)
		;bp=total(abs(stft(*,bx[0]:bx[1]))^2,2)
		if bpplot then begin
			title='Band power '+str[0]
			if print then device,filename=pg_filename(title) else window,/free
			plot, x, bp, title=title, xstyle=1, xtitle='Time (s)'
		endif
	endelse

	ccorr[j-1,*]=pg_ccorr(bp1,bp,/fast)

	if cplot then begin
		error=pg_ccorrerremp(bp1,bp,segment,/fast)
		if rawsignal then title='Crosscorrelation of signals of channels '+nti_wavelet_i2str(startch)+'-'+nti_wavelet_i2str(j) $
			else title='Crosscorrelation of band power '+str[0]+' of channels '+nti_wavelet_i2str(startch)+'-'+nti_wavelet_i2str(j)
		title=title+' (error estimation based on '+nti_wavelet_i2str(nsegment)+' segments)'
		if print then device,filename=pg_filename(title) else window,/free
		plot, x[ind], ccorr[j-1,ind], title=title, xstyle=1, xtitle='Time (s)', $
			yrange=[min(ccorr[j-1,ind]-error),max(ccorr[j-1,ind]+error)]
		oploterr, x[ind], ccorr[j-1,ind], error
	endif

endfor

if print then device,/close

end
