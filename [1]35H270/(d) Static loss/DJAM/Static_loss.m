clc
clear 
close all

 
load p35gs% these parameters have been determined from file (a)
load  B_measu_35d % the measured data of B for 35H
load H_measu_35d  % the measured data of H for 35H
load  B_simul_35d % the measured data of B for 35H, can be dcalculated from file (a)
load  H_simul_35d  % the simulated data of H for 35H, can be dcalculated from file (a)
% we are using p35insf33 to find the Bmi35, Bmi35nsf and the other values
% this function is used to find the power loss and draw it
res=Loss(H_measu_35d,B_measu_35d,H_simul_35d,B_simul_35d);