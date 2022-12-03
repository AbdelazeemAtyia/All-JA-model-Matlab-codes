function [Hsx,m_simulx]=DJAM_new(Hm,Bm);
mu0=4*pi*10^-7;
    global PAR  
     Ms =PAR(1); 
    k  = PAR(2);
    c  =PAR(3);
    alpha=PAR(4);
    a = PAR(5);
 
   jj=0;nl=length(Hm)/6;
M=zeros(size(Hm));
M(1)=(Bm(1)/mu0)-(Hm(1));
 for(j=1:size(Hm,2))
 for i=2:size(Hm,1)
dH=Hm(i,j)-Hm(i-1,j); 
 if(dH>0)
 delta=1;
 else
 delta=-1;
 end
  He=Hm(i-1,j)+alpha*M(i-1,j);
  Man=Ms*(coth((He)/a)-a/(He));
  dMandHe=Ms*(1-(coth((He)/a)^2)+(a/(He))^2)/a;
  Mirr=(M(i-1,j)-c*Man)/(1-c); 
if i==(nl+1)+jj
         jj=jj+nl;
end
  
      if (Man-Mirr)*dH>0
      deltaM=1;
   end
  if (Man-Mirr)*dH<=0
      deltaM=0;  
  end
dMirrdHe=deltaM*(Man-Mirr)/(k*delta);
dMdH=(((1-c)*(dMirrdHe))+(c*dMandHe))/(1-(alpha*c*dMandHe)-(alpha*(1-c)*dMirrdHe));
   M(i,j)=M(i-1,j)+dMdH*dH;
    end
 end
 m_simulx=M(1:end,1:j);Hsx=Hm(1:end,1:j);
 end