set encoding iso_8859_1
set term postscript enhanced color rounded font "Times-Roman, 20" fontfile "/usr/local/share/ghostscript/9.10/Resource/Font/cmsy10.pfb"
set out "../fig/Li7_USco_Beq.ps"

set style line 1 lt 6 lw 3 dt '-' lc rgb "gray20"
set style line 2 lt 4 lw 4 #lc rgb "gray20"
set style line 3 lt 1 lw 2 ps 1.2 lc rgb "gray70"
set style line 4 lt 6 lw 3 dt '_' lc rgb "gray20"

set size square
set tics front
set bars small

set xlabel "Effective Temperature (K)"
set xrange [8000:2500]
set xtics 1000
set mxtics 4
set format x "%4.0f"

set ylabel "A( ^{7}Li )"
set yrange [1.0:3.5]
set ytics 0.5
set mytics 4
set format y "%3.1f"

set label "Upper Scorpius" at 7500, 1.85 left tc rgb "gray20" font ", 16"
#set label "Age: 10 Myr"    at 7500, 1.85 left tc rgb "gray20" font ", 16"
set label "[m/H] = 0.0"    at 7500, 1.70 left tc rgb "gray20" font ", 16"

f(x) = 3.30

set key on at 4700, 1.6 tc rgb "gray20" font ",16"
set key spacing 1.5

plot f(x) dt '.' lw 2 lc rgb "gray20" notitle, \
     "../models/iso/std/dmestar_00010.0myr_z+0.00_a+0.00_phx.iso"  u (10**$2):6 w l ls 1 title "10 Myr: non-magnetic", \
     "../models/iso/std/dmestar_00005.0myr_z+0.00_a+0.00_phx.iso"  u (10**$2):6 w l ls 4 title " 5 Myr: non-magnetic", \
     "../models/iso/mag/dmestar_00010.0myr_z+0.00_a+0.00_phx_magBeq.iso" u (10**$2):6 w l ls 2 title "10 Myr: {/Symbol \341B\646\361 \75} B_{eq}"


####

set out "../fig/Li_logL.ps"

set xlabel "log_{10}(L / L_{/CMSY10 \014})"
set xrange [1.0:-2.0]
set xtics 0.5
set mxtics 2
set format x "%3.1f"

set ylabel "A( ^{7}Li )"
set yrange [1.0:3.5]
set ytics 0.5
set mytics 4
set format y "%3.1f"

#set label "Upper Scorpius" at 7500, 2.00 left tc rgb "gray20" font ", 16"
#set label "Age: 10 Myr" at 7500, 1.85 left tc rgb "gray20" font ", 16"
#set label "[m/H] = 0.0" at 7500, 1.70 left tc rgb "gray20" font ", 16"

f(x) = 3.30

set key on at 5350, 1.5 tc rgb "gray20" font ",16"
set key spacing 1.5

plot f(x) dt '-.' lw 2 lc rgb "gray20" notitle, \
     "../models/iso/std/dmestar_00005.0myr_z+0.00_a+0.00_phx.iso" u 4:6 w l ls 1 dt '-' title "Non-magnetic", \
     "../models/iso/std/dmestar_00010.0myr_z+0.00_a+0.00_phx.iso" u 4:6 w l ls 1 title "Non-magnetic", \
     "../models/iso/mag/dmestar_00010.0myr_z+0.00_a+0.00_phx_magBeq.iso" u 4:6 w l ls 2 title "{/Symbol \341B\646\361 \75} B_{eq}" 
