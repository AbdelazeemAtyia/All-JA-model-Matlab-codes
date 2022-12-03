clc
clear
close all

load Bmi35;load Hmi35;load Hsi35;
load Bmi35sf;load Hmi35sf;load Hsi35sf;
res=Loss_inv(Hmi35sf,Bmi35sf,Hsi35sf,Bmi35sf);

res2=Loss_inv(Hmi35,Bmi35,Hsi35,Bmi35);