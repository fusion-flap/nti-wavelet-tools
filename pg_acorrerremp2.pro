;+
; NAME: pg_acorrerremp2
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2003.05.22.
;
; Purpose: Estimate the error of the ACF by calculating the standard deviation of ACFs of seperate segments
;
; Calling sequence:
;	err=pg_acorrerremp2(data, segment [,/plot] [,/fast] [,/nodiv] [,mean=mean])
;
; Input:
;	data: 1D data vector
;	segment: Length of segments for empirical variation calulation
;	/plot (optional): Plot ACFs for each segment
;	/fast (optional): Obsolete option: always calculates correlations with fast circular convolution
;	/nodiv (optional): Do not divide by sqrt(n)
;
; Output:
;	err: Standard deviation vector of ACFs of the segments
;	mean (optional): Mean of ACFs of the segments
;-

function pg_acorrerremp2, data, segment, plot=plot, fast=fast, nodiv=nodiv, mean=mean

; Set defaults
plot=keyword_set(plot)
fast=keyword_set(fast)
nodiv=keyword_set(nodiv)

; ACF of the segments
ndata=n_elements(data)
n=floor(double(ndata)/segment)
acf=dblarr(n,segment)
if plot then window,/free
for i=0l,n-1 do begin
	acf[i,*]=pg_acorr(data[i*segment:(i+1)*segment-1],dc=dc,/fast)
	if plot then begin
		title='ACF of segment ['+nti_wavelet_i2str(i*segment)+':'+nti_wavelet_i2str((i+1)*segment)+']'
		plot,acf[i,*],xstyle=1,title=title
	endif
endfor

; Mean of ACFs
mean=dblarr(segment)
for i=0l,segment-1 do mean[i]=mean(acf[*,i])

; Standard deviation of ACFs
err=dblarr(segment)
if n GT 1 then for i=0l,segment-1 do err[i]=stddev(acf[*,i])

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
