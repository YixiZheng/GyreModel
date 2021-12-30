bye; clf

nx=62; ny=62; dxg=1e3; dyg=1e3;

% % for nnn=[-20:20:20]*1e3% bottem-left
% % for nnn=[60:20:100]*1e3% bottem-left
% % alpha=0.7;% bottem-left
% % for alpha=0.7% bottem-left
% % nnn=0;
% % alpha=1.5,2.1
% % for alpha=0:0.1:2*pi
% % for alpha=6
% %     nnn=nnn+1;
% %     alpha_i(nnn)=alpha;
% % end
% % for nnn=65*1e3
ieee='b'; % big endian format
accuracy='real*4'; % this is single precision

NX=122; NY=122; DXG=5e2; DYG=5e2;

% Wind-stress
vMax=10; % wind stress maximum
alphak=1/12;
% V=repmat((vMax.*(1-alphak*5e-2*((0:NX-1)-0.5)))',1,NY);
% V(:,1:NY)=V(:,1:NY).*(1-alphak*1e-2*((0:NY-1)-0.5));

for x=0:NX+1
    for y=0:NY+1
        V(x+1,y+1)=(vMax*(1-alphak*5e-2*(x-1.5)))*(1-alphak*1e-2*(y-1.5));
%         vana2(x,y)=vMax*(1-alphak*(5*x*1e-2-y*1e-2+90)+5*alphak^2*(x*y*1e-4-15*(x+y)*1e-2+225));
    end
end

U=zeros(NX+2,NY+2);

UU=sqrt(U.^2+V.^2);

pcolor(2:NX-1,2:NY-1,(UU(2:NX-1,2:NY-1))'); colorbar; load sal_temp; colormap(sal_temp);caxis([5 10])

for i=1:nx
    for j=1:ny
        u(i,j)=mean(mean(U(2*i-1:2*i,2*j-1:2*j)));
        v(i,j)=mean(mean(V(2*i-1:2*i,2*j-1:2*j)));
    end
end

Cd=0.001;
rho_air= 1.275;
tauy=rho_air.*Cd.*abs(v).*v;
taux=rho_air.*Cd.*abs(u).*u;

% % %---------------- generate sea ice
% %---------------- blocks
% % taux(:,nnn:end)=0; u(:,nnn:end)=0;
% % tauy(:,nnn:end)=0; v(:,nnn:end)=0;
% 
% % %---------------- slope
% % for i=1:nx
% %     for j=1:ny
% %         if -i*dxg+2*j*dyg>=50e3 %top-left
% % %         if i*dxg+2*j*dyg>=120e3
% %         taux(i,j)=0; u(i,j)=0;
% %         tauy(i,j)=0; v(i,j)=0;
% %         end
% %     end
% % end

tauy=flipud(tauy);
v=flipud(v);
% % ---------------- diagnol
% for i=1:nx
%     for j=1:ny
%         if i-j<0 % round and round
%         taux(i,j)=0; u(i,j)=0;
%         tauy(i,j)=0*tauy(i,j); v(i,j)=0*v(i,j);
%         end
%     end
% end

figure
uu=sqrt(u.^2+v.^2); 
pcolor(1:nx,1:ny,uu'); colorbar; load sal_temp; colormap(sal_temp);caxis([0 10])


% cd run
fid=fopen('windy_PIB_rec.bin','w',ieee); fwrite(fid,tauy,accuracy); fclose(fid);
% % fid=fopen('/Users/yixizheng/MITgcm-master/verification/tutorial_barotropic_gyre/run/windx_PIB_rec.bin','w',ieee); fwrite(fid,taux,accuracy); fclose(fid);
% % %---------------- test plot
% % test_plot_GenWind
% 
% % %---------------- run MITgcm
% % % system('../test_1')
% 
% 
% system('mv pick* ../pick_up/.')
% system('rm *.meta *.data STD*')
% cd ../pick_up
% system('cp pick* ../run/.')
% % cd ../run
% % cd ../read_matlab
% 
% cd ..
% system('./job_1')
% 
% %---------------- plot 4 main figures
% % plot_4mains
% MITgcmEndingFigure
% % ITGC_wind_current
% % print -r211 -dbmp test
% % print(['test',num2str(nnn)],'-dbmp','-r211')
% % print(['test',num2str(nnn)],'-dbmp','-r71')
% % % end
