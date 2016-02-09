set encoding iso_8859_1
set term postscript enhanced color rounded font "Times-Roman, 20" dashlength 1.0 fontfile "/usr/local/share/ghostscript/9.07/Resource/Font/cmsy10.pfb"

set style line 1 lt 6 lw 3 #lc rgb "gray20"
set style line 2 lt 4 lw 4 #lc rgb "gray20"
set style line 3 lt 1 lw 1 ps 1.2 lc rgb "gray50"
set style line 4 lt 6 lw 4 dt '-' lc rgb "gray20"
set style line 5 lt 6 lw 4 lc rgb "gray20"
set style line 6 lt 6 lw 4 dt '_.' lc rgb "gray20"

set tics front
set bars small
set size square

set out "USco_median_HRD.ps"

set xlabel "T_{eff} (K)"
set xrange [10000:3000]
set xtics 2000
set mxtics 4

set ylabel "log_{10}(L / L_{/CMSY10 \014})"
set yrange [-2.0:2.0]
set ytics 1.0
set mytics 4
set format y "%4.2f"

set key on at 6250, -1.40 tc rgb "gray20" font ", 16"

plot "usco_emp_hrd.txt" u (10**$1):3:4 w filledcurves fc rgb "black" fs solid 0.15 notitle, \
     "" u (10**$1):3 w l lw 1 lc rgb "gray80" notitle, \
     "" u (10**$1):4 w l lw 1 lc rgb "gray80" notitle, \
     "tmp.txt" u (10**$3):5:(abs(10**$3 - 10**($3+$4))):6 w xyerrorbars ls 3 ps 0.6 pt 7 notitle, \
     "usco_emp_hrd.txt" u (10**$1):2 w l lw 3 lc rgb "gray20" title "Median Sequence" 
