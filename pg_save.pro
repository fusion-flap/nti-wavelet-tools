;+
; NAME: pg_save
;
; Written by: Gergo Pokol (lokop@uze.net) 2002.07.18. - 2002.07.19.
;
; PURPOSE: Save displayed image into an image file
;
; CALLING SEQUENCE:
;	pg_save
;
; INPUT: -
;
; OUTPUT: -
;
;-

pro pg_save

device, retain=2
scr_image=tvrd(/true) ; Get screen
; Result=DIALOG_WRITE_IMAGE(scr_image, path='~/data',/WARN_EXIST)
Result=DIALOG_WRITE_IMAGE(scr_image,/WARN_EXIST, path='save_data', type='png')

end
