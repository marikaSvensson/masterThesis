% Task 1
clear;
clc;
clf;
th = linspace(0,pi);
phi = linspace(0,2*pi);


for i=1:length(th)
    for j=1:length(phi)
     
        [Gth(i,j)  Gphi(i,j)] = horizontalDipole( 1, th(i), phi(j)); 
        end
end


figure(1)
subplot(1,2,1)
contour(th, phi, Gth);
xlabel('Angle $\theta$ [rad]','Interpreter','latex','Fontsize',20)
ylabel('Angle $\Phi$(r) [rad]','Interpreter','latex','Fontsize',20)
 title('Contour plot of $G_{\theta}$ ','Interpreter','latex','Fontsize',20)

subplot(1,2,2)
surf(th, phi, Gth);
xlabel('Angle $\theta$ [rad]','Interpreter','latex','Fontsize',20)
ylabel('Angle $\Phi$(r) [rad]','Interpreter','latex','Fontsize',20)
 title('Surf plot of $G_{\theta}$ ','Interpreter','latex','Fontsize',20)


figure(2)
subplot(1,2,1)
contour(th, phi, Gphi);
xlabel('Angle $\theta$ [rad]','Interpreter','latex','Fontsize',20)
ylabel('Angle $\Phi$(r) [rad]','Interpreter','latex','Fontsize',20)
 title('Contour plot of $G_{\phi}$ ','Interpreter','latex','Fontsize',20)



subplot(1,2,2)
surf(th, phi, Gphi);
xlabel('Angle $\theta$ [rad]','Interpreter','latex','Fontsize',20)
ylabel('Angle $\Phi$(r) [rad]','Interpreter','latex','Fontsize',20)
 title('Surf plot of $G_{\phi}$ ','Interpreter','latex','Fontsize',20)

%%
clear;
clc;
clf;
u = linspace(-1,1);
v = linspace(-1,1);


for i=1:length(u)
    for j=1:length(v)
     
        [Gth(i,j)  Gphi(i,j)] = uvHorizontalDipole( 1, u(i), v(j)); 
        end
end


figure(1)
subplot(1,2,1)
contour(u, v, Gth);
xlabel('$u = sin\theta\sin\phi$ ','Interpreter','latex','Fontsize',20)
ylabel('$v = sin\theta\sin\phi$ ','Interpreter','latex','Fontsize',20)
 title('Contour plot of $G_{\theta}$ ','Interpreter','latex','Fontsize',20)

subplot(1,2,2)
surf(u, v, Gth);
xlabel('$u = sin\theta\sin\phi$ ','Interpreter','latex','Fontsize',20)
ylabel('$v = sin\theta\sin\phi$ ','Interpreter','latex','Fontsize',20)
 title('Surf plot of $G_{\theta}$ ','Interpreter','latex','Fontsize',20)


figure(2)
subplot(1,2,1)
contour(u, v, Gphi);
xlabel('$u = sin\theta\sin\phi$','Interpreter','latex','Fontsize',20)
ylabel('$v = sin\theta\sin\phi$','Interpreter','latex','Fontsize',20)
 title('Contour plot of $G_{\phi}$ ','Interpreter','latex','Fontsize',20)



subplot(1,2,2)
surf(u, v, Gphi);
xlabel('$u = sin\theta\sin\phi$','Interpreter','latex','Fontsize',20)
ylabel('$v = sin\theta\sin\phi$','Interpreter','latex','Fontsize',20)
 title('Surf plot of $G_{\phi}$ ','Interpreter','latex','Fontsize',20)












%%
clear;
clc;
% define parameters

% th in [0,pi]
% phi in [0,2pi]
 lambda =1;
 k = 4*pi/lambda;
 eta = 120*pi;
 Ck = -i*k/(4*pi); 
 l  = lambda / 2;
 h = lambda/4;
 
 
% define theta part of G 
G_th = @ (th, phi, I) k/(2*pi)*eta*abs(I)*(cos(th)*sin(phi))*sin(pi/2*sin(th));

% define phi part of G
G_phi = @ (th, phi, I) k/(2*pi)*eta*abs(I) *(cos(phi))*sin(pi/2*sin(th));


th = linspace(0,pi);
phi = linspace(0,2*pi);


for i=1:length(th)
    for j=1:length(phi)
        Gphi(i,j)= G_phi(th(i), phi(j), 1);
     
        Gth(i,j) = G_th( th(i), phi(j), 1); 
        end
end 
figure(1)
subplot(2,1,1)
contour(th, phi, Gth);

subplot(2,1,2)
surf(th, phi, Gth);

%%
figure(2)
subplot(2,1,1)
contour(th, phi, Gphi);

subplot(2,1,2)
surf(th, phi, Gphi);




