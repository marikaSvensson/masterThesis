function [ Prad ] = totalPwr(G)
%UNTITLED15 Summary of this function goes here
%   Detailed explanation goes here
% G = [Gth(th, phi) Gphi(th, phi)] is a function 

% Polarization:
e = pi/2;


% vectors for integration
phi = linspace(0,2*pi);
th  = linspace(0,pi);

for n=1:length(phi)
    costar = [conj(cos(phi(n)-e)) 
          conj(-sin(phi(n)-e))];
    xpstar = [conj(-sin(phi(n)-e)) 
          conj(-cos(phi(n)-e))];
    for m = 1:length(th)
        Gco = G(th(m),phi(n))*costar;
        Gxp = G(th(m),phi(n))*xpstar;
        U(n,m) = norm(Gco)^2 + norm(Gxp)^2;

    end 
end 

Prad =0;
h= (2*pi^2/(length(phi)*length(th)));
% integration with trapez method.
for n = 1:length(th)
    for m = 1:length(phi)
        Prad = Prad + U(n,m)*sin(th(n))*h;
    end 
end 

end

