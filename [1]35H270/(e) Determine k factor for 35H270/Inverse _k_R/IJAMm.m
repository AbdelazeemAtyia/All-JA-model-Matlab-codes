 function [H,M]=IJAMm(B2,B1,H1,M);
 global  PAR Rf k   
mu0=4*pi*10^-7;
    Ms=PAR(1);
      c=PAR(3);
    alpha=PAR(4);
     a=PAR(5);
    dB=B2-B1;   
   He=H1+alpha*M;
   Man=Ms*(coth(He/a)-a/(He));
   Mirr=(M-c*Man)/(1-c);
  dMandHe=(Ms/a)*(1-(coth(He/a).^2)+(a/He).^2);
 if(dB>0)
     delta=1;
 else
     delta=-1;
 end
 
 
delM=0.5*(1+sign((Man-Rf*Mirr)*dB)); 
 %%
  
   dMirrdBe=delM*(Man-Rf*Mirr)/(mu0*k*delta);
   dMdB=((1-c)*dMirrdBe+((c/mu0)*dMandHe))/(1+mu0*(1-alpha)*(1-c)*dMirrdBe+c*(1-alpha)*dMandHe);

  M=M+dMdB*dB;
  H=(B2/mu0-M);
 end  
  