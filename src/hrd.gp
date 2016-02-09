set encoding iso_8859_1
set term postscript enhanced color rounded font "Times-Roman, 20" dashlength 1.0 fontfile "/usr/local/share/ghostscript/9.07/Resource/Font/cmsy10.pfb"

set style line 1 lt 6 lw 3 #lc rgb "gray20"
set style line 2 lt 4 lw 4 #lc rgb "gray20"
set style line 3 lt 1 lw 2 ps 1.2 lc rgb "gray50"
set style line 4 lt 6 lw 4 dt '-' lc rgb "gray20"
set style line 5 lt 6 lw 4 lc rgb "gray20"
set style line 6 lt 6 lw 4 dt '_.' lc rgb "gray20"

set tics front
set bars small

set out "USco_HRD_Astro2015.ps"

set xlabel "T_{eff} (K)"
set xrange [10000:3000]
set xtics 2000
set mxtics 4

set ylabel "log_{10}(L / L_{/CMSY10 \014})"
set yrange [-2.0:2.0]
set ytics 1.0
set mytics 4
set format y "%4.2f"

#set label "Isochrone Ages: 5, 10, 15 Myr" at 9600, -1.3 left tc rgb "gray20" font ",16"
#set label "(top to bottom)" at 9600, -1.6 left tc rgb "gray20" font ",16"

set label "Standard Model Isochrones" at 9600, -0.75 left tc rgb "gray20" font ", 16"
set key on at 7500, -0.9 tc rgb "gray20" font ",16" samplen 10.0 spacing 3.0

set label "A: 9 Myr"  at 8500,  0.70 tc rgb "gray20" font ", 16" center
set label "F: 14 Myr" at 7000,  0.30 tc rgb "gray20" font ", 16" center
set label "G: 10 Myr" at 6000, -0.25 tc rgb "gray20" font ", 16" center
set label "K: 4 Myr"  at 5000, -0.50 tc rgb "gray20" font ", 16" center
set label "M: 5 Myr"  at 4000, -1.00 tc rgb "gray20" font ", 16" right


plot "usco_emp_hrd.txt" u (10**$1):3:4 w filledcurves fc rgb "black" fs solid 0.15 notitle, \
     'tmp.txt' u (10**$3):5:4:6 w xyerrorbars ls 3 ps 0.6 pt 7 notitle, \
     '../../../evolve/dmestar/iso/gs98/p000/a0/amlt1884/dmestar_00005.0myr_z+0.00_a+0.00_phx.iso' u (10**$2):4 w l ls 4 title "5 Myr", \
     '../../../evolve/dmestar/iso/gs98/p000/a0/amlt1884/dmestar_00010.0myr_z+0.00_a+0.00_phx.iso' u (10**$2):4 w l ls 5 title "10 Myr", \
     '../../../evolve/dmestar/iso/gs98/p000/a0/amlt1884/dmestar_00015.0myr_z+0.00_a+0.00_phx.iso' u (10**$2):4 w l ls 6 title "15 Myr", \
     '../../../evolve/dmestar/iso/gas07/p000/a0/amlt2202/dmestar_00015.0myr_z+0.00_a+0.00_marcs.iso' u (10**$2):4 w l ls 2

#     "/Users/grefe950/evolve/data/beq/models/GS98/dmestar_00010.0myr_z+0.00_a+0.00_phx_magBeq.iso" u (10**$2):4 w l ls 2 title "10.0 Myr: {/Symbol \341B\646\361 \75} B_{eq}", \
#     'usco5.txt' u 6:8:7:9 w xyerrorbars lt 2 pt 6 ps 1.0 lw 3 lc rgb "gray20" notitle

unset label

##
set out "USco_MRD_Astro2015.ps"

set xlabel "Mass (M_{/CMSY10 \014})"
set xrange [1.80:0.10] #0.40
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

plot '../../../evolve/dmestar/iso/gs98/p000/a0/amlt1884/dmestar_00005.0myr_z+0.00_a+0.00_phx.iso' u 1:(10**$5) w l ls 1 notitle, \
     '../../../evolve/dmestar/iso/gs98/p000/a0/amlt1884/dmestar_00010.0myr_z+0.00_a+0.00_phx.iso' u 1:(10**$5) w l ls 1 notitle, \
     '../../../evolve/dmestar/iso/gs98/p000/a0/amlt1884/dmestar_00015.0myr_z+0.00_a+0.00_phx.iso' u 1:(10**$5) w l ls 1 notitle, \
     "/Users/grefe950/evolve/data/beq/models/GS98/dmestar_00010.0myr_z+0.00_a+0.00_phx_magBeq.iso" u 1:(10**$5) w l ls 2 title "9.5 Myr: {/Symbol \341B\646\361 \75} B_{eq}", \
     "usco5.txt" u 2:4:3:5 w xyerrorbars lt 2 pt 6 ps 1.0 lw 3 lc rgb "gray20" notitle, \
