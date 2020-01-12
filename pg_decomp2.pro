;+
; Name: pg_decomp2
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2003.05.29.
;
; Purpose: Calculate signal reconstructed from a single row of the STFT transform with the right phase
;
; Calling sequence:
;	pg_decomp2, stft, b [,timeax] [,freqax] [,windowname] [,windowsize] [,masksize] $
;		[,trange] [,plot] [,/print] [,/double] [,sign=sign]
;
; Input:
;	stft: STFT of 1D data vector !Full resolution!
;	b: Frequencies to reconstruct from (kHz)
;	timeax (optional): Time axis
;	freqax (optional): Frequency axis
;	windowsize (optional): length of window (standard deviation /2 for Gauss window); default: length of data / 10
;	masksize (optional): length of mask vector; default: all nonzero values
;	windowname (optional): shape of the window (available: see in pg_gen_win.pro)
;	trange (optional): Time range of the plot (s) !Use with dt set!
;	plot (optional): Display mode (available: 0: Plot reconstructed signal and amplitude as multiplot
;						  1: Plot reconstructed signal
;						  2: Plot modulating amplitude
;						   ; default: 0
;	/double (optional): double precision window
;	/print (optional): Produce ps files
;
; Output:
;	sign (optional): Reconstructed signal
;-

pro pg_decomp2, stft, b, timeax=timeax, freqax=freqax, windowname=windowname, $
	windowsize=windowsize, masksize=masksize, $
	trange=trange, plot=plot, print=print, double=double, $
	sign=sign

compile_opt defint32 ; 32 bit integers

; Set constants
matrixsize=size(stft)
stftsize=matrixsize

; Set defaults
print=keyword_set(print)
if not(keyword_set(timeax)) then timeax=lindgen(matrixsize[1])
if not(keyword_set(freqax)) then freqax=lindgen(matrixsize[2])/(matrixsize[2]-1)*1/(timeax[2]-timeax[1])/1000
if not(keyword_set(plot)) then plot=0
if plot GE 0 then mplot=1 else mplot=0 		; Plot reconstructed signal and amplitude as multiplot
if plot GE 1 then signplot=1 else signplot=0 	; Plot reconstructed signal
if plot GE 2 then ampplot=1 else ampplot=0 	; Plot amplitude

; Initialize graphics
pg_initgraph,print=print

; Define frequences
bsize=size(b)
if bsize[0] EQ 0 then bsize[1]=1
bx=indgen(bsize[1])
;bx=fix(double(b)/max(freqax)*stftsize[2])
for i=0,bsize[1]-1 do bx[i]=where(abs(freqax-b[i]) EQ min(abs(freqax-b[i])))

; Generate strings for titles
str=strarr(bsize[1])
;b=double(bx)*max(freqax)/stftsize[2]
b=freqax[bx]
for i=0,bsize[1]-1 do str[i]=' '+pg_num2str(b[i])+' kHz'

; Calculate plotted range
if not(keyword_set(trange)) then trange=[min(timeax),max(timeax)]
ind=where((timeax ge trange[0]) and (timeax le trange[1]))

; Generate window
win=pg_gen_win(windowsize,masksize=masksize,windowname=windowname,double=double)
winsize=n_elements(win)

; Calculate signals
sign=complexarr(bsize[1],stftsize[1])
amp=dblarr(bsize[1],stftsize[1])

for i=0,bsize[1]-1 do begin
	amp[i,*]=abs(stft[*,bx[i]])
;	sign[i,*]=amp[i,*]*sin(b[i]*1000*2*!PI*timeax) ; Reconstruction without phase

	; Progress indicator
	print,'Frequency being reconstructed: '+pg_num2str(b[i])+' kHz'

	; Reconstruction with phase
	data=stft[*,bx[i]]
	for j=ind[0],ind[n_elements(ind)-1] do begin
		center=j
		first=center-floor(double(winsize)/2) ; begining of the support of the window
		last=center+ceil(double(winsize)/2)-1 ; end of the support of the window
		mask=dblarr(stftsize[1])
		mask[first>0:last<(stftsize[1]-1)]=win[abs(first<0):winsize-1-abs(((stftsize[1]-1)-last)<0)]
		windoweddata=data*mask
		sign[i,*]=sign[i,*]+windoweddata*exp(complex(0,1)*2*!PI*b[i]*1000*timeax)/stftsize[1]
;		sign[i,*]=sign[i,*]+windoweddata*exp(complex(0,1)*2.*!PI*bx[i]*j/stftsize[1])/stftsize[1]
	endfor

	if signplot then begin
		title='Reconstructed signal from the STFT component with frequency'+str[i]
		if print then device,filename=pg_filename(title) else window,/free
		plot, timeax[ind], sign[i,ind], title=title, xstyle=1, xtitle='Time (s)'
	endif
	if ampplot then begin
		title='Amplitude of the STFT component with frequency'+str[i]
		if print then device,filename=pg_filename(title) else window,/free
		plot, timeax[ind], amp[i,ind], title=title, xstyle=1, xtitle='Time (s)'
	endif
endfor

sign=float(sign)

if mplot then begin
	title='Reconstructed signal from the STFT components'
	if print then device,filename=pg_filename(title) else window,/free
	!P.MULTI=[0,0,bsize[1],0,1]
	!P.CHARSIZE=2.0
	for i=0,bsize[1]-1 do begin
		title='Reconstructed signal from the STFT component with frequency'+str[i]
		plot, timeax[ind], sign[i,ind], title=title, xstyle=1, xtitle='Time (s)'
	endfor
	!P.MULTI=[0,0,0,0,0]
	title='Amplitude of the STFT components'
	if print then device,filename=pg_filename(title) else window,/free
	!P.MULTI=[0,0,bsize[1],0,1]
	for i=0,bsize[1]-1 do begin
		title='Amplitude of the STFT component with frequency'+str[i]
		plot, timeax[ind], amp[i,ind], title=title, xstyle=1, xtitle='Time (s)'
	endfor
	!P.MULTI=[0,0,0,0,0]
	!P.CHARSIZE=1.0
endif

sign=sign

if print then device,/close

end
