function dir_f_name,dir,fname
; ********************** dir_f_name.pro **************** 06.10.2000 ******
; Assemble a system dependent full file name from a directory and a file 
; name.                 S. Zoletnik
; ************************************************************************

; For windows
 if (strupcase(!version.os) eq 'WIN32') then begin
	   f=dir+'\'+fname
	endif 

; For VMS
 if (strupcase(!version.os) eq 'VMS') then begin
	   f='[.'+dir+']'+fname
	endif

 ; This is the Unix stuff
 if (not nti_wavelet_defined(f)) then begin
    if (strmid(dir,strlen(dir)-1,1) eq '/') then begin
      f = dir+fname
    endif else begin  
      f=dir+'/'+fname
    endelse
 endif
 return,f
end			



