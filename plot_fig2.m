%% INITIALIZATION
clear all;
close all;
clc
set(0, 'defaulttextinterpreter','latex')    % 将图片的字体等等格式设置成latex样式，方便输入公式
set(0, 'defaultAxesTickLabelInterpreter','latex'); 
set(0, 'defaultLegendInterpreter','latex');
set(groot,'defaultLineLineWidth',2); % 顺便改个默认线宽(ง •_•)ง

%% INPUT TIGHTPLOT PARAMETERS
TightPlot.ColumeNumber = 1;     % 子图行数
TightPlot.RowNumber = 2;    % 子图列数
TightPlot.GapW = 0.01;  % 子图之间的左右间距
TightPlot.GapH = 0.1;   % 子图之间的上下间距
TightPlot.MarginsLower = 0.02;   % 子图与图片上方的间距
TightPlot.MarginsUpper = 0.02;  % 子图与图片下方的间距
TightPlot.MarginsLeft = 0.02;   % 子图与图片左方的间距
TightPlot.MarginsRight = 0.02;  % 子图与图片右方的间距

%% PLOT
fff=figure(1);  % 声明Figure
p = tight_subplot(TightPlot.ColumeNumber,TightPlot.RowNumber,...
    [TightPlot.GapH TightPlot.GapW],...
    [TightPlot.MarginsLower TightPlot.MarginsUpper],...
    [TightPlot.MarginsLeft TightPlot.MarginsRight]); 

axes(p(2));
x=0:0.001:sqrt(2);
data=(x<sqrt(0.24)).*(sqrt(0.25-x.^2)-0.1);
data=smoothdata(data,'gaussian');
[r,alph] = meshgrid(x,0:2*pi/1000:2*pi);
x=r.*cos(alph);
y=r.*sin(alph);
z=data(round(sqrt(x.^2+y.^2)/0.001)+1)+0.01;
ha{1}=surfl(x,y,z);
shading interp;
colormap(winter);
plot_cuboid([-1,-1,-0.00],[1,1,-0.15]);
% axis equal
zlim([-0.15,0.41])
xlim([-1,1])
ylim([-1,1])
set(gca,'xtick',[])
set(gca,'ytick',[])
set(gca,'ztick',[])
axis off
% text(0,pi,' leftarrow sin(pi)','FontSize',18,'rotation',9)

axes(p(1));
x=0:0.001:sqrt(2);
data=(x<sqrt(0.24)).*(sqrt(0.25-x.^2)-0.1);
% data=smoothdata(data,'gaussian');
[r,alph] = meshgrid(x,0:2*pi/1000:2*pi);
x=r.*cos(alph);
y=r.*sin(alph);
z=data(round(sqrt(x.^2+y.^2)/0.001)+1);
ha{2}=surfl(x,y,z);
shading interp;
colormap(winter);
plot_cuboid([-1,-1,0.001],[1,1,-0.15]);
% axis equal
zlim([-0.15,0.40])
xlim([-1,1])
ylim([-1,1])
set(gca,'xtick',[])
set(gca,'ytick',[])
set(gca,'ztick',[])
axis off
text(pi,0,' leftarrow sin(pi)','FontSize',18,'rotation',9)
% ax = axes('position',[0,0,1,1],'visible','off');
% tx = text(0.18,0.05,' leftarrow sin(pi)','FontSize',18,'rotation',9);
