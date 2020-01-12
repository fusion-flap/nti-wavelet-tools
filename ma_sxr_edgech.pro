pro ma_sxr_edgech, shot, crashtime, camera, wdtime=wdtime

 ;defining system variable
 defsysv, '!libddww', '/usr/ads/lib64/libddww.so'

 if not keyword_set(wdtime) then begin
	wdtime=0.03
 endif

 time_range = [crashtime-wdtime*1.1,crashtime+wdtime*1.1] ; Download signal for a slightly wider time range than used

 ;searching for available cameras
 get_ssx_names,shot,my_signames, my_diag_names, my_indices, $
   cameras, cam_ind, available_cams, diag='SSX', exp='AUGD'

 print, 'The following cameras are available in this shot: '
 print, available_cams

 ;selecting camera
 ind = where(strcmp(cameras,camera))
 my_signames = my_signames[ind]
 my_diag_names = my_diag_names[ind]
 my_indices = my_indices[ind]
 cameras = cameras[ind]
 cam_ind = cam_ind[ind]

 ;reading SSX data
 read_ssx,shot,time_range,time,data,info,signames=my_signames
 theta=info.theta

 ;converting time points to indexes
 ct=min(where(time ge crashtime))
 wd=ct-min(where(time ge crashtime-wdtime))
 pd=0;floor(wd/10)
 q=fltarr(n_elements(data[0,*]))
 cam_exc=0

;--------------------
;j=where(cam_ind eq 53)
;window,1
;plot,time[ct-wd:ct+wd], data[ct-wd:ct+wd,j], title=string(cam_ind[j])
;--------------------

 ;searching for channels
 for i=0, n_elements(data[0,*])-1 do begin
	if total(data[*,i]) le 0 then begin
		q[i]=0
		cam_exc=[cam_exc,cam_ind[i]]
	endif else begin
		q[i]=total(data[ct-wd:ct-pd,i])-total(data[ct+pd:ct+wd,i])
	endelse
 endfor

 if n_elements(cam_exc) gt 1 then begin
	print, 'The following channel(s) were excluded: '
	print, cam_exc[1:n_elements(cam_exc)-1]
 endif

 ;sorting q
 q=q[sort(theta)]
 cam_ind=cam_ind[sort(theta)]
 theta=theta[sort(theta)]

 ;norming q, setting threshold
 q=q/max(q)
 threshold=0.05

 window,2
 plot, theta, q, psym=1
 oplot, theta, fltarr(n_elements(theta))+threshold, linestyle=2
 i=lindgen(n_elements(theta))
 pos=q-0.04
 pos[where(i mod 2)]=pos[where(i mod 2)]-0.025
 xyouts, theta-2, pos, pg_num2str(cam_ind,length=2)
 
 ;printing edge channel names
 print, 'Edge channels are:'
 print, cam_ind[min(where(q ge threshold))], cam_ind[max(where(q ge threshold))]
 ;printing the theta of the edge channels
 print, 'Theta of edge channels:'
 print, theta[min(where(q ge threshold))], theta[max(where(q ge threshold))]
 

 print, 'The following channels are available:'
 print, cam_ind
 print, 'Thetas:'
 print, theta

end
