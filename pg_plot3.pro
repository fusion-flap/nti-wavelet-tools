;+
; Name: pg_plot3
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2004.02.21.
;
; Purpose: Visualize a 2D matrix
;
; Calling sequence:
;	pg_plot3, matrix [,ct] [,xrange] [,yrange] [,zrange] [,data] [,xtitle] [,ytitle] $
;		[,title] [,opt] [,/log] [,/interp] [,/poster]
;
; Input:
;	matrix: 2D matrix to be visualized
;	ct (optional): Color table index (Built-in color tables)
;	xrange (optional): Range of x axis; default: matrix x-dimension
;	yrange (optional): Range of y axis; default: matrix y-dimension
;	zrange (optional): Range of colorscale; default: matrix value range
;	data (optional): Extra data to be written on graph
;	xtitle (optional): Title of x axis
;	ytitle (optional): Title of y axis
;	title (optional): Title of the plot
;	opt (optional): exponent for opimized scale visualization
;	/log (optional): visualize on log scale
;	/interp (optonal): Interpolate, when drawing
;	/poster (optional): Print in poster form
;
; Output: -
;-

pro pg_plot3, matrix, ct=ct, xrange=xrange, yrange=yrange, zrange=zrange, data=data, $
	xtitle=xtitle, ytitle=ytitle, title=title, log=log, opt=opt, interp=interp, poster=poster

; Set defaults
msize=size(matrix)
log=keyword_set(log)
interp=keyword_set(interp)
poster=keyword_set(poster)
if not(keyword_set(ct)) then ct=5
if not(keyword_set(xrange)) then xrange=[0,msize[1]-1]
if not(keyword_set(yrange)) then yrange=[0,msize[2]-1]
if not(keyword_set(zrange)) then zrange=[min(min(matrix)),max(max(matrix))]
if not(keyword_set(data)) then data=''
if not(keyword_set(xtitle)) then xtitle=''
if not(keyword_set(ytitle)) then ytitle=''
if not(keyword_set(title)) then title=''
if not(keyword_set(opt)) then opt=1

; Measure screen
if ((!d.name eq 'X') or (!d.name eq 'WIN')) then begin
	!x.margin=[0,0]
	!y.margin=[0,0]
	plot,xrange,yrange,/nodata,xstyle=1,ystyle=1
	px=!d.x_vsize
	py=!d.y_vsize
endif

; Color scale
cscale=fltarr(2,256)
cscale[0,*]=findgen(256)/255
cscale[1,*]=findgen(256)/255

; Apply zrange
zrangest=zrange
matrix2=zrange[0] > matrix < zrange[1]
cscale=zrange[0]+cscale*(zrange[1]-zrange[0])
axis=cscale[0,*]

; Log scale
if log then begin
	matrix2=matrix2+zrange[0]+10.01
	cscale=cscale+zrange[0]+10.01
	matrix2=alog10(temporary(matrix2))
	cscale=alog10(temporary(cscale))
endif

; Optimized scale
matrix2=(temporary(matrix2))^opt
cscale=(temporary(cscale))^opt

; Norm matrix2
minm=min(min(cscale))
maxm=max(max(cscale))
matrix2=temporary(matrix2)-minm ; Set minimum to 0
matrix2=(temporary(matrix2)/(maxm-minm))*255 ; Scale maximum to 256
cscale=temporary(cscale)-minm ; Set minimum to 0
cscale=(temporary(cscale)/(maxm-minm))*255 ; Scale maximum to 256

; Load color table
loadct,ct

; Set system variables for matrix2
!x.range=xrange
!x.ticklen=-0.01
!x.title=xtitle
!y.range=yrange
!y.ticklen=-0.01
!y.title=ytitle
!p.title=title
!P.NOERASE=0
if ((!d.name eq 'X') or (!d.name eq 'WIN')) then begin
	!x.margin=[10,px/7/5]
	!y.margin=[5,3]
endif
if (!d.name eq 'PS') then begin
	!x.margin=[10,30]
	!y.margin=[5,3]
endif
;if poster then begin
;	!P.CHARSIZE=3.0
;	!P.THICK=4.
;	!P.FONT=0
;endif

; Plot axes
plot,xrange,yrange,/nodata,xstyle=1,ystyle=1

; Plot matrix2 as bitmap
nti_wavelet_otv,matrix2,interp=interp

; Set system variables for Color scale
;if poster then begin
;	!P.CHARSIZE=2.0
;	!P.THICK=2.
;	!P.FONT=-1
;endif
!x.range=[0,1]
!x.ticklen=-0
!x.title=''
!x.tickname=[' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ']
!y.range=[min(axis),max(axis)]
!y.title='Magnitude'
!p.title='Color scale'
!P.NOERASE=1
if ((!d.name eq 'X') or (!d.name eq 'WIN')) then begin
	!x.margin=[px/7/5*4+max([10,px/7/10]),10]
	!y.margin=[py/10/2,10]
endif
if (!d.name eq 'PS') then begin
	!x.margin=[150,10]
	!y.margin=[40,10]
endif

; Plot axes
plot,axis,[0,1],/nodata,xstyle=1,ystyle=1

; Plot color scale as bitmap
nti_wavelet_otv,cscale,/interp

; Set default system variables
!x.range=[0,0]
!x.ticklen=0
!x.title=''
!x.margin=[10,3]
!x.tickname=''
!y.range=[0,0]
!y.ticklen=0
!y.title=''
!y.margin=[4,2]
!p.title=''
!P.NOERASE=0
!P.CHARSIZE=1.0
!P.THICK=1.
!P.FONT=-1

; Write data
xyouts,0.85,0.45,data,/normal

end
