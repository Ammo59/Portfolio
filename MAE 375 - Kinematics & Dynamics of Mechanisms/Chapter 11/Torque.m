%
a=.86;
c=0.86;
b=1.85;
d=2.22;
p=1.33;

% omega2=80*pi/30;

omega2=-10;


K1=d/a;
K2=d/c;
K3=0.5*(a*a-b*b+c*c+d*d)/(a*c);
K4=d/b;
K5=0.5*(c*c-d*d-a*a-b*b)/(a*b);

%  theta2=linspace(-105,105,100);

theta2=-36;

A=cosd(theta2)-K1-K2.*cosd(theta2)+K3;
B=-2.*sind(theta2);
C=K1-(K2+1).*cosd(theta2)+K3;
D=cosd(theta2)-K1+K4*cosd(theta2)+K5;
E=-2*sind(theta2);
F=K1+(K4-1)*cosd(theta2)+K5;


theta41=2.*atand(0.5.*(-B+sqrt(B.*B-4*A.*C))./A);
theta42=2.*atand(0.5.*(-B-sqrt(B.*B-4*A.*C))./A);

theta4=theta42;

theta31=2.*atand(0.5.*(-E+sqrt(E.*E-4*D.*F))./D);
theta32=2.*atand(0.5.*(-E-sqrt(E.*E-4*D.*F))./D);

theta3=theta32;
c1=a/b;
c2=a/c;

%velocity analysis
omega3=c1*omega2.*sind(theta4-theta2)./sind(theta3-theta4);
omega4=c2*omega2.*sind(theta2-theta3)./sind(theta4-theta3);

Va=a*omega2.*(-sind(theta2)+j*cosd(theta2));

Vpa=p*omega3.*(-sind(theta3)+j*cosd(theta3));

Vp=Va+Vpa;
Vpmag=abs(Vp);

Vpdir=angle(Vp);

% 7.43 ******************************************************************************

alpha2=10.;
AA=c.*sind(theta4);
BB=b.*sind(theta3);
CC=a*alpha2*sind(theta2)+a*(omega2^2)*cosd(theta2)+b*(omega3.^2).*cosd(theta3)-c*(omega4.^2).*cosd(theta4);
DD=c*cosd(theta4);
EE=b*cosd(theta3);
FF=a*alpha2*cosd(theta2)-a*(omega2^2)*sind(theta2)-b*(omega3.^2).*sind(theta3)+c*(omega4.^2).*sind(theta4);
alpha3=(CC.*DD-AA.*FF)./(AA.*EE-BB.*DD);
alpha4=(CC.*EE-BB.*FF)./(AA.*EE-BB.*DD);

%accel_A=-a*(omega2^2)*(cosd(theta2)+j.*sind(theta2)); this has no alpha2
accel_PA=p*alpha3.*(-sind(theta3)+j.*cosd(theta3))-p.*(omega3.^2).*(cosd(theta3)+j.*sind(theta3));

accel_P=accel_A+accel_PA;
accel_P_mag=abs(accel_P);
aceel_P_angle=angle(accel_P);
% 11.12******************************************************************************************************
T4=0;
phi=8.2990e+03;
r=0.0600; %r is actually diameter  should change r to d
m2=pi*r^2*a*phi/4;
m3=pi*r^2*b*phi/4;
m4=pi*r^2*c*phi/4;

IG2=m2*(.75*r^2+a^2)/12;
IG3=m3*(.75*r^2+b^2)/12;
IG4=m4*(.75*r^2+c^2)/12;

RG2=0.5*a;
RG3=0.5*b;
RG4=0.5*c;

R12x=-RG2*cosd(theta2);
R12y=-RG2*sind(theta2);

R32x=RG2*cosd(theta2);
R32y=RG2*sind(theta2);

R23x=-RG3*cosd(theta3);
R23y=-RG3*sind(theta3);

R43x=-(RG3-b)*cosd(theta3);
R43y=-(RG3-b)*sind(theta3);

R34x=RG4*cosd(theta4);
R34y=RG4*sind(theta4);

R14x=-RG4*cosd(theta4);
R14y=-RG4*sind(theta4);

Rpx=(p-RG3)*cosd(theta3);
Rpy=(p-RG3)*sind(theta3);

accel_G2=RG2*alpha2*(-sind(theta2)+j*cosd(theta2))-RG2*(omega2^2)*(cosd(theta2)+j*sind(theta2));
accel_A=a*alpha2*(-sind(theta2)+j*cosd(theta2))-a*(omega2^2)*(cosd(theta2)+j*sind(theta2));

accel_G4=RG4*alpha4*(-sind(theta4)+j*cosd(theta4))-RG4*(omega4^2)*(cosd(theta4)+j*sind(theta4));

accel_G2a=j*RG2*alpha2*exp(j*theta2*pi/180)-RG2*omega2*omega2*exp(j*theta2*pi/180);
accel_Aa=j*a*alpha2*exp(j*theta2*pi/180)-a*omega2*omega2*exp(j*theta2*pi/180);
accel_G4a=j*RG4*alpha4*exp(j*theta4*pi/180)-RG4*omega4*omega4*exp(j*theta4*pi/180);

Fpx=500;
Fpy=0;

AG2x=real(accel_G2);
AG2y=imag(accel_G2);
%acceleration of cg(3) w.r.t. A.
AG3_A=RG3*alpha3*(-sind(theta3)+j*cosd(theta3))-RG3*(omega3^2)*(cosd(theta3)+j*sind(theta3));
AG3_Aa=j*RG3*alpha3*exp(j*theta3*pi/180)-RG3*omega3*omega3*exp(j*theta3*pi/180);

AG3=accel_A+AG3_A;
AG3a=accel_Aa+AG3_Aa;




Ca=[1 0 1 0 0 0 0 0 0;0 1 0 1 0 0 0 0 0;-R12y R12x -R32y R32x 0 0 0 0 1];
Cb=[0 0 -1 0 1 0 0 0 0; 0 0 0 -1 0 1 0 0 0; 0 0 R23y -R23x -R43y R43x 0 0 0];
Cc=[0 0 0 0 -1 0 1 0 0;0 0 0 0 0 -1 0 1 0;0 0 0 0 R34y -R34x -R14y R14x 0];

C=[Ca;Cb;Cc];

Fa=[m2*real(accel_G2); m2*imag(accel_G2); IG2*alpha2];
Fb=[(m3*real(AG3)-Fpx); m3*imag(AG3)-Fpy; IG3*alpha3+Rpy*Fpx; m4*real(accel_G4)];
Fc=[m4*imag(accel_G4);IG4*alpha4-T4];
F=[Fa;Fb;Fc];
R=inv(C)*F;

%%For Energy Method  power balance

VG2=i*RG2*omega2*exp(i*theta2*pi/180);

VA=i*a*omega2*exp(i*theta2*pi/180);

VG3_A=i*omega3*RG3*exp(i*theta3*pi/180);

VG3=VG3_A+VA;

VP_A=i*p*omega3*exp(i*theta3*pi/180);

VP=VA+VP_A;

VG4=i*RG4*omega4*exp(i*theta4*pi/180);

c1=AG2x*real(VG2)+AG2y*imag(VG2);
c2=real(AG3)*real(VG3)+imag(AG3)*imag(VG3);
c3=real(accel_G4)*real(VG4)+imag(accel_G4)*imag(VG4)
c4=IG2*alpha2*omega2+IG3*alpha3*omega3+IG4*alpha4*omega4;
c5=-Fpx*real(Vp)-Fpy*imag(VP);

T12=(m2*c1+m3*c2+m4*c3+c4+c5)/omega2;

