% this code is used to find the parameters of the major loop using IJAM
clc
clear 
close all

global Hm Bm n_points    PAR   RE  
 mu0=4*pi*10^-7;
  load Hm_35h270;load Bm_35h270;
 
  
 load p35insf3
 
           PAR=p35insf3;
           L=input('The loop number')
      Hm= Hm_35h270(:,L);Bm=Bm_35h270(:,L);
 
  %********************************
 
   x = [1];% the initial parameters to start simulation
 r=x(1); 
 
   
Lbx=[1];
 Ubx=[9];
n_points = length(Hm);

% % Generating of more than one loops to reach the final path
 nr=4;% the number of repeated loops of Hm,and Bm
  Hm=repmat(Hm,[nr,1]);Bm=repmat(Bm,[nr,1]);
   
 %%%%%%%%%%%%%%%%
PARA=[r];
% 
tic
 
   options=psoptimset('MaxIter',50,'Display','iter','CompletePoll','On', ...
       'PollingOrder','Success','InitialMeshSize',1,'ScaleMesh','On','TolX',0,'TolFun',0);
 
      [PARA,fval,exit_flag] = fmincon(@cost_fun,x,[],[],[],[],Lbx,Ubx,[],options);
toc
RE_R_I=[RE,PARA];
%save RERI5_24_11 RE_R_I -ascii

