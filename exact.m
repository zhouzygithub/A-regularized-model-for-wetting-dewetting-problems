function exact(theta,nowarea)
m=4; b=0.0;
%%%%%%%%
g=@(x) (1+b*cos(m*x))*cos(x)+m*b*sin(m*x)*sin(x)-cos(theta);

if theta>pi/2
    thetaA=fsolve(g,3*pi/4);
else
    thetaA=fsolve(g,1*pi/4);
end

temp=-thetaA:0.001:thetaA;
gamma1=1+b*cos(m*temp); gamma2=-m*b*sin(m*temp);
x=-gamma1.*sin(temp)-gamma2.*cos(temp);
y=gamma1.*cos(temp)-gamma2.*sin(temp)-cos(theta);


temp=polyarea(x,y);
x=sqrt(nowarea/temp)*x;
y=sqrt(nowarea/temp)*y;
plot(x,y,'LineWidth',1,'Color','r','LineStyle','-')
hold on 
axis equal
xlim([-1,1])
ylim([0,0.65])

