function [ I , phase] = excitationVector( th, phi , A)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
I = zeros(length(A(:,1)),1);
Psi = zeros(length(A(:,1)),1);
Psi(1) = exp(2*pi *abs(sin(th)*cos(phi)*(A(1,1))...
           + sin(th)*sin(phi)*(A(1,2))  + cos(th)*(A(1,3)) )  );
I(1) = exp(j*Psi(1));
for n = 2:length(A(:,1))
       Psi(n) = exp(2*pi *abs(sin(th)*cos(phi)*(A(n,1) -A(n-1,1))  ...
        + sin(th)*sin(phi)*(A(n,2) -A(n-1,2))  + cos(th)*(A(n,3)-A(n-1,3))) );
       I(n) = exp(j*Psi(n));
end
phase = Psi;
end

