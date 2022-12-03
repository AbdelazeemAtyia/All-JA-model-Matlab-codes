function [Pm,Ps,Hmo,Bmo,Hso,Bso,error]=all_material(Hm,Bm,Hs,Bs);
H_measu_50d=Hm;B_measu_50d=Bm;
H_simul_50d=Hs;B_simul_50d=Bs;
  Bm1=B_measu_50d(:,end);
    Hm1=H_measu_50d(:,end);
    Hs1=H_simul_50d(:,end);
    Bsx1=B_simul_50d(:,end);
    Bmo=Bm1(Bm1>0);
     Bso=Bsx1(Bsx1>0);
     Hmo=Hm1(Bm1>0);
   Hso=Hs1(Bsx1>0);

    dens=7650; % density in kg/m^3
f=1; % frequency in Hz
Ps=(1000*f/dens).*polyarea(H_simul_50d,B_simul_50d); 
Pm=(1000*f/dens).*polyarea(H_measu_50d,B_measu_50d);
error=(abs(Ps-Pm)./Pm)*100;
 
 end