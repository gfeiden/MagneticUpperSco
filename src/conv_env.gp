set encoding iso_8859_1
set term postscript enhanced color rounded font "Times-Roman, 20" dashlength 1.1 fontfile "/usr/local/share/ghostscript/9.07/Resource/Font/cmsy10.pfb"

set style line 1 lt 6 lw 2 #lc rgb "gray20"
set style line 2 lt 4 lw 4 #lc rgb "#1e90ff"
set style line 3 lt 1 lw 2 ps 1.2 lc rgb "gray50"
set style line 4 lt 6 dt '-' lw 3 lc rgb "gray20"
set style line 5 lt 6 lw 3 dt '_' lc rgb "gray20"
set style line 6 lt 6 dt '.-.' lw 3 lc rgb "gray20"

set size square
set tics front scale 3.0
set bars small

#########################
# Radiative Core Masses #
#########################
set out "../fig/convective_env_mass_difference.ps"

set xlabel "Effective Temperature (K)"
set xrange [3000:7000]
set xtics 1000
set mxtics 4
set format x "%4.0f"

set ylabel "Convective Env. Mass Difference (M_{/CMSY10 \014}) [mag - std] "
set yrange [-0.5:0.5]
set ytics 0.2
set mytics 4
set format y "%4.2f"

set key on at 5250, 0.42 font ", 16" tc rgb "gray20"
set key samplen 6.0 
set key spacing 3.0

f(x) = 0.0

set label "(c)" at 6500, 0.40 font ", 16" tc rgb "gray20" center

plot f(x) w l dt '_' lc rgb "gray20" lw 2 notitle, \
     "../models/iso/rad_core_comp.txt" u (10**$2):($14 - $7) w l ls 2 title "10 Myr - 10 Myr", \
     "../models/iso/rad_core_comp_dage.txt" u (10**$2):($14 - $7) w l ls 2 dt '-' title "10 Myr -   5 Myr"

unset label

#########################
# Radiative Core Masses #
#########################
set out "../fig/convection_env_masses.ps"

set multiplot

set size nosquare
set size 0.70, 0.5

set origin 0.0, 0.0

set xlabel "Effective Temperature (K)"
set xrange [2600:7500]
set xtics 1000
set mxtics 4
set format x "%4.0f"

set ylabel "M_{conv. env.} / M_{*} "
set yrange [-0.1:1.1]
set ytics 0.2
set mytics 2
set format y "%3.1f"

set label "(b)" at 3000, 0.2 font ", 16" tc rgb "gray20" left

set key at 7250, 1.0 font ", 14" tc rgb "gray20"
set key samplen 6.5
set key spacing 2.5

plot "../models/iso/std/dmestar_00005.0myr_z+0.00_a+0.00_phx.iso" u (10**$2):($7/$1) w l ls 6 title " 5 Myr, standard", \
     "../models/iso/std/dmestar_00010.0myr_z+0.00_a+0.00_phx.iso" u (10**$2):($7/$1) w l ls 4 title "10 Myr, standard", \
     "../models/iso/mag/dmestar_00010.0myr_z+0.00_a+0.00_phx_magBeq.iso" u (10**$2):($7/$1) w l ls 2 title "10 Myr, magnetic"

unset label

set origin 0.0, 0.5
set bmargin 3

set xlabel "Stellar Mass (M_{/CMSY10 \014})"
set xrange [0.0:1.80]
set xtics 0.2
set mxtics 2
set format x "%3.1f"

set ylabel "M_{conv. env.} / M_{*} "
set yrange [-0.1:1.1]
set ytics 0.2
set mytics 2
set format y "%3.1f"

set key at 1.1, 1.0 font ", 14" tc rgb "gray20"
set key samplen 6.5
set key spacing 2.5
set key off

set label "(a)" at 0.2, 0.2 font ", 16" tc rgb "gray20" left

plot "../models/iso/std/dmestar_00005.0myr_z+0.00_a+0.00_phx.iso" u 1:($7/$1) w l ls 6 title " 5 Myr, standard", \
     "../models/iso/std/dmestar_00010.0myr_z+0.00_a+0.00_phx.iso" u 1:($7/$1) w l ls 4 title "10 Myr, standard", \
     "../models/iso/mag/dmestar_00010.0myr_z+0.00_a+0.00_phx_magBeq.iso" u 1:($7/$1) w l ls 2 title "10 Myr, magnetic" 
