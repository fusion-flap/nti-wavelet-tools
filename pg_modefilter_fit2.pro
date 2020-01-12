;+
; Name: pg_modefilter_fit
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2007.04.03.
;
; Purpose: Filter modenumbers from pre-calculated cross-phases by linear regression
;				(Can be used for a set of probes limited to a segment of the cross section)
;
; Calling sequence:
;	modenum=pg_modefilter_monoton(cphases, chpos [,problim])
;
; Inputs:
;		cphases: relative cross-phases
;		chpos: channel positions in degrees
;		problim (optional): Limit of acceptance of the probability of a good fit; default:0.5
;
; Output:
;		modenum: modenumber, or 1000 for not defined modenumber
;
;-

function pg_modefilter_fit, cphases, chpos, problim=problim

compile_opt defint32 ; 32 bit integers

; Set defaults
if not(keyword_set(problim)) then problim=0.002e-10
channelssize=n_elements(chpos)
crosssize=channelssize*(channelssize-1)/2
if crosssize NE n_elements(cphases) then begin
	print,'Wrong input data dimensions!'
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

; Test for positive modenumbers
phases=phases0
; Monotonize phase diagrams
for i=0,channelssize-1 do begin
	for j=1,channelssize-2 do begin
		if phases(i,j-1) GT phases(i,j) then phases(i,j:channelssize-1)=phases(i,j:channelssize-1)+2*!PI
	endfor
endfor
; Linear fit
g2=total
if prob GT problim then modenum=fit(1)

; Test for negative modenumbers
phases=phases0
; Monotonize phase diagrams
for i=0,channelssize-1 do begin
	for j=1,channelssize-2 do begin
		if phases(i,j-1) LT phases(i,j) then phases(i,j:channelssize-1)=phases(i,j:channelssize-1)-2*!PI
	endfor
endfor
; Linear fit
if prob GT problim then begin
	if (modenum EQ 1000) OR (modenum EQ fit(1)) then begin
		modenum=fit(1)
	endif else begin
		modenum=1000
		print,'Too loose limit for the probability of the linear fit! prob='+pg_num2str(prob)
	endelse
endif

return,modenum

end