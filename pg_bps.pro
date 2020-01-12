;+
; Name: pg_bps
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2003.12.10.
;             Modification S. Zoletnik 2004.04.15
;
; Purpose: Calculate selected band powers for a whole experiment and save in files
;
; Calling sequence:
;	pg_bps, exp, b [,channels] [,trange] [,windowname] [,windowsize] [,masksize] [,step] [,freqres] $
;		[,family] [,order] [,dscale] [,start_scale] [,nscale] $
;		[,plot] [,/print] [,/cwt] [,bps=bps] [,filename=filename]
;
; Input:
;	exp: 2 element vector containing the number of the first and the last shot
;	b: Frequency bands (kHz)
;	channels (optional): Channel numbers to be considered
;	trange (optional): Timerange to view (s), 2 element vector; default: whole range
;	windowsize (optional-STFT): Length of window (standard deviation /2 for Gauss window); default: 50
;	masksize (optional-STFT): Length of mask vector; default: all nonzero values
;	windowname (optional-STFT): Shape of the window (available: see in pg_gen_win.pro)
;	step (optional-STFT): time Steps of FFT; default: 1
;	freqres (optional-STFT): Frequency resolution; default: length of data
;	family (optional-CWT): wavelet family to use (available: 'Morlet'); default: 'Morlet'
;	order (optional-CWT): order of the wavelet; default: default of the family
;	dscale (optional-CWT): fraction of diadic scaling; default:0.25
;	start_scale (optional-CWT): starting scale (has no effect on CWT using Morlet wavelets; default:2
;	nscale (optional-CWT): total number of scale values; default:log2(N/start_scale)/dscale+1
;	plot (optional): Display mode (available: 0: Plot power bands
;						  1: 0+time integrated spectra
;						  2: 1+time-frequency energy density distribution
;						   ; default: 0
;	/print (optional): Produce ps files
;	/cwt (optional): Use CWT instead of STFT
;
; Output:
;	bps (optional): Band powers
;       filename: filename (IDL save) containing the names of the output data files
;-

pro pg_bps, exp, b, channels=channels, trange=trange, windowname=windowname, windowsize=windowsize, masksize=masksize, $
	step=step, freqres=freqres, family=family, order=order, dscale=dscale, $
	start_scale=start_scale, nscale=nscale, plot=plot, print=print, cwt=cwt, $
	bps=bps,filename=filename

compile_opt defint32 ; 32 bit integers


; Set constants
expsize=exp[1]-exp[0]+1
b=reform(b,2,n_elements(b)/2)
bsize=size(b)

if bsize[0] EQ 1 then b[2]=1


; Set defaults
print=keyword_set(print)
cwt=keyword_set(cwt)
if not(keyword_set(channels)) then channels=indgen(16)+1
channelssize=n_elements(channels)
if not(keyword_set(step)) then step=1
if not(keyword_set(windowsize)) then windowsize=50
if not(keyword_set(plot)) then plot=0
if plot GE 0 then bpplot=1 else bpplot=0 		; Plot power bands
if plot GE 1 then splot=1 else splot=0 		; Plot time integrated spectra
if plot GE 2 then matrixplot=1 else matrixplot=-1 		; Plot time-frequency energy density distribution

; Initialize graphics
pg_initgraph,print=print

; Generate strings for titles
str=strarr(bsize[2])
for i=0,bsize[2]-1 do str[i]=' '+pg_num2str(b[0,i])+' kHz - '+pg_num2str(b[1,i])+' kHz'

; Initialize arrays
if cwt then matrix=pg_scalogram(exp[0],'W7-AS Mirnov/Mir-1-1',trange=trange,family=family, order=order, dscale=dscale,$
	start_scale=start_scale, nscale=nscale, /pad, $
	plot=-1, timeax=timeax, freqax=freqax) $
else matrix=pg_spectrogram(exp[0],'W7-AS Mirnov/Mir-1-1',trange=trange,windowname=windowname, $
	windowsize=windowsize, masksize=masksize, step=step, $
	freqres=freqres, plot=-1, timeax=timeax, freqax=freqax)
matrixsize=size(matrix)


bps=fltarr(expsize,channelssize,bsize[2],matrixsize[1])
if cwt then sums=fltarr(expsize,channelssize,matrixsize[2]) $
else sums=fltarr(expsize,channelssize,floor(matrixsize[2]/2)+1)


; Boundaries of the bands
bx=dblarr(bsize[1],bsize[2])
for k=0,bsize[2]-1 do begin
	find=where((freqax ge b[0,k]) and (freqax le b[1,k]))
	bx[*,k]=[min(find),max(find)]
endfor

for i=exp[0],exp[1] do begin
	for j=1,channelssize do begin
		channel='W7-AS Mirnov/Mir-1-'+nti_wavelet_i2str(channels[j-1])

		; Progress indicator
		print,nti_wavelet_i2str(i)+' '+channel
		wait,1

		; Calculate spectrum
		if cwt then matrix=pg_scalogram(i,channel,trange=trange,family=family, order=order, dscale=dscale,$
				start_scale=start_scale, nscale=nscale, /pad, $
				plot=matrixplot, print=print, timeax=timeax, freqax=freqax) $
		else matrix=pg_spectrogram(i,channel,trange=trange,windowname=windowname, $
				windowsize=windowsize, masksize=masksize, step=step, $
				freqres=freqres, plot=matrixplot, print=print, timeax=timeax, freqax=freqax)

		; Calculate band powers
		for k=0,bsize[2]-1 do begin
			find=where((freqax ge b[0,k]) and (freqax le b[1,k]))
                        msize = min([(size(matrix))[1], (size(bps))[4]])
			bps[i-exp[0],j-1,k,0:msize-1]=(total(abs(matrix[*,find])^2,2))[0:msize-1]
                        if (msize lt (size(bps))[4]) then bps[i-exp[0],j-1,k,msize:(size(bps))[4]-1] = 0
		endfor

		; Calculate spectrum for the whole time intervall
		if cwt then sums[i-exp[0],j-1,*]=total(abs(matrix)^2,1) $
		else sums[i-exp[0],j-1,*]=total(abs(matrix[*,0:floor(matrixsize[2]/2)])^2,1)

	endfor

	; Plot band powers
	if bpplot then begin

		; Set multiplot for band power plotting
		!P.MULTI=[0,2,8,0,1]
		!P.CHARSIZE=1.4

		; Progress indicator
		print,'Plotting band powers for shot '+nti_wavelet_i2str(i)

		for k=0,bsize[2]-1 do begin
			title='Band powers '+nti_wavelet_i2str(i)+' '+str[k]
			if print then device,filename=pg_filename(title) else window,/free
			for j=1,16 do begin
				channel='W7-AS Mirnov/Mir-1-'+nti_wavelet_i2str(j)
				title='Band power '+nti_wavelet_i2str(i)+' '+channel+str[k]
				plot, timeax, bps[i-exp[0],j-1,k,*], title=title, xstyle=1, xtitle='Time (s)'
			endfor

		endfor

		; Reset original multiplot after band power plotting
		!P.MULTI=0
		!P.CHARSIZE=1.

	endif

	; Plot spectra for the whole time intervall
	if splot then begin

		; Set multiplot for spectra plotting
		!P.MULTI=[0,2,8,0,1]
		!P.CHARSIZE=1.4

		; Progress indicator
		print,'Plotting spectra for shot '+nti_wavelet_i2str(i)

		title='Spectra '+nti_wavelet_i2str(i)
		if print then device,filename=pg_filename(title) else window,/free
		for j=1,16 do begin
			channel='W7-AS Mirnov/Mir-1-'+nti_wavelet_i2str(j)
			title='Spectrum '+nti_wavelet_i2str(i)+' '+channel
			plot, freqax, sums[i-exp[0],j-1,*], title=title, xstyle=1, xtitle='Frequency (kHz)'
			for k=0,bsize[2]-1 do oplot, freqax[bx(*,k)], sums[i-exp[0],j-1,bx(*,k)], thick=0, psym=(k MOD 3)+4, symsize=1
		endfor

		; Reset original multiplot after spectra plotting
		!P.MULTI=0
		!P.CHARSIZE=1.

	endif

endfor

filenames=strarr(bsize[2])
for k=0,bsize[2]-1 do begin

	; Progress indicator

	print,'Saving band power '+str[k]

	bp=reform(bps[*,*,k,*])
	bk=reform(b[*,k])
	bxk=reform(bx[*,k])

	title='Band powers '+str[k]+' of shots: '+nti_wavelet_i2str(exp[0])+'-'+nti_wavelet_i2str(exp[1])
	filenames[k]=pg_filename(title,ext='.dat')
	if cwt then save,exp,bp,sums,bk,bxk,timeax,family,order,dscale,start_scale,nscale,filename=filenames[k] $
	else save,exp,bp,sums,bk,bxk,timeax,windowname,windowsize,masksize,step,freqres,filename=filenames[k]

endfor

if cwt then filename=pg_filename('cwt'+nti_wavelet_i2str(order)+'_filenames',ext='.dat') $
else filename=pg_filename('stft'+nti_wavelet_i2str(windowsize)+'_filenames',ext='.dat')

; Remove directory names
for j=0,n_elements(filenames)-1 do begin
	temp=strsplit(filenames[j],'/',/extract)
	temp=strsplit(temp[n_elements(temp)-1],'\',/extract)
	filenames[j]=temp[n_elements(temp)-1]
endfor

save,filenames,filename=filename

if print then device,/close

bps=bps

end

