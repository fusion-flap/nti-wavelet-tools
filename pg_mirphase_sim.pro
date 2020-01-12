;+
; Name: pg_mirphase_sim
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2005.04.07.
;
; Purpose: Simulate all 16 Mirnov-signals
;
; Calling sequence:
;  sig_mir=pg_mirphase_sim(timeax=timeax,trange=trange)
;
; Inputs:
;  num: number of simulated channels
;  theta: phase position of channels in degree
;  timeax: time axis of the simulated signal
;  timerange: timerange of the simulated signal
;
; Output:
;  sig_mir: array of all 16 simulated Mirnov-signals
;
;-


function pg_mirphase_sim, num, theta, timeax=timeax, trange=trange

nti_wavelet_default, num, 16
nti_wavelet_default, shot, 1
nti_wavelet_default,sampletime,5e-6
nti_wavelet_default,t_drop,2e-6
nti_wavelet_default,t_rec,2e-6
nti_wavelet_default,a_drop,1
nti_wavelet_default,f_forg,0
nti_wavelet_default,f_mhd,2000
nti_wavelet_default,m,3.
nti_wavelet_default,n_event,1
nti_wavelet_default,trange,[0.4,0.6]
nti_wavelet_default,theta,[10,30,50,85,100,120,145,165,185,200,220,255,275,305,340,355]/360.*2*!PI
nti_wavelet_default,snr,0.5

np = long((trange[1]-trange[0])/sampletime)
t = findgen(np)
amp_mir = fltarr(np)
sig_mir = fltarr(num,np)

timeax=trange[0]+t*sampletime

;seed = systime(1) mod 12345
for i=0,n_event-1 do begin
  j=0
  while 1 do begin
    j=j+1
    if j gt 10000 then return,-1
    t_start = long(randomu(seed)*np)
    t1 = t_start
    t2 = t_start+long(t_rec*10/sampletime) < np-1
    if ((where(amp_mir[t1:t2] gt a_drop*0.3))[0] lt 0) then break
  endwhile
  t_event_mir = (findgen(t2-t_start+1))*sampletime
  ampevent_mir = a_drop*(1-exp(-t_event_mir/t_drop))*exp(-t_event_mir/t_rec)
  amp_mir[t1:t2] = amp_mir[t1:t2] + ampevent_mir
  for k=0,num-1 do begin
     event_mir=ampevent_mir*sin(m*f_forg*2.*!PI*float(t_event_mir)-f_mhd*2.*!PI*float(t_event_mir)+m*theta[k]) ; Hullam egy iranyba
;     event_mir=ampevent_mir*cos(m*f_forg*2.*!PI*float(t_event_mir)+m*theta[k])*sin(f_mhd*2.*!PI*float(t_event_mir)) ; Allohullam
;     event_mir=ampevent_mir*cos(m*f_forg*2.*!PI*float(t_event_mir)+m*theta[k]) ; Fix struktura
     sig_mir[k,t1:t2] = sig_mir[k,t1:t2] + event_mir
  endfor
endfor

if snr then begin
	amp=sqrt(total(sig_mir[0,*]^2)/np/snr)
  for k=0,num-1 do begin
     sig_mir[k,*] = sig_mir[k,*] + amp*randomn(seed,np)
  endfor
endif

return,sig_mir

end
