clc
clear 
close all

global Hm Bm n_points   
% this program is used to find the optimal parametersfor 23H270 using
% Origional JAM
load Hm_35h270;load Bm_35h270;% the data of 35h270
  load Para_OJAM% parameters using gs, we can use any other initial parameters
   % and the optomization will select the right one 
 Hm= Hm_35h270(:,1:7);Bm=Bm_35h270(:,1:7);
   x = [Para_OJAM];% the initial parameters to start simulation
 
 Ms=x(1); 
k=x(2);
c=x(3);
alpha=x(4);
a=x(5); 
   
    
n_points = length(Hm);
mu0=4*pi*10^-7;

% Generating of more than one loops to reach the final path
Hm = [Hm;Hm;Hm;Hm;Hm;Hm];
Bm = [Bm;Bm;Bm;Bm;Bm;Bm]; 
  
perc_Ms = 0.9;
 perc_k = 1.2;
 perc_c = 0.3;
perc_alpha = 1.5;
perc_a = 1.5;

   Lbx=[Ms-Ms*perc_Ms k-k*perc_k c-c*perc_c alpha-alpha*perc_alpha a-a*perc_a];
  Ubx=[Ms+Ms*perc_Ms k+k*perc_k c+c*perc_c alpha+alpha*perc_alpha a+a*perc_a];
 %%%%%%%%%%%%%%%%
PARA=[Ms, k, c, alpha, a];
tic
options=psoptimset('MaxIter',100,'Display','iter','CompletePoll','On', ...
    'PollingOrder','Success','InitialMeshSize',1,'ScaleMesh','On','TolX',0,'TolFun',0);
[PARA,fval,exit_flag] = fmincon(@M35H_cost_fun,PARA,[],[],[],[],Lbx,Ubx,[],options);
 
 
 toc

 % the out put of this program is the optomizing parameters for th major
 % loop of 35H270
