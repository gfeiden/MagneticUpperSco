set encoding iso_8859_1
set term postscript enhanced color rounded font "Times-Roman, 20" dashlength 1.1 fontfile "/usr/local/share/ghostscript/9.07/Resource/Font/cmsy10.pfb"

set style line 1 lt 6 lw 3 lc rgb "gray20"
set style line 2 lt 4 lw 4 #lc rgb "#1e90ff"
set style line 3 lt 1 lw 2 ps 1.2 lc rgb "gray50"
set style line 4 lt 6 dt '-' lw 3 lc rgb "gray20"
set style line 5 lt 6 lw 3 dt '_' lc rgb "gray20"
set style line 6 lt 6 dt '.-.' lw 3 lc rgb "gray20"

set size square
set tics front
set bars small

#########################
# Radiative Core Masses #
#########################
set out "../fig/solar_Kippenhahn.ps"

set xlabel "Age (Myr)"
set logscale x
set xrange [0.1:1000]
set format x "%g"

set ylabel "Convective Boundary Location (M_{conv} / M_{*})"
set yrange [-0.1:1.1]
set ytics 0.2
set mytics 4
set format y "%3.1f"

set key at 10.0, 1.0 font ", 16" tc rgb "gray20"
set key samplen 6.5
set key spacing 3.5

plot "../models/trk/std/m1000_GS98_p000_p0_y28_mlt1.884.ntrk" u ($3*1.0e3):(1.0 - $9) w l ls 1 title "{/Symbol \341B\646\361 \75} 0.0 kG", \
     "" u ($3*1.0e3):8 w l ls 1 notitle, \
     "../models/trk/mag/m1000_GS98_p000_p0_y28_mlt1.884_mag21kG.ntrk" u ($3*1.0e3):(1.0 - $9) w l ls 2 title "{/Symbol \341B\646\361 \75} B_{eq}", \
     "" u ($3*1.0e3):8 w l ls 2 notitle
