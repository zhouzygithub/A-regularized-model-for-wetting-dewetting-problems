function compare_eps(theta)
L=2;
N=2048;  
dx=L/N;
x=-L/2:dx:L/2;
initial=0.4;
% figure;
% subplot(2,1,1);
u=precusor(N,0.01,theta,initial);
plot(x,u(1:N+1),'LineWidth',1,'Color','k','LineStyle','-.');
hold on
axis equal
xlim([-1,1])
ylim([0,0.5])

u=precusor(N,0.005,theta,initial);
plot(x,u(1:N+1),'LineWidth',1,'Color',[0.8500 0.3250 0.0980],'LineStyle',':');

u=precusor(N,0.0025,theta,initial);
plot(x,u(1:N+1),'LineWidth',1,'Color','blue' ,'LineStyle','--');

% u=precusor(N,0.004,theta,initial);
% plot(x,u(1:N+1),'LineWidth',1.5,'Color',[0.72,0.27,1]  );
% 
% u=precusor(N,0.002,theta,initial);
% plot(x,u(1:N+1),'LineWidth',1.5,'Color',[0.47,0.67,0.19] );

nowarea=u(end);
exact(theta,nowarea)

xlabel('x','interpreter','latex','FontSize',15)
ylabel('h','interpreter','latex','FontSize',15)
title('$\theta_e=\frac\pi6$','interpreter','latex','FontSize',15)
legend('$\varepsilon=0.01$','$\varepsilon=0.005$','$\varepsilon=0.0025$','exact','interpreter','latex','FontSize',15)

% title('\theta=pi/6')
% %enlarge
% x=-L/2+dx/2:dx:L/2;
% 
% subplot(2,1,2);
% u=precusor(N,0.01,theta,initial);
% plot(x,u(1:N),'LineWidth',1.5,'Color','k');
% hold on
% axis equal
% xlim([-1,1])
% ylim([0,0.6])
% 
% u=precusor(N,0.008,theta,initial);
% plot(x,u(1:N),'LineWidth',1.5,'Color',[0.85,0.33,0.10] );
% 
% u=precusor(N,0.006,theta,initial);
% plot(x,u(1:N),'LineWidth',1.5,'Color',[0.93,0.69,0.13]  );
% 
% u=precusor(N,0.004,theta,initial);
% plot(x,u(1:N),'LineWidth',1.5,'Color',[0.72,0.27,1]  );
% 
% u=precusor(N,0.002,theta,initial);
% plot(x,u(1:N),'LineWidth',1.5,'Color',[0.47,0.67,0.19] );
% 
% nowarea=u(end);
% exact(theta,nowarea)
% 
% xlabel('x')
% ylabel('h')
% legend('\epsilon=0.01','\epsilon=0.008','\epsilon=0.006','\epsilon=0.004','\epsilon=0.002','exact','FontSize',12)
% 
