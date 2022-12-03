function [H,M,B]=DJAM_minor(Hm,Bm);
mu0=4*pi*10^-7;
    global PAR  parafm_M65A;
     r = PAR(1);
    Ms =parafm_M65A(1); 
    k= parafm_M65A(2);
    c  =parafm_M65A(3);
    alpha=parafm_M65A(4);
    a = parafm_M65A(5);
  
  B=zeros(size(Hm));
  jj=0;nl=length(Hm)/6;
M=zeros(size(Hm));
M(1)=(B(1)/mu0)-(Hm(1));
 for(j=1:size(Hm,2))
 for i=2:size(Hm,1)
  He=Hm(i-1,j)+alpha*M(i-1,j);
  Man=Ms*(coth((He)/a)-a/(He));
  dMandHe=Ms*(1-(coth((He)/a)^2)+(a/(He))^2)/a;
  Mirr=(M(i-1,j)-c*Man)/(1-c);%   if i>=2 & i<=50 
if i==(nl+1)+jj
         jj=jj+nl;
     end
 dH=Hm(i)-Hm(i-1); 
 if(dH>0)
 delta=1;
 else
 delta=-1;
 end
      if (Man-Mirr)*dH>0
      deltaM=1;
       
      end
    if (Man-Mirr)*dH<=0
      deltaM=0;  
  end
 

dMirrdHe=deltaM*(Man-r*Mirr)/(k*delta);
dMdH=(((1-c)*(dMirrdHe))+(c*dMandHe))/(1-(alpha*c*dMandHe)-(alpha*(1-c)*dMirrdHe));
   M(i,j)=M(i-1,j)+dMdH*dH;
  B(i,j)=mu0*(Hm(i,j)+M(i,j));
   end
 end
 B=B(1:end,1:j);H=Hm(1:end,1:j);
 end
