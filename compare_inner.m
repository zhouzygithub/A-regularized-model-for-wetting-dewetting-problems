L=2;
N=2048;  
dx=L/N;
x=-L/2:dx:L/2;
x=x';
initial=0.4;
% eps=[0.01,0.008,0.006,0.004,0.002];
eps=[0.01,0.005,0.0025];
% color=[[0,0,0];[0.85,0.33,0.10];[0.93,0.69,0.13];[0.72,0.27,1];[0.47,0.67,0.19]];
color=[[0 0 0];[0.8500 0.3250 0.0980];[0 0 1]];
line=["-.",":","--"];
S=cos(theta)-1;
for i=1:length(eps)
    u=precusor(N,eps(i),theta,initial);
    hmax=max(u(1:N+1));
    nowarea=u(end);
    f=@(alph) nowarea/hmax/hmax*(1-cos(alph))^2-alph+0.5*sin(2*alph);
    alph=fsolve(f,pi/4);
    xc=sin(alph)*hmax/(1-cos(alph));
    X=(x+xc)/eps(i); H=u(1:N+1)/eps(i);
    plot(X,H,'LineWidth',1,'Color',color(i,:),'LineStyle',line(i));
    axis equal
    hold on
end 
xlim([-20,20])
ylim([0,20])


dx=0.01;
h=-40:dx:40;
X=zeros(length(h),1);
index=(1.55+40)/dx+1;
X(index)=0;
inteH=1./sqrt(((  1-(cos(theta)-1)*(exp(-h)-2*exp(-h/2))  )/cos(theta)).^2-1);

for i=index-1:-1:1
    I=i:1:index-1;
    X(i)=-dx/2*sum(inteH(I)+inteH(I+1));
end
for i=index+1:1:length(h)
    I=index:1:i-1;
    X(i)=dx/2*sum(inteH(I)+inteH(I+1));
end
plot(X,h,'LineWidth',1,'Color','r')    



xlabel('X','interpreter','latex','FontSize',15)
ylabel('H','interpreter','latex','FontSize',15)
title('inner solution $\theta_e=\frac\pi3$','interpreter','latex','FontSize',15)
legend('$\varepsilon=0.01$','$\varepsilon=0.005$','$\varepsilon=0.0025$','asymptotic solution','interpreter','latex','FontSize',15)
