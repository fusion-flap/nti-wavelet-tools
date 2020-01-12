;+
;NAME: pg_probe_sets
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2007.12.29.
;
; PURPOSE: Give channel names and angular coordinates of probes in a probe array.
; 	Uses file data/angle.dat.##### for AUG_mirnov probes.
;
; INPUTS:
;	set: index of probe set, available:
;		0: AUG B31 poloidal array
;		1: AUG B31 toroidal array
;		2: AUG C09 poloidal array
;		3: AUG B31 approximate toroidal array
;		4: AUG B31 approximate toroidal array without B31-03
;   5: AUG B31 approximate toroidal array with B31-02
;   6: AUG B31 approximate toroidal array without B31-01
;   7: AUG B31 approximate toroidal array with B31-02 without B31-03
;		10: W7-AS MIR-1 poloidal array
;		11: W7-AS simulated MIR-1 poloidal array
; shot (optional): shot number
;
; OUTPUT:
;	channels (optional): channel names
;	chpos (optional): angular coordinates
;	chradial (optional): minor radial coordinates
;	chR (optional): major radial coordinates
;	chZ (optional): vertical coordinates
;
; EXAMPLE:
;   pg_probe_sets,4,channels=channels,chpos=chpos,shot=shot
;-

pro pg_probe_sets,set,shot=shot,channels=channels,chpos=chpos,chradial=chradial,chR=chR,chZ=chZ

if not(keyword_set(shot)) then shot=0

channels=['']
chpos=['']
chradial=['']
chR=['']
chZ=['']

; read W7-AS magnetic probe data
W7AS_chpos_pol=[10,30,50,85,100,120,145,165,185,200,220,255,275,305,340,355,$
	5,60,115,160,195,240,270,320,20,65,105,140,180,210,265,315,0,0,10,5,20]
W7AS_chpos_tor=[13.5,13.5,13.5,13.5,13.5,13.5,13.5,13.5,13.5,13.5,13.5,13.5,$
	13.5,13.5,13.5,13.5,129,129,129,129,129,129,129,129,303.5,303.5,303.5,303.5,$
	303.5,303.5,303.5,303.5,194.7,230.5,13.5,129,303.5]
W7AS_chradial=[0.2785,0.3285,0.3880,0.3645,0.3190,0.2730,0.2480,0.2505,0.2725,$
	0.3040,0.3640,0.3910,0.3310,0.2615,0.2460,0.2560,0.2465,0.2655,$
	0.4050,0.2910,0.2450,0.2755,0.3540,0.3460,0.2885,0.4015,0.3115,$
	0.2500,0.2570,0.3170,0.3625,0.2440,0.2810,0.2550,0.2785,0.2465,0.2885]
W7AS_chR=[2.2913,2.3015,2.2664,2.0488,1.9616,1.8805,1.8139,1.7750,1.7455,$
	1.7313,1.7382,1.9158,2.0458,2.1670,2.2482,2.2720,2.2726,2.1598,$
	1.8558,1.7535,1.7903,1.8893,2.0270,2.2921,2.2981,2.1967,1.9464,$
	1.8355,1.7700,1.7525,1.9954,2.1995,2.3080,2.2820,2.2913,2.2726,2.2981]
W7AS_chZ=[0.0484,0.1643,0.2972,0.3631,0.3142,0.2364,0.1422,0.0648,-0.0237,-0.1040,$
	-0.2340,-0.3777,-0.3297,-0.2142,-0.0841,-0.0223,0.0215,0.2299,0.3671,0.0995,$
	-0.0634,-0.2386,-0.3540,-0.2224,0.0987,0.3639,0.3009,0.1607,0.0000,-0.1585,$
	-0.3611,-0.1725,0.0000,0.0000,0.0484,0.0215,0.0987]

; read AUG magnetic probe data
if where([0,1,2,3,4,5,6,7,8,9] EQ set) GT -1 then begin
  datafiles=FILE_SEARCH('data','angle.dat.*')
  datashots=fix(strmid(datafiles,11))
  closest=datafiles[max([0,where(datashots LT shot)])] ; Search for the closest data file given before the shot
  probedata=pi_loadncol(closest,headerline=2,/stringout)
  AUG_chnames=probedata(*,0)
	AUG_chpos_pol=float(probedata(*,2))/2./!PI*360
	AUG_chpos_tor=float(probedata(*,1))/2./!PI*360
	AUG_chR=float(probedata(*,3))
	AUG_chZ=float(probedata(*,4))
	AUG_chradial=sqrt(AUG_chR^2+AUG_chZ^2)
endif

case set of
	0: begin ; AUG B31 poloidal array
   		channels='B31-'+['05','06','07','02','08','09','10']
   		n=n_elements(channels)
   		index=intarr(n)
   		for i=0,n-1 do begin
   			index(i)=where(strcmp(AUG_chnames,channels(i)))
   		endfor
		chpos=AUG_chpos_pol(index)
   		chradial=AUG_chradial(index)
   		chR=AUG_chR(index)
   		chZ=AUG_chZ(index)
   		channels='AUG_mirnov/'+channels
	end
	1: begin ; AUG B31 toroidal array
   		channels='B31-'+['12','13','14']
   		n=n_elements(channels)
   		index=intarr(n)
   		for i=0,n-1 do begin
   			index(i)=where(strcmp(AUG_chnames,channels(i)))
   		endfor
		chpos=AUG_chpos_tor(index)
   		chradial=AUG_chradial(index)
   		chR=AUG_chR(index)
   		chZ=AUG_chZ(index)
   		channels='AUG_mirnov/'+channels
	end
	2: begin ; AUG C09 poloidal array
   		channels='C09-'+['01','02','03','04','05','06','07','08','09','10','11','12','14',$
   			'15','16','17','18','20','21','22','23','24','25','26','27','28','29','30','31','32']
   		n=n_elements(channels)
   		index=intarr(n)
   		for i=0,n-1 do begin
   			index(i)=where(strcmp(AUG_chnames,channels(i)))
   		endfor
		chpos=AUG_chpos_pol(index)
   		chradial=AUG_chradial(index)
   		chR=AUG_chR(index)
   		chZ=AUG_chZ(index)
   		channels='AUG_mirnov/'+channels
	end
	3: begin ; AUG B31 approximate toroidal array
   		channels='B31-'+['12','13','14','01','03']
   		n=n_elements(channels)
   		index=intarr(n)
   		for i=0,n-1 do begin
   			index(i)=where(strcmp(AUG_chnames,channels(i)))
   		endfor
		chpos=AUG_chpos_tor(index)
   		chradial=AUG_chradial(index)
   		chR=AUG_chR(index)
   		chZ=AUG_chZ(index)
   		channels='AUG_mirnov/'+channels
   	end
	4: begin ; AUG B31 approximate toroidal array without B31-03
   		channels='B31-'+['12','13','14','01']
   		n=n_elements(channels)
   		index=intarr(n)
   		for i=0,n-1 do begin
   			index(i)=where(strcmp(AUG_chnames,channels(i)))
   		endfor
		chpos=AUG_chpos_tor(index)
   		chradial=AUG_chradial(index)
   		chR=AUG_chR(index)
   		chZ=AUG_chZ(index)
   		channels='AUG_mirnov/'+channels
   	end
	5: begin ; AUG B31 approximate toroidal array with B31-02
   		channels='B31-'+['12','13','14','01','02','03']
   		n=n_elements(channels)
   		index=intarr(n)
   		for i=0,n-1 do begin
   			index(i)=where(strcmp(AUG_chnames,channels(i)))
   		endfor
		chpos=AUG_chpos_tor(index)
   		chradial=AUG_chradial(index)
   		chR=AUG_chR(index)
   		chZ=AUG_chZ(index)
   		channels='AUG_mirnov/'+channels
   	end
  6: begin ; AUG B31 approximate toroidal array without B31-01
      channels='B31-'+['12','13','14','03']
      n=n_elements(channels)
      index=intarr(n)
      for i=0,n-1 do begin
        index(i)=where(strcmp(AUG_chnames,channels(i)))
      endfor
    chpos=AUG_chpos_tor(index)
      chradial=AUG_chradial(index)
      chR=AUG_chR(index)
      chZ=AUG_chZ(index)
      channels='AUG_mirnov/'+channels
    end
  7: begin ; AUG B31 approximate toroidal array with B31-02, without B31-03
      channels='B31-'+['12','13','14','01','02']
      n=n_elements(channels)
      index=intarr(n)
      for i=0,n-1 do begin
        index(i)=where(strcmp(AUG_chnames,channels(i)))
      endfor
    chpos=AUG_chpos_tor(index)
      chradial=AUG_chradial(index)
      chR=AUG_chR(index)
      chZ=AUG_chZ(index)
      channels='AUG_mirnov/'+channels
    end
	10: begin ; W7-AS MIR-1 poloidal array
   		channels='W7-AS Mirnov/MIR-1-'+['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16']
   		chpos=W7AS_chpos_pol(0:15)
   		chradial=W7AS_chradial(0:15)
   		chR=W7AS_chR(0:15)
   		chZ=W7AS_chZ(0:15)
   	end
	11: begin ; W7-AS simulated MIR-1 poloidal array
   		channels='_gp_sim_channel_'+['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16']
   		chpos=W7AS_chpos_pol(0:15)
   		chradial=W7AS_chradial(0:15)
   		chR=W7AS_chR(0:15)
   		chZ=W7AS_chZ(0:15)
   	end

endcase

end
