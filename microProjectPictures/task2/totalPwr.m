function [ Prad ] = totalPwr(G,e)
%UNTITLED15 Summary of this function goes here
%   Detailed explanation goes here
% G = [Gth(th, phi) Gphi(th, phi)] is a function 

% Polarization:
%e = pi/2;
%Phi = pi/4;

% vectors for integration
phi = linspace(0,2*pi);
th  = linspace(0,pi);
for n=1:length(phi)
    costar = [conj(cos(phi(n)-e)) 
          conj(-sin(phi(n)-e))];
    xpstar = [conj(-sin(phi(n)-e)) 
          conj(-cos(phi(n)-e))];
    costar2 = e^(j*phi(n))*[1 -j]/sqrt(2);
    costar3 = e^(-j*phi(n))*[1 +j]/sqrt(2);
    xpstar2 = e^(j*phi(n))*[1 -j]/sqrt(2);
        xpstar3 = e^(-j*phi(n))*[1 +j]/sqrt(2);
    for m = 1:length(th)
        Gco = G(th(m),phi(n))*costar3';
        Gxp = G(th(m),phi(n))*xpstar3';
        U(n,m) = abs(Gco)^2 + abs(Gxp)^2;

    end 
end 

Prad =0;
h= (2*pi^2/(length(phi)*length(th)));
% integration with midpoint method.
for n = 1:length(th)
    for m = 1:length(phi)
        Prad = Prad + U(n,m)*sin(th(n))*h;
    end 
end 
Prad = Prad/(2*120*pi);
end

