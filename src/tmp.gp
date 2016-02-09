set encoding iso_8859_1
set term postscript enhanced color rounded font "Times-Roman, 20" dashlength 1.0 fontfile "/usr/local/share/ghostscript/9.07/Resource/Font/cmsy10.pfb"

set style line 1 lt 3 lw 3 dt '-' #lc rgb "gray20"
set style line 2 lt 6 lw 3 #lc rgb "gray20"
set style line 3 lt 1 lw 2 ps 1.2 lc rgb "gray50"

set size square
set tics front
set bars small

set out "HRD_ages_bfields.ps"

set xlabel "T_{eff} (K)"
set xrange [6000:2000]
set xtics 1000
set mxtics 4

set ylabel "log_{10}(L / L_{/CMSY10 \014})"
set ytics 1.0
set mytics 4
set format y "%4.2f"

set key off

plot '../../../evolve/dmestar/iso/gs98/p000/a0/amlt1884/dmestar_00002.0myr_z+0.00_a+0.00_phx.iso' u (10**$2):4 w l ls 1 notitle, \
     '../../../evolve/dmestar/iso/gs98/p000/a0/amlt1884/dmestar_00005.0myr_z+0.00_a+0.00_phx.iso' u (10**$2):4 w l ls 1 notitle, \
     '../../../evolve/dmestar/iso/gs98/p000/a0/amlt1884/dmestar_00010.0myr_z+0.00_a+0.00_phx.iso' u (10**$2):4 w l ls 1 notitle, \
     '../../../evolve/dmestar/iso/gs98/p000/a0/amlt1884/dmestar_00030.0myr_z+0.00_a+0.00_phx.iso' u (10**$2):4 w l ls 1 notitle, \
     "/Users/grefe950/evolve/data/beq/models/GS98/dmestar_00005.0myr_z+0.00_a+0.00_phx_magBeq.iso" u (10**$2):4 w l ls 2 title "5.0 Myr: {/Symbol \341B\646\361 \75} B_{eq}", \
     "/Users/grefe950/evolve/data/beq/models/GS98/dmestar_00010.0myr_z+0.00_a+0.00_phx_magBeq.iso" u (10**$2):4 w l ls 2 title "10.0 Myr: {/Symbol \341B\646\361 \75} B_{eq}", \
     "/Users/grefe950/evolve/data/beq/models/GS98/dmestar_00030.0myr_z+0.00_a+0.00_phx_magBeq.iso" u (10**$2):4 w l ls 2 title "30.0 Myr: {/Symbol \341B\646\361 \75} B_{eq}", \
     "/Users/grefe950/evolve/data/beq/models/GS98/dmestar_00050.0myr_z+0.00_a+0.00_phx_magBeq.iso" u (10**$2):4 w l ls 2 title "50.0 Myr: {/Symbol \341B\646\361 \75} B_{eq}"


