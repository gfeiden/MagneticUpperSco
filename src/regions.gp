set encoding iso_8859_1
set term postscript enhanced color rounded font "Times-Roman, 20" dashlength 1.1 fontfile "/usr/local/share/ghostscript/9.07/Resource/Font/cmsy10.pfb"

set style line 1 lt 6 lw 2 dt '-' lc rgb "gray20"
set style line 2 lt 4 lw 4 #lc rgb "gray20"
set style line 3 lt 1 lw 2 ps 1.2 lc rgb "gray50"
set style line 4 lt 6 lw 3 dt '-' lc rgb "gray20"
set style line 5 lt 6 lw 3 dt '_' lc rgb "gray20"
set style line 6 lt 6 lw 3 dt '.-' lc rgb "gray20"

set key off
set tics front
set bars small

set tmargin 2.0
set bmargin 2.0

##################################
# Zoom-In on HR Diagram Locations
##################################
set out "../fig/HR_diagram_split_USco.ps"

set multiplot

set origin 0.0, 0.5
set size 0.7, 0.5

set xlabel "T_{eff} (K)"
set xrange [10000:5000]
set xtics 1000
set mxtics 4

set ylabel "log_{10}(L / L_{/CMSY10 \014})"
set yrange [-0.5:2.0]
set ytics 1.0
set mytics 4
set format y "%4.1f"

set label "(b)" at 9500, 0.0 center tc rgb "gray20" font ", 16"

plot "../data/usco_emp_hrd.txt" u (10**$1):3:4 w filledcurves fc rgb "black" fs solid 0.15 notitle, \
     "" u (10**$1):3 w l lw 1 lc rgb "gray80" notitle, \
     "" u (10**$1):4 w l lw 1 lc rgb "gray80" notitle, \
     "../models/iso/std/dmestar_00005.0myr_z+0.00_a+0.00_phx.iso" u (10**$2):4 w l ls 4 notitle, \
     "../models/iso/std/dmestar_00010.0myr_z+0.00_a+0.00_phx.iso" u (10**$2):4 w l ls 6 notitle, \
     "../models/iso/std/dmestar_00015.0myr_z+0.00_a+0.00_phx.iso" u (10**$2):4 w l ls 5 notitle, \
     "../models/iso/mag/dmestar_00010.0myr_z+0.00_a+0.00_phx_magBeq.iso" u (10**$2):4 w l ls 2 title "10 Myr: {/Symbol \341B\646\361 \75} B_{eq}", \
     "../data/usco5.txt" u 6:8:7:9 w xyerrorbars lt 2 pt 7 ps 1.5 lw 2 lc rgb "gray20" notitle

unset label

set origin 0.0, 0.0

set xrange [5000:2700]
set xtics 500

set yrange [-2.25:0.5]

set label "(c)" at 4800, -1.75 center tc rgb "gray20" font ", 16"

plot "../data/usco_emp_hrd.txt" u (10**$1):3:4 w filledcurves fc rgb "black" fs solid 0.15 notitle, \
     "" u (10**$1):3 w l lw 1 lc rgb "gray80" notitle, \
     "" u (10**$1):4 w l lw 1 lc rgb "gray80" notitle, \
     "../models/iso/std/dmestar_00005.0myr_z+0.00_a+0.00_phx.iso" u (10**$2):4 w l ls 4 notitle, \
     "../models/iso/std/dmestar_00010.0myr_z+0.00_a+0.00_phx.iso" u (10**$2):4 w l ls 6 notitle, \
     "../models/iso/std/dmestar_00015.0myr_z+0.00_a+0.00_phx.iso" u (10**$2):4 w l ls 5 notitle, \
     "../models/iso/mag/dmestar_00010.0myr_z+0.00_a+0.00_phx_magBeq.iso" u (10**$2):4 w l ls 2 title "10 Myr: {/Symbol \341B\646\361 \75} B_{eq}", \
     "../data/usco5.txt"  u 6:8:7:9 w xyerrorbars pt 7 ps 1.5 lw 2 lc rgb "gray20" notitle, \
     "../data/lodieu.txt" u 6:8:7:9 w xyerrorbars pt 5 ps 1.2 lw 2 lc rgb "gray50" notitle
