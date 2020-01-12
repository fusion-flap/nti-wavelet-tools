;+
; Name: pg_plot
;
; Written by: Gergo Pokol (pokol@reak.bme.hu) 2003.04.25.
;
; Purpose: Visualize a 2D matrix (STFT or CWT)
;
; Calling sequence:
;	pg_plot, matrix [,ct] [,xrange] [,yrange] [,xtitle] [,ytitle] [,title] [,opt] [,/norm] [,/log] 
;
; Input:
;	matrix: 2D matrix to be visualized
;	ct (optional): Color table index (Built-in color tables)
;	xrange (optional): Range of x axis
;	yrange (optional): Range of y axis
;	xtitle (optional): Title of x axis
;	ytitle (optional): Title of y axis
;	title (optional): Title of the plot
;	opt (optional): exponent for opimized scale visualization
;	/norm (optional): Norm matrix values
;	/log (optional): visualize on log scale
;
; Output: -
;-

pro pg_plot, matrix, ct=ct, xrange=xrange, yrange=yrange, $
	xtitle=xtitle, ytitle=ytitle, title=title, norm=norm, log=log, opt=opt

; Set defaults
msize=size(matrix)
norm=keyword_set(norm)
log=keyword_set(log)
if not(keyword_set(ct)) then ct=5
if not(keyword_set(xrange)) then xrange=[0,msize[1]-1]
if not(keyword_set(yrange)) then yrange=[0,msize[2]-1]
if not(keyword_set(xtitle)) then xtitle=''
if not(keyword_set(ytitle)) then ytitle=''
if not(keyword_set(title)) then title=''
if not(keyword_set(opt)) then opt=1
minm=min(min(matrix))
maxm=max(max(matrix))

; Draw scale
for i=msize[1]-(msize[1]/200),msize[1]-1 do begin
	matrix[i,*]=findgen(msize[2])/max(findgen(msize[2]))*maxm+minm
endfor

; Log scale
if log then matrix=alog10(temporary(matrix))

; Optimized scale
matrix=(temporary(matrix))^opt

; Norm matrix
if norm then begin
	minm=min(min(matrix))
	maxm=max(max(matrix))
	matrix=temporary(matrix)-minm ; Set minimum to 0
	matrix=(temporary(matrix)/(maxm-minm))*255 ; Scale maximum to 256
endif

; Load color table
loadct,ct

; Set system variables
;!P.CHARSIZE=3.0 ; Poster
;!P.THICK=4. ; Poster
!x.range=xrange
!x.ticklen=-0.01
!x.title=xtitle
!x.margin=[10,3]
!y.range=yrange
!y.ticklen=-0.01
!y.title=ytitle
!y.margin=[5,3]
!p.title=title

; Plot axes
plot,xrange,yrange,/nodata,xstyle=1,ystyle=1

; Plot matrix as bitmap
nti_wavelet_otv,matrix

; Set default system variables
!x.range=[0,0]
!x.ticklen=0
!x.title=''
!x.margin=[10,3]
!y.range=[0,0]
!y.ticklen=0
!y.title=''
!y.margin=[4,2]
!p.title=''
!P.CHARSIZE=1.0
!P.THICK=1.

end
