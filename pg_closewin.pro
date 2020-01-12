;+
; Name: pg_closewin
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2003.04.28.
;
; Purpose: Close all plot windows
;
; Calling sequence:
;	pg_closewin
;
; Input: -
;
; Output: -
;-

pro pg_closewin

pg_initgraph

while !D.WINDOW NE -1 do wdelete

end
