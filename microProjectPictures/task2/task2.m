clear; clc;
I =1; % set the current

% define theta part of G 
G_th = @(th, phi,I)   12*pi*abs(I) *(cos(th)*sin(phi))*sin(pi/2*sin(th));

% define phi part of G
G_phi = @(th,phi, I)   12*pi*abs(I) *(cos(phi))*sin(pi/2*sin(th));

% define total G 
G = @ (th, phi)  [G_th(th, phi,1) G_phi(th,phi,1)];
e=pi/2;
Prad= totalPwr(G, e)


