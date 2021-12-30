ieee='b'; % big endian format
accuracy='real*4'; % this is single precision

Ho=1e3;  % ocean depth in meters
NX=62; % number of gridpoints in x-direction
NY=62; % number of gridpoints in y-direction
% NX=14; % number of gridpoints in x-direction
% NY=14; % number of gridpoints in y-direction

nx=14; ny=14;

% Flat bottom at z=-Ho

H=-Ho*ones(NX,NY);
h=-Ho*ones(nx,ny);
h(1,:)=0; h(1:end-5,[1 end])=0;
% h([1 end],:)=0;h(:,[1 end])=0;

% Walls (surrounding domain) - generate bathymetry file


%% another domain
% H(end-nx+1:end,6:6+ny-1)=h;
% H(6:6+ny-1,6:6+ny-1)=h;

H([1 end],:)=0;
H(:,[1 end])=0;

% h(14:37,10:13)=1.5*Ho;
% fid=fopen('bathy_PIB.bin','w',ieee); fwrite(fid,h,accuracy); fclose(fid);
% cd run
fid=fopen('bathy_PIB_rec.bin','w',ieee); fwrite(fid,H,accuracy); fclose(fid);
% fid=fopen('/Users/yixizheng/MITgcm-master/verification/tutorial_barotropic_gyre/run/bathy_PIB_rec.bin','w',ieee); fwrite(fid,h,accuracy); fclose(fid);
% cd ..