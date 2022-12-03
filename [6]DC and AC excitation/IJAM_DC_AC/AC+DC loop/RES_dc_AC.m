 % this  code is used to simulate the AC+DC loop by 
 % using  the parameters of the DC major loop using IJAM
clc
clear 
close all

global Hm Bm n_points  PAR
 
    load dcb5hz; % the AC=DC measured data
    load pdcnsf; % the parameters of the major loop (DC)
    load pdcnsf
    Hm=dcb5hz(:,1);Bm=dcb5hz(:,2);% DC major loop  at 5 Hz
   PAR=pdcnsf;
    
n_points = length(Hm);
mu0=4*pi*10^-7;

% Generating of more than one loops to reach the final path
Hm = [Hm;Hm;Hm;Hm;Hm;Hm];
Bm = [Bm;Bm;Bm;Bm;Bm;Bm]; 
   
[H,M,B]=loop(Hm,Bm);
   plot(Hm(end-n_points:end),Bm(end-n_points:end),'r',H(end-n_points:end),Bm(end-n_points:end),'b','Linewidth',1.5);
   legend('Meas','Simu','Location','northwest')
 xlabel('H[A/m]'),ylabel('B[T]')
set(gca,'FontSize',15,'fontweight','bold')
  