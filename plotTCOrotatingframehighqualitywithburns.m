clear; clc;

%Read Position Data
T= readmatrix('2006RH120barycentersupershort.csv'); 
B= readmatrix('2006RH120barycentershort.csv');

%%
%set(gcf,'units','pixels','position',[1,1,500,500]);
%Pull in TCO Position Data
theta = 13.186/24;

for i = 1:3625
    x(i)=T(i,2)/384399;
    y(i)=T(i,3)/384399;
    z(i)=T(i,4)/384399;

    r(i) = sqrt(x(i)^2+y(i)^2);
    x(i) = r(i)*cosd(theta*i-theta-160);
    y(i) = r(i)*sind(theta*i-theta-160);

end
plot3(x,y,z,"Color",[0.5 0.5 0.5],"LineWidth",2)

%Pull in Earth
hold on
earthx = B(5,8)/384399;
earthy = B(5,9)/384399;
earthz = B(5,10)/384399;
plot3(earthx,earthy,earthz,"Marker",".","Color","blue","MarkerSize",14)

%Pull in Moon
hold on
for ii = 1:209
    moonx(ii) = B(ii,5)/384399;
    moony(ii) = B(ii,6)/384399;
    moonz(ii) = B(ii,7)/384399;

    moonr(ii) = sqrt(moonx(ii)^2+moony(ii)^2);
    moonx(ii) = moonr(ii)*cosd(theta*ii*24-(theta*24*(ii-1))-160*24);
    moony(ii) = moonr(ii)*sind(theta*ii*24-(theta*24*(ii-1))-160*24);
end
plot3(0,-mean(moony),0,"Marker",".","Color","k","MarkerSize",10)

%Plot burn 1 and 2
burn1x=0;
burn1y=-1500000/384399;
burn1z=0;
plot3(burn1x,burn1y,burn1z,"Color","g","Marker",".","MarkerSize",16)

burn2x = 1500000/384399;
burn2y = 0;
burn2z = 0;
plot3(burn2x,burn2y,burn2z,"Color","cyan","Marker",".","MarkerSize",16)

burn3x=T(3625,2)/384399;
burn3y=T(3625,3)/384399;
burn3z=T(3625,4)/384399;

%Plot the orbit raise
x2 = burn3x;
x1 = burn2x;
y2 = burn3y;
y1 = burn2y;
e = 0.9;
 a = 1/2*sqrt((x2-x1)^2+(y2-y1)^2);
 b = a*sqrt(1-e^2);
 c = 5;
 t = linspace(pi,2*pi,4993-3625);
 X = a*cos(t);
 Y = b*sin(t);
 w = atan2(y2-y1,x2-x1);
 x = (x1+x2)/2 + X*cos(w) - Y*sin(w);
 y = (y1+y2)/2 + X*sin(w) + Y*cos(w);
 
 for i = 1:4993-3625
    r(i) = sqrt(x(i)^2+y(i)^2);
    x(i) = r(i)*cosd(theta*i-theta);
    y(i) = r(i)*sind(theta*i-theta);
 end
 
 plot(x,y,'cyan-',"LineWidth",2)

%Plot rendezvous point
plot3(9.71534,5.60916,0.00312176,"Color","r","Marker",".","MarkerSize",16)

%Plot s/c and TCO together
togetherx=T(3625+1:4993,2)/384399;
togethery=T(3625+1:4993,3)/384399;
togetherz=T(3625+1:4993,4)/384399;

for i = 1:4993-3625
    r(i) = sqrt(togetherx(i)^2+togethery(i)^2);
    togetherx(i) = r(i)*cosd(theta*i-theta+190-160);
    togethery(i) = r(i)*sind(theta*i-theta+190-160);
end

plot3(togetherx,togethery,togetherz,'r-',"LineWidth",2)


grid on 
%grid minor
axis equal
% xlim([-15 15])
% ylim([-15 15])
zlim([-5 5])

%view(90,0) %YZ
view(-145,37.5)
%legend("2006RH_{120} \color{white} TC\color{black}","Earth","Moon","Burn 1","Burn 2","Transfer","Burn 3","TCO & S/C","Location",'northeast','Position',[0.7 0.7 0.1 0.1])
%title("Mission Trajectory to 2006RH120 in 2028")
xlabel("x (LD)")
ylabel("y (LD)")
zlabel("z (LD)")

exportgraphics(gca,'RH120rotatinghighqualitywithburns.jpeg','Resolution',2000)
