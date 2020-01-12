;+
; Name: pg_plot2
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2004.02.16.
;
; Purpose: Visualize a 2D matrix (STFT or CWT)
;
; Calling sequence:
;	pg_plot, matrix [,ct] [,xrange] [,yrange] [,zrange] [,data] [,xtitle] [,ytitle] $ 
;		[,title] [,opt] [,/log] [,/interp]
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
;
; Output: -
;-

pro pg_plot2, matrix, ct=ct, xrange=xrange, yrange=yrange, zrange=zrange, data=data, $
	xtitle=xtitle, ytitle=ytitle, title=title, log=log, opt=opt, interp=interp

; Set defaults
msize=size(matrix)
norm=keyword_set(norm)
log=keyword_set(log)
interp=keyword_set(interp)
if not(keyword_set(ct)) then ct=5
if not(keyword_set(xrange)) then xrange=[0,msize[1]-1]
if not(keyword_set(yrange)) then yrange=[0,msize[2]-1]
if not(keyword_set(zrange)) then zrange=[min(min(matrix)),max(max(matrix))]
if not(keyword_set(data)) then data=''
if not(keyword_set(xtitle)) then xtitle=''
if not(keyword_set(ytitle)) then ytitle=''
if not(keyword_set(title)) then title=''
if not(keyword_set(opt)) then opt=1

;if ((!d.name eq 'X') or (!d.name eq 'WIN')) then begin
;	px=!x.window*!d.x_vsize
;	py=!y.window*!d.y_vsize
;endif 
;if (!d.name eq 'PS') then begin
;  px=!x.window
;  py=!y.window
;endif

; Color scale
cscale=fltarr(2,256)
cscale[0,*]=findgen(256)/255
cscale[1,*]=findgen(256)/255

; Apply zrange
zrangest=zrange
matrix=zrange[0] > matrix < zrange[1]
cscale=zrange[0]+cscale*(zrange[1]-zrange[0])
axis=cscale[0,*]

; Log scale
if log then begin
	matrix=alog10(temporary(matrix))
	cscale=alog10(temporary(cscale))
endif

; Optimized scale
matrix=(temporary(matrix))^opt
cscale=(temporary(cscale))^opt

; Norm matrix
minm=min(min(cscale))
maxm=max(max(cscale))
matrix=temporary(matrix)-minm ; Set minimum to 0
matrix=(temporary(matrix)/(maxm-minm))*255 ; Scale maximum to 256
cscale=temporary(cscale)-minm ; Set minimum to 0
cscale=(temporary(cscale)/(maxm-minm))*255 ; Scale maximum to 256

; Load color table
loadct,ct

; Set system variables for matrix
;!P.CHARSIZE=3.0 ; Poster
;!P.THICK=4. ; Poster
!x.range=xrange
!x.ticklen=-0.01
!x.title=xtitle
!x.margin=[10,30]
!y.range=yrange
!y.ticklen=-0.01
!y.title=ytitle
!y.margin=[5,3]
!p.title=title

; Plot axes
plot,xrange,yrange,/nodata,xstyle=1,ystyle=1

; Plot matrix as bitmap
nti_wavelet_otv,matrix,interp=interp

; Set system variables for Color scale
!x.range=[0,1]
!x.ticklen=-0
!x.title=''
!x.tickname=[' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ']
!y.range=[min(cscale),max(cscale)]
!y.title='Magnitude'
!p.title='Color scale'
!P.NOERASE=1
if ((!d.name eq 'X') or (!d.name eq 'WIN')) then begin
	!x.margin=[195,10]
	!y.margin=[50,10]
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

; Write data
if ((!d.name eq 'X') or (!d.name eq 'WIN')) then begin
	xyouts,0.88,0.35,data,/normal; ,clip=[0.88,0.35,1.0,1.0],noclip=0
endif 
if (!d.name eq 'PS') then begin
	xyouts,0.85,0.45,data,/normal
endif

end
