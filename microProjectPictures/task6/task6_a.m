%% part a: H plane --> phi = 0;
% task 3, prog 2: is the best program so far
clear; clc; close all; 

I =1; % set the current

% define theta part of G 
G_th = @(th, phi)   12*pi*abs(I) *(cos(th)*sin(phi))*sin(pi/2*sin(th));

% define phi part of G
G_phi = @(th,phi)   12*pi*abs(I) *(cos(phi))*sin(pi/2*sin(th));

% define total G 
G = @ (th, phi)  [G_th(th, phi) G_phi(th,phi)];

% task 6:
PSI = @(th, thMax) 4*pi/3 *(cos(th)- cos(thMax));
AFabs =  @(th, thMax, N) 1/N * sin(2*N*pi/3* PSI(th, thMax))...
                            *1/(sin(2*pi/3* PSI(th, thMax)));
%% Assume dipole in y direction
% define parameters
 N=5;
 theta = linspace(0,pi);
 P= totalPwr(G);

% element radiation pattern
F = @(th, phi) sqrt(1 - sin(th)^2*cos(phi)^2); 

% tot radiation pattern =   F * AF
D = @(th, phi, thMax,  P, N) 10*log(4*pi/P *norm(F(th, phi)*AFabs(th, thMax,N))^2);
GD = @(th, phi, thMax,  P, N) 10*log(4*pi/sqrt(P) *norm(F(th, phi)*AFabs(th, thMax,N)));

 % plot
 for n = 1:length(theta)
     Dir(n) = (D(theta(n),0, 0, P, N ));
     GDir(n) = (GD(theta(n),0, 0, P, N ));
     ArrPat(n) = AFabs(theta(n), 0, N);
 end 
 figure(1)
 plot(theta, Dir)
 xlabel('Angle $\theta$ [rad]','Interpreter','latex','Fontsize',20)
ylabel('Radiation Pattern  [dBi]','Interpreter','latex','Fontsize',20)
title('Radiation Pattern in H-plane for y polarization','Interpreter','latex','Fontsize',20)

 figure(2)
 plot(theta, GDir)
 xlabel('Angle $\theta$ [rad]','Interpreter','latex','Fontsize',20)
ylabel('Far field Pattern  [dBi]','Interpreter','latex','Fontsize',20)
title('Far field Pattern in H-plane for y polarization','Interpreter','latex','Fontsize',20)

figure(3)

     plot(theta, ArrPat)
xlabel('Angle $\theta$ [rad]','Interpreter','latex','Fontsize',20)
ylabel('Array factor Pattern  ','Interpreter','latex','Fontsize',20)


%% Assume dipole in z direction
 N = 5;
 theta = linspace(0,pi);
 P= totalPwr(G);

% element radiation pattern
F = @(th, phi)  sin(th);

% tot radiation pattern =   F * AF
D = @(th, phi, thMax,  P, N) log(4*pi/P *norm(F(th, phi)*AFabs(th, thMax,N))^2);

% plot
 for n = 1:length(theta)
     Dir(n) = abs(D(theta(n),0, 0, P, N ));
 end 
 figure(2)
 plot(theta, Dir)

xlabel('Angle $\theta$ [rad]','Interpreter','latex','Fontsize',20)
ylabel('Radiation Pattern  [dBi]','Interpreter','latex','Fontsize',20)
title('Radiation Pattern in H-plane for z polarization','Interpreter','latex','Fontsize',20)





