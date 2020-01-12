pro nti_crosstransform_corrigation

; simpliest version

unit = complex(0,1)

restore, 'test.sav'
restore, 'rel_transfer.sav'

transf_timeax = *saved_datablock.transf_timeax
transf_freqax = *saved_datablock.transf_freqax
crosstransforms = *saved_datablock.crosstransforms
channelpairs = *saved_datablock.channelpairs

corr = rel_transfer

n_freqax = n_elements(freqax)
n_channels = n_elements(crosstransforms(*,0,0))
n_transf_freqax = n_elements(crosstransforms(0,0,*))
n_time = n_elements(crosstransforms(0,*,0))

correction = complexarr(n_channels,n_freqax)
itp_corr = complexarr(n_channels,n_transf_freqax)

print,'freq:',' ', n_freqax,'channel:',' ',n_channels,'freq_transf',' ',n_transf_freqax,'timeax_transf',' ',n_time

;interpolate corrections for the proper frequency axis
; for which channelpair?

for i=long(0), n_channels-1 do begin
  temp = atan(corr(i,*), /phase)
  correction(i,*) = atan(rel_transfer(i,*), /phase)
  itp_corr(i,*) = interpol(correction(i,*),freqax,transf_freqax)
  itp_corr(i,*) = exp(unit*itp_corr(i,*))
endfor

for i=long(0), n_channels-1 do begin ;szondák
  for j=long(0), n_time-1 do begin ; időpontok
    crosstransforms(i,j,*) = crosstransforms(i,j,*)*itp_corr(i,*)
  endfor
endfor

(*saved_datablock.crosstransforms) = crosstransforms

save, saved_datablock, Filename='corrigated.sav'

end
