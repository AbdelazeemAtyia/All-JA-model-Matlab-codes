 function [H,M,He]=optdc2(B2,B1,H1,M,lastHe);
  global  PAR
mu0=4*pi*10^-7;
    Ms=PAR(1); k=PAR(2);c=PAR(3);alpha=PAR(4);a=PAR(5); 
    dB=B2-B1;   
   He=H1+alpha*M;
   dHe=He-lastHe;
   Man=Ms*(coth(He/a)-a/(He));
   Mirr=(M-c*Man)/(1-c);
  dMandHe=(Ms/a)*(1-(coth(He/a)^2)+(a/He)^2);
 
delta=sign(dHe); 
x=(Man-Mirr)/k*delta;
  zeta=dMandHe;
 
  
  if (Man-Mirr)*dHe<=0
       dMdB=(c*zeta)/(mu0*(1+c*zeta*(1-alpha)));
  else
       dMdB=((1-c)*x+(c*zeta))/(mu0*(1+(1-c)*x*(1-alpha)+c*zeta*(1-alpha)));
  end
 
    F=@(H,B)((1/mu0)-dMdB);
     F1=dB*(F(B1,H1));
    F2=dB*F((B1+dB/2),(H1+F1/2));
    F3=dB*F((B1+dB/2),(H1+F2/2));
    F4=dB*F((B1+dB),(H1+F3));
    H=H1+(1/6)*(F1+2*F2+2*F3+F4);
    M=B2/mu0-H;
    H=B2/mu0-M;
    
 end  
 
  