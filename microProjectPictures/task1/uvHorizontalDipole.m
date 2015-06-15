function [ Gth  Gphi ] = uvHorizontalDipole( I, u, v )
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here
phi = atan(v/u);
th = asin(v/sin(phi));
% define theta part of G 
Gth =    log(abs(12*pi*abs(I) *(cos(th)*sin(phi))*sin(pi/2*cos(th))));

% define phi part of G
Gphi = log(abs(12*pi*abs(I) *(cos(phi))*sin(pi/2*cos(th))));

end

