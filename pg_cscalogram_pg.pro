;+
; Name: pg_cscalogram_pg
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2007.01.25.
;
; Purpose: Plot the scalograms, cross-scalogram, cross-phase and cross-coherence calculated with scaled smoothing
;			 of a measurement in the Nicolet system
;
; Calling sequence:
;	coh=pg_cscalogram( shot, channel [,trange] [,family] [,order] [,dscale] [,start_scale] [,nscale]  $
;		[,plot] [,avr] [,phaselevel] [,/print] [,/pad] [,/log] [,opt] [,/double] [,timeax=timeax] [,freqax=freqax])
;
; Inputs:
;	shot: shot numbers
;	channel: channel numbers
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
;	opt (optional): exponent for opimized scale visualization
;	avr (optional): number of independent averages (0 switches averaging off); default: 0
;	phaselevel (optional): plot phase above a critical cross spectrum level (in %); default: 0
;	/print (optional): Print to file instead of plotting
;	/pad (optional): use zero padding instead of cutting the data vector to 2^x length
;	/log (optional): visualize on log scale (except for Phase)
;	/double (optional): double precision
;
; Output:
;	ccwt: cross-scalogram of signals
;	timeax (optional): Time axis
;	freqax (optional): Frequency axis
;-

function pg_cscalogram_pg, shot, channel, trange=trange, family=family, order=order, dscale=dscale,$
	start_scale=start_scale, nscale=nscale, plot=plot, print=print, pad=pad, log=log, opt=opt, $
	phaselevel=phaselevel, double=double, avr=avr, timeax=timeax, freqax=freqax

compile_opt defint32 ; 32 bit integers

; Read data
get_rawsignal,shot(0),channel(0),timeax1,data1,trange=trange
get_rawsignal,shot(1),channel(1),timeax2,data2,trange=trange

if NOT (norm(timeax1-timeax2) EQ 0) then begin
	timesize=n_elements(timeax1)
	stime=timeax2(1)-timeax2(0)
	shift=(timeax2(0)-timeax1(0))/stime
	data2=pg_retrigger(data2,shift)
	data2=pg_resample(data2,timesize)
endif

ccwt=pg_cscalogram_pg_sim(data1,data2,timeax1,shot=shot,channel=channel,trange=trange,family=family,order=order,dscale=dscale,$
	start_scale=start_scale, nscale=nscale, plot=plot, avr=avr, print=print, pad=pad, log=log, opt=opt, $
	phaselevel=phaselevel, double=double, freqax=freqax)

timeax=timeax1
freqax=freqax

return, ccwt

end
