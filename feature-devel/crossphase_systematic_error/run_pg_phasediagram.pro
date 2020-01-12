pro run_pg_phasediagram

pg_initgraph
loadct, 5


; "Read" data from saved NTI WT processed data
restore, '23824_corrected_minus_modes.sav'

;cphases:
  crosstr = *saved_datablock.crosstransforms
  cphases = atan(crosstr , /phase)
;ctransf:
  ctransf = abs(crosstr)
;chpos:
  chpos = 180*(*(saved_datablock.phi))/!dpi ;in degrees
;   chpos = [chpos(0),chpos(2)]
;   chpos = chpos(0:2)
;timeax:
  timeax = *(saved_datablock.transf_timeax)
;freqax:
  freqax = *(saved_datablock.transf_freqax)
;shot:
  shot = saved_datablock.shotnumber
;channels:
  channels = *(saved_datablock.channels)
;   channels = [channels(0),channels(2)]
;   channels = channels(0:2)


; Run ridge following algorithm:
;*********************************************************
;Parameters
matrix = reform(ctransf(0, *, *))
xaxis = timeax
yaxis = freqax
start_x = 1.28
start_y = [130, 140]
bandwidth = 2
;*********************************************************
;Run:
nti_wavelet_ridge_follower, matrix, xaxis = xaxis, yaxis = yaxis, $
  start_x = start_x, start_y = start_y, $
  bandwidth = bandwidth, ridge_index=ridge_index, ridge_unit=ridge_unit
;*********************************************************

; Check ridge:
contour, reform(ctransf(0, *, *))^0.2, timeax, freqax, nlevels = 30, /fill, /xstyle, /ystyle
oplot, timeax, ridge_unit
stop

; Run phasediagram:
;*********************************************************
;Parameters:
filters = 10
filterparam2 = [-100, 100]
time = timeax(2000)
freq = ridge_unit(2000)


print = 1
;*********************************************************
;Run:
pg_phasediagram, cphases, chpos, timeax, freqax, time, freq, shot=shot, channels=channels, filters=filters,$
	 filterparam1=filterparam1, filterparam2=filterparam2, print=print, cpows=cpows, cohs=cohs
;*********************************************************

end