% [x,y] = meshgrid(-1:0.01:1);
% z=zeros(201,201);
% z=z+((x.^2+y.^2)<0.24).*(sqrt(0.25-x.^2-y.^2)-0.1);
% z=smoothdata(z);
% s=surfl(x,y,z);
alph=pi/2-40*2*pi/1000;
[r,t]=meshgrid(0:2*pi/1000:2*pi,0:alph/1000:alph);
x=0.5*cos(r).*sin(t);
y=0.5*sin(r).*sin(t);
z=0.5*cos(t)-0.1;
s=surfl(x,y,z);
shading interp;
colormap(winter);
s.FaceAlpha = 0.5;
hold on
[r,t]=meshgrid(0.5*sin(alph):0.01:sqrt(2),0:2*pi/1000:2*pi);
x=r.*cos(t);
y=r.*sin(t);
C2=tan(alph)*sin(alph)^2/4;
C1=0.5*cos(alph)-C2/(0.5*sin(alph));
z=C1+C2./r-0.1;
s=surfl(x,y,z);
shading interp;
colormap(winter);
s.FaceAlpha = 0.5;
set(gca,'xtick',[])
set(gca,'ytick',[])
set(gca,'ztick',[])
axis off
xlim([-1,1])
ylim([-1,1])

patch([-1 -1 1 1],[-1 1 1 -1],[0.00,0.45,0.74])

t=0:0.01:2*pi;
x=sqrt(0.24)*cos(t);
y=sqrt(0.24)*sin(t);
plot(x,y,'color','k','Linewidth',5,'LineStyle','--')

t=pi-pi/6:0.001:2*pi-pi/6;
x=sqrt(0.24)*cos(t);
y=sqrt(0.24)*sin(t);
plot(x,y,'color','k','Linewidth',5)

plot_cuboid([-1,-1,-0.00],[1,1,-0.15]);
zlim([-0.15,0.4])
