% this code is used to simulate the loop with non sinusoidal excitation
% using JJAM
clc
clear 
close all

global Hm Bm n_points    PAR  
 mu0=4*pi*10^-7;
  load Hm_35h270;load Bm_35h270;
 load H_hr;load B_hr;
  
  load p35insf3 % the parameters of the major loop using IJAM
 PAR=p35insf3;
       Hm= H_hr(:, 4);Bm=B_hr(:,4 );
 
  %********************************
 
   x = [p35insf3(1:5)];% the initial parameters to start simulation
 Ms=x(1); 
k=x(2);
c=x(3);
alpha=x(4);
a=x(5); 
  
  
n_points = length(Hm);

% % Generating of more than one loops to reach the final path
 nr=4;% the number of repeated loops of Hm,and Bm
  Hm=repmat(Hm,[nr,1]);Bm=repmat(Bm,[nr,1]);
    [H,M,B]=IJAM_loop(Hm,Bm); 
  plot(Hm(end-n_points:end,:),Bm(end-n_points:end,:),'r',...
        H(end-n_points:end,:),Bm(end-n_points:end,:),'b'); 
 Bs35ihr=Bm(end-n_points:end,:);
 Hs35ihr= H(end-n_points:end,:);
  

