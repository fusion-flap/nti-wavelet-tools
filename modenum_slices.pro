;+
;NAME: modenum_slices
;
; Written by: Nora Lazanyi (laznor@reak.bme.hu) 2010.07.28.
;
; Purpose: Plot mode numbers at a given time and frequency as a function of frequency or time
;
; Calling sequence: 
; modenum_slices, modenum, timeax, freqax, time=time, freq=freq, shot=shot, $
;  print=print, plottedtime=plottedtime, plottedfreq=plottedfreq
;
;  Hint: Before using modenum_slices one sould run a process for mode number determination $
;    for example pg:modenumber_full
;
; Inputs:
;   modenum: Mode numbers
;   timeax: Time axis
;   freqax: Frequency axis
;   time: Time 
;   freq: Frequency
;   shot: Shot number
;   print (optional): creates .eps files from the graphs 
;
; Outputs:
;  plottedtime: mode numbers as a function of time
;  plottedfreq: mode numbers as a function of frequency
;
;Example:
;  restore,'data/AUG_modenumbers_23418_33200_pairs_order_3_avr_3_mn_frac.sav'
;  modenum_slices, modenum, timeax, freqax, time=3.324, freq=1.8, shot=23418, /print
;-



pro modenum_slices, modenum, timeax, freqax, time=time, freq=freq, shot=shot, print=print, $
plottedtime=plottedtime ,plottedfreq=plottedfreq

compile_opt defint32 ; 32 bit integers

; Set defaults
print=keyword_set(print)
if not(keyword_set(shot)) then shot=0
if not(keyword_set(time)) then time=-1
if not(keyword_set(freq)) then freq=-1

; Extract phases at given time and frequency
freqpos=where(abs(freqax-freq) EQ min(abs(freqax-freq)))
freqpos=freqpos(0)
freq=freqax(freqpos)
timepos=where(abs(timeax-time) EQ min(abs(timeax-time)))
timepos=timepos(0)
time=timeax(timepos)

;Initialize graphics
pg_initgraph,print=print
title0='Modenumbers: #'+nti_wavelet_i2str(shot)+' '+pg_num2str(time)+'s '+pg_num2str(freq,length=4)+'kHz'

;Plot mode numbers at a given time as a function of frequency
if time ge 0 then begin
 loadct,1
 cmin=0
 cmax=220
 printdatas='shot: ' + nti_wavelet_i2str(shot)
 title=title0+' time slice'
 if print then device,filename=pg_filename(title) else window,/free
 plottedtime=modenum(timepos,*)
 plot, freqax,plottedtime, title=title, xtitle= 'Frequency (kHz)',xrange=[min(freqax),max(freqax)], ytitle='Mode numbers',$
   yrange=moderange, charsize=2, charthick=2., thick=4, xstyle=1
endif

;Plot mode numbers at a given frequency as a function of time
if freq ge 0 then begin
 loadct,1
 cmin=0
 cmax=220
 printdatas='shot: ' + nti_wavelet_i2str(shot)
 title=title0+' freq slice'
 if print then device,filename=pg_filename(title) else window,/free
 plottedfreq=modenum(*,freqpos)
 plot, timeax, plottedfreq, title=title, xtitle= 'Time (s)',xrange=[min(timeax),max(timeax)], ytitle='Mode numbers',$
   yrange=moderange, charsize=2, charthick=2., thick=4, xstyle=1
endif

if print then device,/close
print, 'mean:'
print, mean(plottedfreq)
print, 'standard deviation:'
print, stddev(plottedfreq)
plottedtime=plottedtime
plottedfreq=plottedfreq



end