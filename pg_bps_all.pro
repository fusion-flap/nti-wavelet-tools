;+
; Name: pg_pbs_all
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2003.12.10.
;
; Purpose: Calculate selected band powers for a whole experiment and save in files
;
; Calling sequence:
;	pg_bps_all, b [,channels] [,trange] [,windowname] [,windowsize] [,masksize] [,step] [,freqres] $
;		[,family] [,order] [,dscale] [,start_scale] [,nscale] $
;		[,plot] [,/print] [,/cwt]
;
; Input:
;	b: Frequency bands (kHz)
;	channels (optional): Channel numbers to be considered
;	trange (optional): Timerange to view (s), 2 element vector; default: whole range
;	windowsize (optional-STFT): Length of window (standard deviation /2 for Gauss window); default: 50
;	masksize (optional-STFT): Length of mask vector; default: all nonzero values
;	windowname (optional-STFT): Shape of the window (available: see in pg_gen_win.pro)
;	step (optional-STFT): time Steps of FFT; default: 1
;	freqres (optional-STFT): Frequency resolution; default: length of data
;	family (optional-CWT): wavelet family to use (available: 'Morlet'); default: 'Morlet'
;	order (optional-CWT): order of the wavelet; default: default of the family
;	dscale (optional-CWT): fraction of diadic scaling; default:0.25
;	start_scale (optional-CWT): starting scale (has no effect on CWT using Morlet wavelets; default:2
;	nscale (optional-CWT): total number of scale values; default:log2(N/start_scale)/dscale+1
;	plot (optional): Display mode (available: 0: Plot power bands
;						  1: 0+time integrated spectra
;						  2: 1+time-frequency energy density distribution
;						   ; default: 0
;	/print (optional): Produce ps files
;	/cwt (optional): Use CWT instead of STFT
;
; Output: -
;
;-

pro pg_bps_all, b, channels=channels, trange=trange, windowname=windowname, windowsize=windowsize, masksize=masksize, $
	step=step, freqres=freqres, family=family, order=order, dscale=dscale, $
	start_scale=start_scale, nscale=nscale, plot=plot, print=print, cwt=cwt

exp=[52123,52128,52129,52134,52135,52140,52141,52146,52147,52152,52153,52158,52164,52169,52170,52175]

for i=3,5 do pg_bps, exp[2*i:2*i+1], b, channels=channels, trange=trange, windowname=windowname, windowsize=windowsize, masksize=masksize, $
		step=step, freqres=freqres, family=family, order=order, dscale=dscale, $
		start_scale=start_scale, nscale=nscale, plot=plot, print=print, cwt=cwt

end