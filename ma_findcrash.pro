; Name: ma_findcrash
;
; Written by: Magyarkuti Andras (amagyarkuti@gmail.com) 2010.02.12
;
; Purpose: Finds the sawtooth crashes
;
; Calling sequence:
; ma_findcrash, shot, channel [, datapath] [,trange] [,threshold] [,frange] [,res] [,windowsize] [,windowname]
; [,masksize] [,step] [,fres] [,opt] [,fmax] [,save]
;
; Inputs:
; shot: shot number
; channel: channel name
; datapath: location of data
; trange: time interval
; threshold: limit=average signal * threshold
; frange: frequency band
;
; Output: crash times in the interval of trange are written to file

pro ma_findcrash, shot,channel,datapath=datapath,trange=trange,frange=frange, threshold=threshold, res=res,windowsize=windowsize $
,windowname=windowname,masksize=masksize,step=step,fres=fres,opt=opt,fmax=fmax,save=save,times=times

;Setting defaults
if not(keyword_set(datapath)) then datapath='./data/'
if not(keyword_set(save)) then save=0
if not(keyword_set(threshold)) then threshold=10
if not(keyword_set(frange)) then frange=[1,3]

if not(keyword_set(res)) then begin
  if not(keyword_set(fres)) then fres=1
  if not(keyword_set(step)) then step=20
  if not(keyword_set(windowsize)) then windowsize=100
  if not(keyword_set(masksize)) then masksize=4*windowsize
  if not(keyword_set(windowname)) then windowname='Gauss'
  if not(keyword_set(opt)) then opt=0.1
  if not(keyword_set(fmax)) then fmax=40
endif else begin
  if res eq 'low' then begin
    if not(keyword_set(fres)) then fres=1
    if not(keyword_set(step)) then step=20
    if not(keyword_set(windowsize)) then windowsize=100
    if not(keyword_set(masksize)) then masksize=2*windowsize
    if not(keyword_set(windowname)) then windowname='Gauss'
    if not(keyword_set(opt)) then opt=0.1
    if not(keyword_set(fmax)) then fmax=40
  endif
  if res eq 'high' then begin
    if not(keyword_set(fres)) then fres=1
    if not(keyword_set(step)) then step=10
    if not(keyword_set(windowsize)) then windowsize=200
    if not(keyword_set(masksize)) then masksize=4*windowsize
    if not(keyword_set(windowname)) then windowname='Gauss'
    if not(keyword_set(opt)) then opt=0.1
    if not(keyword_set(fmax)) then fmax=40
  endif
  if res eq 'no' then begin
  endif
endelse

;Reading data
getchannel=channel
get_rawsignal,shot,getchannel,orig_timeax,orig_data,trange=trange,datapath=datapath

if not keyword_set(trange) then trange=[orig_timeax[0],orig_timeax[n_elements(orig_timeax)-1]]

crasht=0

;Separating to shorter time ranges
ctrange=[0,0.5]
j=0
dt=0.001/fmax
side=3*windowsize*dt

while ctrange[1] le trange[1] do begin
   ctrange=[0.5*j-side,0.5*(1+j++)+side+0.5/fmax]

   if ctrange[0] lt trange[0] then ctrange[0]=trange[0]
   if ctrange[1] gt trange[1] then ctrange[1]=trange[1]

   timeax=orig_timeax
   data=orig_data

;Calculates and Plots the Spectrogram
  pg_initgraph
  tmax=ctrange[1]-0.5/fmax

  stft = pg_spectrogram_sim(data,timeax,shot=shot,channel=channel,windowname=windowname, trange=ctrange,$
               windowsize=windowsize,step=step,freqres=fres,plot=1,opt=opt,freqax=freqax,fmax=fmax,/print)

   if (keyword_set(frange)) then begin ;setting the desired frequency range
      stft = ma_freqcut(stft,frange,freqax)
   endif else begin
      stft = ma_freqcut(stft,[0,max(freqax)],freqax)
   endelse

;Calculating Band Power
  ind=[max(where(timeax le ctrange[0]+side)),min(where(timeax ge tmax-side))]
  data=data[ind[0]:ind[1]]
  timeax=timeax[ind[0]:ind[1]]
  stft=stft[ind[0]:ind[1],*]

   pg_anal2, stft, frange, freqax=freqax, timeax=timeax, bp=bp, /nosum ;bp - band power vector

;Searching for peaks
   limit=total(bp)/n_elements(bp)*threshold ;setting amplitude limit

   for i=1,n_elements(bp)-2 do begin
      if (bp[i] gt limit and bp[i] gt bp[i-1] and bp[i] gt bp[i+1]) then begin
         crasht=[crasht,timeax[i]]
      endif  
   endfor

;Plotting Band Power over time 
   limitvec=fltarr(n_elements(timeax), /nozero)
   limitvec[*]=limit

   pg_initgraph, /print
   device, filename='./output/bp'+'_'+pg_num2str(shot,length=5)+'_'+pg_num2str(ctrange[0],length=4)+'-'+pg_num2str(ctrange[1],length=4)+'.eps'
   plot, timeax, bp, xtitle='time (sec)', ytitle='Band Power', yrange=[min(bp)-(max(bp)-min(bp))/10,max(bp)+(max(bp)-min(bp))/10], xstyle=1, ystyle=1
   oplot, timeax, limitvec, linestyle=5
   device, /close
endwhile

if n_elements(crasht) eq 1 then begin
  print, 'No crash found!'
endif else begin

  crasht=crasht[1:n_elements(crasht)-1]
  crasht=crasht[sort(crasht)]
  crasht=crasht[uniq(crasht)]

  print, 'Crash Times:'
  print, crasht

  if save eq 1 then begin
    filename=pg_num2str(shot)+strmid(getchannel,8)+'crasht_t_'+pg_num2str(trange[0],length=4)+'-'+pg_num2str(trange[1],length=4)+'.sav'
    save, crasht, frange, threshold, filename=filename
  endif

endelse

end
