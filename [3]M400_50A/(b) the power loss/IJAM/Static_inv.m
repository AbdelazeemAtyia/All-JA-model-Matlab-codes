clc
clear
close all
% these results have been determined from folder (a) using IJAM
load Bmi50;load Hmi50; % the measured data 
load Hsi50; % the simulated data 
 

res2=Loss_inv(Hmi50,Bmi50,Hsi50,Bmi50);