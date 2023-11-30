function triangle(tr1,tr2,ratio,text1,text2,pos_adjust)
    x0 = tr1(1); y0 = tr1(2); x1 = tr2; 
    y1 = y0*(x1/x0)^ratio;
    loglog([x0,x1],[y0,y0],'-k','HandleVisibility','off','Linewidth',1.5);
    loglog([x1,x1],[y0,y1],'-k','HandleVisibility','off','Linewidth',1.5);
    loglog([x1,x0],[y1,y0],'-k','HandleVisibility','off','Linewidth',1.5);
    text(sqrt(x0*x1),y0*pos_adjust,text1,'fontsize',16);
    text(x1*pos_adjust,sqrt(y0*y1),text2,'fontsize',16);
end