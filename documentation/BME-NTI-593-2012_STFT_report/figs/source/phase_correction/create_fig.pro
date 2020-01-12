pro create_fig, eps = eps

nti_wavelet_default, eps, 0

;Define colors for plot
pg_initgraph
loadct, 39
blue = 64
cyan = 96
green = 160
yellow = 192
red = 224
white = 255

t = 9*findgen(1001)/1000
twin = 8*findgen(1001)/1000

;Create user symbol
ang = 2*!PI*findgen(49)/48.
xarr = 1.5*cos(ang)  &  yarr = 1.5*sin(ang)
usersym, xarr, yarr, /fill


s1 = 1*sin(2*!pi*1./9*t)
s2 = 0.8*sin(2*!pi*2./9*t)
s3 = 0.6*sin(2*!pi*3./9*t)
s4 = 0.4*sin(2*!pi*4./9*t)

if eps then begin
  pg_initgraph, /print
  device, filename = 'figure.eps'
endif

plot, t, s1, /xstyle, /ystyle, xrange = [-1,10], yrange = [-1.8,1.2], /nodata
oplot, t, s1, color = blue
oplot, t, s2, color = red
oplot, t, s3, color = green
oplot, t, s4, color = cyan

oplot, [0,8], [-1.5, -1.5]
oplot, findgen(9), findgen(9)*0-1.5, psym = 8

oplot, twin, 5*pg_gen_win(150, masksize = 1001)-1.4, linestyle = 2

oplot, [4,4], [-3, 3], linestyle = 2
oplot, [4.5,4.5], [-3, 3], linestyle = 2

oplot, [4,4.5], [-1.7, -1.7], color = green

if eps then begin
  device, /close
  pg_initgraph
endif

end