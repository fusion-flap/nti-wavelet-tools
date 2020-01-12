pro nti_wavelet_systematic_errors_stat,$
;INPUT(S):
  energy_density, timeax, freqax,crosstransforms, chpos,$
       errors, t_start=t_start, t_end=t_end, bandwidth=bandwidth, start_indeces_y=start_indeces_y,modenumber=modenumber,$
;OUTPUT(S):       
  cphase_time_dev = cphase_time_dev, avg=avg, var=var,$
;OPTIONAL:
  print=print

;inputs:
;      for nti_wavelet_ridge_follower:
;  -energy_density
;  -xrange_unit
;  -timeax
;  -freqax
;  -bandwidth
;      for pg_phasediagram_modified:
;  -crosstransforms
;  -chpos (°)
;  -timeax
;  -freqax
;  -cphaserr
;
;EXAMPLE CALLING: nti_wavelet_systematic_errors_stat
;    restore, 'C:\Documents and Settings\PETI\Asztal\AUG_23824_bal_tor_1.27s-1.37s_phases-and-errors_0.1_mean.sav'
;    nti_wavelet_systematic_errors_stat, energy_density, timeax, freqax, crosstransforms, phi*180/(!pi), phase_errors, cphase_time_dev=cphase_time_dev, /print
;
;Mode number    Freq_Range    Bandwidth    Time_Unit
;  -3            345,355          3        1.27-1.305        
;  -4            365,372          3        1.27-1.37
;  -5            393,397          2        1.29-1.37

print=keyword_set(print)
pg_initgraph, print=print
title0='Mode number time development'

first = (where((timeax-t_start) eq min(timeax-t_start, /abs)))
last = (where((timeax-t_end) eq min(timeax-t_end, /abs)))
if first ne -1 then begin
  if last ne -1 then begin
; First we find the ridge of the energy_density (for each probe it's almost the same (should be the avg of six))
    matrix = reform(energy_density(0,*,*))
    nti_wavelet_ridge_follower, matrix, xaxis=timeax, yaxis=freqax, xrange_unit=[t_start,t_end], start_index_y=start_indeces_y,$
      bandwidth=bandwidth, ridge_index=ridge_index, ridge_unit=ridge_unit

; Make an array for ridge's & rel_phases' & rel_probe_pos' & diff between measured & expected values time development
    n1=n_elements(ridge_unit)
    n2=n_elements(chpos)*(n_elements(chpos)-1)/2
    cphase_time_dev=fltarr(n1,3,n2)
	avg=fltarr(n2)
	var=fltarr(n2)

; Calculate rel_phases, rel_pos at each timeposition
; cphase_time_dev(i,0,*) for rel channel position
; cphase_time_dev(i,1,*) for phases
; cphase_time_dev(i,2,*) for difference between measured and expected values in rel. probe position
    cphases=atan(crosstransforms, /phase)
    for i=first(0), last(0)-1  do begin
      pg_phasediagram_modified, cphases, chpos, timeax, freqax, timeax(i), ridge_unit(i), cphaserr=errors, phases_and_pos = phases_and_pos
      cphase_time_dev(i,0,*)=phases_and_pos(0,*)
      cphase_time_dev(i,1,*)=phases_and_pos(1,*)
      cphase_time_dev(i,2,*)=phases_and_pos(2,*)/modenumber(0)
    endfor

	for i=0, n2(0)-1 do begin
		index=where(cphase_time_dev(*,2,i) ne 0)
		n=n_elements(index)
		avg(i)=total(cphase_time_dev(*,2,i))/n
		var(i)=stddev(cphase_time_dev(index,2,i))
	endfor
  endif
endif

; Plot difference between measured and expected rel.phases as an output (if /print)
if print then begin
  loadct, 1
  for i=0, n2-1 do begin
    title=title0+'rf'
    device,filename=pg_filename(title)
    plot, timeax, cphase_time_dev(*,2,i), xstyle=1, title=title0, xtitle='IDo [s]',$
      ystyle=1, ytitle='Szonda poz. diff[Pi]', charsize=4., thick=8
      device,/close
      wait, 0.2
  endfor
endif

end
