;+
; Name: pg_anal3
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2004.10.12.
;
; Purpose: Plot autocorrelations, crosscorrelations of bandpowers
;
; Calling sequence:
;	pg_anal3, bp, b, [,timeax] [,corrlength] [,plot] [,/print] [/poster] [,/nodiv]$
;		[,acorr=acorr] [,aerr=aerr] [,ccorr=ccorr] [,cerr=cerr] [,nsegment=nsegment]
;
; Input:
;	bp: Band powers
;	b: Frequency bands (kHz)
;	timeax (optional): Time axis
;	corrlength (optional): Maximum correlation length plotted (s) !Use with timeax set!
;	plot (optional): Display mode (available:
;						  1: 0+crosscorrelations
;						  2: 1+autocorrelations)
;						   ; default: 0
;	/print (optional): Produce ps files
;	/poster (optional): Print in poster form
;	/nodiv (optional): Do not divide by sqrt(n) in error estimation
;
; Output:
;	acorr (optional): Autocorrelations of the band powers (b*n matrix)
;	aerr (optional): Errors of autocorrelations of the band powers (b*n matrix)
;	ccorr (optional): Crosscorrelations of each pair of band powers ((b^2-b)/2*n matrix)
;	cerr (optional): Errors of crosscorrelations of each pair of band powers ((b^2-b)/2*n matrix)
;	nsegment (optional): Number of segments the error estimation is calculated from
;-

pro pg_anal3, bp, b, timeax=timeax, corrlength=corrlength, plot=plot, print=print, poster=poster, $
	 acorr=acorr, aerr=aerr, ccorr=ccorr, cerr=cerr, nsegment=nsegment,nodiv=nodiv

compile_opt defint32 ; 32 bit integers

; Set constants
dstep=1

; Set defaults
print=keyword_set(print)
poster=keyword_set(poster)
if not(keyword_set(corrlength)) then corrlength=0.001
if not(keyword_set(plot)) then plot=0
if plot GE 1 then cplot=1 else cplot=0 	; Plot crosscorrelations
if plot GE 2 then aplot=1 else aplot=0 ; Plot autocorrelations
if not(keyword_set(nsegment)) then nsegment=10

; Initialize graphics
pg_initgraph,print=print

if poster then begin
	!P.CHARSIZE=4.0
	!P.THICK=4.
	!P.FONT=0
	dstep=20 ; Farction of error bars to be drawn
endif


; Define bands
b=reform(b,2,n_elements(b)/2)
bsize=size(b)

; Generate strings for titles
str=strarr(bsize[2])
for i=0,bsize[2]-1 do str[i]=' '+pg_num2str(b[0,i])+' kHz - '+pg_num2str(b[1,i])+' kHz'

; Calculate x axis for correlation plotting
x=lindgen(n_elements(timeax))-ceil(n_elements(timeax)/2.)+1
x=x*(timeax[2]-timeax[1])
; Calculate plotted range from corrlength
if not(keyword_set(corrlength)) then corrlength=max(x)+1
ind=where((x ge -corrlength) and (x le corrlength))
indsize=n_elements(ind)

; Calculate segmentation
segment=n_elements(timeax)/nsegment

; Calculate x axis for segments
xs=lindgen(segment)-ceil(segment/2.)+1
xs=xs*(timeax[2]-timeax[1])
; Calculate plotted range from corrlength
inds=where((xs ge -corrlength) and (xs le corrlength))

; Calculate autocorrelations

acorr=dblarr(bsize[2],n_elements(timeax))
aerr=dblarr(bsize[2],segment)
for i=0,bsize[2]-1 do begin
	acorr[i,*]=pg_acorr(bp[i,*],/fast)
	aerr[i,*]=pg_acorrerremp2(bp[i,*],segment,fast=fast,nodiv=nodiv)

	if aplot then begin
		title='Autocorrelation of band power'+str[i]
		if print then device,filename=pg_filename(title) else window,/free
		title=title+' ('+nti_wavelet_i2str(nsegment)+' segments)'
		if poster then title='ACF '+nti_wavelet_i2str(b[0,i])+'-'+nti_wavelet_i2str(b[1,i])+' kHz'
		if poster then plot, x[ind], acorr[i,ind], title=title, xstyle=1, xtitle='Ido (s)', $
				yrange=[min(acorr[i,ind]-aerr[i,inds]),1] $
			else plot, x[ind], acorr[i,ind], title=title, xstyle=1, xtitle='Time (s)', $
				yrange=[min(acorr[i,ind]-aerr[i,inds]),1]
		if poster then oploterr, pg_downsample(x[ind],step=dstep), pg_downsample(acorr[i,ind],step=dstep), pg_downsample(aerr[i,inds],step=dstep) $
		else oploterr, x[ind], acorr[i,ind], aerr[i,inds]
	endif
endfor

; Calculate crosssorrelation

ccorr=dblarr(bsize[2],bsize[2],n_elements(timeax))
cerr=dblarr(bsize[2],bsize[2],segment)

for i=0,bsize[2]-2 do begin
	for j=i+1,bsize[2]-1 do begin
		ccorr[i,j,*]=pg_ccorr(bp[i,*],bp[j,*],/fast)
		cerr[i,j,*]=pg_ccorrerremp2(bp[i,*],bp[j,*],segment,nodiv=nodiv)

		if cplot then begin
			title='Crosscorrelation of band powers'+str[i]+' and'+str[j]
			if print then device,filename=pg_filename(title) else window,/free
			title=title+' ('+nti_wavelet_i2str(nsegment)+' segments)'
			if poster then title='CCF '+nti_wavelet_i2str(b[0,i])+'-'+nti_wavelet_i2str(b[1,i])+' kHz - '+nti_wavelet_i2str(b[0,j])+'-'+i2str(b[1,j])+' kHz'
			if poster then plot, x[ind], ccorr[i,j,ind], title=title, xstyle=1, xtitle='Ido (s)', $
					yrange=[min(ccorr[i,j,ind]-cerr[i,j,inds]),max(ccorr[i,j,ind]+cerr[i,j,inds])] $
				else plot, x[ind], ccorr[i,j,ind], title=title, xstyle=1, xtitle='Time (s)', $
					yrange=[min(ccorr[i,j,ind]-cerr[i,j,inds]),max(ccorr[i,j,ind]+cerr[i,j,inds])]
			if poster then oploterr, pg_downsample(x[ind],step=dstep), pg_downsample(ccorr[i,j,ind],step=dstep), pg_downsample(cerr[i,j,inds],step=dstep) $
				else oploterr, x[ind], ccorr[i,j,ind], cerr[i,j,inds]
		endif
	endfor
endfor

; Reshape ccorr, cerr
temp1=ccorr
temp2=cerr
ccorr=dblarr(((bsize[2]^2-bsize[2])/2)>1,n_elements(timeax))
cerr=dblarr(((bsize[2]^2-bsize[2])/2)>1,segment)
index=0
for i=0,bsize[2]-2 do begin
	for j=i+1,bsize[2]-1 do begin
		ccorr[index,*]=temp1[i,j,*]
		cerr[index,*]=temp2[i,j,*]
		index=index+1
	endfor
endfor

acorr=acorr
aerr=aerr
ccorr=ccorr
cerr=cerr
nsegment=nsegment

if print then device,/close

if poster then begin
	!P.CHARSIZE=1.0
	!P.THICK=1.
	!P.FONT=-1
endif


end
