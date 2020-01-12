;+
; Name: pg_acorr
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2003.04.07.
;
; Purpose: Calculate autocorrelation
;
; Calling sequence:
;	acorr=pg_acorr(data [,/fast] [,/dc] [,/nonorm])
;
; Input:
;	data: 1D data vector
;	/fast (optional): Calculate with fast circular convolution
;	/dc (optional): Without mean subtraction
;	/nonorm (optional): Does not norm
;
; Output:
;	acorr: Autocorrelation vector (centered, same length as data)
;
; Modifications:
;	Gergo Pokol 2003.12.16. : Zero padding added to fast convolution
; Gergely Papp 2008.12.16.: Calculating autocorrelation with pg_ccorr
;-

function pg_acorr, data, fast=fast, dc=dc, nonorm=nonorm, normalize=normalize

acorr=pg_ccorr(data,data,fast=fast,dc=dc,nonorm=nonorm, normalize=normalize)

; Set defaults
;fast=keyword_set(fast)
;dc=keyword_set(dc)
;nonorm=keyword_set(nonorm)
;normalize=keyword_set(normalize)
;datasize=n_elements(data)
;
;; Mean subtraction
;if dc NE 1 then data=data-mean(data)
;
;if fast then begin
;	zeropad=fltarr(datasize)
;	data=reform(data)
;	datafft=FFT([data,zeropad],-1) ;FFT
;	acorr=FFT(datafft*conj(datafft),1) ;IFFT
;	acorr=float(acorr) ;Imaginary part is computation noise
;	if NOT nonorm then acorr=acorr/acorr(0) ;Norm
;;	acorr=shift(acorr,floor(n_elements(acorr)/2d)) ;Shift to center
;	acorr=shift(acorr,datasize) ;Shift to center
;	acorr=acorr[floor(datasize/2.)+1:datasize+floor(datasize/2.)] ;Cut to original length
;endif else begin
;	acorr=dblarr(datasize)
;	for i=0L,floor(datasize/2d) do begin
;		for j=0L,datasize-i-1 do acorr[i+ceil(datasize/2d)-1]=acorr[i+ceil(datasize/2d)-1]+data[j]*data[j+i]
;		acorr[i+ceil(datasize/2d)-1]=acorr[i+ceil(datasize/2d)-1]/(datasize-i)
;	endfor
;	for i=1L,ceil(datasize/2d)-1 do begin
;		for j=0L,datasize-i-1 do acorr[-i+ceil(datasize/2d)-1]=acorr[-i+ceil(datasize/2d)-1]+data[j+i]*data[j]
;		acorr[-i+ceil(datasize/2d)-1]=acorr[-i+ceil(datasize/2d)-1]/(datasize-i)
;	endfor
;	if NOT nonorm then acorr=acorr/acorr(ceil(datasize/2d)-1) ;Norm
;endelse

return, acorr

end
