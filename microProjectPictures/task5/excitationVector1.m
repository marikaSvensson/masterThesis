function [ I , phase] = excitationVector1( th, phi , A)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
I = zeros(length(A(:,1)),1);
Psi = zeros(length(A(:,1)),1);

for n = 1:length(A(:,1))
       Psi(n) = (2*pi *abs(sin(th)*cos(phi)*A(n,1)  ...
        + sin(th)*sin(phi)*A(n,2)  + cos(th)*A(n,3) ));
       I(n) = exp(j*Psi(n));
end
phase = Psi;
end

