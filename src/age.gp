set encoding iso_8859_1
set term postscript enhanced color rounded font "Times-Roman, 20" dashlength 1.1 fontfile "/usr/local/share/ghostscript/9.07/Resource/Font/cmsy10.pfb"

set style line 1 lt 6 lw 2 #lc rgb "gray20"
set style line 2 lt 4 lw 4 #lc rgb "#1e90ff"
set style line 3 lt 1 lw 2 ps 1.2 lc rgb "gray50"
set style line 4 lt 6 lw 3 dt '-' lc rgb "gray20"
set style line 5 lt 6 lw 3 dt '_' lc rgb "gray20"
set style line 6 lt 6 lw 3 dt '.-' lc rgb "gray20"

set size square
set tics front
set bars small

#############
# HR Diagram
#############
set out "../fig/HR_diagram_age_USco.ps"

set xlabel "T_{eff} (K)"
set xrange [10000:2500]
set xtics 2000
set mxtics 4

set ylabel "log_{10}(L / L_{/CMSY10 \014})"
set yrange [-2.0:2.0]
set ytics 1.0
set mytics 4
set format y "%4.2f"

set label "(a)" at 3500, 1.5 center tc rgb "gray20" font ", 16"
set label "Isochrone Ages: 5, 10, 15 Myr" at 9250, -1.25 left tc rgb "gray20" font ",16"
set label "(top to bottom)" at 9250, -1.5 left tc rgb "gray20" font ",16"

set key on at 5475, -0.75 tc rgb "gray20" font ",16"

plot "../data/usco_emp_hrd.txt" u (10**$1):3:4 w filledcurves fc rgb "black" fs solid 0.15 notitle, \
     "" u (10**$1):3 w l lw 1 lc rgb "gray80" notitle, \
     "" u (10**$1):4 w l lw 1 lc rgb "gray80" notitle, \
     "../models/iso/std/dmestar_00005.0myr_z+0.00_a+0.00_phx.iso" u (10**$2):4 w l ls 4 notitle, \
     "../models/iso/std/dmestar_00010.0myr_z+0.00_a+0.00_phx.iso" u (10**$2):4 w l ls 6 notitle, \
     "../models/iso/std/dmestar_00015.0myr_z+0.00_a+0.00_phx.iso" u (10**$2):4 w l ls 5 notitle, \
     "../models/iso/mag/dmestar_00010.0myr_z+0.00_a+0.00_phx_magBeq.iso" u (10**$2):4 w l ls 2 title "10.0 Myr: {/Symbol \341B\646\361 \75} B_{eq}", \
     "" u (10**$2):4:(sprintf("(%4.2f)", (1.0 - $7/$1))) every 8::14 w labels point pt 6 ps 1.5 lt 4 lw 2 font ",12" offset char 0.7,0.5 notitle, \
     "../data/lodieu.txt" u 6:8:7:9 w xyerrorbars pt 7 ps 1.5 lw 2 lc rgb "gray20" notitle, \
     "../data/usco5.txt"  u 6:8:7:9 w xyerrorbars pt 7 ps 1.5 lw 2 lc rgb "gray20" notitle

unset label

######################
# Mass-Radius Diagram
######################
set out "../fig/USCO5_MR.ps"

set xlabel "Mass (M_{/CMSY10 \014})"
set xrange [1.80:0.00] #0.40
set xtics 0.5
set mxtics 5
set format x "%4.2f"

set ylabel "Radius (R_{/CMSY10 \014})"
set yrange [0.1:2.7]   #1.0
set ytics 0.4
set mytics 4

set label "Isochrone Ages: 5, 10, 15 Myr" at 1.65, 0.60 left tc rgb "gray20" font ",16"
set label "(top to bottom)" at 1.65, 0.40 left tc rgb "gray20" font ",16"

set key on at 0.20, 2.5 tc rgb "gray20" font ",16"

plot "../models/iso/std/dmestar_00005.0myr_z+0.00_a+0.00_phx.iso" u 1:(10**$5) w l ls 4 notitle, \
     "../models/iso/std/dmestar_00010.0myr_z+0.00_a+0.00_phx.iso" u 1:(10**$5) w l ls 6 notitle, \
     "../models/iso/std/dmestar_00015.0myr_z+0.00_a+0.00_phx.iso" u 1:(10**$5) w l ls 5 notitle, \
     "../models/iso/mag/dmestar_00010.0myr_z+0.00_a+0.00_phx_magBeq.iso" u 1:(10**$5) w l ls 2 title "10.0 Myr: {/Symbol \341B\646\361 \75} B_{eq}", \
     "../data/lodieu.txt" u 2:4:3:5 w xyerrorbars pt 5 ps 1.2 lw 2 lc rgb "gray50" notitle, \
     "../data/david.txt"  u 2:4:3:5 w xyerrorbars pt 9 ps 1.5 lw 2 lc rgb "gray50" notitle, \
     "../data/usco5.txt"  u 2:4:3:5 w xyerrorbars pt 7 ps 1.5 lw 2 lc rgb "gray20" notitle

unset label

#######################
#  Mass-Radius Diagram (w/ data from David et al.)
#######################
set out "../fig/USCO5_MR_David.ps"

set xlabel "Mass (M_{/CMSY10 \014})"
set xrange [1.80:0.00] #0.40
set xtics 0.5
set mxtics 5
set format x "%4.2f"

set ylabel "Radius (R_{/CMSY10 \014})"
set yrange [0.1:2.7]   #1.0
set ytics 0.4
set mytics 4

set label "Isochrone Ages: 5, 10, 15 Myr" at 1.65, 0.60 left tc rgb "gray20" font ",16"
set label "(top to bottom)" at 1.65, 0.40 left tc rgb "gray20" font ",16"

set label "EBs from David et al." at 0.2, 2.20 right font ", 16" tc rgb "gray20"
set key on at 0.20, 2.5 tc rgb "gray20" font ",16"

plot "../models/iso/std/dmestar_00005.0myr_z+0.00_a+0.00_phx.iso" u 1:(10**$5) w l ls 4 notitle, \
     "../models/iso/std/dmestar_00010.0myr_z+0.00_a+0.00_phx.iso" u 1:(10**$5) w l ls 6 notitle, \
     "../models/iso/std/dmestar_00015.0myr_z+0.00_a+0.00_phx.iso" u 1:(10**$5) w l ls 5 notitle, \
     "../models/iso/mag/dmestar_00009.0myr_z+0.00_a+0.00_phx_magBeq.iso" u 1:(10**$5) w l ls 2 title "9.0 Myr: {/Symbol \341B\646\361 \75} B_{eq}", \
     "../data/david.txt" u 2:4:3:5 w xyerrorbars pt 6 ps 1.0 lw 3 lc rgb "gray40" notitle
     
