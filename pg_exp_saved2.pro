;+
; Name: pg_exp_saved2
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2003.12.10.-2003.12.12.
; Rewritten by: Gergo Pokol (pokol@reak.bme.hu) 2004.10.06.
; Modified by: Gergo Pokol (pokol@reak.bme.hu) 2005.05.26. (APDS, Coherence, Phase added)
;
; Purpose: Read band powers from file and plot autocorrelations, crosscorrelations,
;  APSDs, CPSDs, coherences and phase functions for a whole experiment
;
; Calling sequence:
;	pg_exp_saved2, filenames [,channels] [,corrlength] [,plot] [,/print] [,/freq] [,blocksize] [,maxf]
;   [err=err] [,acorr=acorr] [,ccorr=ccorr]
;
; Input:
;	filenames: Names of data files of the different band powers
;	channels (optional): Channel numbers to be considered; default: all channels
;	corrlength (optional): Maximum correlation length plotted (s); default: 0.003
;	/freq (optional): Nor correlations, but APSD, Coh. and Phase functions will be plotted
;	blocksize (optional): Size of blocks for /freq; default: 4096
;	maxf (optional): Maximum frequency plotted /freq; default: 1/windowlength
;	fitmaxf (optional): Maximum frequency fitted /freq; default: maxf/3
;	plot (optional): Display mode (available:
;						  0: Plot experiment means
;						  1: 0+shot means
;						  2: 1+crosscorrelations / coh+phase
;						  3: 2+autocorrelations / APSD1+APSD2+CPSD
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

pro pg_exp_saved2, filenames, channels=channels, corrlength=corrlength, plot=plot, print=print, err=err, $
	acorr=acorr, ccorr=ccorr, freq=freq, blocksize=blocksize, maxf=maxf, fitmaxf=fitmaxf

compile_opt defint32 ; 32 bit integers

; Set constants
nsegment=20
dstep=10
minf=100

; Set defaults
fast=keyword_set(fast)
print=keyword_set(print)
freq=keyword_set(freq)
if not(keyword_set(blocksize)) then blocksize=4096
if not(keyword_set(channels)) then channels=indgen(16)+1
if not(keyword_set(corrlength)) then corrlength=0.003
if not(keyword_set(plot)) then plot=0
if plot GE 0 then expplot=1 else expplot=0 		; Plot experiment means
if plot GE 1 then shotplot=1 else shotplot=0 		; Plot shot means
if plot GE 2 then cplot=1 else cplot=0 			; Plot crosscorrelations
if plot GE 3 then aplot=1 else aplot=0 			; Plot autocorrelations
if not(keyword_set(err)) then err=0
if err GE 2 then systerr=1 else systerr=0

; Calculate constants
channelssize=n_elements(channels)
filenamessize=n_elements(filenames)
if filenamessize EQ 1 then filenames=[filenames,'']

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

if NOT freq then begin ;********************* ACF, CCF

; Calculate x axis for correlation plotting
x=lindgen(n_elements(timeax))-ceil(n_elements(timeax)/2.)+1
x=x*(timeax[2]-timeax[1])
; Calculate plotted range from corrlength
if not(keyword_set(corrlength)) then corrlength=max(x)+1
ind=where((x ge -corrlength) and (x le corrlength))
indsize=n_elements(ind)

; Calculate segmentation
;segment=round(corrlength*2/(timeax[2]-timeax[1])) ; Length of segments
;segment=n_elements(ind) ; Length of segments
;nsegment=floor(n_elements(timeax)/segment) ; Number of segments
segment=n_elements(timeax)/nsegment

; Calculate x axis for segments
xs=lindgen(segment)-ceil(segment/2.)+1
xs=xs*(timeax[2]-timeax[1])
; Calculate plotted range from corrlength
inds=where((xs ge -corrlength) and (xs le corrlength))

; Progress indicator
print,'Initializing arrays'

; Initialize arrays
acorr1=fltarr(filenamessize,indsize)
ccorr1=fltarr(filenamessize,filenamessize,indsize)
aerr1=fltarr(filenamessize,indsize)
cerr1=fltarr(filenamessize,filenamessize,indsize)

acorr=fltarr(expsize,channelssize,filenamessize,indsize)
ccorr=fltarr(expsize,channelssize,1>(filenamessize^2-filenamessize)/2,indsize)
aerr=fltarr(expsize,channelssize,filenamessize,indsize)
cerr=fltarr(expsize,channelssize,1>(filenamessize^2-filenamessize)/2,indsize)

smacorr=fltarr(expsize,filenamessize,indsize)				; Shot mean
smccorr=fltarr(expsize,1>(filenamessize^2-filenamessize)/2,indsize)	; Shot mean
seacorr=fltarr(expsize,filenamessize,indsize)				; Shot error
seccorr=fltarr(expsize,1>(filenamessize^2-filenamessize)/2,indsize)	; Shot error

macorr=fltarr(filenamessize,indsize)					; Experiment mean
mccorr=fltarr(1>(filenamessize^2-filenamessize)/2,indsize)		; Experiment mean
eacorr=fltarr(filenamessize,indsize)					; Experiment error
eccorr=fltarr(1>(filenamessize^2-filenamessize)/2,indsize)		; Experiment error

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

		; Calculate autocorrelations
		if aplot then begin
			!P.MULTI=[0,1,(filenamessize+1) < 5,0,1]
			!P.CHARSIZE=1.4
			ftitle='Autocorrelations '+nti_wavelet_i2str(i)+' '+channel
		endif

		for k=0,filenamessize-1 do begin
			tmp=pg_acorr(bps[i-exp[0],j-1,k,*],/fast)
			acorr1[k,*]=tmp[ind]
			tmp=pg_acorrerremp2(bps[i-exp[0],j-1,k,*],segment)
			aerr1[k,*]=tmp[inds]

			if aplot then begin
				if k/4. EQ k/4 then begin
					if print then device,filename=pg_filename(ftitle+'-'+nti_wavelet_i2str(k/4)) else window,/free
					xyouts,0.1,0.18,data,/normal
				endif

				title='Autocorrelation of band power'+str[k]
				title=title+' (error estimation based on '+nti_wavelet_i2str(nsegment)+' segments)'
				plot, x[ind], acorr1[k,*], title=title, xstyle=1, xtitle='Time (s)', $
					yrange=[min(acorr1[k,*]-aerr1[k,*]),max(acorr1[k,*]+aerr1[k,*])]
				errplot, pg_downsample(x[ind],step=dstep), pg_downsample(acorr1[k,*]-aerr1[k,*],step=dstep), pg_downsample(acorr1[k,*]+aerr1[k,*],step=dstep),width=0.002
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
				tmp=pg_ccorr(bps[i-exp[0],j-1,k,*],bps[i-exp[0],j-1,m,*],/fast)
				ccorr1[k,m,*]=tmp[ind]
				tmp=pg_ccorrerremp2(bps[i-exp[0],j-1,k,*],bps[i-exp[0],j-1,m,*],segment)
				cerr1[k,m,*]=tmp[inds]

				if cplot then begin
					if c/4. EQ c/4 then begin
					if print then device,filename=pg_filename(ftitle+'-'+nti_wavelet_i2str(c/4)) else window,/free
						xyouts,0.1,0.18,data,/normal
					endif

					title='Crosscorrelation of band powers'+str[k]+' and'+str[m]
					title=title+' (error estimation based on '+nti_wavelet_i2str(nsegment)+' segments)'
					plot, x[ind], ccorr1[k,m,*], title=title, xstyle=1, xtitle='Time (s)', $
						yrange=[min(ccorr1[k,m,*]-cerr1[k,m,*]),max(ccorr1[k,m,*]+cerr1[k,m,*])]
					errplot, pg_downsample(x[ind],step=dstep), pg_downsample(ccorr1[k,m,*]-cerr1[k,m,*],step=dstep), pg_downsample(ccorr1[k,m,*]+cerr1[k,m,*],step=dstep),width=0.002
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
		temp1=fltarr(((filenamessize^2-filenamessize)/2)>1,indsize)
		temp2=fltarr(((filenamessize^2-filenamessize)/2)>1,indsize)
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
	for k=0,indsize-1 do begin
		for j=0,filenamessize-1 do begin
			if (err EQ 0) OR (err EQ 1) OR (err EQ 2) then smacorr[i-exp[0],j,k]=mean(acorr[i-exp[0],*,j,k])
			if err EQ 3 then smacorr[i-exp[0],j,k]=mean(acorr[i-exp[0],*,j,k])
		endfor
		for j=0,(filenamessize^2-filenamessize)/2-1 do begin
			if (err EQ 0) OR (err EQ 1) OR (err EQ 2) then smccorr[i-exp[0],j,k]=mean(ccorr[i-exp[0],*,j,k])
			if err EQ 3 then smccorr[i-exp[0],j,k]=mean(ccorr[i-exp[0],*,j,k])
		endfor
	endfor
	for k=0,indsize-1 do begin
		for j=0,filenamessize-1 do begin
			if err EQ 0 then seacorr[i-exp[0],j,k]=sqrt(total(aerr[i-exp[0],*,j,k]^2))/channelssize
			if err EQ 1 then seacorr[i-exp[0],j,k]=mean(aerr[i-exp[0],*,j,k])
			if err EQ 2 then seacorr[i-exp[0],j,k]=stddev(acorr[i-exp[0],*,j,k])
			if err EQ 3 then seacorr[i-exp[0],j,k]=stddev(acorr[i-exp[0],*,j,k])
		endfor
		for j=0,(filenamessize^2-filenamessize)/2-1 do begin
			if err EQ 0 then seccorr[i-exp[0],j,k]=sqrt(total(cerr[i-exp[0],*,j,k]^2))/channelssize
			if err EQ 1 then seccorr[i-exp[0],j,k]=mean(cerr[i-exp[0],*,j,k])
			if err EQ 2 then seccorr[i-exp[0],j,k]=stddev(ccorr[i-exp[0],*,j,k])
			if err EQ 3 then seccorr[i-exp[0],j,k]=stddev(ccorr[i-exp[0],*,j,k])
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
			if print then device,filename=pg_filename(title) else window,/free
			plot,x[ind],smacorr[i-exp[0],j,*],xstyle=1,title=title,xtitle='Time (s)', $
				yrange=[min(smacorr[i-exp[0],j,*]-seacorr[i-exp[0],j,*]),max(smacorr[i-exp[0],j,*]+seacorr[i-exp[0],j,*])]
			errplot,pg_downsample(x[ind],step=dstep),pg_downsample(smacorr[i-exp[0],j,*]-seacorr[i-exp[0],j,*],step=dstep),pg_downsample(smacorr[i-exp[0],j,*]+seacorr[i-exp[0],j,*],step=dstep),width=0.002
			xyouts,0.7,0.9,data,/normal
		endfor
		for j=0,(filenamessize^2-filenamessize)/2-1 do begin
			title='Average CCF '+str2[j]+' for shot '+nti_wavelet_i2str(i)
			if err EQ 0 then title=title+' (error estimation based on '+nti_wavelet_i2str(nsegment*channelssize)+' segments)'
			if err EQ 1 then title=title+' (error estimation based on '+nti_wavelet_i2str(nsegment)+' segments)'
			if err EQ 2 then title=title+' (error estimation based on '+nti_wavelet_i2str(channelssize)+' segments)'
			if err EQ 3 then title=title+' (error estimation based on '+nti_wavelet_i2str(nsegment*channelssize)+' segments)'
			if print then device,filename=pg_filename(title) else window,/free
			plot,x[ind],smccorr[i-exp[0],j,*],xstyle=1,title=title,xtitle='Time (s)', $
				yrange=[min(smccorr[i-exp[0],j,*]-seccorr[i-exp[0],j,*]),max(smccorr[i-exp[0],j,*]+seccorr[i-exp[0],j,*])]
			errplot,pg_downsample(x[ind],step=dstep),pg_downsample(smccorr[i-exp[0],j,*]-seccorr[i-exp[0],j,*],step=dstep),pg_downsample(smccorr[i-exp[0],j,*]+seccorr[i-exp[0],j,*],step=dstep),width=0.002
			xyouts,0.7,0.9,data,/normal
		endfor
	endif
endfor

; Calculate experiment mean and error
for k=0,indsize-1 do begin
	for j=0,filenamessize-1 do begin
		if (err EQ 0) OR (err EQ 1) OR (err EQ 2) then macorr[j,k]=mean(smacorr[*,j,k])
		if err EQ 3 then macorr[j,k]=mean(smacorr[*,j,k])
	endfor
	for j=0,(filenamessize^2-filenamessize)/2-1 do begin
		if (err EQ 0) OR (err EQ 1) OR (err EQ 2) then mccorr[j,k]=mean(smccorr[*,j,k])
		if err EQ 3 then mccorr[j,k]=mean(smccorr[*,j,k])
	endfor
endfor
for k=0,indsize-1 do begin
	for j=0,filenamessize-1 do begin
		if err EQ 0 then eacorr[j,k]=sqrt(total(seacorr[*,j,k]^2))/expsize
		if err EQ 1 then eacorr[j,k]=sqrt(total(seacorr[*,j,k]^2))/expsize
		if err EQ 2 then eacorr[j,k]=stddev(acorr[*,*,j,k])
		if err EQ 3 then eacorr[j,k]=stddev(acorr[*,*,j,k])
	endfor
	for j=0,(filenamessize^2-filenamessize)/2-1 do begin
		if err EQ 0 then eccorr[j,k]=sqrt(total(seccorr[*,j,k]^2))/expsize
		if err EQ 1 then eccorr[j,k]=sqrt(total(seccorr[*,j,k]^2))/expsize
		if err EQ 2 then eccorr[j,k]=stddev(ccorr[*,*,j,k])
		if err EQ 3 then eccorr[j,k]=stddev(ccorr[*,*,j,k])
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
		if print then device,filename=pg_filename(title) else window,/free
		plot,x[ind],macorr[j,*],xstyle=1,title=title,xtitle='Time (s)', $
			yrange=[-0.1,1]
			;yrange=[min(macorr[j,*]-eacorr[j,*]),max(macorr[j,*]+eacorr[j,*])]
		errplot,pg_downsample(x[ind],step=dstep),pg_downsample(macorr[j,*]-eacorr[j,*],step=dstep),pg_downsample(macorr[j,*]+eacorr[j,*],step=dstep),width=0.002
		xyouts,0.7,0.9,data,/normal
	endfor
	for j=0,(filenamessize^2-filenamessize)/2-1 do begin
		title='Average CCF '+str2[j]+' for the experiment ('+nti_wavelet_i2str(exp[0])+'-'+nti_wavelet_i2str(exp[1])+')'
		if err EQ 0 then title=title+' (error estimation based on '+nti_wavelet_i2str(nsegment*channelssize*expsize)+' segments)'
		if err EQ 1 then title=title+' (error estimation based on '+nti_wavelet_i2str(nsegment*expsize)+' segments)'
		if err EQ 2 then title=title+' (error estimation based on '+nti_wavelet_i2str(expsize)+' segments)'
		if print then device,filename=pg_filename(title) else window,/free
		plot,x[ind],mccorr[j,*],xstyle=1,title=title,xtitle='Time (s)', $
			yrange=[-0.1,1]
			;yrange=[min(mccorr[j,*]-eccorr[j,*]),max(mccorr[j,*]+eccorr[j,*])]
		errplot,pg_downsample(x[ind],step=dstep),pg_downsample(mccorr[j,*]-eccorr[j,*],step=dstep),pg_downsample(mccorr[j,*]+eccorr[j,*],step=dstep),width=0.002
		xyouts,0.7,0.9,data,/normal
	endfor
endif

endif else begin ;********************* APSD, COH, PHASE

; Calculate x axis for spectrum plotting
f=findgen(floor(blocksize/2.)+1)
f=f/max(f)
fn=(1/(timeax[2]-timeax[1])/2.)
f=f*fn
if not(keyword_set(maxf)) then maxf=1./windowsize/(timeax[2]-timeax[1])
if not(keyword_set(fitmaxf)) then fitmaxf=maxf/3

; Calculate plotted range
ind=where(f lt maxf)
ind_range=where(f gt minf and f lt maxf)
ind_fit=where(f lt fitmaxf)

; Progress indicator
print,'Initializing arrays'

; Initialize arrays
temp_apsd=fltarr(filenamessize,blocksize)
temp_cpsd=complexarr(filenamessize,filenamessize,blocksize)
temp_apsd_err=fltarr(filenamessize,blocksize)
temp_cpsd_err=complexarr(filenamessize,filenamessize,blocksize)
temp_coh=fltarr(filenamessize,filenamessize,blocksize)
temp_phase=fltarr(filenamessize,filenamessize,blocksize)

apsd=fltarr(expsize,channelssize,filenamessize,blocksize)
cpsd=complexarr(expsize,channelssize,1>(filenamessize^2-filenamessize)/2,blocksize)
apsd_err=fltarr(expsize,channelssize,filenamessize,blocksize)
cpsd_err=complexarr(expsize,channelssize,1>(filenamessize^2-filenamessize)/2,blocksize)
coh=fltarr(expsize,channelssize,1>(filenamessize^2-filenamessize)/2,blocksize)
phase=fltarr(expsize,channelssize,1>(filenamessize^2-filenamessize)/2,blocksize)

smapsd=fltarr(expsize,filenamessize,blocksize)				; Shot mean
smcpsd=complexarr(expsize,1>(filenamessize^2-filenamessize)/2,blocksize)	; Shot mean
smapsd_err=fltarr(expsize,filenamessize,blocksize)				; Shot standard deviation
smcpsd_err=complexarr(expsize,1>(filenamessize^2-filenamessize)/2,blocksize)	; Shot standard deviation
smcoh=fltarr(expsize,1>(filenamessize^2-filenamessize)/2,blocksize)	; Shot mean
smphase=fltarr(expsize,1>(filenamessize^2-filenamessize)/2,blocksize)	; Shot mean

mapsd=fltarr(filenamessize,blocksize)					; Experiment mean
mcpsd=complexarr(1>(filenamessize^2-filenamessize)/2,blocksize)		; Experiment mean
mapsd_err=fltarr(filenamessize,blocksize)					; Experiment standard deviation
mcpsd_err=complexarr(1>(filenamessize^2-filenamessize)/2,blocksize)		; Experiment standard deviation
mcoh=fltarr(1>(filenamessize^2-filenamessize)/2,blocksize)		; Experiment mean
mphase=fltarr(1>(filenamessize^2-filenamessize)/2,blocksize)		; Experiment mean

for i=exp[0],exp[1] do begin
	for j=1,channelssize do begin
		channel='W7-AS Mirnov/Mir-1-'+nti_wavelet_i2str(channels[j-1])

		data='shot: '+nti_wavelet_i2str(i)+' '+channel+$
			'             trange: '+pg_num2str(timeax[0],length=4)+' s - '+$
				pg_num2str(timeax[n_elements(timeax)-1],length=4)+' s'+$
			'!Cwin.: '+windowname+$
			'             winsize: '+nti_wavelet_i2str(windowsize)+$
			'             masksize: '+nti_wavelet_i2str(masksize)+$
			'!Cfreqres: '+nti_wavelet_i2str(freqres)+$
			'             step: '+nti_wavelet_i2str(step)+$
			'!Cblocksize: '+nti_wavelet_i2str(blocksize)

		; Progress indicator
		print,nti_wavelet_i2str(i)+' '+channel
		wait,1

		; Initialize multiplot
		if cplot then begin
			!P.MULTI=[0,1,3,0,1]
			!P.CHARSIZE=1.4
			ftitle='Phase coherence '+nti_wavelet_i2str(i)+' '+channel
		endif
		if aplot then begin
			!P.MULTI=[0,1,6,0,1]
			!P.CHARSIZE=1.4
			ftitle='Combined coherence '+nti_wavelet_i2str(i)+' '+channel
		endif

		for k=0,filenamessize-2 do begin
			for m=k+1,filenamessize-1 do begin
				temp_cohphase=g_cohphasef(bps[i-exp[0],j-1,k,*],bps[i-exp[0],j-1,m,*],blocksize,hann=0,$
					meanapsd1=meanapsd1,meanapsd2=meanapsd2,meancpsd=meancpsd,$
					errapsd1=errapsd1,errapsd2=errapsd2,errcpsd=errcpsd, error=err)

				temp_apsd[k,*]=meanapsd1
				temp_apsd[m,*]=meanapsd2
				temp_apsd_err[k,*]=errapsd1
				temp_apsd_err[m,*]=errapsd2
				temp_cpsd[k,m,*]=meancpsd
				temp_cpsd_err[k,m,*]=errcpsd
				temp_coh[k,m,*]=temp_cohphase[*,0]
				temp_phase[k,m,*]=temp_cohphase[*,1]

				if cplot then begin
					if print then device,filename=pg_filename(ftitle+'-'+str[k]+' and'+str[m],dir=nti_wavelet_i2str(exp[0])+'-'+nti_wavelet_i2str(exp[1])) else window,/free
				endif
				if aplot then begin ;Plot APDSs and CPSD
					title='APSD of band power'+str[k]
					plot, f[ind], meanapsd1[ind], title=title, xstyle=1, xtitle='Frequency (Hz)',yrange=[0,max(meanapsd1[ind_range])]
					errplot,f[ind],meanapsd1[ind]-errapsd1[ind],meanapsd1[ind]+errapsd1[ind],width=0.002
					title='APSD of band power'+str[m]
					plot, f[ind], meanapsd2[ind], title=title, xstyle=1, xtitle='Frequency (Hz)',yrange=[0,max(meanapsd2[ind_range])]
					errplot,f[ind],meanapsd2[ind]-errapsd2[ind],meanapsd2[ind]+errapsd2[ind],width=0.002
					title='CPSD of band powers'+str[k]+' and'+str[m]
					plot, f[ind], abs(meancpsd[ind]), title=title, xstyle=1, xtitle='Frequency (Hz)',yrange=[0,max(abs(meancpsd[ind_range]))]
					errplot,f[ind],abs(meancpsd[ind])-abs(errcpsd[ind]),abs(meancpsd[ind])+abs(errcpsd[ind]),width=0.002
				endif
				if cplot then begin ;Plot Coherence and phase
					title='Coherence of band powers'+str[k]+' and'+str[m]
					plot, f[ind], temp_cohphase[ind,0], title=title, xstyle=1, xtitle='Frequency (Hz)',$
						yrange=[0,1]
					title='Phase of band powers'+str[k]+' and'+str[m]
					if mean(abs(abs(temp_cohphase[ind_range[0:10],1])/!PI-1)) lt 0.5 then begin
						opposite=1
						plotted=temp_cohphase[ind,1]/!PI
						for a=0,n_elements(ind)-1 do if plotted[a] lt 0 then plotted[a]=plotted[a]+2
						yrange=[0,2]
					endif else begin
						opposite=0
						plotted=temp_cohphase[ind,1]/!PI
						yrange=[-1,1]
					endelse
					plot, f[ind], plotted, title=title, xstyle=1, xtitle='Frequency (Hz)',$
						yrange=yrange,ytitle='Multiples of PI'
					;Calculate phase error
					errphase=1/!PI/(1+temp_cohphase[*,1]^2)*imaginary(meancpsd)/float(meancpsd)*$
						sqrt((Imaginary(errcpsd)/Imaginary(meancpsd))^2+(Float(errcpsd)/Float(meancpsd))^2) ;Gauss
;					errphase=temp_cohphase[*,1]/!PI*sqrt((Imaginary(errcpsd)/Imaginary(meancpsd))^2+(Float(errcpsd)/Float(meancpsd))^2) ;Wrong
;					errphase=1/!PI/(1+temp_cohphase[*,1]^2)*temp_cohphase[*,1]*sqrt((Imaginary(errcpsd)/Imaginary(meancpsd))^2+(Float(errcpsd)/Float(meancpsd))^2) ;Wrong
					errphase[0]=1e-10
					errplot,f[ind],plotted-errphase[ind],plotted+errphase[ind],width=0.002
					;Fit linear
					plotted[0]=opposite
					fit=linfit(f[ind_fit],plotted[ind_fit],sigma=errfit,yfit=yfit,measure_errors=errphase[ind_fit])
					oplot,f[ind_fit],yfit,linestyle=2
					fitstr='time delay= '+pg_num2str(fit[1]/2.*1e6,length=4)+'us'+$
						'!C sigma= '+pg_num2str(errfit[1]/2.*1e6,length=4)+'us'
					plot,[0],/nodata,xstyle=4, ystyle=4
					xyouts,0.1,0.16,data,/normal
					xyouts,0.7,0.16,fitstr,/normal
				endif
			endfor
		endfor

		; Reset original multiplot after correlation plotting
		if cplot then begin
			!P.MULTI=0
			!P.CHARSIZE=1.
		endif

		; Reshape ccorr1, cerr1
		temp1=complexarr(((filenamessize^2-filenamessize)/2)>1,blocksize)
		temp2=complexarr(((filenamessize^2-filenamessize)/2)>1,blocksize)
		temp3=fltarr(((filenamessize^2-filenamessize)/2)>1,blocksize)
		temp4=fltarr(((filenamessize^2-filenamessize)/2)>1,blocksize)
		index=0
		for k=0,filenamessize-2 do begin
			for m=k+1,filenamessize-1 do begin
				temp1[index,*]=temp_cpsd[k,m,*]
				temp2[index,*]=temp_cpsd_err[k,m,*]
				temp3[index,*]=temp_coh[k,m,*]
				temp4[index,*]=temp_phase[k,m,*]
				index=index+1
			endfor
		endfor

		; Fill martixes
		apsd[i-exp[0],j-1,*,*]=temp_apsd
		apsd_err[i-exp[0],j-1,*,*]=temp_apsd_err
		cpsd[i-exp[0],j-1,*,*]=temp1
		cpsd_err[i-exp[0],j-1,*,*]=temp2
		coh[i-exp[0],j-1,*,*]=temp3
		phase[i-exp[0],j-1,*,*]=temp4
	endfor

	; Calculate shot mean and error for APSD and CPSD
	for k=0,blocksize-1 do begin
		for j=0,filenamessize-1 do begin
			smapsd[i-exp[0],j,k]=mean(apsd[i-exp[0],*,j,k])
		endfor
		for j=0,(filenamessize^2-filenamessize)/2-1 do begin
			smcpsd[i-exp[0],j,k]=mean(cpsd[i-exp[0],*,j,k])
		endfor
	endfor
	for k=0,blocksize-1 do begin
		for j=0,filenamessize-1 do begin
			if err EQ 0 then smapsd_err[i-exp[0],j,k]=sqrt(total(apsd_err[i-exp[0],*,j,k]^2))/channelssize
		endfor
		for j=0,(filenamessize^2-filenamessize)/2-1 do begin
			if err EQ 0 then smcpsd_err[i-exp[0],j,k]=sqrt(total(cpsd_err[i-exp[0],*,j,k]^2))/channelssize
		endfor
	endfor

	; Calculate coherence and phase for shot means
	if shotplot then begin
		!P.MULTI=[0,1,6,0,1]
		!P.CHARSIZE=1.4
		ftitle='Combined coherence for shot: '+nti_wavelet_i2str(i)
	endif
		data='shot: '+nti_wavelet_i2str(i)+$
			'             trange: '+pg_num2str(timeax[0],length=4)+' s - '+$
				pg_num2str(timeax[n_elements(timeax)-1],length=4)+' s'+$
			'!Cwin.: '+windowname+$
			'             winsize: '+nti_wavelet_i2str(windowsize)+$
			'             masksize: '+nti_wavelet_i2str(masksize)+$
			'!Cfreqres: '+nti_wavelet_i2str(freqres)+$
			'             step: '+nti_wavelet_i2str(step)+$
			'!Cblocksize: '+nti_wavelet_i2str(blocksize)

	index=0
	for k=0,filenamessize-2 do begin
		meanapsd1=smapsd[i-exp[0],k,*]
		errapsd1=smapsd_err[i-exp[0],k,*]
		for m=k+1,filenamessize-1 do begin
			meanapsd2=smapsd[i-exp[0],m,*]
			errapsd2=smapsd_err[i-exp[0],m,*]
			meancpsd=smcpsd[i-exp[0],index,*]
			errcpsd=smcpsd_err[i-exp[0],index,*]
			for j=0,blocksize-1 do begin
  				temp_cohphase[j,0]=abs(meancpsd(j))/SQRT(meanapsd1(j)*meanapsd2(j))
  				temp_cohphase[j,1]=atan(imaginary(meancpsd(j)),float(meancpsd(j)))
			endfor
			smcoh[i-exp[0],index,*]=temp_cohphase[*,0]
			smphase[i-exp[0],index,*]=temp_cohphase[*,1]

			if shotplot then begin ; Plot shot means
				if print then device,filename=pg_filename(ftitle+'-'+str[k]+' and'+str[m],dir=nti_wavelet_i2str(exp[0])+'-'+nti_wavelet_i2str(exp[1])) else window,/free
				title='APSD of band power'+str[k]
				plot, f[ind], meanapsd1[ind], title=title, xstyle=1, xtitle='Frequency (Hz)',yrange=[0,max(meanapsd1[ind_range])]
				errplot,f[ind],meanapsd1[ind]-errapsd1[ind],meanapsd1[ind]+errapsd1[ind],width=0.002
				title='APSD of band power'+str[m]
				plot, f[ind], meanapsd2[ind], title=title, xstyle=1, xtitle='Frequency (Hz)',yrange=[0,max(meanapsd2[ind_range])]
				errplot,f[ind],meanapsd2[ind]-errapsd2[ind],meanapsd2[ind]+errapsd2[ind],width=0.002
				title='CPSD of band powers'+str[k]+' and'+str[m]
				plot, f[ind], abs(meancpsd[ind]), title=title, xstyle=1, xtitle='Frequency (Hz)',yrange=[0,max(abs(meancpsd[ind_range]))]
				errplot,f[ind],abs(meancpsd[ind])-abs(errcpsd[ind]),abs(meancpsd[ind])+abs(errcpsd[ind]),width=0.002
				title='Coherence of band powers'+str[k]+' and'+str[m]
				plot, f[ind], temp_cohphase[ind,0], title=title, xstyle=1, xtitle='Frequency (Hz)',$
					yrange=[0,1]
				title='Phase of band powers'+str[k]+' and'+str[m]
					opposite=0
					plotted=temp_cohphase[ind,1]/!PI
					yrange=[-1,1]
				plot, f[ind], plotted, title=title, xstyle=1, xtitle='Frequency (Hz)',$
					yrange=yrange,ytitle='Multiples of PI'
				;Calculate phase error
				errphase=1/!PI/(1+temp_cohphase[*,1]^2)*imaginary(meancpsd)/float(meancpsd)*$
					sqrt((Imaginary(errcpsd)/Imaginary(meancpsd))^2+(Float(errcpsd)/Float(meancpsd))^2) ;Gauss
				errphase[0]=1e-10
				errplot,f[ind],plotted-errphase[ind],plotted+errphase[ind],width=0.002
				;Fit linear
				plotted[0]=opposite
				fit=linfit(f[ind_fit],plotted[ind_fit],sigma=errfit,yfit=yfit,measure_errors=errphase[ind_fit])
				oplot,f[ind_fit],yfit,linestyle=2
				fitstr='time delay= '+pg_num2str(fit[1]/2.*1e6,length=4)+'us'+$
					'!C sigma= '+pg_num2str(errfit[1]/2.*1e6,length=4)+'us'
				plot,[0],/nodata,xstyle=4, ystyle=4
				xyouts,0.1,0.16,data,/normal
				xyouts,0.7,0.16,fitstr,/normal
			endif
			index=index+1
		endfor
	endfor
endfor

; Calculate experiment mean and error for APSD and CPSD
for k=0,blocksize-1 do begin
	for j=0,filenamessize-1 do begin
		mapsd[j,k]=mean(smapsd[*,j,k])
	endfor
	for j=0,(filenamessize^2-filenamessize)/2-1 do begin
		mcpsd[j,k]=mean(smcpsd[*,j,k])
	endfor
endfor
for k=0,blocksize-1 do begin
	for j=0,filenamessize-1 do begin
		if err EQ 0 then mapsd_err[j,k]=sqrt(total(smapsd_err[*,j,k]^2))/expsize
	endfor
	for j=0,(filenamessize^2-filenamessize)/2-1 do begin
		if err EQ 0 then mcpsd_err[j,k]=sqrt(total(smcpsd_err[*,j,k]^2))/expsize
	endfor
endfor

; Calculate coherence and phase for experiment means
if expplot then begin
	data='experiment: '+nti_wavelet_i2str(exp[0])+'-'+nti_wavelet_i2str(exp[1])+$
		'             trange: '+pg_num2str(timeax[0],length=4)+' s - '+$
			pg_num2str(timeax[n_elements(timeax)-1],length=4)+' s'+$
		'!Cwin.: '+windowname+$
		'             winsize: '+nti_wavelet_i2str(windowsize)+$
		'             masksize: '+nti_wavelet_i2str(masksize)+$
		'!Cfreqres: '+nti_wavelet_i2str(freqres)+$
		'             step: '+nti_wavelet_i2str(step)+$
		'!Cblocksize: '+nti_wavelet_i2str(blocksize)
	!P.MULTI=[0,1,6,0,1]
	!P.CHARSIZE=1.4
	ftitle='Combined coherence for experiment: '+nti_wavelet_i2str(exp[0])+'-'+nti_wavelet_i2str(exp[1])
endif

index=0
for k=0,filenamessize-2 do begin
	meanapsd1=mapsd[k,*]
	errapsd1=mapsd_err[k,*]
	for m=k+1,filenamessize-1 do begin
		meanapsd2=mapsd[m,*]
		errapsd2=mapsd_err[m,*]
		meancpsd=mcpsd[index,*]
		errcpsd=mcpsd_err[index,*]
		for j=0,blocksize-1 do begin
  			temp_cohphase[j,0]=abs(meancpsd(j))/SQRT(meanapsd1(j)*meanapsd2(j))
  			temp_cohphase[j,1]=atan(imaginary(meancpsd(j)),float(meancpsd(j)))
		endfor
		mcoh[index,*]=temp_cohphase[*,0]
		mphase[index,*]=temp_cohphase[*,1]

		if shotplot then begin ; Plot shot means
			if print then device,filename=pg_filename(ftitle+'-'+str[k]+' and'+str[m],dir=nti_wavelet_i2str(exp[0])+'-'+nti_wavelet_i2str(exp[1])) else window,/free
			title='APSD of band power'+str[k]
			plot, f[ind], meanapsd1[ind], title=title, xstyle=1, xtitle='Frequency (Hz)',yrange=[0,max(meanapsd1[ind_range])]
			errplot,f[ind],meanapsd1[ind]-errapsd1[ind],meanapsd1[ind]+errapsd1[ind],width=0.002
			title='APSD of band power'+str[m]
			plot, f[ind], meanapsd2[ind], title=title, xstyle=1, xtitle='Frequency (Hz)',yrange=[0,max(meanapsd2[ind_range])]
			errplot,f[ind],meanapsd2[ind]-errapsd2[ind],meanapsd2[ind]+errapsd2[ind],width=0.002
			title='CPSD of band powers'+str[k]+' and'+str[m]
			plot, f[ind], abs(meancpsd[ind]), title=title, xstyle=1, xtitle='Frequency (Hz)',yrange=[0,max(abs(meancpsd[ind_range]))]
			errplot,f[ind],abs(meancpsd[ind])-abs(errcpsd[ind]),abs(meancpsd[ind])+abs(errcpsd[ind]),width=0.002
			title='Coherence of band powers'+str[k]+' and'+str[m]
			plot, f[ind], temp_cohphase[ind,0], title=title, xstyle=1, xtitle='Frequency (Hz)',$
				yrange=[0,1]
			title='Phase of band powers'+str[k]+' and'+str[m]
			if mean(abs(abs(temp_cohphase[ind_range[0:10],1])/!PI-1)) lt 0.5 then begin
				opposite=1
				plotted=temp_cohphase[ind,1]/!PI
				for a=0,n_elements(ind)-1 do if plotted[a] lt 0 then plotted[a]=plotted[a]+2
				yrange=[0,2]
			endif else begin
				opposite=0
				plotted=temp_cohphase[ind,1]/!PI
				yrange=[-1,1]
			endelse
			plot, f[ind], plotted, title=title, xstyle=1, xtitle='Frequency (Hz)',$
				yrange=yrange,ytitle='Multiples of PI'
			;Calculate phase error
			errphase=1/!PI/(1+temp_cohphase[*,1]^2)*imaginary(meancpsd)/float(meancpsd)*$
				sqrt((Imaginary(errcpsd)/Imaginary(meancpsd))^2+(Float(errcpsd)/Float(meancpsd))^2) ;Gauss
			errphase[0]=1e-10
			errplot,f[ind],plotted-errphase[ind],plotted+errphase[ind],width=0.002
			;Fit linear
			plotted[0]=opposite
			fit=linfit(f[ind_fit],plotted[ind_fit],sigma=errfit,yfit=yfit,measure_errors=errphase[ind_fit])
			oplot,f[ind_fit],yfit,linestyle=2
			fitstr='time delay= '+pg_num2str(fit[1]/2.*1e6,length=4)+'us'+$
				'!C sigma= '+pg_num2str(errfit[1]/2.*1e6,length=4)+'us'
			plot,[0],/nodata,xstyle=4, ystyle=4
			xyouts,0.1,0.16,data,/normal
			xyouts,0.7,0.16,fitstr,/normal
		endif
		index=index+1
	endfor
endfor

endelse ;**************

if print then device,/close
pg_initgraph

end
