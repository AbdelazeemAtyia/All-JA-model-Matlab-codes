% this program is used to find the parameters of the DC major loop
clc
clear all
close all

global Hm Bm n_points Ms   k
 
   load dc_5Hz.mat; % the measured data for DC
   load dcb5hz; % the measured data for DC+AC
    load p5hz; % the initial parameters for the major loop
    x=p5hz;
 Ms=x(1); 
k=x(2);
c=x(3);
alpha=x(4);
a=x(5); 
  Hm=dc_5Hz(:,1);Bm=dc_5Hz(:,2); % the major loop of the DC major loop
    n_points = length(Hm);
 % Generating of more than one loops to reach the final path
Hm = [Hm;Hm;Hm;Hm;Hm;Hm];
Bm = [Bm;Bm;Bm;Bm;Bm;Bm];

mu0=4*pi*10^-7;

% tolerance percentage
 
perc_Ms = 0.9;
 perc_k = 1.2;
 perc_c = 0.3;
perc_alpha = 1.5;
perc_a = 1.5;
Lbx=[Ms-Ms*perc_Ms k-k*perc_k c-c*perc_c alpha-alpha*perc_alpha a-a*perc_a];
Ubx=[Ms+Ms*perc_Ms k+k*perc_k c+c*perc_c alpha+alpha*perc_alpha a+a*perc_a];


%%%%%%%%%%%%%%%%
PARA=[Ms, k, c, alpha, a];

options=psoptimset('MaxIter',200,'Display','iter','CompletePoll','On', ...
    'PollingOrder','Success','InitialMeshSize',1,'ScaleMesh','On','TolX',0,'TolFun',0);
[PARA,fval,exit_flag] = fmincon(@cost_dcbias,PARA,[],[],[],[],Lbx,Ubx,[],options);

