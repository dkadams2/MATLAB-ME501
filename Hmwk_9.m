%Derrik Adams
%ME 501 - Hmwk 8
%10-41
clear all
%Define Variables
k = 40.715e6; %N/m
b = 1.4666; %m^-1
a = .75; %m
E = 200e9; %N/m^2
Ix = 11e6; %mm^4
c = .152/2; %m
ba = b*a;
Dba = exp(-ba)*cos(ba);
Cba = exp(-ba)*(cos(ba)-sin(ba));
z = -.75:.0001:.75; %m
P = 60000; %N

for i=1:length(z)
    az = a+z(i);
    %If statements are for ABz and CBz, since ABz(-z)=ABz(z) and
    %CBz(-z)=CB(z)
    if z(i)<0 && az<0
         y(i) = (P*b/(2*k))*((exp(-b*-z(i))*(sin(b*-z(i))+cos(b*-z(i))))+(2*Dba*exp(-b*(az))*cos(b*(az)))+(Cba*exp(-b*(-az))*((cos(b*(-az)))-sin(b*(-az)))));
         M(i) = (P/(4*b))*(exp(-b*-z(i))*(cos(b*-z(i))-sin(b*-z(i)))-2*Dba*exp(-b*(a+z(i)))*sin(b*(a+z(i)))-Cba*exp(-b*(-az))*((sin(b*(-az)))+cos(b*(-az))));
    
    elseif z(i)<0 && az>=0
         y(i) = (P*b/(2*k))*((exp(-b*-z(i))*(sin(b*-z(i))+cos(b*-z(i))))+(2*Dba*exp(-b*(a+z(i)))*cos(b*(a+z(i))))+(Cba*exp(-b*(a+z(i)))*((cos(b*(a+z(i))))-sin(b*(a+z(i))))));
         M(i) = (P/(4*b))*(exp(-b*-z(i))*(cos(b*-z(i))-sin(b*-z(i)))-2*Dba*exp(-b*(a+z(i)))*sin(b*(a+z(i)))-Cba*exp(-b*(a+-z(i)))*((sin(b*(a+-z(i))))+cos(b*(a+-z(i)))));
         
    else
         y(i) = (P*b/(2*k))*((exp(-b*z(i))*(sin(b*z(i))+cos(b*z(i))))+(2*Dba*exp(-b*(a+z(i)))*cos(b*(a+z(i))))+(Cba*exp(-b*(a+z(i)))*((cos(b*(a+z(i))))-sin(b*(a+z(i))))));
         M(i) = (P/(4*b))*(exp(-b*z(i))*(cos(b*z(i))-sin(b*z(i)))-2*Dba*exp(-b*(a+z(i)))*sin(b*(a+z(i)))-Cba*exp(-b*(a+z(i)))*((sin(b*(a+z(i))))+cos(b*(a+z(i)))));
    end
end

figure(1)
plot(z,y)
ymax = max(y);
zmaxy = z(find(y==ymax));
figure(2)
plot(z,M)
Mmax = max(M);
zmaxm = z(find(M==Mmax));

%Solve for stress in rod and beam
stress_rod = E*(ymax/2.5);
stress_beam = Mmax*c/(Ix*(1/1000)^4);