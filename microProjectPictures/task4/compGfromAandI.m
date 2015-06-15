function [ G ] = compGfromAandI( A, I )
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
    
for n=1:length(I)
    Amplitude(n) = norm(I);
    phase(n) = atan(imag(I)/real(I));
end 
th = linspace(0,pi);
phi = linspace(0,2*pi);

factor = @(th,phi, p) Amplitude(p)*exp(j*phase(p))*exp(j*2*pi*(A(1)*sin(th)*cos(phi)+ A(2)*sin(th)*sin(phi)...
                + A(3)*cos(th)));
% define theta part of G 
G_th = @(th, phi, current)   12*pi*abs(current) *(cos(th)*sin(phi))*sin(pi/2*sin(th));

% define phi part of G
G_phi = @(th,phi, current)   12*pi*abs(current) *(cos(phi))*sin(pi/2*sin(th));

GAth = zeros(length(th), length(phi));
GAphi = zeros(length(th), length(phi));
for n=1:length(th)
    for m=1:length(phi)
        for p=1:length(I) % sum over elements
           
            F = factor(th(n), phi(m), p);
            
            GAphi(n,m)=  GAphi(n,m)+ F* G_phi(th(n), phi(m), I(1));
     
            GAth(n,m) = GAth(n,m) + F * G_th( th(n), phi(m), I(1)); 
        end
    end 
end
    
G=[GAth GAphi];

figure(1)
subplot(1,2,1)
contour(th, phi, abs(GAth));
xlabel('Angle $\theta$ [rad]','Interpreter','latex','Fontsize',20)
ylabel('Angle $\Phi$(r) [rad]','Interpreter','latex','Fontsize',20)
 title('Contour plot of $G_{\theta}$ ','Interpreter','latex','Fontsize',20)

subplot(1,2,2)
surf(th, phi, abs(GAth));
xlabel('Angle $\theta$ [rad]','Interpreter','latex','Fontsize',20)
ylabel('Angle $\Phi$(r) [rad]','Interpreter','latex','Fontsize',20)
 title('Surf plot of $G_{\theta}$ ','Interpreter','latex','Fontsize',20)

figure(2)
subplot(1,2,1)
contour(th, phi, abs(GAphi));
xlabel('Angle $\theta$ [rad]','Interpreter','latex','Fontsize',20)
ylabel('Angle $\Phi$(r) [rad]','Interpreter','latex','Fontsize',20)
 title('Contour plot of $G_{\phi}$ ','Interpreter','latex','Fontsize',20)



subplot(1,2,2)
surf(th, phi, abs(GAphi));
xlabel('Angle $\theta$ [rad]','Interpreter','latex','Fontsize',20)
ylabel('Angle $\Phi$(r) [rad]','Interpreter','latex','Fontsize',20)
 title('Surf plot of $G_{\phi}$ ','Interpreter','latex','Fontsize',20)




end

