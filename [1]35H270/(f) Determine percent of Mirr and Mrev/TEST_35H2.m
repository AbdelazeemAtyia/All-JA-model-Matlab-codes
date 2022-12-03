function [H,B,M,Mrev,Mirr]=TEST_35H2(Hm,Bm);
global parafm_M65A
mu0=4*pi*10^-7;
 
Ms=parafm_M65A(1);
k=parafm_M65A(2);
c=parafm_M65A(3);
alpha=parafm_M65A(4);
a=parafm_M65A(5); 
%  
  B=zeros(size(Hm));
  jj=0;nl=length(Hm)/6;
M=zeros(size(Hm));
Mirr=zeros(size(Hm));
Mrev=zeros(size(Hm));
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
Mirr(i-1,j)=(M(i-1,j)-c*Man)/(1-c); 
Mrev(i-1,j)=c*(Man-Mirr(i-1,j));
if i==(nl+1)+jj
         jj=jj+nl;
     end
 dH=Hm(i,j)-Hm(i-1,j);dB=Bm(i,j)-Bm(i-1,j);
 if(dH>0)
 delta=1;
 else
 delta=-1;
 end
      if (Man-Mirr(i-1,j))*dH>0
      deltaM=1;
   end
  if (Man-Mirr(i-1,j))*dH<=0
      deltaM=0;  
  end
dMirrdHe=deltaM*(Man-Mirr(i-1,j))/(k*delta);

  if sign(dH*(Man-Mirr(i-1,j))) > 0
          dMirrdHe = abs(Man-Mirr(i-1,j))/k;
      else
          dMirrdHe = 0;
  end
      
  
 dMdH=(((1-c)*(dMirrdHe))+(c*dMandHe))/(1-(alpha*c*dMandHe)-(alpha*(1-c)*dMirrdHe));
%dMdH=(((1-c)*(dMirrdHe))+(c*dMandHe))/(1-alpha*(1-c)*(dMirrdHe)-(alpha*c*dMandHe));
  M(i,j)=M(i-1,j)+dMdH*dH;
  B(i,j)=mu0*(Hm(i,j)+M(i,j));
   end
 end
 B=B(1:end,1:j);H=Hm(1:end,1:j);M=M(1:end,1:j);Mirr=Mirr(1:end,1:j);Mrev=Mrev(1:end,1:j);
 end
