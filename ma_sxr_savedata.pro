; Name: ma_sxr_savedata
;
; Written by: Magyarkuti Andras magyarkuti@reak.bme.hu 2010.07.21.
;
; Purpose: Downloading SXR data from ASDEX Upgrade
;
; Calling sequence: ma_sxr_savedata, shot, channel, [trange], [save_path] [/scp], [remote], [/plot], [/no_correction], [data], [time]
;
;
; Inputs:
;       shot: shot number
;       channel: channel name (eg. 'J_053')
;	trange (optional): time range, default: whole shot
;	save_path: path to save data
;       /scp (optional): secure copy data to remote machine
;	remote: address of remote machine, default: deep.reak.bme.hu:/home/data/asdex/raw_data/
;       /plot (optional): visualize downloaded data
;       /no_correction (optional): downloading data without hotlink correction
;	data: data vector
;	time: time vector
;
; Outputs:
;	The following variables are written to file:
;       data: SXR data
;       starttime
;	endtime
;	sampletime: time between two points
;	info: information on shot (from SXinfo)
;

pro ma_sxr_savedata, shot, channel, trange=trange, save_path=save_path,$
	plot=plot, scp=scp, no_correction=no_correction, data=data, time=time

 ;setting defaults
 plot=keyword_set(plot)
 scp=keyword_set(scp)
 no_correction=keyword_set(no_correction)
 if not keyword_set(trange) then begin
	settrange=0
 endif else settrange=1
 calibrated=1
 hotlinkerror_corrected = 1
 if no_correction then hotlinkerror_corrected = 0

 if not keyword_set(save_path) then save_path = '~/idl/data/'

 if not keyword_set(remote) then remote = 'data@deep.reak.bme.hu:asdex/raw_data/'

 ;defining system variable
 defsysv, '!libddww', '/usr/ads/lib64/libddww.so'

 ;displaying information on the data requested
 print, '========================================================'
 spawn, 'SXinfo '+string(shot), info
 print, info
 print, '========================================================'

 ;reading SXR data
 print, 'Reading SXR data ...'

 if no_correction then begin
	 read_sx_,shot,channel,time,data,r,z,theta,phi,time_win=trange, /NO_CORRECT
 endif else begin
	 read_sx_,shot,channel,time,data,r,z,theta,phi,time_win=trange
 endelse

 if plot then plot,time,data

 ;saving data
 print, 'Saving data ...'
 
 starttime = time(0)
 endtime = time(n_elements(time)-1)
 sampletime = (endtime-starttime)/n_elements(time)
 
 if settrange eq 0 then begin
 save_file =  save_path + pg_num2str(shot) + '_AUG_SXR_'+channel+'.sav'
 endif else begin
 save_file =  save_path + pg_num2str(shot) + '_AUG_SXR_'+channel+'_time_'+pg_num2str(starttime, length=6)+'-'+pg_num2str(endtime, length=6)+'.sav'
 endelse

 save, data, starttime, endtime, sampletime, info, r, z, theta, phi, calibrated, hotlinkerror_corrected, filename=save_file
 
 print, 'Succesfully written to file: '+save_file

 ;copying data to remote machine
 if scp then begin
	print, 'MOVEing data to ' + remote + ' via ssh.'
	spawn, 'scp '+save_file+' '+remote, copy
	print, 'Succesfully MOVED to remote machine!'

	spawn, 'rm ' + save_file
 endif

end
