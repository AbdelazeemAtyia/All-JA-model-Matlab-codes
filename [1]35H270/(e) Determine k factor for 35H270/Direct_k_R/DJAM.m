function [H,M,B]=DJAM(Hm,Bm);
mu0=4*pi*10^-7;
    global PAR  Para_OJAM;

    Ms =Para_OJAM(1); 
     c  =Para_OJAM(3);
    alpha=Para_OJAM(4);
    a = Para_OJAM(5);
   k= PAR(1); r = PAR(2);
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
    %%
  if (abs(He/a)<=0.1)
        dMandHe = Ms/(3*a);
    elseif (abs(He/a)>0.1)
        dMandHe= (Ms/a)*(1-(coth(He/a))^2+(a/He)^2);
   end
  %%
  Mirr=(M(i-1,j)-c*Man)/(1-c);%   if i>=2 & i<=50 
if i==(nl+1)+jj
         jj=jj+nl;
end
 
 
    if (Man-r*Mirr)>0&dH<0
      deltaM=0;
  elseif (Man-r*Mirr)<0&dH>0
      deltaM=0;
  else
      deltaM=1;  
    end
   dMirrdHe=deltaM*(Man-r*Mirr)/(k*delta);
 dMdH=(((1-c)*(dMirrdHe))+(c*dMandHe))/(1-(alpha*c*dMandHe)-(alpha*(1-c)*dMirrdHe));
   M(i,j)=M(i-1,j)+dMdH*dH;
  B(i,j)=mu0*(Hm(i,j)+M(i,j));
   end
 end
 B=B(1:end,1:j);H=Hm(1:end,1:j);
 end
