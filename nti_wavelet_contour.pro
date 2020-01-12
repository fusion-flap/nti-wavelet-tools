;+
;
; NAME:
;	NTI_WAVELET_CONTOUR
;
; PURPOSE:
;	This procedure plot matrices with "CONTOUR" procedure. This can be used only for PostScript plots.
;
; CALLING SEQUENCE:
;	NTI_WAVELET_CONTOUR, matrix [,xaxis] [,yaxis] [,zrange] [,data] [,xtitle] $
;	  [,ytitle] [,title] [,ct] [,opt] [,resolution] [,levels] [,c_colors] [,/intz] [,/poster]
;
; INPUTS:
;	matrix: 2D matrix to be visualized
;	xaxis (optional): Complete x axis of the matrix; default: vector from integers
;	yaxis (optional): Complete y axis of the matrix; default: vector from integers
;	zrange (optional): Range of colorscale; default: matrix value range
;	data (optional): Extra data to be written on graph
;	xtitle (optional): Title of x axis
;	ytitle (optional): Title of y axis
;	title (optional): Title of the plot
;	ct (optional): Color table index (Built-in color tables)
;	opt (optional): Exponent for opimized scale visualization
;	resolution: The number of levels used by CONTOUR procedure
;	levels: The value of the levels used by CONTOUR procedure
;	c_colors: The color indices of the levels used by CONTOUR procedure
;	/intz (optional): Plot discrete colorscale at integer values (and skip color code 255)
;	/poster (optional): Print in poster form
;
;-

pro nti_wavelet_contour, matrix, xaxis=xaxis, yaxis=yaxis, zrange=zrange, data=data, xtitle=xtitle, ytitle=ytitle, $
	title=title, ct=ct, opt=opt, resolution=resolution, levels=levels, c_colors=c_colors, intz=intz, poster=poster

; Set defaults
msize=size(matrix)
interp=keyword_set(interp)
poster=keyword_set(poster)
intz=keyword_set(intz)
nti_wavelet_default, xaxis, findgen(msize[1]-1)
nti_wavelet_default, yaxis, findgen(msize[2]-1)
nti_wavelet_default, zrange, [min(min(matrix)),max(max(matrix))]
nti_wavelet_default, data, ''
nti_wavelet_default, xtitle, ''
nti_wavelet_default, ytitle, ''
nti_wavelet_default, title, ''
nti_wavelet_default, opt, 1
nti_wavelet_default, resolution, 60


;Checking plot device
;--------------------
;nti_wavelet_contour is able to plot PS files only
if not (!d.name eq 'PS') then begin
  print, 'nti_wavelet_contour is able to plot PS files only!'
  return
endif

;Initialize color scale
;----------------------
cscale=fltarr(2,256)
cscale[0,*]=findgen(256)/255
cscale[1,*]=findgen(256)/255

;Apply zrange
;----------------------
matrix2=zrange[0] > matrix < zrange[1]
cscale=zrange[0]+cscale*(zrange[1]-zrange[0])
axis=cscale[0,*]

;Optimize colorscale
;-------------------
cscale=(temporary(cscale))^opt
minm=min(min(cscale))
maxm=max(max(cscale))
if intz then begin
  cscale=float(round(cscale))
  axis=float(round(axis))
  minm=min(min(cscale))
  maxm=max(max(cscale))
  cscale=temporary(cscale)-minm ; Set minimum to 0
  cscale=(temporary(cscale)/(maxm-minm))*254 ; Scale maximum to 254 (skip 255)
endif else begin
  cscale=temporary(cscale)-minm ; Set minimum to 0
  cscale=(temporary(cscale)/(maxm-minm))*255 ; Scale maximum to 255
endelse

;Initialize levels:
;------------------
if not nti_wavelet_defined(levels) then begin
  ;Create levels
  levels=findgen(resolution)
  levels = levels/max(levels)*255

  ; Optimize color scale
  matrix2=(temporary(matrix2))^opt
  matrix2=temporary(matrix2)-minm ; Set minimum to 0
  matrix2=(temporary(matrix2)/(maxm-minm))*255 ; Scale maximum to 255
endif


; Load color table
if keyword_set(ct) then loadct,ct

;Set system variables for matrix2
;--------------------------------
!x.ticklen=-0.01
!x.thick=2.
!y.ticklen=-0.01
!y.thick=2.
!p.thick=2
!P.NOERASE=0

!P.FONT=0
!x.margin=[10,30]
!y.margin=[5,4]
if poster then begin
  device, font_size=14
  !X.THICK=3.5
  !Y.THICK=3.5
  !x.margin=[10,23]
  !y.margin=[5,4]
endif

;Plot matrix2
;------------
if nti_wavelet_defined(c_colors) then begin
  CONTOUR, matrix2, xaxis, yaxis, /FILL, XSTYLE=1, YSTYLE=1, XTITLE=xtitle, YTITLE=ytitle,$
    levels=levels, c_colors=c_colors, title=title
endif else begin
  CONTOUR, matrix2, xaxis, yaxis, /FILL, XSTYLE=1, YSTYLE=1, XTITLE=xtitle, YTITLE=ytitle,$
    levels=levels, title=title
endelse

;Plot colorscale
;---------------
if poster then begin
  !P.THICK=1
  device, font_size=11
endif

!x.range=[0,1]
!x.ticklen=0
!x.title=''
!x.tickname=[' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ']
!y.range=[min(axis),max(axis)]
!y.title='Magnitude'
!p.title='Color scale'
!P.NOERASE=1

!x.margin=[107,7]
!y.margin=[30,5]
if poster then begin
  !x.margin=[77,5]
  !y.margin=[18,6]
endif

; Plot axes
plot,axis,[0,1],/nodata,xstyle=1,ystyle=1

; Plot color scale as bitmap
nti_wavelet_otv,cscale,interp=(not intz) 

if (!d.name eq 'PS' and poster) then begin
  device, font_size=8
endif

; Write data
xyouts, 0.82,0.30, data, /normal, charsize = 0.6, charthick = 1


; Set default system variables
;-----------------------------
!x.range=[0,0]
!x.ticklen=0
!x.thick=1.
!x.title=''
!x.margin=[10,3]
!x.tickname=''
!y.range=[0,0]
!y.ticklen=0
!y.thick=1.
!y.title=''
!y.margin=[4,2]
!p.title=''
!P.NOERASE=0
!P.CHARSIZE=1.0
!P.THICK=1.
!P.FONT=-1
!P.CHARTHICK=1.

end