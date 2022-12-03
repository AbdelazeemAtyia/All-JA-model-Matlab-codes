% this code is used to find the major loop parameters for M400-50A using
% IJAM

clc
clear 
close all

global Hm Bm n_points     RE   
  mu0=4*pi*10^-7;

load Hm_50f;load Bm_50A;% the data of 35h270
    
   load par400; % the initial parameters to start simulation
         
         P35_OJ=par400; 
    
   Hm= Hm_50f(:,6);Bm=Bm_50A(:,6);
   out=[Hm Bm];
   
 

   Hm= Hm_50f(:,1:6);Bm=Bm_50A(:,1:6);
   
  %********************************
 
   x = [P35_OJ(1:5)];% the initial parameters to start simulation
 Ms=x(1); 
k=x(2);
c=x(3);
alpha=x(4);
a=x(5); 
 
perc_Ms = 0.9;
 perc_k = 1.2;
 perc_c = 0.3;
perc_alpha = 1.5;
perc_a = 1.5;

Lbx=[Ms-Ms*perc_Ms k-k*perc_k c-c*perc_c alpha-alpha*perc_alpha a-a*perc_a];
Ubx=[Ms+Ms*perc_Ms k+k*perc_k c+c*perc_c alpha+alpha*perc_alpha a+a*perc_a];

% Lbx=0.99*[Ms-Ms*perc_Ms k-k*perc_k c-c*perc_c alpha-alpha*perc_alpha a-a*perc_a];
% Ubx=[Ms+Ms*perc_Ms k+k*perc_k c+c*perc_c alpha+alpha*perc_alpha a+a*perc_a];
n_points = length(Hm);

% % Generating of more than one loops to reach the final path
 nr=4;% the number of repeated loops of Hm,and Bm
  Hm=repmat(Hm,[nr,1]);Bm=repmat(Bm,[nr,1]);
  
 %%%%%%%%%%%%%%%%
PARA=[Ms, k, c, alpha, a];
% 
tic
 
 
 
   options=psoptimset('MaxIter',150,'Display','iter','CompletePoll','On', ...
       'PollingOrder','Success','InitialMeshSize',1,'ScaleMesh','On','TolX',0,'TolFun',0);
 
      [PARA,fval,exit_flag] = fmincon(@cost_fun,x,[],[],[],[],Lbx,Ubx,[],options);
 


toc
 


