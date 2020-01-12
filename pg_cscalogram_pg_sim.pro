;+
; Name: pg_cscalogram_pg_sim
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2007.01.25.
;
; Purpose: Plot the Scalograms, Phase of the Cross Wavelet Spectrum and Coherence
;		calculated with scaled smoothing of two 1D data vectors
;
; Calling sequence:
;	ccwt=pg_cscalogram_pg_sim(data1, data2, timeax [,shot] [,channel] [,trange] [,family] [,order] [,dscale] [,start_scale] [,nscale]  $
;		[,plot] [,avr] [,phaselevel] [,/print] [,/pad] [,/log] [,opt] [,/double] [,freqax])
;
; Inputs:
;	data1: signal 1
;	data2: signal 2
;	timeax: time axis
;	shot (optional): shot numbers
;	channel (optional): channel numbers
;	trange (optional): timerange to view, 2 element vector; default: whole range
;	family (optional): wavelet family to use (available: 'Morlet'); default: 'Morlet'
;	order (optional): order of the wavelet; default: default of the family
;	dscale (optional): fraction of diadic scaling; default:0.25
;	start_scale (optional): starting scale (has no effect on CWT using Morlet wavelets; default:2
;	nscale (optional): total number of scale values; default:log2(N/start_scale)/dscale+1
;	plot (optional): display mode (available:
;										 0:All,
;										 1:Scale scale,
;										 3:Freq. scale (for Morlet wavelets only), other:None; default: 0
;	avr (optional): number of independent averages (0 switches averaging off); default: 0
;	opt (optional): exponent for opimized scale visualization
;	phaselevel (optional): plot phase above a critical cross spectrum level (in %); default: 1
;	/print (optional): Print to file instead of plotting
;	/pad (optional): use zero padding instead of cutting the data vector to 2^x length
;	/log (optional): visualize on log scale (except for Phase)
;	/double (optional): double precision
;
; Output:
;	CCWT: Cross-CWT of signal
;	freqax (optional): Frequency scale
;
;-


function pg_cscalogram_pg_sim, data1, data2, timeax, shot=shot, channel=channel, trange=trange, family=family, order=order, dscale=dscale,$
	start_scale=start_scale, nscale=nscale, plot=plot, avr=avr, print=print, pad=pad, log=log, opt=opt, $
	phaselevel=phaselevel, double=double, freqax=freqax

compile_opt defint32 ; 32 bit integers


; Set defaults
print=keyword_set(print)
log=keyword_set(log)
if not(keyword_set(shot)) then shot=[0,0]
if not(keyword_set(channel)) then channel=['SIMULATED','SIMULATED']
if not(keyword_set(order)) then order=6
if not(keyword_set(family)) then family='Morlet'
if not(keyword_set(plot)) then plot=0
if not(keyword_set(opt)) then opt=1
if not(keyword_set(avr)) then avr=0
if not(keyword_set(phaselevel)) then phaselevel=1

; Calculate CWT-s
cwt1=pg_scalogram_sim2(data1,timeax,shot=shot(0),channel=channel(0),trange=trange,family=family,order=order,dscale=dscale,$
	start_scale=start_scale, nscale=nscale, plot=plot, print=print, pad=pad, log=log, opt=opt, $
	double=double, freqax=freqax, scaleax=scaleax)
cwt2=pg_scalogram_sim2(data2,timeax,shot=shot(1),channel=channel(1),trange=trange,family=family,order=order,dscale=dscale,$
	start_scale=start_scale, nscale=nscale, plot=plot, print=print, pad=pad, log=log, opt=opt, $
	double=double, freqax=freqax,scaleax=scaleax)

; Calculate CPSD
cpsd=conj(cwt1)*cwt2

; Calculate APSDs
apsd1=float(conj(cwt1)*cwt1)
apsd2=float(conj(cwt2)*cwt2)

if avr GT 0 then begin

	; Chop off the frequencies too low for averaging
	cwtsize=size(cpsd)
	scaleind=where(scaleax LT cwtsize[1]/(avr*2*!PI))
	scaleax=scaleax[scaleind]
	cpsd=cpsd[*,scaleind]
	apsd1=apsd1[*,scaleind]
	apsd2=apsd2[*,scaleind]

	; Time intergration
	cwtsize=size(cpsd)
	for i=0,cwtsize[2]-1 do cpsd[*,i]=smooth(cpsd[*,i],ceil(scaleax[i]*avr*2*!PI), /EDGE_TRUNCATE)
	for i=0,cwtsize[2]-1 do apsd1[*,i]=smooth(apsd1[*,i],ceil(scaleax[i]*avr*2*!PI), /EDGE_TRUNCATE)
	for i=0,cwtsize[2]-1 do apsd2[*,i]=smooth(apsd2[*,i],ceil(scaleax[i]*avr*2*!PI), /EDGE_TRUNCATE)

	; Calculate Cross Coherence
	coh=float(abs(cpsd)/sqrt(apsd1*apsd2))
	timeax=timeax
endif

;Compute frequency axis
freqax=order/scaleax/(timeax[1]-timeax[0])/1000/2/!PI

; Initialize graphics
pg_initgraph,print=print
title0=' of shot: '+pg_num2str(shot[0])+' '+channel[0]+' and shot: '+pg_num2str(shot[1])+' '+channel[1]

datas='shot1: '+nti_wavelet_i2str(shot[0])+$
	'!C'+channel[0]+$
	'!Cshot2: '+nti_wavelet_i2str(shot[1])+$
	'!C'+channel[1]+$
	'!Ctrange:!C '+pg_num2str(timeax[0],length=4)+' s - '+$
		pg_num2str(timeax[n_elements(timeax)-1],length=4)+' s'+$
	'!Cfamily: '+family+$
	'!Corder: '+nti_wavelet_i2str(order)+$
	'!Cdscale: '+pg_num2str(dscale,length=5)+$
	'!Cstart scale: '+pg_num2str(start_scale,length=5)+$
	'!Cnscale: '+nti_wavelet_i2str(nscale)+$
	'!Caveraging: '+nti_wavelet_i2str(avr)

; Plot the results
if (plot EQ 0) OR (plot EQ 1) then begin

	ploted=abs(cpsd)

	;Plot
	title='Cross-scalogram'+title0
	if print then device,filename=pg_filename(title) else window,/free
	pg_plot4,reverse(ploted,2),ct=5,xrange=[min(timeax),max(timeax)],yrange=[min(freqax),max(freqax)]$
		,/ylog,y2range=[min(-pg_log2(scaleax)),max(-pg_log2(scaleax))]$
		,xtitle='Time (s)',ytitle='Frequency (kHz)',y2title='-log base 2 of scale'$
		,title=title,data=datas, poster=poster,opt=opt

endif
if ((plot EQ 0) OR (plot EQ 1)) AND (avr GT 0) then begin
	ploted=coh

	;Plot
	title='Cross-coherence'+title0
	if print then device,filename=pg_filename(title) else window,/free
	pg_plot4,reverse(ploted,2),ct=5,xrange=[min(timeax),max(timeax)],yrange=[min(freqax),max(freqax)]$
		,/ylog,y2range=[min(-pg_log2(scaleax)),max(-pg_log2(scaleax))]$
		,xtitle='Time (s)',ytitle='Frequency (kHz)',y2title='-log base 2 of scale'$
		,title=title,data=datas, poster=poster

endif
if ((plot EQ 0) OR (plot EQ 3)) AND (family EQ 'Morlet') AND (avr GT 0) then begin


	;Plot
	title='Coherence in f.'+title0
	if print then device,filename=pg_filename(title) else window,/free
	loadct,5
	levels=findgen(60)
	if max(ploted) EQ min(ploted) then levels=levels/max(levels)*0.01+min(ploted) $
		else levels=levels/max(levels)*(max(ploted)-min(ploted))+min(ploted)
	CONTOUR, ploted, timeax, freqax, /FILL, XSTYLE=1, YSTYLE=1, XTITLE='Time', YTITLE='Frequency (kHz)',$
		 levels=levels,title=title

endif

;Compute Phase
ploted=atan(imaginary(cpsd),float(cpsd))
if (plot EQ 0) OR (plot EQ 1) then begin

	;Plot
	title='Cross-CWT phase'+title0
	if print then device,filename=pg_filename(title) else window,/free
	pg_plot4,reverse(ploted,2),ct=6,xrange=[min(timeax),max(timeax)],yrange=[min(freqax),max(freqax)]$
		,/ylog,y2range=[min(-pg_log2(scaleax)),max(-pg_log2(scaleax))]$
		,xtitle='Time (s)',ytitle='Frequency (kHz)',y2title='-log base 2 of scale'$
		,zrange=[-!PI,!PI],title=title,data=datas, poster=poster

endif
if ((plot EQ 0) OR (plot EQ 3)) AND (family EQ 'Morlet') then begin

	;Plot
	ploted=atan(imaginary(cpsd),float(cpsd))
	title='Cross-CWT phase in f. '+title0
	if print then device,filename=pg_filename(title) else window,/free
	loadct,6
	levels=findgen(60)
	levels=levels/max(levels)*2*!PI-!PI
	CONTOUR, ploted, timeax, freqax, /FILL, XSTYLE=1, YSTYLE=1, XTITLE='Time', YTITLE='Frequency (kHz)',$
		 levels=levels,title=title

endif

if phaselevel NE 0 then begin
	print,'phaselevel'
	if avr GT 0 then wherephase=where(coh LT 1/100.*phaselevel) $
		else wherephase=where(abs(cpsd) LT max(abs(cpsd))/100.*phaselevel)
	ploted[wherephase]=(257/255)*!PI
	if (plot EQ 0) OR (plot EQ 1) then begin

		;Plot
		title='Cross-CWT phaselevel'+title0
		if print then device,filename=pg_filename(title) else window,/free
		pg_plot4,reverse(ploted,2),ct=41,xrange=[min(timeax),max(timeax)],yrange=[min(freqax),max(freqax)]$
			,/ylog,y2range=[min(-pg_log2(scaleax)),max(-pg_log2(scaleax))]$
			,xtitle='Time (s)',ytitle='Frequency (kHz)',y2title='-log base 2 of scale'$
			,zrange=[-!PI,!PI],title=title,data=datas+'!C phaselevel: '+pg_num2str(phaselevel,length=3)+'%', poster=poster

	endif
	if ((plot EQ 0) OR (plot EQ 3)) AND (family EQ 'Morlet') then begin

		;Plot
		title='Cross-CWT phaselevel in f. '+title0
		if print then device,filename=pg_filename(title) else window,/free
		loadct,41
		levels=findgen(60)
		levels=levels/max(levels)*2*!PI-!PI
		CONTOUR, ploted, timeax, freqax, /FILL, XSTYLE=1, YSTYLE=1, XTITLE='Time', YTITLE='Frequency (kHz)',$
			 levels=levels,title=title
	endif
endif

freqax=freqax
ccwt=cpsd

if print then device,/close

return, ccwt

end
