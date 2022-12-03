% this code is used to find the major loop parameters for M400-50A using DJAM
clc
clear 
close all

global Hm Bm n_points  
load Hm_50f;load Bm_50A; % the measured data
 
 load Par400 % the initial parameter
 mu0=4*pi*10^-7;

Hm= Hm_50f(:,1:6);Bm=Bm_50A(:,1:6); % the major loop
 x=Par400;
 Ms=x(1); 
k=x(2);
c=x(3);
alpha=x(4);
a=x(5); 
   
    
n_points = length(Hm);

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
options=psoptimset('MaxIter',200,'Display','iter','CompletePoll','On', ...
    'PollingOrder','Success','InitialMeshSize',1,'ScaleMesh','On','TolX',0,'TolFun',0);
 [PARA,fval,exit_flag] = fmincon(@cost_fun,PARA,[],[],[],[],Lbx,Ubx,[],options);
 toc
 

