clear; clc;

%Read Position Data
T= readmatrix('2006RH120barycentershort.csv'); 


%set(gcf,'units','pixels','position',[1,1,500,500]);
%Pull in TCO Position Data
theta = 13.186;

for i = 1:145
    x(i)=T(i,2)/384399;
    y(i)=T(i,3)/384399;
    z(i)=T(i,4)/384399;

    r(i) = sqrt(x(i)^2+y(i)^2);
    x(i) = r(i)*cosd(theta*i);
    y(i) = r(i)*sind(theta*i);

end
plot3(x,y,z,"Color",[0.5 0.5 0.5],"LineWidth",2)

%Pull in Moon
hold on
for i = 1:209
    x(i)=T(i,5)/384399;
    y(i)=T(i,6)/384399;
    z(i)=T(i,7)/384399;

    r(i) = sqrt(x(i)^2+y(i)^2);
    x(i) = r(i);
    y(i) = 0;
end
moonx = mean(x);
moony = mean(y);
moonz = mean(z);
plot3(moonx,moony,moonz,"Marker",".","Color","k","MarkerSize",10)

%Pull in Earth
hold on
for i = 1:209
    x(i)=T(i,8)/384399;
    y(i)=T(i,9)/384399;
    z(i)=T(i,10)/384399;

    r(i) = sqrt(x(i)^2+y(i)^2);
    x(i) = -r(i);
    y(i) = 0;
end
earthx = mean(x);
earthy = mean(y);
earthz = mean(z);
plot3(earthx,earthy,earthz,"Marker",".","Color","blue","MarkerSize",14)

%Plot burn 1 and 2
burn1x=1500000/384399;
burn1y=0;
burn1z=0;
plot3(burn1x,burn1y,burn1z,"Color","g","Marker",".","MarkerSize",16)

burn2x = burn1x;
burn2y = burn1y;
burn2z = burn1z;

burn3x=T(145,2)/384399;
burn3y=T(145,3)/384399;
burn3z=T(145,4)/384399;

%Plot the orbit raise
x2 = burn3x;
x1 = burn2x;
y2 = burn3y;
y1 = burn2y;
e = 0.9;
 a = 1/2*sqrt((x2-x1)^2+(y2-y1)^2);
 b = a*sqrt(1-e^2);
 c = 5;
 t = linspace(pi,2*pi,145);
 X = a*cos(t);
 Y = b*sin(t);
 w = atan2(y2-y1,x2-x1);
 x = (x1+x2)/2 + X*cos(w) - Y*sin(w);
 y = (y1+y2)/2 + X*sin(w) + Y*cos(w);
 
 for i = 1:145
    r(i) = sqrt(x(i)^2+y(i)^2);
    x(i) = r(i)*cosd(theta*i);
    y(i) = r(i)*sind(theta*i);
 end
 
 plot(x,y,'b-',"LineWidth",2)

%Plot rendezvous point
plot3(burn3x,burn3y,burn3z,"Color","r","Marker",".","MarkerSize",16)

%Plot s/c and TCO together
togetherx=T(146:208,2)/384399;
togethery=T(146:208,3)/384399;
togetherz=T(146:208,4)/384399;

for i = 1:63
    r(i) = sqrt(togetherx(i)^2+togethery(i)^2);
    togetherx(i) = r(i)*cosd(theta*i);
    togethery(i) = r(i)*sind(theta*i);
end

plot3(togetherx,togethery,togetherz,'r-',"LineWidth",2)

grid on 
grid minor
axis equal
% xlim([-15 15])
% ylim([-15 15])
% zlim([-10 10])


legend("2006RH_{120} \color{white} TC\color{black}","Moon","Earth","Burn 1 & 2","Transfer","Burn 3","TCO & Spacecraft","Location",'northeast')
%title("Mission Trajectory to 2006RH120 in 2028")
xlabel("x (LD)")
ylabel("y (LD)")
zlabel("z (LD)")

%exportgraphics(gca,'RH120rotating.jpeg','Resolution',2000)
