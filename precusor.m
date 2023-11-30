function [term]=precusor(N,eps,theta,initial)
format longe
%parameters
% N=6400;  
% eps=0.001;
L=2;

%  assume gammafv=1;
% theta=pi/3;
S=cos(theta)-1;

dx=L/N;
x=-L/2:dx:L/2;
x=x';


%initial   
% 
% h=(x>-L/3).*(x<L/3).*(cos(3*pi/L*(x))+1)*0.3;

% temp=0.5*cot(theta);
h=(x>-L/4).*(x<L/4).*(sqrt(initial^2+(L/4)^2-x.^2)-initial);
nowarea=pi*(initial^2+(L/4)^2)*(atan(0.5/initial)/pi)-initial/2;
% 
% h=(x>-L/4).*(x<L/4).*(sqrt(1-x.^2/0.25))*0.28+eps;
% nowarea=pi*0.5*0.3/2+eps*2;

m0=nowarea/dx;
% plot(x,h)
lambda=1;
u=[h;lambda];

%
I=2:N+2;
J=sparse(N+2,N+2);
temp=ones(N+1,1);
J(1:N+1,N+2)=-temp;
J(N+2,1:N+1)=4*temp'/3;
J(N+2,1:2:N+1)=J(N+2,1:2:N+1)/2;
J(N+2,1)=J(N+2,1)/2; J(N+2,N+1)=J(N+2,N+1)/2;


F=zeros(N+2,1);
F_line=zeros(N+2,1);
itnum=0;
while(1)
    u00=u;
    
    
    %expend boundary
    h=[u(2);u(1:N+1);u(N)];
    u0=u;
    % comute element
    z=h/eps;
    gammae=1-S*(exp(-z)-2*exp(-z/2));
    dgammae=-S*(-exp(-z)+exp(-z/2))/eps;
    ddgammae=-S*(exp(-z)-exp(-z/2)/2)/eps/eps;

% %     gammae=1-S*(atan(z)*2/pi-1);
% %     dgammae=-S./(1+z.^2)*2/pi/eps;
% %     ddgammae=-S*2/pi/eps/eps./((1+z.^2).^(3/2)).*(-z);
    
    
    nablah=(h(I+1)-h(I-1))/2/dx;
    Deltah=(h(I+1)-2*h(I)+h(I-1))/dx/dx;
    
    %compute J
    element1=sqrt(1+nablah.^2); 
    element2=(1+nablah.^2).^(3/2); 
    element3=(1+nablah.^2).^(5/2); 
   
    Jright=-dgammae(I).*nablah./element2/2/dx+3*gammae(I).*Deltah.*nablah./element3/2/dx-gammae(I)./element2/dx/dx;
    Jmid=ddgammae(I)./element1-dgammae(I).*Deltah./element2+gammae(I)./element2*2/dx/dx;
    Jleft=dgammae(I).*nablah./element2/2/dx-3*gammae(I).*Deltah.*nablah./element3/2/dx-gammae(I)./element2/dx/dx;
    J(1,1)=Jleft(1)+Jmid(1); J(1,2)=Jright(1);
    J(N+1,N)=Jleft(N+1);  J(N+1,N+1)=Jmid(N+1)+Jright(N+1);
    for i=2:N
        J(i,i-1)=Jleft(i); J(i,i)=Jmid(i); J(i,i+1)=Jright(i);
    end

    %compute F
    F(1:N+1)=dgammae(I)./element1-gammae(I).*Deltah./element2-u(N+2);
    F(N+2)=(sum(u(2:2:N)*4/3)+sum(u(3:2:N-1)*2/3)+u(1)/3+u(N+1)/3)-m0;

    itnum=itnum+1;
    temp=max(abs(F))
    if (itnum>10000) || temp<1e-8
        break
    end


    d=-J\F;
    
    c0=2e-4;
    %line search
    lambda0=1;
    while(lambda0>1e-4)
        fx0=F'*F;
        u_line=u-(J\F)*lambda0;
        
        %expend boundary
        h=[u_line(2);u_line(1:N+1);u_line(N)];
        % comute element
        z=h/eps;
        gammae=1-S*(exp(-z)-2*exp(-z/2));
        dgammae=-S*(-exp(-z)+exp(-z/2))/eps;
%     gammae=1-S*(atan(z)*2/pi-1);
%     dgammae=-S./(1+z.^2)*2/pi/eps;
    

        nablah=(h(I+1)-h(I-1))/2/dx;
        Deltah=(h(I+1)-2*h(I)+h(I-1))/dx/dx;
        element1=sqrt(1+nablah.^2); 
        element2=(1+nablah.^2).^(3/2); 
        F_line(1:N+1)=dgammae(I)./element1-gammae(I).*Deltah./element2-u_line(N+2);
        F_line(N+2)=(sum(u_line(2:2:N)*4/3)+sum(u_line(3:2:N-1)*2/3)+u_line(1)/3+u_line(N+1)/3)-m0;
        
        fline=F_line'*F_line;
        if (fline<fx0+c0*lambda0*F'*d)
            break;
        end
        lambda0=lambda0/2;
    end
    u=u_line;
    
%     temp=max(abs(u00-u))
%     if (itnum>10000) || temp<1e-8
%         break
%     end
%     drawnow;
%     plot(x,u(1:N+1))
%     axis equal
end




term=[u;nowarea];
% plot(x,u(1:N+1))
% axis equal
% hold on
% u(1)
% u(10)

return
