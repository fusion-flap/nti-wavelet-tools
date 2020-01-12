;+
; Name: pg_modenumber
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2007.02.14.-03.02.
;
; Purpose: Calculate and plot coherences and modenumbers on the time-frequency plane
;	 derived from data in the Nicolet system
;
; Calling sequence:
;	modenum=pg_modenumber(shot [,channels] [,chpos] [,trange] [,filters] [,windowname] [,windowsize] [,masksize] [,step] $
;		[,freqres]  [,/cwt] [,family] [,order] [,dscale] [,start_scale] [,nscale] [,modescale], [,/nophase]$
;		[,plot] [,avr] [,/print] [,opt] [,filterparam1] [,filterparam2] [,cohlim] [,powlim]$
;		[,timeax=timeax] [,freqax=freqax] [,cphases=cphases] [,transforms=transforms])
;
; Inputs:
;		shot: shot numbers
;		channels (optional): channel numbers; default: W7-AS Mirnov/MIR-1 coils
;		chpos (optional): channel positions in degrees; default: W7-AS Mirnov/MIR-1 coils
;		trange (optional): timerange to view, 2 element vector; default: whole range
;		modescale (optional): range of mode numbers; default: not set
;		filters (optional): vector of filter numbers to use; default: [0,1] available filters:
;			-1: No filter
;			0: In phase filter giving 0 modenumber limiting the maxmum deviation from 0 phase
;			1: Positive-negative modenumbers filter assuming strictly monoton phase diagram
;				and same modenumber for all reference signals (must use whole array)
;			2: Positive-negative modenumbers filter assuming strictly monoton phase diagram
;				and using linear fit to mean phase diagram (does not require whole array)
;			3: Optimized positive-negative modenumbers filter not assuming strictly monoton phase diagram
;				and using linear fit to mean phase diagram (does not require whole array)
;			4: Select most fitting linear to the relative phases as a function of their relative position
;				(does not require whole array)
;					filterparam1 (optional): modenumber steps to be considered; default:1
;					filterparam2 (optional): minimum distance accepted Q values from Q_mean measured in Q_stddev units
;						default: 10000 (everything is accepted)
;		/nophase (optional): no phase calculation (less memory needed)
;  STFT parameters:
;		windowname (optional); window type; default: 'Gauss'
;		windowsize (optional): length of window (standard deviation *2 for Gauss window); default: 50
;		masksize (optional): length of mask vector; default: 500
;		step (optional): time steps of FFT; default: 1
;		freqres (optional): frequency resolution; default: 1 (giving masksize/2)
;	CWT parameters:
;		/cwt (optional): Use CWT instead of STFT
;		family (optional): wavelet family to use (available: 'Morlet'); default: 'Morlet'
;		order (optional): order of the wavelet; default: 6
;		dscale (optional): fraction of diadic scaling; default:0.25
;		start_scale (optional): starting scale (has no effect on CWT using Morlet wavelets; default:2
;		nscale (optional): total number of scale values; default:log2(N/start_scale)/dscale+1
;	Visualization parameters:
;		plot (optional): display mode (available:
;										 0:Modenumbers of the time-frequency plane,
;										 1:0+time-frequency energy-density distributions,
;										 2:1+phaes+Freq. scale (for Morlet wavelets only), other:None; default: 0
;		opt (optional): exponent for opimized scale visualization
;		avr (optional): number of independent averages (0 switches averaging off); default: 0
;		modescale (optional): scale of plotted modes; default: all modes
;		cohlim (optional): lower limit of minimal coherence for plotting; default: none
;		powlim (optional): limit of CPSD for plotting (fraction of maximum); default: none
;		/print (optional): Print to file instead of plotting
;
; Output:
;		modenum: modenumbers of the time-frequency plane
;		timeax (optional): Time axis
;		freqax (optional): Frequency axis
;		cphases (optional): Cross-phases
;		transforms (optional): Unsmoothed time-frequency transforms of the channels
;		smoothed_apsds (optional): Smoothed APSDs of the channels
;
; Modifications:
;		2007.04.10. Gergo Pokol: coherence calculation added
;		2007.08.16. Gergo Pokol: powlim added
;
;-

function pg_modenumber, shot, channels=channels, chpos=chpos, trange=trange, filters=filters, nophase=nophase,$
	windowname=windowname, windowsize=windowsize, masksize=masksize, step=step, freqres=freqres, $
	cwt=cwt, family=family, order=order, dscale=dscale, start_scale=start_scale, nscale=nscale, cohlim=cohlim, powlim=powlim,$
	plot=plot, print=print, opt=opt, modescale=modescale, avr=avr, filterparam1=filterparam1, filterparam2=filterparam2,$
	timeax=timeax, freqax=freqax, cphases=cphases, transforms=transforms,smoothed_apsds=smoothed_apsds

compile_opt defint32 ; 32 bit integers

; Set defaults
print=keyword_set(print)
log=keyword_set(log)
cwt=keyword_set(cwt)
nophase=keyword_set(nophase)
if not(keyword_set(channels)) then channels=['W7-AS Mirnov/MIR-1-1',$
															'W7-AS Mirnov/MIR-1-2',$
															'W7-AS Mirnov/MIR-1-3',$
															'W7-AS Mirnov/MIR-1-4',$
															'W7-AS Mirnov/MIR-1-5',$
															'W7-AS Mirnov/MIR-1-6',$
															'W7-AS Mirnov/MIR-1-7',$
															'W7-AS Mirnov/MIR-1-8',$
															'W7-AS Mirnov/MIR-1-9',$
															'W7-AS Mirnov/MIR-1-10',$
															'W7-AS Mirnov/MIR-1-11',$
															'W7-AS Mirnov/MIR-1-12',$
															'W7-AS Mirnov/MIR-1-13',$
															'W7-AS Mirnov/MIR-1-14',$
															'W7-AS Mirnov/MIR-1-15',$
															'W7-AS Mirnov/MIR-1-16']
if not(keyword_set(chpos)) then chpos=[10,30,50,85,100,120,145,165,185,200,220,255,275,305,340,355]
if not(keyword_set(filters)) then filters=[0,1]
if nophase then filters=[-1]
if not(keyword_set(windowname)) then windowname='Gauss'
if not(keyword_set(windowsize)) then windowsize=50
if not(keyword_set(masksize)) then masksize=500
if not(keyword_set(step)) then step=1
if not(keyword_set(freqres)) then freqres=1
if not(keyword_set(order)) then order=6
if not(keyword_set(dscale)) then dscale=0.25
if not(keyword_set(family)) then family='Morlet'
if not(keyword_set(plot)) then plot=0
if (plot GE 0) AND (where(filters EQ -1) EQ -1) then modenumberplot=1 else modenumberplot=0 ; Plot modenumbers
if plot GE 1 then transplot=1 else transplot=-1 ; Plot time-frequency energy-density distributions
if plot GE 2 then transplot=0 ; Plot everything
if not(keyword_set(opt)) then opt=1
if not(keyword_set(avr)) then avr=0
if not(keyword_set(modescale)) then begin
	setmodescale=0
	modescale=[-1.,1.]
endif else begin
	setmodescale=1
endelse
channessize=n_elements(channels)

; Read data, and resize to the size of the first channel, if necessary
get_rawsignal,shot,channels(0),timeax,data,trange=trange
datas=fltarr(n_elements(channels),n_elements(data))
datas(0,*)=data
for i=1,channessize-1 do begin
	get_rawsignal,shot,channels(i),timeax2,data,trange=trange
	if NOT (norm(timeax-timeax2) EQ 0) then begin
		timesize=n_elements(timeax)
		stime=timeax2(1)-timeax2(0)
		shift=(timeax2(0)-timeax(0))/stime
		data=pg_retrigger(data,shift)
		data=pg_resample(data,timesize)
	endif
	datas(i,*)=data
endfor

; Initialize graphics
pg_initgraph,print=print
printdatas='shot: '+nti_wavelet_i2str(shot)+$
	'!C'+channels[0]+$
	'!C'+channels[1]+$
	'!C...'+$
	'!Ctrange:!C '+pg_num2str(timeax[0],length=4)+' s - '+$
		pg_num2str(timeax[n_elements(timeax)-1],length=4)+' s'+$
	'!Caverages: '+nti_wavelet_i2str(avr)
if cwt then printdatas=printdatas+$
		'!Cfamily: '+family+$
		'!Corder: '+nti_wavelet_i2str(order)+$
		'!Cdscale: '+pg_num2str(dscale,length=5) $
	else printdatas=printdatas+$
		'!Cwin.: '+windowname+$
		'!Cwinsize: '+nti_wavelet_i2str(windowsize)+'!C '+pg_num2str((timeax[1]-timeax[0])*windowsize/step)+'s'+$
		'!Cmasksize: '+nti_wavelet_i2str(masksize)+$
		'!Cfreqres: '+nti_wavelet_i2str(freqres)+$
		'!Cstep: '+nti_wavelet_i2str(step)

; Calculate energy-density distributions
if cwt then begin
	print,'CWT for '+nti_wavelet_i2str(shot)+channels(0)
	time=timeax
	transform=pg_scalogram_sim2(datas(0,*),time,shot=shot,channel=channels(0),trange=trange,family=family,order=order,dscale=dscale,$
		start_scale=start_scale, nscale=nscale, plot=transplot, print=print, /pad, opt=opt, $
		freqax=freqax, scaleax=scaleax)
	transformsize=size(transform)
	transforms=complexarr(channessize,transformsize(1),transformsize(2))
	transforms(0,*,*)=transform
	for i=1,channessize-1 do begin
		print,'CWT for '+nti_wavelet_i2str(shot)+channels(i)
		time=timeax
		transforms(i,*,*)=pg_scalogram_sim2(datas(i,*),time,shot=shot,channel=channels(i),trange=trange,family=family,order=order,dscale=dscale,$
			start_scale=start_scale, nscale=nscale, plot=transplot, print=print, /pad, opt=opt, $
			freqax=freqax, scaleax=scaleax)
	endfor
endif else begin
	print,'STFT for '+nti_wavelet_i2str(shot)+channels(0)
	time=timeax
	transform=pg_spectrogram_sim(datas(0,*),time,shot=shot,channel=channels(0),trange=trange,windowname=windowname, $
		windowsize=windowsize,masksize=masksize,step=step, $
		freqres=freqres, plot=transplot, print=print, log=log, opt=opt, freqax=freqax)
	transformsize=size(transform)
	transformsize(2)=transformsize(2)/2+1 ;Store for positive frequencies only
	transforms=complexarr(channessize,transformsize(1),transformsize(2))
	transforms(0,*,*)=transform(*,0:transformsize(2)-1) ;Store for positive frequencies only
	for i=1,channessize-1 do begin
		print,'STFT for '+nti_wavelet_i2str(shot)+channels(i)
		time=timeax
		transform=pg_spectrogram_sim(datas(i,*),time,shot=shot,channel=channels(i),trange=trange,windowname=windowname, $
			windowsize=windowsize,masksize=masksize,step=step, $
			freqres=freqres, plot=transplot, print=print, log=log, opt=opt, freqax=freqax)
		transforms(i,*,*)=transform(*,0:transformsize(2)-1) ;Store for positive frequencies only
	endfor
endelse
timeax=time ;Set new time axis

; Calculate smoothed (averaged) APDSs
smoothed_transsize=transformsize
if (avr GT 0) then begin
	print,'Smoothing transforms'
	wait,0.1
	if cwt then begin
		scaleind=where(scaleax LT smoothed_transsize(1)/(avr*2*!PI))
		scaleax=scaleax(scaleind)
		smoothed_transsize(2)=n_elements(scaleax)
		freqax=order/scaleax/(timeax(1)-timeax(0))/1000/2/!PI
	endif
	smoothed_apsds=complexarr(channessize,smoothed_transsize(1),smoothed_transsize(2))
	for i=0,channessize-1 do begin
		if cwt then begin
			; Chop off the frequencies too low for averaging
			transform=reform(transforms(i,*,scaleind))
			; Time intergration
			for k=0,smoothed_transsize(2)-1 do $
				smoothed_apsds(i,*,k)=smooth(abs(transform(*,k))^2,ceil(scaleax(k)*avr*2*!PI), /EDGE_TRUNCATE)
			; Plot smoothed scalogram
			if transplot GE 0 then begin
				title='Smoothed scalogram '+nti_wavelet_i2str(shot)+' '+channels(i)
				if print then device,filename=pg_filename(title) else window,/free
				pg_plot4,reverse(reform(smoothed_apsds(i,*,*)),2),ct=5,xrange=[min(timeax),max(timeax)],yrange=[min(freqax),max(freqax)]$
					,/ylog,y2range=[min(-pg_log2(scaleax)),max(-pg_log2(scaleax))]$
					,xtitle='Time (s)',ytitle='Frequency (kHz)',y2title='-log base 2 of scale'$
					,title=title,zlog=log,opt=opt,data=printdatas,poster=poster
			endif
		endif else begin
			inttime=avr*windowsize/step
			; Time intergration
			for k=0,smoothed_transsize(2)-1 do $
				smoothed_apsds(i,*,k)=smooth(abs(reform(transforms(i,*,k)))^2,inttime, /EDGE_TRUNCATE)
			; Plot smoothed spectrogram
			if transplot GE 0 then begin
				title='Smoothed spectrogram '+nti_wavelet_i2str(shot)+' '+channels(i)
				if print then device,filename=pg_filename(title) else window,/free
				pg_plot4,reform(smoothed_apsds(i,*,*)),ct=5,xrange=[min(timeax),max(timeax)],yrange=[min(freqax),max(freqax)]$
					,xtitle='Time (s)',ytitle='Frequency (kHz)',title=title,zlog=log,opt=opt,data=printdatas,poster=poster
			endif
		endelse
	endfor
endif

; Create arrays for coherences and averaged CPSD
if (avr GT 0) then begin
	mincoh=fltarr(smoothed_transsize(1),smoothed_transsize(2))+1
	avrcoh=fltarr(smoothed_transsize(1),smoothed_transsize(2))
endif
smoothed_avrcpsd=fltarr(smoothed_transsize(1),smoothed_transsize(2))

; Calculate cross-phases
crosssize=channessize*(channessize-1)/2
if NOT nophase then cphases=fltarr(crosssize,smoothed_transsize(1),smoothed_transsize(2))
for i=0,channessize-1 do begin
	for j=i+1,channessize-1 do begin
		print,'Crosstransforms for '+nti_wavelet_i2str(shot)+channels(i)+' '+channels(j)
		wait,0.1
		ctrans=conj(reform(transforms(i,*,*)))*reform(transforms(j,*,*)) ; Calculate cross-transform
		; Smoothing cross-transforms in time for averaging
		if avr GT 0 then begin
			if cwt then begin
				; Chop off the frequencies too low for averaging
				ctrans=ctrans(*,scaleind)
				; Time intergration
				for k=0,smoothed_transsize(2)-1 do ctrans(*,k)=smooth(ctrans(*,k),ceil(scaleax(k)*avr*2.*!PI), /EDGE_TRUNCATE)
				; Calculate coherence
				coh=float(abs(ctrans)/sqrt(reform(smoothed_apsds(i,*,*))*reform(smoothed_apsds(j,*,*))))
			endif else begin
				inttime=avr*windowsize/step
				; Time intergration
				ctranssize=size(ctrans)
				for k=0,smoothed_transsize(2)-1 do ctrans(*,k)=smooth(ctrans(*,k),inttime, /EDGE_TRUNCATE)
				; Calculate coherence
				coh=float(abs(ctrans)/sqrt(reform(smoothed_apsds(i,*,*))*reform(smoothed_apsds(j,*,*))))
			endelse
			mincoh=mincoh<coh ; Calculate minimum coherence
			avrcoh=avrcoh+coh/float(crosssize) ; Calculate average coherence
		endif
		if NOT nophase then cphases(i*(channessize-(i+1)/2.)-(i+1)+j,*,*)=atan(imaginary(ctrans),float(ctrans)) ; Calculate cross-phase
		smoothed_avrcpsd=smoothed_avrcpsd+abs(ctrans)/float(crosssize) ; Calculate average smothed CPSD
	endfor
endfor

; Plot coherences
if avr GT 0 then begin
	if cwt then begin
		title='Minimum coherence of shot: '+nti_wavelet_i2str(shot)+' '+channels(0)+' '+channels(1)+'...'
		if print then device,filename=pg_filename(title) else window,/free
		pg_plot4,reverse(mincoh,2),ct=5,xrange=[min(timeax),max(timeax)],yrange=[min(freqax),max(freqax)]$
			,/ylog,y2range=[min(-pg_log2(scaleax)),max(-pg_log2(scaleax))],zrange=[0,1]$
			,xtitle='Time (s)',ytitle='Frequency (kHz)',y2title='-log base 2 of scale'$
			,title=title,data=printdatas, poster=poster
		title='Average coherence of shot: '+nti_wavelet_i2str(shot)+' '+channels(0)+' '+channels(1)+'...'
		if print then device,filename=pg_filename(title) else window,/free
		pg_plot4,reverse(avrcoh,2),ct=5,xrange=[min(timeax),max(timeax)],yrange=[min(freqax),max(freqax)]$
			,/ylog,y2range=[min(-pg_log2(scaleax)),max(-pg_log2(scaleax))],zrange=[0,1]$
			,xtitle='Time (s)',ytitle='Frequency (kHz)',y2title='-log base 2 of scale'$
			,title=title,data=printdatas, poster=poster
	endif else begin
		title='Minimum coherence of shot: '+nti_wavelet_i2str(shot)+' '+channels(0)+' '+channels(1)+'...'
		if print then device,filename=pg_filename(title) else window,/free
		pg_plot4,mincoh,ct=5,xrange=[min(timeax),max(timeax)],yrange=[min(freqax),max(freqax)],zrange=[0,1]$
			,xtitle='Time (s)',ytitle='Frequency (kHz)',title=title,data=printdatas,poster=poster
		title='Average coherence of shot: '+nti_wavelet_i2str(shot)+' '+channels(0)+' '+channels(1)+'...'
		if print then device,filename=pg_filename(title) else window,/free
		pg_plot4,avrcoh,ct=5,xrange=[min(timeax),max(timeax)],yrange=[min(freqax),max(freqax)],zrange=[0,1]$
			,xtitle='Time (s)',ytitle='Frequency (kHz)',title=title,data=printdatas,poster=poster
	endelse
endif

; Calculate modenumbers on the time-frequency plane
print,'Modenumbers for '+nti_wavelet_i2str(shot)
wait,0.1
T=systime(1) ; Initialize progress indicator
modenum=fltarr(smoothed_transsize(1),smoothed_transsize(2))
modenum=modenum+1000 ; set mode number values definetly not reached
for i=0,smoothed_transsize(1)-1 do begin
	for j=0,smoothed_transsize(2)-1 do begin
		; Filter 0: in phase -> 0 modenumber (maxmum deviation from 0 phase)
		if where(filters EQ 0) GT -1 then begin
			m0=pg_modefilter0(cphases(*,i,j),chpos)
			if NOT(m0 EQ 1000) then modenum(i,j)=m0
		endif

		; Filter 1: positive-negative modenumbers (strictly monoton)
		if where(filters EQ 1) GT -1 then begin
			m0=pg_modefilter_monoton(cphases(*,i,j),chpos)
			if NOT(m0 EQ 1000) then modenum(i,j)=m0
		endif

		; Filter 2: positive-negative modenumbers (linear fit)
		if where(filters EQ 2) GT -1 then begin
			m0=pg_modefilter_fit(cphases(*,i,j),chpos)
			if NOT(m0 EQ 1000) then modenum(i,j)=m0
		endif

		; Filter 3: optimized positive-negative modenumbers (linear fit)
		if where(filters EQ 3) GT -1 then begin
			m0=pg_modefilter_varfit(cphases(*,i,j),chpos)
			if NOT(m0 EQ 1000) then modenum(i,j)=m0
		endif

		; Filter 4: positive-negative modenumbers from relative positions (linear fit)
		if where(filters EQ 4) GT -1 then begin
			if setmodescale then moderange=modescale
			m0=pg_modefilter_fitrel(cphases(*,i,j),chpos, modestep=filterparam1, qlim=filterparam2)
			if NOT(m0 EQ 1000) then modenum(i,j)=m0
		endif

		; Progress indicator
		if floor(systime(1)-T) GE 10 then begin
			print, pg_num2str(double(i)/double(smoothed_transsize(1))*100.)+' % done'
			T=systime(1)
			wait,0.1
		endif
	endfor
endfor

; Set scale for plotting modenumbers
isdefined=where(modenum NE 1000)
if max(isdefined) GT -1 then maxmodenum=max(abs(modenum(isdefined))) else maxmodenum=0
if (modescale(1) LT maxmodenum) AND (NOT setmodescale) then modescale=[-maxmodenum,maxmodenum]
; Set not defined modenumbers for plotting
notdefined=where((modenum LT modescale(0)) OR (modenum GT modescale(1)))
if max(notdefined) NE -1 then modenum(notdefined)=modescale(1)+(modescale(1)-modescale(0))/200.

; Plot modenumbers
if modenumberplot then begin
	; Set filter parameters to be plotted
	if where(filters EQ 0) GT -1 then begin
		printdatas=printdatas+'!CFilter 0'
	endif
	if where(filters EQ 1) GT -1 then begin
		printdatas=printdatas+'!CFilter 1'
	endif
	if where(filters EQ 2) GT -1 then begin
		printdatas=printdatas+'!CFilter 2'
	endif
	if where(filters EQ 3) GT -1 then begin
		printdatas=printdatas+'!CFilter 3'
	endif
	if where(filters EQ 4) GT -1 then begin
		printdatas=printdatas+'!CFilter 4'+$
			'!Cmodestep: '+pg_num2str(filterparam1)+$
			'!CQ limit: '+pg_num2str(filterparam2)
	endif
	title='Modenumbers of shot: '+nti_wavelet_i2str(shot)+' '+channels(0)+' '+channels(1)+'...'
	; Plot

	if cwt then begin
		if print then device,filename=pg_filename(title) else window,/free
		pg_plot4,reverse(modenum,2),ct=42,xrange=[min(timeax),max(timeax)],yrange=[min(freqax),max(freqax)] $
			,/ylog,y2range=[min(-pg_log2(scaleax)),max(-pg_log2(scaleax))] $
			,xtitle='Time (s)',ytitle='Frequency (kHz)',y2title='-log base 2 of scale' $
			,title=title,data=printdatas,/nearest,zrange=[modescale(0),modescale(1)+(modescale(1)-modescale(0))/200.] $
			,/original
	endif else begin
		if print then device,filename=pg_filename(title) else window,/free
		pg_plot4,modenum,ct=42,xrange=[min(timeax),max(timeax)],yrange=[min(freqax),max(freqax)] $
			,xtitle='Time (s)',ytitle='Frequency (kHz)',title=title,data=printdatas $
			,poster=poster,/nearest,zrange=[modescale(0),modescale(1)+(modescale(1)-modescale(0))/200.] $
			,/original
	endelse
	modenumfull=modenum
	if (avr GT 0) and keyword_set(cohlim) then begin
		modenum=modenumfull
		notplotted=where(mincoh LT cohlim)
		if max(notplotted) GT -1 then modenum(notplotted)=1000
		; Set scale for plotting modenumbers
		isdefined=where(modenum LT modescale(1)+(modescale(1)-modescale(0))/200.)
		if max(isdefined) GT -1 then maxmodenum=max(abs(modenum(isdefined))) else maxmodenum=0
		if (modescale(1) LT maxmodenum) AND (NOT setmodescale) then modescale=[-maxmodenum,maxmodenum]
		; Set not defined modenumbers for plotting
		notdefined=where((modenum LT modescale(0)) OR (modenum GT modescale(1)))
		if max(notdefined) NE -1 then modenum(notdefined)=modescale(1)+(modescale(1)-modescale(0))/200.

		printdatas=printdatas+'!Ccohlim:'+pg_num2str(cohlim)
		title='Modenumbers (cohlim) of shot: '+nti_wavelet_i2str(shot)+' '+channels(0)+' '+channels(1)+'...'
		; Plot
		if cwt then begin
			if print then device,filename=pg_filename(title) else window,/free
			pg_plot4,reverse(modenum,2),ct=42,xrange=[min(timeax),max(timeax)],yrange=[min(freqax),max(freqax)] $
				,/ylog,y2range=[min(-pg_log2(scaleax)),max(-pg_log2(scaleax))] $
				,xtitle='Time (s)',ytitle='Frequency (kHz)',y2title='-log base 2 of scale' $
				,title=title,data=printdatas,/nearest,zrange=[modescale(0),modescale(1)+(modescale(1)-modescale(0))/200.] $
				,/original
		endif else begin
			if print then device,filename=pg_filename(title) else window,/free
			pg_plot4,modenum,ct=42,xrange=[min(timeax),max(timeax)],yrange=[min(freqax),max(freqax)] $
				,xtitle='Time (s)',ytitle='Frequency (kHz)',title=title,data=printdatas $
				,poster=poster,/nearest,zrange=[modescale(0),modescale(1)+(modescale(1)-modescale(0))/200.] $
				,/original
		endelse
	endif
	if keyword_set(powlim) then begin
		modenum=modenumfull
		powlim=powlim*max(smoothed_avrcpsd)
		; Plot modenumbers for large CPSD areas
		notplotted=where(smoothed_avrcpsd LT powlim)
		if max(notplotted) GT -1 then modenum(notplotted)=1000
		; Set scale for plotting modenumbers
		isdefined=where(modenum LT modescale(1)+(modescale(1)-modescale(0))/200.)
		if max(isdefined) GT -1 then maxmodenum=max(abs(modenum(isdefined))) else maxmodenum=0
		if (modescale(1) LT maxmodenum) AND (NOT setmodescale) then modescale=[-maxmodenum,maxmodenum]
		; Set not defined modenumbers for plotting
		notdefined=where((modenum LT modescale(0)) OR (modenum GT modescale(1)))
		if max(notdefined) NE -1 then modenum(notdefined)=modescale(1)+(modescale(1)-modescale(0))/200.

		printdatas=printdatas+'!Cpowlim+:'+pg_num2str(powlim)
		title='Modenumbers (powlim+) of shot: '+nti_wavelet_i2str(shot)+' '+channels(0)+' '+channels(1)+'...'
		; Plot
		if cwt then begin
			if print then device,filename=pg_filename(title) else window,/free
			pg_plot4,reverse(modenum,2),ct=42,xrange=[min(timeax),max(timeax)],yrange=[min(freqax),max(freqax)] $
				,/ylog,y2range=[min(-pg_log2(scaleax)),max(-pg_log2(scaleax))] $
				,xtitle='Time (s)',ytitle='Frequency (kHz)',y2title='-log base 2 of scale' $
				,title=title,data=printdatas,/nearest,zrange=[modescale(0),modescale(1)+(modescale(1)-modescale(0))/200.] $
				,/original
		endif else begin
			if print then device,filename=pg_filename(title) else window,/free
			pg_plot4,modenum,ct=42,xrange=[min(timeax),max(timeax)],yrange=[min(freqax),max(freqax)] $
				,xtitle='Time (s)',ytitle='Frequency (kHz)',title=title,data=printdatas $
				,poster=poster,/nearest,zrange=[modescale(0),modescale(1)+(modescale(1)-modescale(0))/200.] $
				,/original
		endelse

		; Plot modenumbers for small CPSD areas
		modenum=modenumfull
		notplotted=where(smoothed_avrcpsd GT powlim)
		if max(notplotted) GT -1 then modenum(notplotted)=1000
		; Set scale for plotting modenumbers
		isdefined=where(modenum LT modescale(1)+(modescale(1)-modescale(0))/200.)
		if max(isdefined) GT -1 then maxmodenum=max(abs(modenum(isdefined))) else maxmodenum=0
		if (modescale(1) LT maxmodenum) AND (NOT setmodescale) then modescale=[-maxmodenum,maxmodenum]
		; Set not defined modenumbers for plotting
		notdefined=where((modenum LT modescale(0)) OR (modenum GT modescale(1)))
		if max(notdefined) NE -1 then modenum(notdefined)=modescale(1)+(modescale(1)-modescale(0))/200.

		printdatas=printdatas+'!Cpowlim-:'+pg_num2str(powlim)
		title='Modenumbers (powlim-) of shot: '+nti_wavelet_i2str(shot)+' '+channels(0)+' '+channels(1)+'...'
		; Plot
		if cwt then begin
			if print then device,filename=pg_filename(title) else window,/free
			pg_plot4,reverse(modenum,2),ct=42,xrange=[min(timeax),max(timeax)],yrange=[min(freqax),max(freqax)] $
				,/ylog,y2range=[min(-pg_log2(scaleax)),max(-pg_log2(scaleax))] $
				,xtitle='Time (s)',ytitle='Frequency (kHz)',y2title='-log base 2 of scale' $
				,title=title,data=printdatas,/nearest,zrange=[modescale(0),modescale(1)+(modescale(1)-modescale(0))/200.] $
				,/original
		endif else begin
			if print then device,filename=pg_filename(title) else window,/free
			pg_plot4,modenum,ct=42,xrange=[min(timeax),max(timeax)],yrange=[min(freqax),max(freqax)] $
				,xtitle='Time (s)',ytitle='Frequency (kHz)',title=title,data=printdatas $
				,poster=poster,/nearest,zrange=[modescale(0),modescale(1)+(modescale(1)-modescale(0))/200.] $
				,/original
		endelse
	endif
endif

if print then device,/close

timeax=timeax
freqax=freqax
cphases=cphases
transforms=transforms
smoothed_apsds=smoothed_apsds

return, modenum

end
