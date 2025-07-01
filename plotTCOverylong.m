clear; clc;

%Read Position Data
T= readmatrix('2006RH120verylong.csv'); 

%%
%set(gcf,'units','pixels','position',[1,1,500,500]);

%Pull in TCO Position Data
x=(T(:,2)-T(:,11))/(1.496*10^8);
y=(T(:,3)-T(:,12))/(1.496*10^8);
z=(T(:,4)-T(:,13))/(1.496*10^8);
plot3(x,y,z,"Color",[0.5 0.5 0.5],"LineWidth",2)

%Pull in Earth Position Data
hold on
x=(T(:,5)-T(:,8)-T(:,11))/(1.496*10^8);
y=(T(:,6)-T(:,9)-T(:,12))/(1.496*10^8);
z=(T(:,7)-T(:,10)-T(:,13))/(1.496*10^8);
plot3(x,y,z,"Color","blue","LineWidth",2)

%Plot Sun Actual Size
[xx, yy, zz] = sphere(100); 
sunRadius = (1.4*10^6)/(1.496*10^8);
surf(sunRadius*xx, sunRadius*yy, sunRadius*zz, 'FaceColor', "y"); 

% %Pull in L2 Point Position Data
% hold on
% x=(T(:,5)-T(:,11))/384399;
% y=(T(:,6)-T(:,12))/384399;
% z=(T(:,7)-T(:,13))/384399;
% plot3(x,y,z,"Color","k","LineWidth",2)

% %Pull in Moon Data
% hold on
% x=(T(:,8)-T(:,11))/384399;
% y=(T(:,9)-T(:,12))/384399;
% z=(T(:,10)-T(:,13))/384399;
% plot3(x,y,z,"Color","g","LineWidth",2)

%Pull in Sun Data
% hold on
% x=T(:,11)/384399;
% y=T(:,12)/384399;
% z=T(:,13)/384399;
% plot3(x,y,z,"Color","y","LineWidth",2)

%Plot Earth Actual Size
% [x, y, z] = sphere(10); 
% earthRadius = 6371/384399;
% surf(earthRadius*x, earthRadius*y, earthRadius*z, 'FaceColor', "b"); 

% %Plot departure burn
% burn1x=T(10,5)/384399;
% burn1y=T(10,6)/384399;
% burn1z=T(10,7)/384399;
% plot3(burn1x,burn1y,burn1z,"Color","g","Marker",".","MarkerSize",16)
% 
% %Plot hohmann transfer orbit raising burn
% burn2x=T(1,5)/384399;
% burn2y=T(1,6)/384399;
% burn2z=T(1,7)/384399;
% plot3(burn2x,burn2y,burn2z,"Color","b","Marker",".","MarkerSize",16)
% 
% burn3x=T(431,2)/384399;
% burn3y=T(431,3)/384399;
% burn3z=T(431,4)/384399;
% 
% %Plot the orbit raise
% x2 = burn3x;
% x1 = burn2x;
% y2 = burn3y;
% y1 = burn2y;
% e = 0.9;
%  a = 1/2*sqrt((x2-x1)^2+(y2-y1)^2);
%  b = a*sqrt(1-e^2);
%  c = 5;
%  t = linspace(pi,2*pi);
%  X = a*cos(t);
%  Y = b*sin(t);
%  w = atan2(y2-y1,x2-x1);
%  x = (x1+x2)/2 + X*cos(w) - Y*sin(w);
%  y = (y1+y2)/2 + X*sin(w) + Y*cos(w);
%  plot(x,y,'b-',"LineWidth",2)
% 
% %Plot rendezvous point
% plot3(burn3x,burn3y,burn3z,"Color","r","Marker",".","MarkerSize",16)
% 
% %Plot s/c and TCO together
% togetherx=T(431:end,2)/384399;
% togethery=T(431:end,3)/384399;
% togetherz=T(431:end,4)/384399;
% plot3(togetherx,togethery,togetherz,'r-',"LineWidth",2)

grid on 
grid minor
axis equal
% xlim([-100 20])
% ylim([-60 80])
% zlim([-5 5])

%xlim([-2 15])
%ylim([-15 5])
%zlim([-5 5])

legend("2006RH_{120} \color{white} TCO\color{black}","Earth","Sun","Location",'northeast')
%title("Mission Trajectory to 2006RH120 in 2028")
xlabel("x (AU)")
ylabel("y (AU)")
zlabel("z (AU)")

%exportgraphics(gca,'RH120zoomed.jpeg','Resolution',2000)

%% XY View
figure(2)

%set(gcf,'units','pixels','position',[1,1,500,500]);
%Pull in TCO Position Data
x=T(1:438,2)/384399;
y=T(1:438,3)/384399;
z=T(1:438,4)/384399;
plot3(x,y,z,"Color",[0.5 0.5 0.5],"LineWidth",2)

%Pull in L2 Point Position Data
hold on
x=T(:,5)/384399;
y=T(:,6)/384399;
z=T(:,7)/384399;
plot3(x,y,z,"Color","k","LineWidth",2)

%Plot Earth Actual Size
% [x, y, z] = sphere(10); 
% earthRadius = 6371/384399;
% surf(earthRadius*x, earthRadius*y, earthRadius*z, 'FaceColor', "b"); 

%Plot departure burn
burn1x=T(10,5)/384399;
burn1y=T(10,6)/384399;
burn1z=T(10,7)/384399;
plot3(burn1x,burn1y,burn1z,"Color","g","Marker",".","MarkerSize",16)

%Plot hohmann transfer orbit raising burn
burn2x=T(1,5)/384399;
burn2y=T(1,6)/384399;
burn2z=T(1,7)/384399;
plot3(burn2x,burn2y,burn2z,"Color","b","Marker",".","MarkerSize",16)

burn3x=T(439,2)/384399;
burn3y=T(439,3)/384399;
burn3z=T(439,4)/384399;

%Plot the orbit raise
x2 = burn3x;
x1 = burn2x;
y2 = burn3y;
y1 = burn2y;
e = 0.9;
 a = 1/2*sqrt((x2-x1)^2+(y2-y1)^2);
 b = a*sqrt(1-e^2);
 c = 5;
 t = linspace(pi,2*pi);
 X = a*cos(t);
 Y = b*sin(t);
 w = atan2(y2-y1,x2-x1);
 x = (x1+x2)/2 + X*cos(w) - Y*sin(w);
 y = (y1+y2)/2 + X*sin(w) + Y*cos(w);
 plot(x,y,'b-',"LineWidth",2)

%Plot rendezvous point
plot3(burn3x,burn3y,burn3z,"Color","r","Marker",".","MarkerSize",16)

%Plot s/c and TCO together
togetherx=T(439:end,2)/384399;
togethery=T(439:end,3)/384399;
togetherz=T(439:end,4)/384399;
plot3(togetherx,togethery,togetherz,'r-',"LineWidth",2)

grid on 
grid minor
axis equal
xlim([-20 20])
ylim([-20 20])

view(0,90)   % XY
legend("2006RH120 Trajectory","L2 Point Orbiting Earth","Burn 1","Burn 2","Transfer Orbit","Burn 3","Spacecraft and TCO","Location",'northeast')
title("Mission Trajectory to 2006RH120 in 2028")
xlabel("x (LD)")
ylabel("y (LD)")
zlabel("z (LD)")


%%  XZ View
figure(3)

%set(gcf,'units','pixels','position',[1,1,500,500]);
%Pull in TCO Position Data
x=T(1:438,2)/384399;
y=T(1:438,3)/384399;
z=T(1:438,4)/384399;
plot3(x,y,z,"Color",[0.5 0.5 0.5],"LineWidth",2)

%Pull in L2 Point Position Data
hold on
x=T(:,5)/384399;
y=T(:,6)/384399;
z=T(:,7)/384399;
plot3(x,y,z,"Color","k","LineWidth",2)

%Plot Earth Actual Size
% [x, y, z] = sphere(10); 
% earthRadius = 6371/384399;
% surf(earthRadius*x, earthRadius*y, earthRadius*z, 'FaceColor', "b"); 

%Plot departure burn
burn1x=T(10,5)/384399;
burn1y=T(10,6)/384399;
burn1z=T(10,7)/384399;
plot3(burn1x,burn1y,burn1z,"Color","g","Marker",".","MarkerSize",16)

%Plot hohmann transfer orbit raising burn
burn2x=T(1,5)/384399;
burn2y=T(1,6)/384399;
burn2z=T(1,7)/384399;
plot3(burn2x,burn2y,burn2z,"Color","b","Marker",".","MarkerSize",16)

burn3x=T(439,2)/384399;
burn3y=T(439,3)/384399;
burn3z=T(439,4)/384399;

%Plot the orbit raise
x2 = burn3x;
x1 = burn2x;
y2 = burn3y;
y1 = burn2y;
e = 0.9;
 a = 1/2*sqrt((x2-x1)^2+(y2-y1)^2);
 b = a*sqrt(1-e^2);
 c = 5;
 t = linspace(pi,2*pi);
 X = a*cos(t);
 Y = b*sin(t);
 w = atan2(y2-y1,x2-x1);
 x = (x1+x2)/2 + X*cos(w) - Y*sin(w);
 y = (y1+y2)/2 + X*sin(w) + Y*cos(w);
 plot(x,y,'b-',"LineWidth",2)

%Plot rendezvous point
plot3(burn3x,burn3y,burn3z,"Color","r","Marker",".","MarkerSize",16)

%Plot s/c and TCO together
togetherx=T(439:end,2)/384399;
togethery=T(439:end,3)/384399;
togetherz=T(439:end,4)/384399;
plot3(togetherx,togethery,togetherz,'r-',"LineWidth",2)

grid on 
grid minor
axis equal
xlim([-100 20])
zlim([-60 60])

view(0,0)   % XZ
legend("2006RH120 Trajectory","L2 Point Orbiting Earth","Burn 1","Burn 2","Transfer Orbit","Burn 3","Spacecraft and TCO","Location",'northeast')
title("Mission Trajectory to 2006RH120 in 2028")
xlabel("x (LD)")
ylabel("y (LD)")
zlabel("z (LD)")

%% YZ View
figure(4)
%set(gcf,'units','pixels','position',[1,1,500,500]);
%Pull in TCO Position Data
x=T(1:438,2)/384399;
y=T(1:438,3)/384399;
z=T(1:438,4)/384399;
plot3(x,y,z,"Color",[0.5 0.5 0.5],"LineWidth",2)

%Pull in L2 Point Position Data
hold on
x=T(:,5)/384399;
y=T(:,6)/384399;
z=T(:,7)/384399;
plot3(x,y,z,"Color","k","LineWidth",2)

%Plot Earth Actual Size
% [x, y, z] = sphere(10); 
% earthRadius = 6371/384399;
% surf(earthRadius*x, earthRadius*y, earthRadius*z, 'FaceColor', "b"); 

%Plot departure burn
burn1x=T(10,5)/384399;
burn1y=T(10,6)/384399;
burn1z=T(10,7)/384399;
plot3(burn1x,burn1y,burn1z,"Color","g","Marker",".","MarkerSize",16)

%Plot hohmann transfer orbit raising burn
burn2x=T(1,5)/384399;
burn2y=T(1,6)/384399;
burn2z=T(1,7)/384399;
plot3(burn2x,burn2y,burn2z,"Color","b","Marker",".","MarkerSize",16)

burn3x=T(439,2)/384399;
burn3y=T(439,3)/384399;
burn3z=T(439,4)/384399;

%Plot the orbit raise
x2 = burn3x;
x1 = burn2x;
y2 = burn3y;
y1 = burn2y;
e = 0.9;
 a = 1/2*sqrt((x2-x1)^2+(y2-y1)^2);
 b = a*sqrt(1-e^2);
 c = 5;
 t = linspace(pi,2*pi);
 X = a*cos(t);
 Y = b*sin(t);
 w = atan2(y2-y1,x2-x1);
 x = (x1+x2)/2 + X*cos(w) - Y*sin(w);
 y = (y1+y2)/2 + X*sin(w) + Y*cos(w);
 plot(x,y,'b-',"LineWidth",2)

%Plot rendezvous point
plot3(burn3x,burn3y,burn3z,"Color","r","Marker",".","MarkerSize",16)

%Plot s/c and TCO together
togetherx=T(439:end,2)/384399;
togethery=T(439:end,3)/384399;
togetherz=T(439:end,4)/384399;
plot3(togetherx,togethery,togetherz,'r-',"LineWidth",2)

grid on 
grid minor
axis equal
xlim([-100 60])
ylim([-60 100])
zlim([-80 80])

view(90,0)   % YZ
legend("2006RH120 Trajectory","L2 Point Orbiting Earth","Burn 1","Burn 2","Transfer Orbit","Burn 3","Spacecraft and TCO","Location",'northeast')
title("Mission Trajectory to 2006RH120 in 2028")
xlabel("x (LD)")
ylabel("y (LD)")
zlabel("z (LD)")


%% Plot approach when its close
% figure(5)
% set(gcf,'units','pixels','position',[1,1,1000,1000]);
% %Pull in TCO Position Data
% x=T(350:end-20,2)/384399;
% y=T(350:end-20,3)/384399;
% z=T(350:end-20,4)/384399;
% plot3(x,y,z,"Color",[0.5 0.5 0.5],"LineWidth",2)
% 
% %Pull in L2 Point Position Data
% hold on
% x=T(350:end-20,5)/384399;
% y=T(350:end-20,6)/384399;
% z=T(350:end-20,7)/384399;
% plot3(x,y,z,"Color","k","LineWidth",2)
% 
% %Plot Earth Actual Size
% [x, y, z] = sphere(10); 
% earthRadius = 6371/384399;
% surf(earthRadius*x, earthRadius*y, earthRadius*z, 'FaceColor', "b"); 
% 
% 
% axis equal
% grid on 
% xticks([-2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15])
% 
% view(0,0)   % XZ
% legend("2006RH120 Trajectory","L2 Point Orbiting Earth","Earth","Location",'northeast')
% title("Approach of 2006RH120 on 10/27/2028")
% xlabel("x (LD)")
% ylabel("y (LD)")
% zlabel("z (LD)")