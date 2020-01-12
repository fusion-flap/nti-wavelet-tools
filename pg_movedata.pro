;+
; Name: pg_movedata
;
; Written by: Gergo Pokol (lokop@uze.net) 2002.07.18. - 2002.07.19.
;
; Purpose: move data to desired location
;
; Calling sequence:
;	pg_movedata, filename, location
;
; Input:
;	filename: filename(s) to move
;	location: location to move to
;
; Output: -
;-

pro pg_movedata, filename, location

if location eq 1 then location = 'data@deep.reak.bme.hu:asdex/raw_data/'

spawn,'scp -B '+filename+' '+location
spawn,'rm '+filename

end
