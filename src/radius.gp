set encoding iso_8859_1
set term postscript enhanced color rounded font "Times-Roman, 20" fontfile "/usr/local/share/ghostscript/9.07/Resource/Font/cmsy10.pfb"
set out "radius_bump.ps"

set size square
set tics front
set bars small

set xlabel "Age (Myr)"
set xrange [4.0:17.0]
set xtics 2.0
set mxtics 2
set format x "%2.0f"

set ylabel "Radius (R_{/CMSY10 \014} )"
set yrange [1.4:2.3]
set ytics 0.2
set mytics 4
set format y "%3.1f"

set key on at 16.0, 2.25 tc rgb "gray20" font ",16"
set key spacing 1.5

#set label "Non-magnetic Dartmouth mass tracks" at 5, 1.48 tc rgb "gray20" font ", 16"
#set label "[m/H] = 0.0" at 5, 1.53 tc rgb "gray20" font ", 16"

plot '/Users/grefe950/evolve/dmestar/trk/gs98/p000/a0/amlt1884/m1600_GS98_p000_p0_y28_mlt1.884.trk' u ($1/1.e6):(10**$5) w l lt 6 lw 3 title "1.60 M_{/CMSY10 \014}", \
     '/Users/grefe950/evolve/dmestar/trk/gs98/p000/a0/amlt1884/m1550_GS98_p000_p0_y28_mlt1.884.trk' u ($1/1.e6):(10**$5) w l lt 2 dt '-' lw 3 title "1.55 M_{/CMSY10 \014}", \
     '/Users/grefe950/evolve/dmestar/trk/gs98/p000/a0/amlt1884/m1500_GS98_p000_p0_y28_mlt1.884.trk' u ($1/1.e6):(10**$5) w l lt 3 dt '.-' lw 3 title "1.50 M_{/CMSY10 \014}", \
     '/Users/grefe950/evolve/dmestar/trk/gs98/p000/a0/amlt1884/m1450_GS98_p000_p0_y28_mlt1.884.trk' u ($1/1.e6):(10**$5) w l lt 4 dt '_' lw 3 title "1.45 M_{/CMSY10 \014}", \
     '/Users/grefe950/evolve/dmestar/trk/gs98/p000/a0/amlt1884/m1350_GS98_p000_p0_y28_mlt1.884.trk' u ($1/1.e6):(10**$5) w l lt 7 dt '._' lw 3 title "1.35 M_{/CMSY10 \014}"
