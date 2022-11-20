function Slice3DVelocity(x,y,z,velocity)
X=zeros(length(y),length(x),length(z));
Y=zeros(length(y),length(x),length(z));
Z=zeros(length(y),length(x),length(z));
V=zeros(length(y),length(x),length(z));
for i=1:length(y)
  for j=1:length(x)
    for k=1:length(z)
      Y(i,j,k)=y(i);
      X(i,j,k)=x(j);
      Z(i,j,k)=z(k);
      V(i,j,k)=velocity(k,(i-1)*length(x)+j); %change by y
    end
  end
end

% yslice=[min(y),max(y),max(y)/2];
% zslice=[0,-max(z)];
% xslice=[max(x)/2];
yslice=[];
zslice=[0 max(z)];
xslice=[];

h=slice(X,Y,Z,V,xslice,yslice,zslice);

alpha(h,0.5);
yslice=[max(y)];
xslice=[];
zslice=[];
h=slice(X,Y,Z,V,xslice,yslice,zslice);

xlabel('Distance-x');ylabel('Distance-y');zlabel('Depth-z');
shading interp;
title('3D Model');
rotate3d on
set(gca,'PlotBoxAspectRatio',[ 1 1 1 ])
set(gca,'CameraViewAngleMode','manual')
end