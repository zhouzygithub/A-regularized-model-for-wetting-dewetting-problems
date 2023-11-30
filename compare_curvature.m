% function [k,e_curvature]=compare_curvature(theta)
theta=pi/6;
k=[];
L=2;
N=1024;  
dx=L/N;


nowL=0.5;
left=N/2-round(nowL/2*N)+1;
right=N/2+round(nowL/2*N)+1;
I=left:right;
initial=0.4;

% eps=[0.01,0.008,0.006,0.004,0.002];
eps=[0.01,0.005,0.0025];
for i=1:length(eps)
    u=precusor(N,eps(i),theta,initial);
    dh=(u(I+1)-u(I-1))/dx/2;
    ddh=(u(I+1)-2*u(I)+u(I-1))/dx/dx;
    temp=-ddh./((sqrt(1+dh.^2)).^3);
    k=[k temp];
end

% color=[[0,0,0];[0.85,0.33,0.10];[0.93,0.69,0.13];[0.72,0.27,1];[0.47,0.67,0.19]];
color=[[0 0 0];[0.8500 0.3250 0.0980];[0 0 1]];
line=["-.",":","--"];
[~,NN]=size(k);
for i=1:NN
    index=left:right;   
    dx=L/N;
    x=-L/2+dx/2:dx:L/2;
    x=x';
    xnow=x(index);
    plot(xnow,k(:,i),'LineWidth',1,'Color',color(i,:),'LineStyle',line(i));
    hold on
end
nowarea=u(end);
real=1/sqrt(nowarea/(theta-sin(2*theta)/2));
plot(xnow,real*ones(length(xnow),1),'LineWidth',1,'Color','m');

xlim([-0.4,0.4])
% ylim([0.67,0.77])
% ylim([1.85,1.95]) 
xlabel('x','interpreter','latex','FontSize',15)
ylabel('h','interpreter','latex','FontSize',15)
title('$\theta_e=\frac\pi6$','interpreter','latex','FontSize',15)
legend('$\varepsilon=0.01$','$\varepsilon=0.005$','$\varepsilon=0.0025$','exact curvature','interpreter','latex','FontSize',15)

e_curvature=max(k)-min(k);


    


% return

