% task 3, prog 2: is the best program so far
clear; clc; close all;

I =1; % set the current

% define theta part of G 
G_th = @(th, phi)   12*pi*abs(I) *(cos(th)*sin(phi))*sin(pi/2*sin(th));

% define phi part of G
G_phi = @(th,phi)   12*pi*abs(I) *(cos(phi))*sin(pi/2*sin(th));

% define total G 
G = @ (th, phi)  [G_th(th, phi) G_phi(th,phi)];

% Polarization:
e = pi/2;

costar = @(phi)[conj(cos(phi-e)) 
          conj(-sin(phi-e))];
xpstar = @(phi)[conj(-sin(phi-e)) 
          conj(-cos(phi-e))];
Gco = @(th, phi ) G(th,phi)*costar(phi);
D = @(th, phi, P) 10*log(4*pi/(P)* norm(Gco(th,phi)^2));

% Eplane phi = pi/2
 theta = linspace(0,pi);
 P= totalPwr(G);
 
 for n = 1:length(theta)
     Dir(n) = abs(D(theta(n),pi/2, P ));
 end 
 
 figure(1)
 plot(theta(1:length(theta)-1), Dir(1:length(theta)-1)) 
xlabel('Angle $\theta$ [rad]','Interpreter','latex','Fontsize',20)
ylabel('Far field Pattern  [dBi]','Interpreter','latex','Fontsize',20)
title('Far field Pattern in E-plane ','Interpreter','latex','Fontsize',20)

% Hplane : phi = 0;
 theta = linspace(0,pi);
 P= totalPwr(G);
 
 for n = 1:length(theta)
     Dir(n) = abs(D(theta(n),0, P ));
 end 
 
 figure(2)
 plot(theta(1:length(theta)-1), Dir(1:length(theta)-1))
 xlabel('Angle $\theta$ [rad]','Interpreter','latex','Fontsize',20)
ylabel('Far field Pattern  [dBi]','Interpreter','latex','Fontsize',20)
title('Far field Pattern in H-plane ','Interpreter','latex','Fontsize',20)

 