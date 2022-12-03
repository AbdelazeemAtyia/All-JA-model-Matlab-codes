clc
clear
close all
% these are the results of the hysteresis loop determined from folder (a) IJAM
load Bmi65;load Hmi65;load Hsi65;
load Bmi65sf;load Hmi65sf;load Hsi65sf;
res=Loss_inv(Hmi65sf,Bmi65sf,Hsi65sf,Bmi65sf);

res2=Loss_inv(Hmi65,Bmi65,Hsi65,Bmi65);