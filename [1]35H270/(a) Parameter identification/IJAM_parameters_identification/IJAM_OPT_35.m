% this code is used to find the parameters of the major loop using IJAM
clc
clear 
close all

global Hm Bm n_points   
 mu0=4*pi*10^-7;
  load Hm_35h270;load Bm_35h270;
   load p35gs  % I used these parameters as initla values
  % the global search has been used to find the parameters Param_accurate
          P35_OJ=p35gs; % thisis just the initial parameters
       Hm= Hm_35h270(:,1:7);Bm=Bm_35h270(:,1:7);
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
 
n_points = length(Hm);

% % Generating of more than one loops to reach the final path
 nr=4;% the number of repeated loops of Hm,and Bm
  Hm=repmat(Hm,[nr,1]);Bm=repmat(Bm,[nr,1]);
 
  tic
   
    options=psoptimset('MaxIter', 50,'Display','iter','CompletePoll','On', ...
         'PollingOrder','Success','InitialMeshSize',1,'ScaleMesh','On','TolX',0,'TolFun',0);
  
        [PARA,fval,exit_flag] = fmincon(@cost_fun,x,[],[],[],[],Lbx,Ubx,[],options);
  toc
 
 % the output is the parameters under the name of p35insf3

