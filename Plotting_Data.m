%%       1000Hz:   Actual vs Simulated DoA 
axis([0 180 0 180]);
x = linspace(0,180,15);
y = linspace(0,180,15);
l = plot(x,y, 'k')
ylabel('System DoA (°)', 'FontSize',16);
xlabel('Actual DoA (°)', 'FontSize',16);
title('System DoA vs Ideal DoA', 'FontSize',16);

xticks(0:15:180);
yticks(0:15:180);

hold on
grid on
%  0

plot(0, 0,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(0, 6.1,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(0, 8.51,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(0, 9.59,'o', 'MarkerFaceColor','black','MarkerSize', 5)

% 15

plot(15,20.34,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(15,34.35,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(15,34.35,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(15,31,'o', 'MarkerFaceColor','black','MarkerSize', 5)


% 30

plot(30,38.32 ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(30,20.89  ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(30,36.32 ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(30,20.89  ,'o', 'MarkerFaceColor','black','MarkerSize', 5)



% 45

plot(45,24.76  ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(45,31.42   ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(45,31.42  ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(45,38.87   ,'o', 'MarkerFaceColor','black','MarkerSize', 5)


% 60

plot(60,54.88  ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(60,66.24    ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(60,66.24   ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(60,76.4   ,'o', 'MarkerFaceColor','black','MarkerSize', 5)


% 75

plot(75,81.58   ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(75,78.78     ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(75,61    ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(75,62   ,'o', 'MarkerFaceColor','black','MarkerSize', 5)


% 90

plot(90,80   ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(90,81    ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(90,91    ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(90,81    ,'o', 'MarkerFaceColor','black','MarkerSize', 5)



% 105

plot(105,115    ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(105,115     ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(105,101.27     ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(105,101.27     ,'o', 'MarkerFaceColor','black','MarkerSize', 5)

% 120

p = plot(120,126.98     ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(120,110      ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(120,114      ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(120,126.98      ,'o', 'MarkerFaceColor','black','MarkerSize', 5)



% 135

plot(135,143.55      ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(135,143.55       ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(135,126.98       ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(135,115.37       ,'o', 'MarkerFaceColor','black','MarkerSize', 5)




% 150

plot(150,143.55      ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(150,163       ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(150,158.65       ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(150,152.65       ,'o', 'MarkerFaceColor','black','MarkerSize', 5)




% 165

plot(165,136.81       ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(165,159.14        ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(165,135.19        ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(165,140.81       ,'o', 'MarkerFaceColor','black','MarkerSize', 5)




% 180

plot(180,163.81       ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(180,169.14         ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(180,169.81         ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(180,173.81       ,'o', 'MarkerFaceColor','black','MarkerSize', 5)



% JOIN
x1 = [0 15 30 45 60 75 90 105 120 135 150 165 180];
y1 = [5.45, 27.52, 31.62, 35.01, 62.94, 72.65, 81.58, 107.10, 116.67, 128.36, 156.8, 144.74, 168.63];

y2 = plot(x1,y1,'r.','markersize',20)
y3 = plot(x1,y1,'r')

legend([p,y2,l],'Result per DoA','DoA_{system}','DoA_{ideal}','location','northwest')

%%        1000Hz:  Error Plot 
axis([0 180 0 180]);
x = linspace(0,180,15);
y = linspace(0,180,15);


ylabel('System DoA (°)', 'FontSize',18);
xlabel('Actual DoA (°)', 'FontSize',18);
title('Analysis of Results', 'FontSize',20);

text(4.5,111,'R^{2} = 0.9751  ','FontSize',13,'Color', 'k','BackgroundColor','w')

xticks(0:15:180);
yticks(0:15:180);

hold on


p0= plot([0 0],[0 9.59],'k', 'LineWidth',2);
p1= plot([15 15],[20.34 34.35],'k', 'LineWidth',2);
p2= plot([30 30],[20.89 35.87],'k', 'LineWidth',2);
p3= plot([45 45],[24.76 39.87],'k', 'LineWidth',2);
p4= plot([60 60],[54.8 76.4],'k', 'LineWidth',2);
p5= plot([75 75],[61  81.58],'k', 'LineWidth',2);
p6= plot([90 90],[74.7 89.4],'k', 'LineWidth',2);

p7= plot([105 105],[100.65 115],'k', 'LineWidth',2);
p8= plot([120 120],[113.37 126.98],'k', 'LineWidth',2);
p9= plot([135 135],[116.37 143.1],'k', 'LineWidth',2);
p10= plot([150 150],[143.55 162.65 ],'k', 'LineWidth',2);
p11= plot([165 165],[140.8 160.14],'k', 'LineWidth',2);
p12= plot([180 180],[160.1 177.14 ],'k', 'LineWidth',2);


p13 = plot([0 180],[0 180],'k','LineWidth', 1);
p14 = plot([0 180],[10 190],':k');
p15 = plot([0 180],[-10 170],':k');

x1 = [0 15 30 45 60 75 90 105 120 135 150 165 180];
y1 = [5.45, 27.52, 31.62, 35.01, 62.94, 72.65, 81.58, 107.10, 116.67, 128.36, 156.8, 144.74, 168.63];
y2 = plot(x1,y1,'r.','MarkerSize', 20);


coefficients = polyfit(x1, y1, 1);
xFit = linspace(min(x1), max(x1), 1000);
yFit = polyval(coefficients , xFit);
hold on;
u = plot(xFit, yFit, 'r-', 'LineWidth', 1);
grid on;

legend([y2,p1,u,p14],'DoA_{system}','Range per DoA','Regression line ','Acceptable Range','location', 'northwest')


%%        1500Hz:  Actual vs Simulated DoA 
axis([0 180 0 180]);
x = linspace(0,180,15);
y = linspace(0,180,15);
l = plot(x,y, 'k')
ylabel('System DoA (°)');
xlabel('Actual DoA (°)');
title('System DoA vs Ideal DoA', 'FontSize',16);


xticks(0:15:180);
yticks(0:15:180);

hold on

%  0
xline(0)
plot(0,8.51,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(0,0,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(0,0,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(0,0,'o', 'MarkerFaceColor','black','MarkerSize', 5)

plot(0,2.13,'o', 'MarkerFaceColor','blue','MarkerSize', 5)

% 15
xline(15)
plot(15,0,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(15,15.87,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(15,8.51,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(15,8.51,'o', 'MarkerFaceColor','black','MarkerSize', 5)

plot(15,8.22 ,'o', 'MarkerFaceColor','blue','MarkerSize', 5)

% 30
xline(30)
plot(30,38.32 ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(30,38.32  ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(30,36.32 ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(30,36.32  ,'o', 'MarkerFaceColor','black','MarkerSize', 5)

plot(30,36.32  ,'o', 'MarkerFaceColor','blue','MarkerSize', 5)

% 45
xline(45)
plot(45,46.12  ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(45,56.04    ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(45,58.88  ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(45,46.12   ,'o', 'MarkerFaceColor','black','MarkerSize', 5)

plot(45,51.79  ,'o', 'MarkerFaceColor','blue','MarkerSize', 5)

% 60
xline(60)
plot(60,45.24   ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(60,61.66    ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(60,70.34   ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(60,61.66   ,'o', 'MarkerFaceColor','black','MarkerSize', 5)

plot(60,58.73    ,'o', 'MarkerFaceColor','blue','MarkerSize', 5)

% 75
xline(75)
plot(75,76.00   ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(75,76.00     ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(75,73.23    ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(75,70.34    ,'o', 'MarkerFaceColor','black','MarkerSize', 5)

plot(75,73.89     ,'o', 'MarkerFaceColor','blue','MarkerSize', 5)

% 90
xline(90)
plot(90,90   ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(90,90    ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(90,90    ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(90,90    ,'o', 'MarkerFaceColor','black','MarkerSize', 5)

plot(90,90     ,'o', 'MarkerFaceColor','blue','MarkerSize', 5)

% 105
xline(105)
plot(105,101.28    ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(105,95.62     ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(105,115.94     ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(105,112.91     ,'o', 'MarkerFaceColor','black','MarkerSize', 5)

plot(105,103.44      ,'o', 'MarkerFaceColor','blue','MarkerSize', 5)

% 120
xline(120)
p = plot(120,129.01     ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(120,125.52       ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(120,119.29      ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(120,126.98      ,'o', 'MarkerFaceColor','black','MarkerSize', 5)

j = plot(120,125.20        ,'o', 'MarkerFaceColor','blue','MarkerSize', 5)

% 135
xline(135)
plot(135,145.75      ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(135,143.55       ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(135,137.82      ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(135,140.73       ,'o', 'MarkerFaceColor','black','MarkerSize', 5)

plot(135,141.96          ,'o', 'MarkerFaceColor','blue','MarkerSize', 5)


% 150
xline(150)
plot(150,145.75      ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(150,154.24       ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(150,154.24      ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(150,167.91       ,'o', 'MarkerFaceColor','black','MarkerSize', 5)

plot(150,155.54          ,'o', 'MarkerFaceColor','blue','MarkerSize', 5)


% 165
xline(165)
plot(165,171.44        ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(165,160.14        ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(165,171.44        ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(165,180.00       ,'o', 'MarkerFaceColor','black','MarkerSize', 5)

plot(165,170.76          ,'o', 'MarkerFaceColor','blue','MarkerSize', 5)


% 180
xline(180)
plot(180,160.56        ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(180,177.14         ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(180,180.00         ,'o', 'MarkerFaceColor','black','MarkerSize', 5)
plot(180,180.00       ,'o', 'MarkerFaceColor','black','MarkerSize', 5)

plot(180,174.42           ,'o', 'MarkerFaceColor','blue','MarkerSize', 5)



% JOIN
x1 = [0 15 30 45 60 75 90 105 120 135 150 165 180];
y1 = [2.13 8.22 36.32 51.79 58.73 73.89 90 103.44 125.20 141.96 155.54 170.76 174.42];
y2 = plot(x1,y1,'b')


legend([l,p,j],'Actual DoA','Data per DoA','Average Data per DoA','Location','north')
%%    Line of Best Fit 2

axis([0 180 0 180]);
x = linspace(0,180,15);
y = linspace(0,180,15);
l = plot(x,y, 'k', 'LineWidth', 2)
ylabel('System DoA (°)');
xlabel('Actual DoA (°)');
title('System DoA vs Actual DoA');

xticks(0:15:180);
yticks(0:15:180);

hold on

x1 = [0 15 30 45 60 75 90 105 120 135 150 165 180];
y1 = [2.13 8.22 36.32 51.79 58.73 73.89 90 103.44 125.20 141.96 155.54 170.76 174.42];
y2 = plot(x1,y1,'b.','MarkerSize', 10);


coefficients = polyfit(x1, y1, 1);
xFit = linspace(min(x1), max(x1), 1000);
yFit = polyval(coefficients , xFit);
hold on;
u = plot(xFit, yFit, 'b-', 'LineWidth', 1);
grid on;

legend([l,y2,u],'Actual DoA','System DoA Average','System DoA Bestfit ','Location','north')

%%          Error Plot 2
axis([0 180 0 180]);
x = linspace(0,180,15);
y = linspace(0,180,15);


ylabel('System DoA (°)');
xlabel('Actual DoA (°)');
title('Sytstem DoA Range');


xticks(0:15:180);
yticks(0:15:180);
hold on

xline(0)
p0= plot([0 0],[0 8.51],'b', 'LineWidth',2);

xline(15)
p1= plot([15 15],[0 15.87],'b', 'LineWidth',2);

xline(30)
p2= plot([30 30],[36.32 38.32],'b', 'LineWidth',2);

xline(45)
p3= plot([45 45],[46.12 58.88],'b', 'LineWidth',2);

xline(60)
p4= plot([60 60],[45.24 70.34],'b', 'LineWidth',2);

xline(75)
p5= plot([75 75],[70.34 76.00],'b', 'LineWidth',2);

xline(90)
p6= plot([90 90],[90 90],'b.', 'LineWidth',2);

xline(105)
p7= plot([105 105],[95.62 115.94],'b', 'LineWidth',2);

xline(120)
p8= plot([120 120],[119.29 129.01],'b', 'LineWidth',2);

xline(135)
p9= plot([135 135],[137.82 145.75],'b', 'LineWidth',2);

xline(150)
p10= plot([150 150],[145.75 167.91],'b', 'LineWidth',2);

xline(165)
p11= plot([165 165],[160.14 180],'b', 'LineWidth',2);

xline(180)
p12= plot([180 180],[160.56 180],'b', 'LineWidth',2);

p13 = plot([0 180],[0 180],'k');
p14 = plot([0 180],[7.5 187.5],':k');
p15 = plot([0 180],[-7.5 172.5],':k');

x1 = [0 15 30 45 60 75 90 105 120 135 150 165 180];
y1 = [2.13 8.22 36.32 51.79 58.73 73.89 90 103.44 125.20 141.96 155.54 170.76 174.42];
y2 = plot(x1,y1,'b');

legend([p1,y2,p14],'System DoA Range','System DoA Average','Safety Range', 'Location','north')

%%      2000Hz:  Error Plot   
axis([0 180 0 180]);
x = linspace(0,180,15);
y = linspace(0,180,15);


ylabel('System DoA (°)', 'FontSize',18);
xlabel('Actual DoA (°)', 'FontSize',18);
title('Analysis of Results', 'FontSize',20);
text(4.5,111,'R^{2} = 0.9773 ','FontSize',13,'Color', 'k','BackgroundColor','w')


xticks(0:15:180);
yticks(0:15:180);
hold on
grid on


p0= plot([0 0],[0 0],'k.', 'LineWidth',2);
p1= plot([15 15],[7 20],'k', 'LineWidth',2);
p2= plot([30 30],[7 20],'k', 'LineWidth',2);
p3= plot([45 45],[39 58],'k', 'LineWidth',2);
p4= plot([60 60],[49 66],'k', 'LineWidth',2);
p5= plot([75 75],[59 67],'k', 'LineWidth',2);
p6= plot([90 90],[73 89],'k', 'LineWidth',2);
p7= plot([105 105],[105 115],'k', 'LineWidth',2);
p8= plot([120 120],[115 125],'k', 'LineWidth',2);
p9= plot([135 135],[125 164],'k', 'LineWidth',2);
p10= plot([150 150],[156 180],'k', 'LineWidth',2);
p11= plot([165 165],[166 178],'k', 'LineWidth',2);
p12= plot([180 180],[162 175],'k', 'LineWidth',2);

p13 = plot([0 180],[0 180],'k');
p14 = plot([0 180],[7.5 187.5],':k');
p15 = plot([0 180],[-7.5 172.5],':k');

x1 = [0 15 30 45 60 75 90 105 120 135 150 165 180];
y1 = [0, 13.05, 13.27, 47.83, 57.9, 63.63, 82.37, 110.05, 123.80, 141.27, 163.32, 172.76, 168.65];
y2 = plot(x1,y1,'.','MarkerSize', 20);

coefficients = polyfit(x1, y1, 1);
xFit = linspace(min(x1), max(x1), 1000);
yFit = polyval(coefficients , xFit);
hold on;
u = plot(xFit, yFit, 'color',[0.9290, 0.6940, 0.1250], 'LineWidth', 1);
grid on;

legend([y2,p1,u,p14],'System DoA Average','Range per DoA','Regression line','Safety Range','location', 'northwest')


