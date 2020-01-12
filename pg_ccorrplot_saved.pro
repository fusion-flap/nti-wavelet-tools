;+
; Name: pg_ccorrplot_saved
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2003.12.10.
;
; Purpose: Read band powers from file and plot crosscorrelations between the band power of channels of a single shot averaged for an experiment
;
; Calling sequence:
;	pg_ccorrplot_saved, filename [,corrlength] [,plot] [,/print] [,/interp] [,ct]
;
; Input:
;	filename: Name of data file
;	corrlength (optional): Maximum correlation length (s); default whole time intervall
;	plot (optional): Display mode (available: 0: Plot average maximum crosscorrelations
;						  1: 0+maximum crosscorrelations
;						  2: 1+crosscorrelations
;						  ; default: 0
;	ct (optional): Color table index (Built-in color tables)
;	/print (optional): Produce ps files
;	/interp (optonal): Interpolate, when drawing
;
; Output: -
;-

pro pg_ccorrplot_saved, filename, corrlength=corrlength, plot=plot, print=print, interp=interp, ct=ct

compile_opt defint32 ; 32 bit integers

; Set defaults, constants
print=keyword_set(print)
if not(keyword_set(plot)) then plot=0
if plot GE 0 then ccorravrplot=1 else ccorravrplot=0 	; Plot average maximum crosscorrelations
if plot GE 1 then ccorrmaxplot=1 else ccorrmaxplot=0 	; Plot maximum crosscorrelations
if plot GE 2 then ccorrplot=1 else ccorrplot=0 		; Plot crosscorrelations

; Initialize graphics
pg_initgraph,print=print

; Load data
restore,dir_f_name('data',filename)

; Generate strings for titles
bstr=' {'+pg_num2str(bk[0])+' kHz - '+pg_num2str(bk[1])+' kHz}'

; Initialize cross correlation arrays
expsize=exp[1]-exp[0]+1
ccorrmax=fltarr(expsize,16,16)
ccorravr=fltarr(16,16)

; Calculate x axis for correlation plotting
x=lindgen(n_elements(timeax))-ceil(n_elements(timeax)/2.)+1
x=x*(timeax[2]-timeax[1])

; Calculate plotted range from corrlength
if not(keyword_set(corrlength)) then corrlength=max(x)+1
ind=where((x ge -corrlength) and (x le corrlength))

; Calculate segmentation
;segment=floor(corrlength*2/(timeax[2]-timeax[1])) ; Length of segments
segment=n_elements(ind) ; Length of segments
nsegment=floor(n_elements(timeax)/segment) ; Number of segments

;Calculate crosscorrelations
for i=exp[0],exp[1] do begin
	shot=i
	ccorr=fltarr(16,16,n_elements(timeax))
	for j=1,16 do begin

	; Progress indicator
	print,'Calculating correlations for shot '+nti_wavelet_i2str(shot)+' with respect to channel '+nti_wavelet_i2str(j)

	; Set multiplot for correlation plotting
	if ccorrplot then begin
		!P.MULTI=[0,2,8,0,1]
		!P.CHARSIZE=1.4
		title='CCFs '+nti_wavelet_i2str(shot)+bstr
		if print then device,filename=pg_filename(title) else window,/free
	endif

		for k=1,16 do begin
			;ccorr[i-exp[0],j-1,k-1,*]=pg_ccorr(bp[i-exp[0],j-1,*],bp[i-exp[0],k-1,*],/fast)
			ccorr[j-1,k-1,*]=pg_ccorr(bp[i-exp[0],j-1,*],bp[i-exp[0],k-1,*],/fast)
			ccorrmax[i-exp[0],j-1,k-1]=max(ccorr[j-1,k-1,*])

			; Plot crosscorrelations
			if ccorrplot then begin
				cerr=pg_ccorrerremp(bp[i-exp[0],j-1,*],bp[i-exp[0],k-1,*],segment,/fast)
				title='CCF '+nti_wavelet_i2str(shot)+' channels: '+nti_wavelet_i2str(j)+'-'+nti_wavelet_i2str(k)+bstr
				title=title+' (error estimation based on '+nti_wavelet_i2str(nsegment)+' segments)'
				plot, x[ind], ccorr[j-1,k-1,ind], title=title, xstyle=1, xtitle='Time (s)', $
					yrange=[min(ccorr[j-1,k-1,ind]-cerr),max(ccorr[j-1,k-1,ind]+cerr)]
				oploterr, x[ind], ccorr[j-1,k-1,ind], cerr
			endif
		end

	; Reset original multiplot after correlation plotting
	if ccorrplot then begin
		!P.MULTI=0
		!P.CHARSIZE=1.
	endif

	end

	; Plot maximum crosscorrelations
	if ccorrmaxplot then begin
		title='Maximum crosscorrelations for shot '+nti_wavelet_i2str(shot)
		data='shot: '+nti_wavelet_i2str(shot)+$
			'!Ctrange:!C '+pg_num2str(timeax[0],length=4)+' s - '+$
				pg_num2str(timeax[n_elements(timeax)-1],length=4)+' s'+$
			'!Cwin.: '+windowname+$
			'!Cwinsize: '+nti_wavelet_i2str(windowsize)+$
			'!Cmasksize: '+nti_wavelet_i2str(masksize)+$
			'!Cfreqres: '+nti_wavelet_i2str(freqres)+$
			'!Cstep: '+nti_wavelet_i2str(step)+$
			'!Cband:!C '+bstr
		if print then device,filename=pg_filename(title) else window,/free

		pg_plot3,reform(ccorrmax[i-exp[0],*,*]),ct=ct,xrange=[0.5,16.5],yrange=[0.5,16.5],zrange=[0,1],$
			xtitle='Channel',ytitle='Channel',title=title, interp=interp,data=data
;		; Load color table
;		loadct,5
;
;		; Set system variables
;		!x.range=[0.5,16.5]
;		!x.ticklen=-0.01
;		!x.title='Channel'
;		!x.margin=[10,3]
;		!y.range=[0.5,16.5]
;		!y.ticklen=-0.01
;		!y.title='Channel'
;		!y.margin=[5,3]
;		!p.title=title
;
;		; Plot axes
;		plot,axis,axis,/nodata,xstyle=1,ystyle=1
;
;		; Plot matrix as bitmap
;		nti_wavelet_otv,ccorrmax[i-exp[0],*,*]*255,interp=interp
;
;		; Set default system variables
;		!x.range=[0,0]
;		!x.ticklen=0
;		!x.title=''
;		!x.margin=[10,3]
;		!y.range=[0,0]
;		!y.ticklen=0
;		!y.title=''
;		!y.margin=[4,2]
;		!p.title=''

	endif
end

; Calculate average maximum crosscorrelations
for i=0,15 do begin
	for j=0,15 do begin
		ccorravr[i,j]=mean(ccorrmax[*,i,j])
	endfor
endfor

; Plot average maximum crosscorrelations
if ccorravrplot then begin
	title='Average maximum crosscorrelations for experiment '+nti_wavelet_i2str(exp[0])+'-'+nti_wavelet_i2str(exp[1])
	data='exp:!C '+nti_wavelet_i2str(exp[0])+' - '+nti_wavelet_i2str(exp[1])+$
		'!Ctrange:!C '+pg_num2str(timeax[0],length=4)+' s - '+$
			pg_num2str(timeax[n_elements(timeax)-1],length=4)+' s'+$
		'!Cwin.: '+windowname+$
		'!Cwinsize: '+nti_wavelet_i2str(windowsize)+$
		'!Cmasksize: '+nti_wavelet_i2str(masksize)+$
		'!Cfreqres: '+nti_wavelet_i2str(freqres)+$
		'!Cstep: '+nti_wavelet_i2str(step)+$
		'!Cband:!C '+bstr
	if print then device,filename=pg_filename(title) else window,/free
	pg_plot3,ccorravr,ct=ct,xrange=[0.5,16.5],yrange=[0.5,16.5],zrange=[0,1],$
		xtitle='Channel',ytitle='Channel',title=title, interp=interp, data=data
endif

if print then device,/close

; Progress indicator
print,'Ready'

end
