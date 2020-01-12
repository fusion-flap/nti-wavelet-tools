;+
; Name: pg_dat2sav
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2005.04.19.
;
; Purpose: Convert .dat files of pg_bps.pro to .sav files read by get_rawsignal.pro
;
; Calling sequence:
;	pg_dat2sav,filenames
;
; Input: -
;
; Output: -
;-

pro pg_dat2sav, fname

restore,'data/'+fname

; Initialize arrays
restore, 'data/'+filenames[0]
bands_size=n_elements(filenames)
bp_size=size(bp)
bks=dblarr(bands_size,2)
bps=dblarr(bands_size,bp_size[1],bp_size[2],bp_size[3])


; Read
for i=0,bands_size-1 do begin
	restore, 'data/'+filenames[i]
	bks[i,*]=bk
	bps[i,*,*,*]=bp
endfor

; Write
sampletime=(timeax[bp_size[3]-1]-timeax[0])/double((bp_size[3]-1))
starttime=timeax[0]
for i=exp[0],exp[1] do begin
	for j=0,bands_size-1 do begin
		for k=0,bp_size[2]-1 do begin
			data=reform(bps[j,i-exp[0],k,*])
			fn='data/'+nti_wavelet_i2str(i)+'MIR1-'+nti_wavelet_i2str(k+1)+'_band_'+nti_wavelet_i2str(fix(bks[j,0]))+'-'+nti_wavelet_i2str(fix(bks[j,1]))+'.sav'
			print,'Saving: '+fn
			save,data,sampletime,starttime,filename=fn
		endfor
	endfor
endfor

end
