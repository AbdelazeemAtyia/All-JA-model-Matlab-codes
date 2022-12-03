% this code is used to determine the hyst. loss
clc
clear 
close all

 
    %% M400_65A data
    load pl77 %  the major loop parameter
    % thes data were determined from file a, these are the measured and
    % simulated data
load B_measu_65d  
load H_measu_65d  
load B_simul_65d  
load H_simul_65d
     
      
   res=loss(H_measu_65d,B_measu_65d,H_simul_65d,B_simul_65d);
 
    