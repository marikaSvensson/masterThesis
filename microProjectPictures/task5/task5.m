clear;
clc;
close all;

% steering angles
th_0 = pi/3;
phi_0 = pi/2;


max = 5;
A1 = zeros(max,3);
for n = 1:max
    elements(n) = n;
            A1(n, 3) =n/max;
end 
[CurrentEquispaced  psi1] = excitationVector1( th_0, phi_0 , A1);

A2 = zeros(max,3);
for n = 1:max
           A2(n, 1) =n^2/max;
            A2(n, 2) =n/max ;
             A2(n, 3) =1/n/max ;
end 
[CurrentNonEquispaced  psi2] = excitationVector1( th_0, phi_0 , A2);
figure(2)
plot(elements, psi1, elements, psi2);
h_legend = legend('Equispaced array', 'irregular spaced array' )
set(h_legend,'FontSize',14);
xlabel('Number of element','Interpreter','latex','Fontsize',20)
ylabel('Difference in phase of excitation current','Interpreter','latex','Fontsize',20)


clear;
clc;
close all;

% steering angles
th_0 = pi/3;
phi_0 = pi/2;


max = 5;
A1 = zeros(max,3);
for n = 1:max
    elements(n) = n;
            A1(n, 3) =n/max;
end 
[CurrentEquispaced  psi1] = excitationVector( th_0, phi_0 , A1);

A2 = zeros(max,3);
for n = 1:max
           A2(n, 1) =n^2/max;
            A2(n, 2) =n/max ;
             A2(n, 3) =1/n/max ;
end 
[CurrentNonEquispaced  psi2] = excitationVector( th_0, phi_0 , A2);
figure(2)
plot(elements, psi1, elements, psi2);
h_legend = legend('Equispaced array', 'irregular spaced array' )
set(h_legend,'FontSize',14);
xlabel('Number of element','Interpreter','latex','Fontsize',20)
ylabel('Difference in phase of excitation current ','Interpreter','latex','Fontsize',20)
title('Phase difference with respect to neighbor element','Interpreter','latex','Fontsize',20)


