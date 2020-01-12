pro get_rawdata,shot=shot,chy,tchop,exp=exp,diag=diag,name=name,$
                data_number=data_number,leng=leng,date=date,physdim=physdim,$
                double_timeaxis=double_timeaxis

; shot   shotnumber requested
; chy    signal returned
; tchop  timebase data returned

if not keyword_set(shot) then begin
    print,'No shot number defined'
    return
endif
shot=long(shot)

lib = '/usr/ads/lib64/libddww.so' ; library
if not keyword_set(diag) then diag = 'PEL'    ; diagnostic name
if not keyword_set(exp) then exp = 'AUGD'     ; experiment name
if not keyword_set(name) then name='3Co-1'    ; name of the signal
if not keyword_set(data_number) then data_number=50000.
data_number=long(data_number)


date = '                  '   ; preset time string
error=0L                      ; error variable dummy initialized
leng=0L                       ; length of timebase returned
k1=1L                         ; index mark for start of data sequence
k2=data_number                ; index mark for end of data sequence
chy=fltarr(data_number)       ; signal 
tchop=chy
lbuf=data_number              ; element size of buffer prepared 
ncal=0L                       ; calibration steps
physdim='            '        ; preset physical dimension string
type=2L                       ; type of data requested, 2L = real
ctrl=0L                       ; error handling
ed=0L                         ; edition of data
diaref=0L                     ; reference number for diagnostic
ntval = lbuf                  ; new name for buffer size

; Open Shotfile
s = CALL_EXTERNAL (lib,'ddgetaug','ddopen', error, exp, diag, shot, ed, diaref, $
                   date)
if s gt 0 then begin
        s_err = error
        s = CALL_EXTERNAL(lib,'ddgetaug','xxerror',s_err,ctrl,' ')
        s = CALL_EXTERNAL(lib,'ddgetaug','xxsev'  ,s_err,ctrl,' ')
 print,''
 print,diag+':  '+name+',  '+'Error 1:',s
endif
 
; zeitbasis
s = CALL_EXTERNAL (lib,'ddgetaug','ddtbase', error, diaref, name, k1, k2, 2L, $
                   ntval, tchop, leng)
if s gt 0 then begin
        s_err = error
        s = CALL_EXTERNAL(lib,'ddgetaug','xxerror',s_err,ctrl,' ')
        s = CALL_EXTERNAL(lib,'ddgetaug','xxsev'  ,s_err,ctrl,' ')
 print,''
 print, diag+':  '+name+',  '+'Error 2:',s
endif
if keyword_set(double_timeaxis) then tchop=double(tchop)



 
s=CALL_EXTERNAL(lib,'ddgetaug','ddcsgnl', error, diaref, name, k1, k2, type, $
                lbuf, chy, leng, ncal, physdim)
if s gt 0 then begin
        s_err = error
        s = CALL_EXTERNAL(lib,'ddgetaug','xxerror',s_err,ctrl,' ')
        s = CALL_EXTERNAL(lib,'ddgetaug','xxsev'  ,s_err,ctrl,' ')
 print,''
 print,diag+':  '+name+',  '+'Error 3:',s
endif
 
; close shotfile
s = CALL_EXTERNAL (lib,'ddgetaug','ddclose', error, diaref)


if (leng gt 0.) then chy=chy(0:leng-1)
if (leng gt 0.) then tchop=tchop(0:leng-1)

;print,exp,diag,name,data_number,leng
;print,chy(leng-1)

;stop
end
