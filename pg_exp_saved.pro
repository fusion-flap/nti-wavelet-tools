;+
; Name: pg_exp_saved
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2003.12.10.-2003.12.12.
;
; Purpose: Read band powers from file and plot autocorrelations, crosscorrelations for a whole experiment
;
; Calling sequence:
;	pg_exp_saved, filenames [,channels] [,corrlength] [,plot] [,/print] [err=err] [,acorr=acorr] [,ccorr=ccorr]
;
; Input:
;	filenames: Names of data files of the different band powers
;	channels (optional): Channel numbers to be considered; default: all channels
;	corrlength (optional): Maximum correlation length plotted (s); default: 0.003
;	plot (optional): Display mode (available:
;						  0: Plot experiment means
;						  1: 0+shot means
;						  2: 1+crosscorrelations
;						  3: 2+autocorrelations
;						   ; default: 0
;	/print (optional): Produce ps files
;	err (optional): Error handling in averaging (available:
;						  0: Supposing independent data in different shots and channels
;						  1: Supposing independent data in different shots and correlated data in channels
;						  2: Calculate error using direct empirical standard deviation on all levels
;						  3: NOT FUNCTIONING! Supposing independent data in different shots and correlated data in channels (weighted)
;						   ; dafault: 0
;
; Output:
;	acorr (optional): Autocorrelations of the band powers
;	ccorr (optional): Crosscorrelations of each pair of band powers
;
;-

pro pg_exp_saved, filenames, channels=channels, corrlength=corrlength, plot=plot, print=print, err=err, $
	acorr=acorr, ccorr=ccorr

compile_opt defint32 ; 32 bit integers

; Set defaults
fast=keyword_set(fast)
print=keyword_set(print)
if not(keyword_set(channels)) then channels=indgen(16)+1
if not(keyword_set(corrlength)) then corrlength=0.003
if not(keyword_set(plot)) then plot=0
if plot GE 0 then expplot=1 else expplot=0 		; Plot experiment means
if plot GE 1 then shotplot=1 else shotplot=0 		; Plot shot means
if plot GE 2 then cplot=1 else cplot=0 			; Plot crosscorrelations
if plot GE 3 then aplot=1 else aplot=0 			; Plot autocorrelations
if not(keyword_set(err)) then err=0
if err GE 2 then systerr=1 else systerr=0

; Set constants
channelssize=n_elements(channels)
filenamessize=n_elements(filenames)

; Progress indicator
print,'Loading file: '+filenames[0]

; Load 1st file
restore,dir_f_name('data',filenames[0])

; Set constants
expsize=exp[1]-exp[0]+1
timeaxsize=n_elements(timeax)

; Initialize arrays
b=fltarr(2,filenamessize)
bps=fltarr(expsize,channelssize,filenamessize,timeaxsize)

; Load data
b[*,0]=bk
for j=1,channelssize do begin
	bps[*,j-1,0,*]=bp[*,channels[j-1]-1,*]
endfor
for i=1,filenamessize-1 do begin

	; Progress indicator
	print,'Loading file: '+filenames[i]

	restore,dir_f_name('data',filenames[i])
	b[*,i]=bk
	for j=1,channelssize do begin
		bps[*,j-1,i,*]=bp[*,channels[j-1]-1,*]
	endfor
endfor

; Initialize graphics
pg_initgraph,print=print

; Generate strings for titles
str=strarr(filenamessize)
for i=0,filenamessize-1 do str[i]=' '+pg_num2str(b[0,i])+' kHz - '+pg_num2str(b[1,i])+' kHz'
str2=strarr(1>(filenamessize^2-filenamessize)/2)
index=0
for i=0,filenamessize-2 do begin
	for j=i+1,filenamessize-1 do begin
		str2[index]='['+str[i]+'] - ['+str[j]+']'
		index=index+1
	endfor
endfor

; Calculate x axis for correlation plotting
x=lindgen(n_elements(timeax))-ceil(n_elements(timeax)/2.)+1
x=x*(timeax[2]-timeax[1])

; Calculate plotted range from corrlength
if not(keyword_set(corrlength)) then corrlength=max(x)+1
ind=where((x ge -corrlength) and (x le corrlength))

; Calculate segmentation
;segment=round(corrlength*2/(timeax[2]-timeax[1])) ; Length of segments
segment=n_elements(ind) ; Length of segments
nsegment=floor(n_elements(timeax)/segment) ; Number of segments

; Progress indicator
print,'Initializing arrays'

; Initialize arrays
acorr1=fltarr(filenamessize,timeaxsize)
ccorr1=fltarr(filenamessize,filenamessize,timeaxsize)
;aerr1=fltarr(filenamessize,timeaxsize)
;cerr1=fltarr(filenamessize,filenamessize,timeaxsize)
aerr1=fltarr(filenamessize,segment)
cerr1=fltarr(filenamessize,filenamessize,segment)

acorr=fltarr(expsize,channelssize,filenamessize,timeaxsize)
ccorr=fltarr(expsize,channelssize,1>(filenamessize^2-filenamessize)/2,timeaxsize)
;aerr=fltarr(expsize,channelssize,filenamessize,timeaxsize)
;cerr=fltarr(expsize,channelssize,1>(filenamessize^2-filenamessize)/2,timeaxsize)
aerr=fltarr(expsize,channelssize,filenamessize,segment)
cerr=fltarr(expsize,channelssize,1>(filenamessize^2-filenamessize)/2,segment)

smacorr=fltarr(expsize,filenamessize,timeaxsize)			; Shot mean
smccorr=fltarr(expsize,1>(filenamessize^2-filenamessize)/2,timeaxsize)	; Shot mean
;seacorr=fltarr(expsize,filenamessize,timeaxsize)			; Shot error
;seccorr=fltarr(expsize,1>(filenamessize^2-filenamessize)/2,timeaxsize)	; Shot error
seacorr=fltarr(expsize,filenamessize,segment)			; Shot error
seccorr=fltarr(expsize,1>(filenamessize^2-filenamessize)/2,segment)	; Shot error

macorr=fltarr(filenamessize,timeaxsize)					; Experiment mean
mccorr=fltarr(1>(filenamessize^2-filenamessize)/2,timeaxsize)		; Experiment mean
;eacorr=fltarr(filenamessize,timeaxsize)					; Experiment error
;eccorr=fltarr(1>(filenamessize^2-filenamessize)/2,timeaxsize)		; Experiment error
eacorr=fltarr(filenamessize,segment)					; Experiment error
eccorr=fltarr(1>(filenamessize^2-filenamessize)/2,segment)		; Experiment error

for i=exp[0],exp[1] do begin
	for j=1,channelssize do begin
		channel='W7-AS Mirnov/Mir-1-'+nti_wavelet_i2str(channels[j-1])

		data='shot: '+nti_wavelet_i2str(i)+$
			'!Ctrange:!C '+pg_num2str(timeax[0],length=4)+' s - '+$
				pg_num2str(timeax[n_elements(timeax)-1],length=4)+' s'+$
			'!Cwin.: '+windowname+$
			'!Cwinsize: '+nti_wavelet_i2str(windowsize)+$
			'!Cmasksize: '+nti_wavelet_i2str(masksize)+$
			'!Cfreqres: '+nti_wavelet_i2str(freqres)+$
			'!Cstep: '+nti_wavelet_i2str(step)

		; Progress indicator
		print,nti_wavelet_i2str(i)+' '+channel
		wait,1

		; Set multiplot for correlation plotting
;		if cplot then begin
;			if aplot then !P.MULTI=[0,1,(((filenamessize^2-filenamessize)/2)>1)+filenamessize,0,1] $
;			else !P.MULTI=[0,1,((filenamessize^2-filenamessize)/2)>1,0,1]
;			!P.CHARSIZE=1.4
;			title='Correlations '+nti_wavelet_i2str(i)+' '+channel
;			if print then device,filename=pg_filename(title) else window,/free
;		endif

		; Calculate autocorrelations
		if aplot then begin
			!P.MULTI=[0,1,(filenamessize+1) < 5,0,1]
			!P.CHARSIZE=1.4
			ftitle='Autocorrelations '+nti_wavelet_i2str(i)+' '+channel
		endif

		for k=0,filenamessize-1 do begin
			acorr1[k,*]=pg_acorr(bps[i-exp[0],j-1,k,*],/fast)
			;aerr1[k,ind]=pg_acorrerremp(bps[i-exp[0],j-1,k,*],segment,/fast)
			aerr1[k,*]=pg_acorrerremp(bps[i-exp[0],j-1,k,*],segment,/fast)

			if aplot then begin
				if k/4. EQ k/4 then begin
					if print then device,filename=pg_filename(ftitle+'-'+nti_wavelet_i2str(k/4)) else window,/free
					xyouts,0.1,0.18,data,/normal
				endif

				title='Autocorrelation of band power'+str[k]
				title=title+' (error estimation based on '+nti_wavelet_i2str(nsegment)+' segments)'
				;plot, x[ind], acorr1[k,ind], title=title, xstyle=1, xtitle='Time (s)', $
				;	yrange=[min(acorr1[k,ind]-aerr1[k,ind]),max(acorr1[k,ind]+aerr1[k,ind])]
				;oploterr, x[ind], acorr1[k,ind], aerr1[k,ind]
				plot, x[ind], acorr1[k,ind], title=title, xstyle=1, xtitle='Time (s)', $
					yrange=[min(acorr1[k,ind]-aerr1[k,*]),max(acorr1[k,ind]+aerr1[k,*])]
				oploterr, x[ind], acorr1[k,ind], aerr1[k,*]
			endif
		endfor

		; Calculate crosssorrelation
		if cplot then begin
			!P.MULTI=[0,1,(filenamessize+1) < 5,0,1]
			!P.CHARSIZE=1.4
			ftitle='Crosscorrelations '+nti_wavelet_i2str(i)+' '+channel
		endif

		c=0
		for k=0,filenamessize-2 do begin
			for m=k+1,filenamessize-1 do begin
				ccorr1[k,m,*]=pg_ccorr(bps[i-exp[0],j-1,k,*],bps[i-exp[0],j-1,m,*],/fast)
				;cerr1[k,m,ind]=pg_ccorrerremp(bps[i-exp[0],j-1,k,*],bps[i-exp[0],j-1,m,*],segment,/fast)
				cerr1[k,m,*]=pg_ccorrerremp(bps[i-exp[0],j-1,k,*],bps[i-exp[0],j-1,m,*],segment,/fast)

				if cplot then begin
					if c/4. EQ c/4 then begin
					if print then device,filename=pg_filename(ftitle+'-'+nti_wavelet_i2str(c/4)) else window,/free
						xyouts,0.1,0.18,data,/normal
					endif

					title='Crosscorrelation of band powers'+str[k]+' and'+str[m]
					title=title+' (error estimation based on '+nti_wavelet_i2str(nsegment)+' segments)'
					;plot, x[ind], ccorr1[k,m,ind], title=title, xstyle=1, xtitle='Time (s)', $
					;	yrange=[min(ccorr1[k,m,ind]-cerr1[k,m,ind]),max(ccorr1[k,m,ind]+cerr1[k,m,ind])]
					;oploterr, x[ind], ccorr1[k,m,ind], cerr1[k,m,ind]
					plot, x[ind], ccorr1[k,m,ind], title=title, xstyle=1, xtitle='Time (s)', $
						yrange=[min(ccorr1[k,m,ind]-cerr1[k,m,*]),max(ccorr1[k,m,ind]+cerr1[k,m,*])]
					oploterr, x[ind], ccorr1[k,m,ind], cerr1[k,m,*]
				endif
				c=c+1
			endfor
		endfor

		; Reset original multiplot after correlation plotting
		if cplot then begin
			!P.MULTI=0
			!P.CHARSIZE=1.
		endif

		; Reshape ccorr1, cerr1
		temp1=fltarr(((filenamessize^2-filenamessize)/2)>1,timeaxsize)
		;temp2=fltarr(((filenamessize^2-filenamessize)/2)>1,timeaxsize)
		temp2=fltarr(((filenamessize^2-filenamessize)/2)>1,segment)
		index=0
		for k=0,filenamessize-2 do begin
			for m=k+1,filenamessize-1 do begin
				temp1[index,*]=ccorr1[k,m,*]
				temp2[index,*]=cerr1[k,m,*]
				index=index+1
			endfor
		endfor

		; Fill martixes
		acorr[i-exp[0],j-1,*,*]=acorr1
		aerr[i-exp[0],j-1,*,*]=aerr1
		ccorr[i-exp[0],j-1,*,*]=temp1
		cerr[i-exp[0],j-1,*,*]=temp2
	endfor

	; Calculate shot mean and error
	for k=0,timeaxsize-1 do begin
		for j=0,filenamessize-1 do begin
			if (err EQ 0) OR (err EQ 1) OR (err EQ 2) then smacorr[i-exp[0],j,k]=mean(acorr[i-exp[0],*,j,k])
			if err EQ 3 then smacorr[i-exp[0],j,k]=mean(acorr[i-exp[0],*,j,k])
		endfor
		for j=0,(filenamessize^2-filenamessize)/2-1 do begin
			if (err EQ 0) OR (err EQ 1) OR (err EQ 2) then smccorr[i-exp[0],j,k]=mean(ccorr[i-exp[0],*,j,k])
			if err EQ 3 then smccorr[i-exp[0],j,k]=mean(ccorr[i-exp[0],*,j,k])
		endfor
	endfor
	for k=0,segment-1 do begin
		for j=0,filenamessize-1 do begin
			if err EQ 0 then seacorr[i-exp[0],j,k]=sqrt(total(aerr[i-exp[0],*,j,k]^2))/channelssize
			if err EQ 1 then seacorr[i-exp[0],j,k]=mean(aerr[i-exp[0],*,j,k])
			if err EQ 2 then seacorr[i-exp[0],j,k]=stddev(acorr[i-exp[0],*,j,k])
			if err EQ 3 then seacorr[i-exp[0],j,k]=stddev(acorr[i-exp[0],*,j,k])
;			if systerr then seacorr[i-exp[0],j,k]=stddev(acorr[i-exp[0],*,j,k])
;			else seacorr[i-exp[0],j,k]=sqrt(total(aerr[i-exp[0],*,j,k]^2))/channelssize
		endfor
		for j=0,(filenamessize^2-filenamessize)/2-1 do begin
			if err EQ 0 then seccorr[i-exp[0],j,k]=sqrt(total(cerr[i-exp[0],*,j,k]^2))/channelssize
			if err EQ 1 then seccorr[i-exp[0],j,k]=mean(cerr[i-exp[0],*,j,k])
			if err EQ 2 then seccorr[i-exp[0],j,k]=stddev(ccorr[i-exp[0],*,j,k])
			if err EQ 3 then seccorr[i-exp[0],j,k]=stddev(ccorr[i-exp[0],*,j,k])
;			if systerr then seccorr[i-exp[0],j,k]=stddev(ccorr[i-exp[0],*,j,k]) $
;			else seccorr[i-exp[0],j,k]=sqrt(total(cerr[i-exp[0],*,j,k]^2))/channelssize
		endfor
	endfor

	; Plot shot means
	if shotplot then begin
		for j=0,filenamessize-1 do begin
			title='Average ACF '+str[j]+' for shot '+nti_wavelet_i2str(i)
			if err EQ 0 then title=title+' (error estimation based on '+nti_wavelet_i2str(nsegment*channelssize)+' segments)'
			if err EQ 1 then title=title+' (error estimation based on '+nti_wavelet_i2str(nsegment)+' segments)'
			if err EQ 2 then title=title+' (error estimation based on '+nti_wavelet_i2str(channelssize)+' segments)'
			if err EQ 3 then title=title+' (error estimation based on '+nti_wavelet_i2str(nsegment*channelssize)+' segments)'
;			if NOT systerr then title=title+' (error estimation based on '+nti_wavelet_i2str(nsegment)+' segments)'
			if print then device,filename=pg_filename(title) else window,/free
			;plot,x[ind],smacorr[i-exp[0],j,ind],xstyle=1,title=title,xtitle='Time (s)', $
			;	yrange=[min(smacorr[i-exp[0],j,ind]-seacorr[i-exp[0],j,ind]),max(smacorr[i-exp[0],j,ind]+seacorr[i-exp[0],j,ind])]
			;oploterr,x[ind],smacorr[i-exp[0],j,ind],seacorr[i-exp[0],j,ind]
			plot,x[ind],smacorr[i-exp[0],j,ind],xstyle=1,title=title,xtitle='Time (s)', $
				yrange=[min(smacorr[i-exp[0],j,ind]-seacorr[i-exp[0],j,*]),max(smacorr[i-exp[0],j,ind]+seacorr[i-exp[0],j,*])]
			oploterr,x[ind],smacorr[i-exp[0],j,ind],seacorr[i-exp[0],j,*]
			xyouts,0.7,0.9,data,/normal
		endfor
		for j=0,(filenamessize^2-filenamessize)/2-1 do begin
			title='Average CCF '+str2[j]+' for shot '+nti_wavelet_i2str(i)
			if err EQ 0 then title=title+' (error estimation based on '+nti_wavelet_i2str(nsegment*channelssize)+' segments)'
			if err EQ 1 then title=title+' (error estimation based on '+nti_wavelet_i2str(nsegment)+' segments)'
			if err EQ 2 then title=title+' (error estimation based on '+nti_wavelet_i2str(channelssize)+' segments)'
			if err EQ 3 then title=title+' (error estimation based on '+nti_wavelet_i2str(nsegment*channelssize)+' segments)'
;			if NOT systerr then title=title+' (error estimation based on '+nti_wavelet_i2str(nsegment)+' segments)'
			if print then device,filename=pg_filename(title) else window,/free
			;plot,x[ind],smccorr[i-exp[0],j,ind],xstyle=1,title=title,xtitle='Time (s)', $
			;	yrange=[min(smccorr[i-exp[0],j,ind]-seccorr[i-exp[0],j,ind]),max(smccorr[i-exp[0],j,ind]+seccorr[i-exp[0],j,ind])]
			;oploterr,x[ind],smccorr[i-exp[0],j,ind],seccorr[i-exp[0],j,ind]
			plot,x[ind],smccorr[i-exp[0],j,ind],xstyle=1,title=title,xtitle='Time (s)', $
				yrange=[min(smccorr[i-exp[0],j,ind]-seccorr[i-exp[0],j,*]),max(smccorr[i-exp[0],j,ind]+seccorr[i-exp[0],j,*])]
			oploterr,x[ind],smccorr[i-exp[0],j,ind],seccorr[i-exp[0],j,*]
			xyouts,0.7,0.9,data,/normal
		endfor
	endif
endfor

; Calculate experiment mean and error
for k=0,timeaxsize-1 do begin
	for j=0,filenamessize-1 do begin
		if (err EQ 0) OR (err EQ 1) OR (err EQ 2) then macorr[j,k]=mean(smacorr[*,j,k])
		if err EQ 3 then macorr[j,k]=mean(smacorr[*,j,k])
	endfor
	for j=0,(filenamessize^2-filenamessize)/2-1 do begin
		if (err EQ 0) OR (err EQ 1) OR (err EQ 2) then mccorr[j,k]=mean(smccorr[*,j,k])
		if err EQ 3 then mccorr[j,k]=mean(smccorr[*,j,k])
	endfor
endfor
for k=0,segment-1 do begin
	for j=0,filenamessize-1 do begin
		if err EQ 0 then eacorr[j,k]=sqrt(total(seacorr[*,j,k]^2))/expsize
		if err EQ 1 then eacorr[j,k]=sqrt(total(seacorr[*,j,k]^2))/expsize
		if err EQ 2 then eacorr[j,k]=stddev(acorr[*,*,j,k])
		if err EQ 3 then eacorr[j,k]=stddev(acorr[*,*,j,k])
;		if systerr then eacorr[j,k]=stddev(acorr[*,*,j,k]) $
;		else eacorr[j,k]=sqrt(total(seacorr[*,j,k]^2))/expsize
	endfor
	for j=0,(filenamessize^2-filenamessize)/2-1 do begin
		if err EQ 0 then eccorr[j,k]=sqrt(total(seccorr[*,j,k]^2))/expsize
		if err EQ 1 then eccorr[j,k]=sqrt(total(seccorr[*,j,k]^2))/expsize
		if err EQ 2 then eccorr[j,k]=stddev(ccorr[*,*,j,k])
		if err EQ 3 then eccorr[j,k]=stddev(ccorr[*,*,j,k])
;		if systerr then eccorr[j,k]=stddev(ccorr[*,*,j,k]) $
;		else eccorr[j,k]=sqrt(total(seccorr[*,j,k]^2))/expsize
	endfor
endfor

; Plot experiment means
if expplot then begin
	data='experiment: '+nti_wavelet_i2str(exp[0])+'-'+nti_wavelet_i2str(exp[1])+$
		'!Ctrange:!C '+pg_num2str(timeax[0],length=4)+' s - '+$
			pg_num2str(timeax[n_elements(timeax)-1],length=4)+' s'+$
		'!Cwin.: '+windowname+$
		'!Cwinsize: '+nti_wavelet_i2str(windowsize)+$
		'!Cmasksize: '+nti_wavelet_i2str(masksize)+$
		'!Cfreqres: '+nti_wavelet_i2str(freqres)+$
		'!Cstep: '+nti_wavelet_i2str(step)

	for j=0,filenamessize-1 do begin
		title='Average ACF '+str[j]+' for the experiment ('+nti_wavelet_i2str(exp[0])+'-'+nti_wavelet_i2str(exp[1])+')'
		if err EQ 0 then title=title+' (error estimation based on '+nti_wavelet_i2str(nsegment*channelssize*expsize)+' segments)'
		if err EQ 1 then title=title+' (error estimation based on '+nti_wavelet_i2str(nsegment*expsize)+' segments)'
		if err EQ 2 then title=title+' (error estimation based on '+nti_wavelet_i2str(expsize)+' segments)'
;		if NOT systerr then title=title+' (error estimation based on '+nti_wavelet_i2str(nsegment*expsize)+' segments)'
		if print then device,filename=pg_filename(title) else window,/free
		;plot,x[ind],macorr[j,ind],xstyle=1,title=title,xtitle='Time (s)', $
		;	yrange=[min(macorr[j,ind]-eacorr[j,ind]),max(macorr[j,ind]+eacorr[j,ind])]
		;oploterr,x[ind],macorr[j,ind],eacorr[j,ind]
		plot,x[ind],macorr[j,ind],xstyle=1,title=title,xtitle='Time (s)', $
			yrange=[min(macorr[j,ind]-eacorr[j,*]),max(macorr[j,ind]+eacorr[j,*])]
		oploterr,x[ind],macorr[j,ind],eacorr[j,*]
		xyouts,0.7,0.9,data,/normal
	endfor
	for j=0,(filenamessize^2-filenamessize)/2-1 do begin
		title='Average CCF '+str2[j]+' for the experiment ('+nti_wavelet_i2str(exp[0])+'-'+nti_wavelet_i2str(exp[1])+')'
		if err EQ 0 then title=title+' (error estimation based on '+nti_wavelet_i2str(nsegment*channelssize*expsize)+' segments)'
		if err EQ 1 then title=title+' (error estimation based on '+nti_wavelet_i2str(nsegment*expsize)+' segments)'
		if err EQ 2 then title=title+' (error estimation based on '+nti_wavelet_i2str(expsize)+' segments)'
;		if NOT systerr then title=title+' (error estimation based on '+nti_wavelet_i2str(nsegment*expsize)+' segments)'
		if print then device,filename=pg_filename(title) else window,/free
		;plot,x[ind],mccorr[j,ind],xstyle=1,title=title,xtitle='Time (s)', $
		;	yrange=[min(mccorr[j,ind]-eccorr[j,ind]),max(mccorr[j,ind]+eccorr[j,ind])]
		;oploterr,x[ind],mccorr[j,ind],eccorr[j,ind]
		plot,x[ind],mccorr[j,ind],xstyle=1,title=title,xtitle='Time (s)', $
			yrange=[min(mccorr[j,ind]-eccorr[j,*]),max(mccorr[j,ind]+eccorr[j,*])]
		oploterr,x[ind],mccorr[j,ind],eccorr[j,*]
		xyouts,0.7,0.9,data,/normal
	endfor
endif

if print then device,/close

acorr=acorr
ccorr=ccorr

end
