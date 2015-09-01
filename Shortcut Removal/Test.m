%This code shows the meaninfgulness of geodesic pathes in embedding
%manifold which produced by Isomap.
%face_data is a database of faces in naturally 3 dimensiosns but primary 4096
%formal dimensions
clc;
load face_data;
%compute the distance matrix of data points 
%return 698 by 698 matrix
adDistanceMatrix=L2_distance(images(:,1:698),images(:,1:698));
[Y, R, E, vec, val,F]=Isomap(adDistanceMatrix,'k',6);
%now we move along x, y and z axes of 3-dimensional embedding
%x: face turns left and right
%y: face turns up to down
%z: the density of light changes
adX=Y.coords{3}(:,135);
adY=Y.coords{3}(:,88);
adZ=Y.coords{3}(:,698);
ix=0;iy=0;iz=0;preindexx=inf;preindexy=inf;preindexz=inf;
h=figure('name','3-dimensinal embedding from Isomap dimension reduction algorithm','NumberTitle','off');

for i=1:40
    adX(1,1)=adX(1,1)+1.97;
    adY(2,1)=adY(2,1)+1.97;
    adZ(3,1)=adZ(3,1)+1.97;
    
    [dd indexx]= min(L2_distance(Y.coords{3},adX));
    [dd indexy]= min(L2_distance(Y.coords{3},adY));
    [dd indexz]= min(L2_distance(Y.coords{3},adZ));
    
    if indexx~=preindexx && ix<12
    ix=ix+1;
    subplot(3,12,ix);
    imshow(reshape(images(:,indexx),[64 64]));
    if preindexx==inf
    title(' to Right Turning');end;
    end;
    if indexy~=preindexy && iy<12
    iy=iy+1;
    subplot(3,12,iy+12);
    imshow(reshape(images(:,indexy),[64 64]));
    if preindexy==inf
    title('Up to Down Turning');end;
    end;
    if  indexz~=preindexz && iz<12
    iz=iz+1;    
    subplot(3,12,iz+24);
    imshow(reshape(images(:,indexz),[64 64]));
    if preindexz==inf
    title('Density of Lightness');end;
    end;
    preindexx=indexx;
    preindexy=indexy;
    preindexz=indexz;
end;
