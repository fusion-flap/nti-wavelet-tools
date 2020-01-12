;+
; Name: pg_ccorrerremp2
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2003.05.22.
; Rewritten by: Gergo Pokol (pokol@reak.bme.hu) 2004.10.06.
;
; Purpose: Estimate the error of the CCF by calculating the standard deviation of CCFs of seperate segments
;
; Calling sequence:
;	err=pg_ccorrerremp2(data1, data2, segment [,/plot] [,/fast] [,/nodiv] [,mean=mean])
;
; Input:
;	data1: 1D data vector
;	data2: 1D data vector of the same length
;	segment (optional): Length of segments for empirical variation calulation
;	/plot (optional): Plot ACFs for each segment
;	/fast (optional): Obsolete option: always calculates correlations with fast circular convolution
;	/nodiv (optional): Do not divide by sqrt(n)
;
; Output:
;	err: Standard deviation vector of ACFs of the segments
;	mean (optional): Mean of ACFs of the segments
;-


function pg_ccorrerremp2, data1, data2, segment, plot=plot, fast=fast, nodiv=nodiv, mean=mean

; Set defaults
plot=keyword_set(plot)
fast=keyword_set(fast)
nodiv=keyword_set(nodiv)

; CCF of the segments
ndata=n_elements(data1)
n=floor(double(ndata)/segment)
ccf=dblarr(n,segment)
if plot then window,/free
for i=0l,n-1 do begin
	ccf[i,*]=pg_ccorr(data1[i*segment:(i+1)*segment-1],data2[i*segment:(i+1)*segment-1],/fast)
	if plot then begin
		title='CCF of segment ['+nti_wavelet_i2str(i*segment)+':'+nti_wavelet_i2str((i+1)*segment)+']'
		plot,ccf[i,*],xstyle=1,title=title
	endif
endfor

; Mean of ACFs
mean=dblarr(segment)
for i=0l,segment-1 do mean[i]=mean(ccf[*,i])

; Standard deviation of ACFs
err=dblarr(segment)
if n GT 1 then for i=0l,segment-1 do err[i]=stddev(ccf[*,i])

; Divide by sqrt(n)
if (NOT(nodiv)) then err=err/sqrt(n)

; Plot result
if plot then begin
	title='Mean of ACFs with standard deviations'
	plot,mean,xstyle=1,title=title
	oploterr,mean,err
endif

return, err

end
