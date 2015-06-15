function [ Gth  Gphi ] = horizontalDipole( I, th, phi )
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here

% define theta part of G 
Gth =    12*pi*abs(I) *(cos(th)*sin(phi))*sin(pi/2*sin(th));

% define phi part of G
Gphi = 12*pi*abs(I) *(cos(phi))*sin(pi/2*sin(th));

end

