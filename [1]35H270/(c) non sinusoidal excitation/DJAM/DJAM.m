% this is the  DJAM 
% using the major loop parameters , that have been determined from 
% file (a), we can simulate the loop with harmonics
clc
clear
load H_hr;load B_hr;% the measured data with harmonics
 
load Hm_35h270;load Bm_35h270;% the measured data without harmonics
load p35gs; % the parameters of the major loop
load Rd; % the damping factor R determined from the symmetric minor loops

 Bt=max(Bm_35h270(:,1:7));
Ms=p35gs(1);k=p35gs(2);c=p35gs(3);alpha=p35gs(4);a=p35gs(5);
 nr=6;% the number of repeated loops of Hm,and Bm
 Hm=H_hr(:,4);Bm=B_hr(:,4);
n_points = length(Hm);
mu0=4*pi*10^-7;
 
Hm=repmat(Hm,[nr,1]);Bm=repmat(Bm,[nr,1]);

      B=zeros(size(Hm));
  jj=0;nl=length(Hm)/6;
M=zeros(size(Hm));
M(1)=(B(1)/mu0)-(Hm(1));
 for(j=1:size(Hm,2))
 for i=2:size(Hm,1)
dH=Hm(i,j)-Hm(i-1,j);dB=Bm(i,j)-Bm(i-1,j);
 if(dH>0)
 delta=1;
 else
 delta=-1;
 end
  He=Hm(i-1,j)+alpha*M(i-1,j);
  Man=Ms*(coth((He)/a)-a/(He));
  dMandHe=Ms*(1-(coth((He)/a)^2)+(a/(He))^2)/a;
  Mirr=(M(i-1,j)-c*Man)/(1-c); 
 
 dH=Hm(i)-Hm(i-1);dB=Bm(i)-Bm(i-1);
 if(dH>0)
 delta=1;
 else
 delta=-1;
 end
 
  RR=1;
  
      if (Man-Mirr)*dH>0
      deltaM=1;
   end
  if (Man-Mirr)*dH<=0
      deltaM=0;  
  end
%   deltaM=1;
dMirrdHe=deltaM*(Man-RR*Mirr)/(k*delta);
dMdH=(((1-c)*(dMirrdHe))+(c*dMandHe))/(1-(alpha*c*dMandHe)-(alpha*(1-c)*dMirrdHe));
   M(i,j)=M(i-1,j)+dMdH*dH;
  B(i,j)=mu0*(Hm(i,j)+M(i,j));
   end
 end
 Bs=B(1:end,1:j);Hm=Hm(1:end,1:j);
 figure(2)
plot(Hm(end-n_points:end),Bm(end-n_points:end),'r','LineWidth',1.5);
hold on
 plot(Hm(end-n_points:end),Bs(end-n_points:end),'b','LineWidth',1.5);
 hold on
  hold off
legend('Meas','Simu','Location','northwest')
title(['JA Res at B = ', num2str(max(Bm)),'T'],'fontweight','bold','fontsize',15);
xlabel('H[A/m]'),ylabel('B[T]')
set(gca,'FontSize',15,'fontweight','bold') 

Hs35dhr=Hm(end-n_points:end);
Bs35dhr=Bs(end-n_points:end);
 
