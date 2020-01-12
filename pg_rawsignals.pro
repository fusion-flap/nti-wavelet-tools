;+
; Name: pg_rawsignals
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2003.04.28.
;
; Purpose: Plot rawsignals
;
; Calling sequence:
;	pg_rawsignals, shots [,channels] [,/print] [,/multi]
;
; Input:
;	shot: Intevall of shot numbers
;	channels (optional): Channels to be plotted
;	/print (optional): Print to file instead of plotting
;	/multi (optional): Plot all channels on a single multiplot
;
; Output: -
;-

pro pg_rawsignals,shots,channels=channels,print=print,multi=multi

; Set defaults
print=keyword_set(print)
multi=keyword_set(multi)
if NOT keyword_set(channels) then channels=indgen(16)+1

; Initialize graphics
pg_initgraph,print=print

if multi then begin
	!P.MULTI=[0,2,ceil(n_elements(channels)/2.),0,1]
	!P.CHARSIZE=1.4
endif

for i=shots[0],shots[1] do begin
	title0='Raw signal '+nti_wavelet_i2str(i)
	if multi then begin
		if print then device,filename=pg_filename(title0) else window,/free
	endif
	for j=0,n_elements(channels)-1 do begin
		channel='W7-AS Mirnov/Mir-1-'+nti_wavelet_i2str(channels[j])

		; Progress indicator
		print,nti_wavelet_i2str(i)+' '+channel
		
		get_rawsignal,i,channel,t,d

		; Plot
		title=title0+' '+channel
		if NOT multi then begin
			if print then device,filename=pg_filename(title) else window,/free
		endif
		plot, t, d, title=title, xstyle=1, xtitle='Time (s)'
		
	endfor
endfor

!P.MULTI=0
!P.CHARSIZE=1.

if print then device,/close

end
