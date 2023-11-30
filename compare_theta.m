theta=pi/3;
nowtheta=[];
nowcontactline=[];
format long
N=2048;  
eps=[0.01,0.008,0.006,0.004,0.002];
S=cos(theta)-1;

for i=1:length(eps)
    u=precusor(N,eps(i),theta,0.4);
    hmax=max(u(1:N+1));
    nowarea=u(end);
    f=@(alph) nowarea-(alph-0.5*sin(2*alph))*hmax*hmax/(1-cos(alph))/(1-cos(alph));
    alph=fsolve(f,pi/4);
    nowtheta=[nowtheta;alph];
    nowcontactline=[nowcontactline;hmax*sin(alph)/(1-cos(alph))];
end

error=theta-nowtheta;

loglog(eps,error,'LineWidth',1.5,'Color','k');
hold on
loglog(eps,eps.^2,'LineWidth',1.5,'Color','r')

figure
error2=abs(sqrt(nowarea/(theta-0.5*sin(2*theta)))*sin(theta)-nowcontactline);

loglog(eps,error2,'LineWidth',1.5,'Color','k');
hold on
loglog(eps,eps.^2,'LineWidth',1.5,'Color','r')
