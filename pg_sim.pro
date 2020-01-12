;+
; Name: pg_sim
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2003.06.12.
;
; Purpose: Simulate Mirnov signal
;
; Calling sequence:
;	sign=pg_sim([bs] [,dt] [,trange] [,burstlength] [,burstdens] [,nburst] [,snr] [,plot] $
;		[,/print] [,/xcorr] [,/mcorr] [,/lcorr] [,sims=sims] [,envelope=envelope] $
;		[,time=time])
;
; Input:
;	bs (optional): Simulated frequencies (kHz); default: [30,100]
;	dt (optional): Time step (s); default: 0.000003
;	trange (optional): Time range (s); default: [0,0.1]
;	burstlength (optional): Average burst length; default: 32
;	burstdens (optional): Normed rate of bursts; default: 2
;	nburst (optional): Number of bursts; default: simsize/burstlength*burstdens
;	snr (optional): Singal to noise power ratio; default: 0
;	plot (optional): Display mode (available: 1: Plot signal
;						  2: 1+modulated frequiencies
;						   ; default: 0
;	/print (optional): Produce ps files
;	/xcorr (optional): Correlation in time of bursts
;	/mcorr (optional): Correlation in magnitude of bursts
;	/lcorr (optional): Correlation in length of bursts
;
; Output:
;	sign: Simulated signal
;	sims (optional): Array of modulated frequencies
;	envelope (optional): Array of envelopes of modulation
;	time (optional): Time axis
;
; Modifications:
;	2006.08.13. Pokol: 	burstlength distribution narrowed by a fector of 2
;								added 0.1 to the distribution function of burst magnitude
;-

function pg_sim, bs=bs, dt=dt, trange=trange, burstlength=burstlength, burstdens=burstdens, nburst=nburst, $
	snr=snr, plot=plot, print=print, xcorr=xcorr, mcorr=mcorr, lcorr=lcorr, sims=sims, envelope=envelope,time=time

compile_opt defint32 ; 32 bit integers

; Set defaults
print=keyword_set(print)
xcorr=keyword_set(xcorr)
mcorr=keyword_set(mcorr)
lcorr=keyword_set(lcorr)

if not(keyword_set(burstlength)) then burstlength=32
if not(keyword_set(burstdens)) then burstdens=2

if not(keyword_set(bs)) then bs=[30,100]
bsize=n_elements(bs)

if not(keyword_set(dt)) then dt=0.000003
if not(keyword_set(trange)) then trange=[0,0.1]
simsize=floor((trange[1]-trange[0])/dt)

if not(keyword_set(nburst)) then nburst=floor(simsize/burstlength*burstdens)

if not(keyword_set(snr)) then snr=0

if not(keyword_set(plot)) then plot=0
if plot GE 1 then signplot=1 else signplot=0 		; Plot signal
if plot GE 2 then simplot=1 else simplot=0 		; Plot modulated frequiencies

; Initialize graphics
pg_initgraph,print=print

; Calculate time axis
time=lindgen(simsize)
time=trange[0]+time*dt

; Initialize arrays
sims=dblarr(bsize,simsize)
envelope=dblarr(bsize,simsize)

; Generate modulated frequencies
lburst=floor((randomn(s1,nburst)*burstlength/2+burstlength)>3)
xburst=floor(randomu(s2,nburst)*simsize)
mburst=randomu(s3,nburst)+0.1
for i=0,bsize-1 do begin
	if NOT lcorr then lburst=floor((randomn(s4,nburst)*burstlength/2+burstlength)>3)
	if NOT xcorr then xburst=floor(randomu(s5,nburst)*simsize)
	if NOT mcorr then mburst=randomu(s6,nburst)+0.1
	for j=0,nburst-1 do begin
		burst=(2^(reverse(findgen(lburst[j])/(lburst[j]-1)*96.730024)*0.1)- $
			0.035*2^(reverse(findgen(lburst[j])/(lburst[j]-1)*96.730024)*0.15))/121*mburst[j]
		sims[i,xburst[j]:(xburst[j]+lburst[j])<(simsize)-1]= $
			sims[i,xburst[j]:(xburst[j]+lburst[j])<(simsize)-1]+ $
			burst[0:lburst[j]-((xburst[j]+lburst[j]-(simsize))>0)-1]* $
			sin(bs[i]*1000*2*!PI*time[xburst[j]:(xburst[j]+lburst[j])<(simsize)-1])
		envelope[i,xburst[j]:(xburst[j]+lburst[j])<(simsize)-1]= $
			envelope[i,xburst[j]:(xburst[j]+lburst[j])<(simsize)-1]+ $
			burst[0:lburst[j]-((xburst[j]+lburst[j]-(simsize))>0)-1]
	endfor
	if simplot then begin
		title='Modulated frequency: '+pg_num2str(bs[i])+' kHz'
		if print then device,filename=pg_filename(title) else window,/free
		plot,time,sims[i,*],xstyle=1,title=title,xtitle='Time (s)'
	endif
endfor

sign=total(sims,1)

; Add noise
if snr then begin
	amp=sqrt(total(sign^2)/simsize/snr)
	sign=sign+amp*randomn(seed,simsize)
endif

if signplot then begin
	title='Simulated signal'
	if print then device,filename=pg_filename(title) else window,/free
	plot,time,sign,xstyle=1,title=title,xtitle='Time (s)'
endif

sims=sims
envelope=envelope

return,sign

if print then device,/close

end
