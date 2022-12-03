 function [Hsim,Msim,Bsim]=loop_ALL(Hm,Bm);
global   n_points   nr   
mu0=4*pi*10^-7;
nr=4;% the number of repeated loops of Hm,and Bm
  Mm=Bm/mu0-Hm;
Msim=zeros(size(Bm));
Hsim=zeros(size(Bm));
  for(j=1:size(Bm,2));
    H=Hm(1,j); 
    M=Mm(1,j); 
    lastHe=0;
      for(i=2:size(Bm,1));
        [H,M]=IJAM(Bm(i,j),Bm(i-1,j),H,M);
         Hsim(i,j)=H;
        Msim(i,j)=M; 
      end
  end
   sf1=max(Hm(:,end))/max(Hsim(:,end));
   sf1=1;
  Hsim=sf1.*(Hsim(1:end,:));Bsim=Bm(1:end,:);Msim=Msim(1:end,:);
  end
 
 