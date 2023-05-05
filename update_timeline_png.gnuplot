#!/usr/bin/env gnuplot

set xdata time
set timefmt "%Y; %m;"
set format x "%Y"

set ylabel 'Oldal letöltés működik (%)'

set yrange [0:60]

set terminal png size 780,620 enhanced font "Helvetica,12"
set output 'results/timeline.png'

plot 'results/timeline.csv' u 1:(100*$5/20)   w lp title 'top 20' , \
     'results/timeline.csv' u 1:9             w lp title 'top 100', \
     'results/timeline.csv' u 1:(100*$13/500) w lp title 'top 500'

