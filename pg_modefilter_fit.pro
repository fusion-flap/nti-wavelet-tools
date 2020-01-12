;+
; Name: pg_modefilter_fit
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2007.03.21.-2007.04.11.
;
; Purpose: Filter modenumbers from pre-calculated cross-phases by linear regression
;				(Can be used for a set of probes limited to a segment of the cross section)
;
; Calling sequence:
;	modenum=pg_modefilter_fit(cphases, chpos [,problim] [,chisqlim])
;
; Inputs:
;		cphases: relative cross-phases
;		chpos: channel positions in degrees
;		problim (optional): Limit of acceptance of the probability of a good fit; default: None
;		chisqlim (optional): Limit of acceptance of the probability of a good fit; default: None
;
; Output:
;		modenum: modenumber, or 1000 for not defined modenumber
;
;-


function pg_modefilter_fit, cphases, chpos, problim=problim, chisqlim=chisqlim

compile_opt defint32 ; 32 bit integers

; Set defaults
channelssize=n_elements(chpos)
crosssize=channelssize*(channelssize-1)/2
if crosssize NE n_elements(cphases) then begin
	print,'Wrong input data dimensions!'
	exit
endif
if keyword_set(problim) AND keyword_set(chisqlim) then begin
	print,'Only one criterium of acceptance can be given!'
	exit
endif
modenum=1000

; Create array for phase diagrams with different reference channels
phases0=fltarr(channelssize,channelssize)
; Fill array from input
for i=0,channelssize-1 do begin
	for j=i+1,channelssize-1 do begin
		phases0(i,j)=cphases(i*(channelssize-(i+1)/2.)-(i+1)+j)
		phases0(j,i)=-cphases(i*(channelssize-(i+1)/2.)-(i+1)+j)
	endfor
endfor
; Translate phase diagrams to start from (0,0)
for i=1,channelssize-1 do begin
	phases0(i,*)=phases0(i,*)+cphases(0*(channelssize-(0+1)/2.)-(0+1)+i)
endfor
chpos=chpos-chpos(0)

; Create matrixes for fitting
fit=fltarr(2,2)
sigma=fltarr(2,2)
chisq=fltarr(2)
prob=fltarr(2)
yfit=fltarr(2,channelssize)

; Test for positive modenumbers
phases=phases0
; Monotonize phase diagrams
for i=0,channelssize-1 do begin
	for j=1,channelssize-1 do begin
		if phases(i,j-1) GT phases(i,j) then phases(i,j:channelssize-1)=phases(i,j:channelssize-1)+2*!PI
	endfor
endfor
; Linear fit
meanphases=fltarr(channelssize)
stddevphases=fltarr(channelssize)
for i=0,channelssize-1 do begin
	meanphases(i)=mean(phases(*,i))
	stddevphases(i)=max([1.e-8,stddev(phases(*,i))]) ; Lower limit of standard deviation
endfor
stddevphases(0)=1.e-15 ; Force a=0
fit(0,*)=linfit(chpos/360.*2*!PI,meanphases,measure_errors=stddevphases,sigma=sigma0,chisq=chisq0,$
	yfit=yfit0,prob=prob0)
sigma(0,*)=sigma0
chisq(0)=chisq0
yfit(0,*)=yfit0
prob(0)=prob0

; Test for negative modenumbers
phases=phases0
; Monotonize phase diagrams
for i=0,channelssize-1 do begin
	for j=1,channelssize-1 do begin
		if phases(i,j-1) LT phases(i,j) then phases(i,j:channelssize-1)=phases(i,j:channelssize-1)-2*!PI
	endfor
endfor
; Linear fit
meanphases=fltarr(channelssize)
stddevphases=fltarr(channelssize)
for i=0,channelssize-1 do begin
	meanphases(i)=mean(phases(*,i))
	stddevphases(i)=max([1.e-8,stddev(phases(*,i))]) ; Lower limit of standard deviation
endfor
stddevphases(0)=1.e-15 ; Force a=0
fit(1,*)=linfit(chpos/360.*2*!PI,meanphases,measure_errors=stddevphases,sigma=sigma1,chisq=chisq1,$
	yfit=yfit1,prob=prob1)
sigma(1,*)=sigma1
chisq(1)=chisq1
yfit(1,*)=yfit1
prob(1)=prob1

; Compare the two fits
if fit(0,1) EQ -fit(1,1) then begin
	modenum=1000
endif else begin
	;if chisq(0) LT chisq(1) then good=0 else good=1
	;if chisq(0)*sigma(0,1)^2 LT chisq(1)*sigma(1,1)^2 then good=0 else good=1 ;Qmin
	if abs(fit(0,1)) LT abs(fit(1,1)) then good=0 else good=1 ;modenumber
	;if prob(0) LT prob(1) then good=0 else good=1
	if keyword_set(chisqlim) then if chisq(good)/float(channelssize-1) LT chisqlim then modenum=fit(good,1)
	if keyword_set(problim) then if prob(good) GT problim then modenum=fit(good,1)
	if NOT(keyword_set(chisqlim) OR keyword_set(problim)) then modenum=fit(good,1)
endelse

return,modenum

end