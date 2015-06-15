clear;
clc;
clf;
%Initialize position matrix
for n= 1:10        
    A(n,:) = [n n+1 n-1];
    I(n)= 1*exp(j*2*pi/n);
end 

 G = compGfromAandI(A,I);