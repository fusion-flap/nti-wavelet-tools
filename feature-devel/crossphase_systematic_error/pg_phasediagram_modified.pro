; CALLING SEQUENCE:
; pg_phasediagram, cphases, chpos, timeax, freqax, time, freq [,filters]$
;    [,cphaserr=cphaserr]
;
; INPUTS:
;   cphases: Cross-phases
;   chpos: channel positions in degrees; default: W7-AS Mirnov/MIR-1 coils
;   timeax: Time axis
;   freqax: Frequency axis
;   time: Time of phase diagram
;   freq: Frequency of phase diagram
;   shot (optional): shot number
;   cphaserr (optional): Cross-phases error (only with filter 11 & 12)

pro pg_phasediagram_modified, cphases, chpos, timeax, freqax, time, freq, filters=filters,$
  cphaserr=cphaserr,$
;output
  phases_and_pos = phases_and_pos

compile_opt defint32 ; 32 bit integers

; Set defaults
if not(keyword_set(filters)) then filters=[12]
channelssize=n_elements(chpos)
crosssize=channelssize*(channelssize-1)/2
if crosssize NE n_elements(cphases(*,0,0)) then begin
  print,'Wrong input data dimensions!'
endif

; Extract phases at given time and frequency
freqpos=where(abs(freqax-freq) EQ min(abs(freqax-freq)))
freqpos=freqpos(0)
freq=freqax(freqpos)
timepos=where(abs(timeax-time) EQ min(abs(timeax-time)))
timepos=timepos(0)
time=timeax(timepos)
; Create array for phase diagrams with different reference channels
phases0=fltarr(channelssize,channelssize)
; Fill array from input
for i=0,channelssize-1 do begin
  for j=i+1,channelssize-1 do begin
    phases0(i,j)=cphases(i*(channelssize-(i+1)/2.)-(i+1)+j,timepos,freqpos)
    phases0(j,i)=-cphases(i*(channelssize-(i+1)/2.)-(i+1)+j,timepos,freqpos)
  endfor
endfor
; Translate phase diagrams to start from (0,0)
for i=1,channelssize-1 do begin
  phases0(i,*)=phases0(i,*)+(cphases(0*(channelssize-(0+1)/2.)-(0+1)+i,timepos,freqpos))(0)
endfor
chpos=chpos-chpos(0)

if where(filters EQ 12) GT -1 then begin
  ; Set defaults
  modestep=1.
  moderange=[-channelssize,channelssize]
  phase_errors=reform(cphaserr(*,timepos,freqpos))
  phases=reform(cphases(*,timepos,freqpos))
  ; Calculate relative channel positions
  cchpos=fltarr(crosssize)
  for i=0,channelssize-1 do begin
    for j=i+1,channelssize-1 do begin
      cchpos(i*(channelssize-(i+1)/2.)-(i+1)+j,*,*)=chpos(j)-chpos(i)
      if cchpos(i*(channelssize-(i+1)/2.)-(i+1)+j,*,*) LT 0 then $
        cchpos(i*(channelssize-(i+1)/2.)-(i+1)+j,*,*)=360+$
        cchpos(i*(channelssize-(i+1)/2.)-(i+1)+j,*,*)
    endfor
  endfor
  ; Change channel position range to [0,pi]
  for i=0, crosssize-1 do begin
    if cchpos(i) GT 180 then begin
      cchpos(i) = 360 - cchpos(i)
      phases(i) = -phases(i)
    endif
  endfor
  
  ; Calculate weights for most fitting linear
  inv_sq=1/(phase_errors*phase_errors)
  weight=inv_sq*(1/total(inv_sq))
  ; Convert to Pi units
  cchposfit=cchpos/360.*2
  phasesfit=phases/!Pi
  errorsfit=phase_errors/!Pi
  inv_sqpi=inv_sq/!Pi
  ; Select most fitting modenumber &
  ; Calculate chi_square test result for each modenumber
  m=findgen((moderange(1)-moderange(0))/modestep+1)*modestep+moderange(0)
  msize=n_elements(m)
  chisq=fltarr(msize)
  q=fltarr(msize)
  for i=0,msize-1 do begin
    if m(i) EQ 0 then lin=cchposfit*0 $
      else lin=((m(i)*(cchposfit+1./abs(m(i)))) mod 2 )-m(i)/abs(m(i))
    q(i)=total(weight*((phasesfit-lin)^2)<(weight*(2-abs(phasesfit-lin))^2))
  endfor
  qfit=min(q)
  mfit=m(where(q EQ qfit))
  mfit=mfit(0)
  ; Calculate diff between measured, and expected values
  if mfit EQ 0 then lin=cchposfit*0 $
      else lin=((mfit*(cchposfit+1./abs(mfit))) mod 2 )-mfit/abs(mfit)

  diff =phasesfit-lin
  n=n_elements(diff)
  for i=0, n-1 do begin
    if abs(diff(i)) gt 1 then diff(i)=-2*diff(i)/abs(diff(i))+diff(i)
  endfor
    
  
  ; All the units measured in pi units (radian)
  phases_and_pos = fltarr(3,crosssize)
  phases_and_pos(0,*)=cchposfit
  phases_and_pos(1,*)=phasesfit
  phases_and_pos(2,*)=diff
  
endif

end