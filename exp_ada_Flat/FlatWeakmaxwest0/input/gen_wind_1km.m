bye; clf

nx=62; ny=62; dxg=1e3; dyg=1e3;

ieee='b'; % big endian format
accuracy='real*4'; % this is single precision

load /Users/yixizheng/MITgcm/basic_tauy
load /Users/yixizheng/MITgcm/basic_curl

tauy=zeros(nx,ny);
tauy(1,:)=basic_tauy(1,:);
tauy(:,1)=basic_tauy(:,1);
tauy=(tauy./0.08526)*0.067351575189616;

curl=basic_curl./2;
for i=2:nx
    tauy(i,:)=tauy(i-1,:)+curl(i-1,:)*dxg;
end
% mean(tauy(:))/mean(basic_tauy(:))

u=zeros(nx,ny);

Cd=0.001;
rho_air= 1.275;
taux=rho_air.*Cd.*abs(u).*u;

tauy=flipud(tauy);
% v=flipud(v);
% ---------------- diagnol
for i=1:nx
    for j=1:ny
        if j>31 % round and round
        taux(i,j)=0; u(i,j)=0;
        tauy(i,j)=0*tauy(i,j);% v(i,j)=0*v(i,j);
        end
    end
end

% figure
% uu=sqrt(u.^2+v.^2); 
% pcolor(1:nx,1:ny,uu'); colorbar; load sal_temp; colormap(sal_temp);caxis([0 10])

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
