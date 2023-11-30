% function height=compare_height(theta)
theta=pi/3;
height=[];
predict_h=[];
N=2048;  
lambda0=[];
eps=[0.01,0.008,0.006,0.004,0.002];
% eps=[0.02,0.01,0.008,0.005,0.001];
S=cos(theta)-1;
for i=1:length(eps)
    u=precusor(N,eps(i),theta,0.4);
    height=[height;u(1)];
    predict_h=[predict_h;(-u(end-1)*2/S*eps(i)*eps(i))];
    lambda0=[lambda0; u(end-1)];
end
% rate=[0;log(height(1:end-1)./height(2:end))/log(2)];
% height=[height rate];
% 
loglog(eps,height,'Marker','o','LineWidth',1,'Color','r');
% hold on
% loglog(eps,eps.^2,'LineWidth',1.5,'Color','r')

xlabel('$\varepsilon$','interpreter','latex','FontSize',15)
ylabel('height of the precursor','FontSize',15)
h=legend('numerical height of the precursor','FontSize',15);
set(h,'Interpreter','latex','Location','northwest') 
title('$\theta_e=\frac\pi3$','Interpreter','latex','FontSize',15)
xlim([1e-3,2e-2])
hold on
 triangle([0.0033,0.00006],0.0047,2,'1','2',1.1)


figure
tempeps=0:1e-4:12e-3;
plot(tempeps,-u(end-1)*2/S.*tempeps.*tempeps,'LineWidth',1,'Color','r');
hold on
plot(eps,height,'ko');

xlabel('$\varepsilon$','interpreter','latex','FontSize',15)
ylabel('height of the precursor','FontSize',15)
h=legend('numerical height of the precursor','asymptotic height: $-\frac{2\lambda_0}{S}\varepsilon^2$','FontSize',15);
set(h,'Interpreter','latex','Location','northwest') 
title('$\theta_e=\frac\pi3$','Interpreter','latex','FontSize',15)

error=height-predict_h;

% return



