;+
; Name: pg_simnoise
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2006.08.13.
;
; Purpose: Generate Simulation Figure for publication showing the effect of noise
;
; Calling sequence:
;	pg_simnoise [,/print]
;
; Input:
;	/print: Generate ps file
;
; Output: -
;-

pro pg_simnoise, print=print

compile_opt defint32 ; 32 bit integers

; Set defaults
print=keyword_set(print)
trange=[0,0.4]
b=[10,25,35,50,70,100]
;b=[10,35,50,70,100]
bs=[50,70]
bands=[22,27,32,37]
corrlength=0.003
nsegment=30
snr=1/33.
simplot=-1
stftplot=-1
anal2plot=-1
anal3plot=0
dstep=20
nodiv=0

sign1=pg_sim(bs=b,trange=trange,envelope=envelope1,time=time1,burstlength=50,burstdens=2, $
	/xcorr,snr=0,plot=simplot,print=print)
sign2=pg_sim(bs=b,trange=trange,envelope=envelope2,time=time2,burstlength=50,burstdens=2 $
	,snr=0,plot=simplot,print=print)

matrix=pg_spectrogram_sim(sign1,time1,windowsize=100,masksize=400,freqres=1,freqax=freqax1, $
	plot=stftplot,print=print)
;matrix=pg_scalogram_sim(sign1,time1,order=32,dscale=0.05,freqax=freqax1,plot=-1)
pg_anal2,matrix,bands,timeax=time1,freqax=freqax1,plot=anal2plot,bp=bp1,print=print,/nosum
pg_anal3,bp1,bands,timeax=time1,corrlength=corrlength,plot=anal3plot, $
	acorr=acorr1, aerr=aerr1, ccorr=ccorr1, cerr=cerr1, nsegment=nsegment1,print=print,nodiv=nodiv

matrix=0
matrix=pg_spectrogram_sim(sign2,time2,windowsize=100,masksize=400,freqres=1,freqax=freqax2, $
	plot=stftplot,print=print)
;matrix=pg_scalogram_sim(sign2,time2,order=32,dscale=0.05,freqax=freqax2,plot=-1)
pg_anal2,matrix,bands,timeax=time2,freqax=freqax2,plot=anal2plot,bp=bp2,print=print,/nosum
pg_anal3,bp2,bands,timeax=time2,corrlength=corrlength,plot=anal3plot, $
	acorr=acorr2, aerr=aerr2, ccorr=ccorr2, cerr=cerr2, nsegment=nsegment2,print=print,nodiv=nodiv

; Add noise
amp=sqrt(total(bp1[0,*])/n_elements(sign1)/snr)
sign1=sign1+amp*randomn(seed1,n_elements(sign1))
amp=sqrt(total(bp2[0,*])/n_elements(sign2)/snr)
sign2=sign2+amp*randomn(seed2,n_elements(sign2))

matrix=pg_spectrogram_sim(sign1,time1,windowsize=100,masksize=400,freqres=1,freqax=freqax1, $
	plot=stftplot,print=print)
;matrix=pg_scalogram_sim(sign1,time1,order=32,dscale=0.05,freqax=freqax1,plot=-1)
pg_anal2,matrix,bands,timeax=time1,freqax=freqax1,plot=anal2plot,bp=bp1,print=print,/nosum
pg_anal3,bp1,bands,timeax=time1,corrlength=corrlength,plot=anal3plot, $
	acorr=acorr1n, aerr=aerr1n, ccorr=ccorr1n, cerr=cerr1n, nsegment=nsegment1,print=print,nodiv=nodiv

matrix=0
matrix=pg_spectrogram_sim(sign2,time2,windowsize=100,masksize=400,freqres=1,freqax=freqax2, $
	plot=stftplot,print=print)
;matrix=pg_scalogram_sim(sign2,time2,order=32,dscale=0.05,freqax=freqax2,plot=-1)
pg_anal2,matrix,bands,timeax=time2,freqax=freqax2,plot=anal2plot,bp=bp2,print=print,/nosum
pg_anal3,bp2,bands,timeax=time2,corrlength=corrlength,plot=anal3plot, $
	acorr=acorr2n, aerr=aerr2n, ccorr=ccorr2n, cerr=cerr2n, nsegment=nsegment2,print=print,nodiv=nodiv

; Set constants
timeax=time1

; Calculate x axis for correlation plotting
x=lindgen(n_elements(timeax))-ceil(n_elements(timeax)/2.)+1
x=x*(timeax[2]-timeax[1])
; Calculate plotted range from corrlength
if not(keyword_set(corrlength)) then corrlength=max(x)+1
ind=where((x ge -corrlength) and (x le corrlength))
indsize=n_elements(ind)

; Calculate segmentation
segment=n_elements(timeax)/nsegment

; Calculate x axis for segments
xs=lindgen(segment)-ceil(segment/2.)+1
xs=xs*(timeax[2]-timeax[1])
; Calculate plotted range from corrlength
inds=where((xs ge -corrlength) and (xs le corrlength))

; Calculate crosscorrelations for envelopes
corr1=pg_ccorr(envelope1[1,*],envelope1[2,*],/fast)
corr2=pg_ccorr(envelope2[1,*],envelope2[2,*],/fast)
err1=pg_ccorrerremp2(envelope1[1,*],envelope1[2,*],segment,nodiv=nodiv)
err2=pg_ccorrerremp2(envelope2[1,*],envelope2[2,*],segment,nodiv=nodiv)
;ccorr1=pg_ccorr(envelope1[1,*]^2,envelope1[2,*]^2,/fast)
;ccorr2=pg_ccorr(envelope2[1,*]^2,envelope2[2,*]^2,/fast)
;cerr1=pg_ccorrerremp2(envelope1[1,*]^2,envelope1[2,*]^2,segment,nodiv=nodiv)
;cerr2=pg_ccorrerremp2(envelope2[1,*]^2,envelope2[2,*]^2,segment,nodiv=nodiv)

; Initialize graphics
pg_initgraph,print=print;,/portrait

if print then device,filename=pg_filename('simnoise') else window,/free
!P.MULTI=[0,2,3,0,0]
!P.CHARSIZE=3.0
!P.THICK=2.
!P.FONT=0

x=x*1000

title='Simulated corr. CCF'
plot, x[ind], corr1[ind], title=title, xstyle=1, xtitle='Time (ms)',yrange=[-0.1,1]
errplot, pg_downsample(x[ind],step=dstep), $
	pg_downsample(corr1[ind],step=dstep)-pg_downsample(err1[inds],step=dstep), $
	pg_downsample(corr1[ind],step=dstep)+pg_downsample(err1[inds],step=dstep), $
	width=0.002

title='Simulated uncorr. CCF'
plot, x[ind], corr2[ind], title=title, xstyle=1, xtitle='Time (ms)',yrange=[-0.1,1]
errplot, pg_downsample(x[ind],step=dstep), $
	pg_downsample(corr2[ind],step=dstep)-pg_downsample(err2[inds],step=dstep), $
	pg_downsample(corr2[ind],step=dstep)+pg_downsample(err2[inds],step=dstep), $
	width=0.002

title='Reconstructed corr. CCF'
plot, x[ind], ccorr1[ind], title=title, xstyle=1, xtitle='Time (ms)',yrange=[-0.1,1]
errplot, pg_downsample(x[ind],step=dstep), $
	pg_downsample(ccorr1[ind],step=dstep)-pg_downsample(cerr1[inds],step=dstep), $
	pg_downsample(ccorr1[ind],step=dstep)+pg_downsample(cerr1[inds],step=dstep), $
	width=0.002

title='Reconstructed uncorr. CCF'
plot, x[ind], ccorr2[ind], title=title, xstyle=1, xtitle='Time (ms)',yrange=[-0.1,1]
errplot, pg_downsample(x[ind],step=dstep), $
	pg_downsample(ccorr2[ind],step=dstep)-pg_downsample(cerr2[inds],step=dstep), $
	pg_downsample(ccorr2[ind],step=dstep)+pg_downsample(cerr2[inds],step=dstep), $
	width=0.002

title='Reconstructed corr. CCF (SNR=1)'
plot, x[ind], ccorr1n[ind], title=title, xstyle=1, xtitle='Time (ms)',yrange=[-0.1,1]
errplot, pg_downsample(x[ind],step=dstep), $
	pg_downsample(ccorr1n[ind],step=dstep)-pg_downsample(cerr1n[inds],step=dstep), $
	pg_downsample(ccorr1n[ind],step=dstep)+pg_downsample(cerr1n[inds],step=dstep), $
	width=0.002

title='Reconstructed uncorr. CCF (SNR=1)'
plot, x[ind], ccorr2n[ind], title=title, xstyle=1, xtitle='Time (ms)',yrange=[-0.1,1]
errplot, pg_downsample(x[ind],step=dstep), $
	pg_downsample(ccorr2n[ind],step=dstep)-pg_downsample(cerr2n[inds],step=dstep), $
	pg_downsample(ccorr2n[ind],step=dstep)+pg_downsample(cerr2n[inds],step=dstep), $
	width=0.002

!P.MULTI=0
!P.CHARSIZE=1.0
!P.THICK=1.
!P.FONT=-1

if print then device,/close

end
