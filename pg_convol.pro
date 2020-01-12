;+
; Name: pg_convol
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2003.04.17.
;
; Purpose: Fast circular convolution of 2 vectors of equal length
;
; Calling sequence:
;	convol=pg_convol(x,y)
;
; Input:
;	x: 1D vector (signal)
;	y: 1D vector (filter)
;
; Output:
;	convol: fast circular convolution of x and y
;
; Modified:
;	Gergo Pokol (2007.05.16): Conjugate corrected
;-


function pg_convol, x, y

zeropad=fltarr(n_elements(x))
x=reform(x)
xfft=FFT([x,zeropad],-1) ;FFT
y=reform(y)
yfft=FFT([y,zeropad],-1) ;FFT
convol=FFT(xfft*yfft,1) ;IFFT
convol=float(convol) ;Imaginary part is computation noise

convol=shift(convol,n_elements(x)) ;Shift to center
convol=convol[floor(n_elements(x)/2d):n_elements(x)+floor(n_elements(x)/2d)-1] ;Cut to original length

return,convol

end
