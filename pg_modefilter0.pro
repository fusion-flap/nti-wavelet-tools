;+
; Name: pg_modefilter0
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2007.02.26.
;
; Purpose: Filter 0 modenumber modes from pre-calculated cross-phases
;
; Calling sequence:
;	modenum=pg_modefilter0(cphases,chpos)
;
; Inputs:
;		cphases: relative cross-phases
;		chpos: channel positions in degrees
;
; Output:
;		modenum: 0 for 0 modenumber, 1000 for not 0 modenumber
;
;-

function pg_modefilter0, cphases, chpos

compile_opt defint32 ; 32 bit integers

; Set defaults
zeromax=!Pi*0.5 ; maximum deviation from 0 phase difference allowed for 0 modenumber

if max(abs(cphases)) LT zeromax then modenum=0 else modenum=1000

return,modenum

end