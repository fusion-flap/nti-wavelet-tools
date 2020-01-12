;+
; Name: pg_scalogram
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2002.07.17. - 2002.07.18.
; Modified by: Gergo Pokol (pokol@reak.bme.hu) 2004.12.08. (call pg_scalogram_sim2)
;
; Purpose: Plot the Scalogram or the Phase of the Continous Wavelet Transform of a measurement in the Nicolet system
;
; Calling sequence:
;	cwt=pg_scalogram( shot, channel [,trange] [,family] [,order] [,dscale] [,start_scale] [,nscale]  $
;		[,plot] [,/print] [,/poster] [,/pad] [,/log] [,opt] [,/double] [,timeax=timeax] [,freqax=freqax])
;
; Inputs:
;	shot: shot number
;	channel: channel number
;	trange (optional): timerange to view, 2 element vector; default: whole range
;	fmax (optional): frequency maximum of spectrogram (in kHz), resampled with pg_resample, Downsamples time axis!
;	family (optional): wavelet family to use (available: 'Morlet'); default: 'Morlet'
;	order (optional): order of the wavelet; default: default of the family
;	dscale (optional): fraction of diadic scaling; default:0.25
;	start_scale (optional): starting scale (has no effect on CWT using Morlet wavelets; default:2
;	nscale (optional): total number of scale values; default:log2(N/start_scale)/dscale+1
;	plot (optional): display mode (available: 0:All, 1:Scalogram(log), 2:Phase,
;					3:Scalogram(lin) (for Morlet wavelets only), other:None; default: 0
;	opt (optional): exponent for opimized scale visualization
;	/print (optional): Print to file instead of plotting
;	/poster (optional): Print in poster form
;	/pad (optional): use zero padding instead of cutting the data vector to 2^x length
;	/log (optional): visualize on log scale (except for Phase)
;	/double (optional): double precision
;
; Output:
;	cwt: CWT of signal
;	timeax (optional): Time axis
;	freqax (optional): Frequency axis
;
; Modification:
;	Gergo Pokol 2003.03.31: Output added
;	Gergo Pokol 2003.06.12: Moved to pg_scalogram_sim
;-


function pg_scalogram, shot, channel, trange=trange, family=family, order=order, dscale=dscale,$
	start_scale=start_scale, nscale=nscale, plot=plot, print=print, poster=poster, pad=pad, log=log, opt=opt, $
	double=double, timeax=timeax, freqax=freqax, fmax=fmax, ID=ID

compile_opt defint32 ; 32 bit integers

; Read data
get_rawsignal,shot,channel,timeax,data,trange=trange

cwt=pg_scalogram_sim2(data,timeax,shot=shot,channel=channel,trange=trange,family=family,order=order,dscale=dscale,$
	start_scale=start_scale, nscale=nscale, plot=plot, print=print, poster=poster, pad=pad, log=log, opt=opt, $
	double=double, freqax=freqax, fmax=fmax, ID=ID)

timeax=timeax
freqax=freqax

return, cwt

end
