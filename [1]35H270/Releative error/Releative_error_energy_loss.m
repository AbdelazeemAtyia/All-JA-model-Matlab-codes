clc
clear 
close all
%% the results for the DJAM 
load B_measu_35d;load B_simul_35d;load H_measu_35d;load H_simul_35d;
 Bt=max(B_measu_35d);
 
%% determine the relative error for the origional direct JAM
 ELD_measured=(polyarea(H_measu_35d,B_measu_35d));
 ELD_computed_origional=(polyarea(H_simul_35d,B_simul_35d));
 RelativeError_origional=(ELD_computed_origional-ELD_measured)./(ELD_measured)*100;
  RelativeError_origional=abs(RelativeError_origional);
 %% these are the releative errir at each loop for Liete's modification using DJAM
 load RDs1 ;load RDs2 ;load RDs3 ;load RDs4 ;load RDs5 ;load RDs6 ;
  %% these are the releative errir at each loop for Sajid's modification using DJAM
 load KRDs1 ;load KRDs2 ;load KRDs3 ;load KRDs4 ;load KRDs5 ;load KRDs6 ;
RE_Liete_direct=[RDs1(1); RDs2(1);  RDs3(1); RDs4(1);  RDs5(1);  RDs6(1);RelativeError_origional(end)];
RE_Liete_direct=abs(RE_Liete_direct);
 RE_Sajid_direct=[KRDs1(1);  KRDs2(1);  KRDs3(1);  KRDs4(1);  KRDs5(1);  KRDs6(1);RelativeError_origional(end)];
 RE_Sajid_direct=abs(RE_Sajid_direct);
 %% %% these are the releative errir at each loop for Sajid's modification using IJAM
 load REKI1_24_11;load REKI2_24_11;load REKI3_24_11;load REKI4_24_11;
 load REKI5_24_11;load REKI6_24_11;
  %% these are the releative errir at each loop for Liete's modification using IJAM
 load RERI1_24_11;load RERI2_24_11;load RERI3_24_11;load RERI4_24_11;
 load RERI5_24_11;load RERI6_24_11;
 load RE_I_NSF % the releative error for inverse without scaling factor
 RE_I_NSF=abs(RE_I_NSF);
 RE_Sajid_i_nsf=[REKI1_24_11(1); REKI2_24_11(1);  REKI3_24_11(1); ...
     REKI4_24_11(1);  REKI5_24_11(1);  REKI6_24_11(1);RE_I_NSF(end)];
RE_Sajid_i_nsf=abs(RE_Sajid_i_nsf);
  RE_Liete_i_nsf=[RERI1_24_11(1);  RERI2_24_11(1);  RERI3_24_11(1);  RERI4_24_11(1);....
      RERI5_24_11(1);  RERI6_24_11(1);RE_I_NSF(end)];
  RE_Liete_i_nsf=abs(RE_Liete_i_nsf);
  xq=linspace(Bt(1),Bt(end),10000);
 vq1i = interp1(Bt,RE_I_NSF,xq,'cubic');
 vq2i = interp1(Bt,RE_Liete_i_nsf,xq,'cubic');
 vq3i = interp1(Bt,RE_Sajid_i_nsf,xq,'cubic');
  vq1d = interp1(Bt,RelativeError_origional,xq,'cubic');
 vq2d = interp1(Bt,RE_Liete_direct,xq,'cubic');
 vq3d = interp1(Bt,RE_Sajid_direct,xq,'cubic');
 
 figure()
 subplot(1,2,1)
 hold on
 plot(xq,vq1d,'k','Linewidth',1.5)
 plot(xq,vq2d,'k:','Linewidth',1.5)
 plot(xq,vq3d,'k-.','Linewidth',1.5)
%  title('(a)The RE incase of DJAM')
title('(a)')
ylabel('ARE(%)'),xlabel('B [T]')
 legend('ARE\_DJAM','ARE\_Liete','ARE\_Sajid')
 set(gca,'FontSize',15,'fontweight','bold') 
 box on
 subplot(1,2,2)
 hold on 
 plot(xq,vq1i,'k','Linewidth',1.5)
 plot(xq,vq2i,'k:','Linewidth',1.5)
 plot(xq,vq3i,'k-.','Linewidth',1.5)
% title('(b)The RE incase of IJAM')
ylabel('ARE(%)'),xlabel('B [T]')
title('(b)')
 legend('ARE\_IJAM','ARE\_Liete','ARE\_Sajid')
 set(gca,'FontSize',15,'fontweight','bold') 
 box on
 