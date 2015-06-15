%% part a: H plane --> phi = 0;
% task 3, prog 2: is the best program so far
clear; clc; clf; 

I =1; % set the current

% define theta part of G 
G_th = @(th, phi)   12*pi*abs(I) *(cos(th)*sin(phi))*sin(pi/2*sin(th));

% define phi part of G
G_phi = @(th,phi)   12*pi*abs(I) *(cos(phi))*sin(pi/2*sin(th));

% define total G 
G = @ (th, phi)  [G_th(th, phi) G_phi(th,phi)];

% task 6:
PSI = @(th, thMax, lnr) 2*pi/lnr *(cos(th)- cos(thMax));
AFabs =  @(th, thMax, N, lnr) 1/N * sin(N*pi/lnr* PSI(th, thMax, lnr))...
                            *1/(sin(pi/lnr* PSI(th, thMax, lnr)));
%% Assume dipole in y direction
vec = [0.25 0.75 1.5 1.5 3.5 4]
for pic = 1:6
    lnr = vec(pic)
    % define parameters
     N=5;
     theta = linspace(0,pi);
     P= totalPwr(G);

    % element radiation pattern
    F = @(th, phi) sqrt(1 - sin(th)^2*cos(phi)^2); 

    % tot radiation pattern =   F * AF
    D = @(th, phi, thMax,  P, N, lnr) 10*log(4*pi/P *norm(F(th, phi)*AFabs(th, thMax,N, lnr))^2);
    GD = @(th, phi, thMax,  P, N, lnr) 10*log(4*pi/sqrt(P) *norm(F(th, phi)*AFabs(th, thMax,N, lnr)));

     % plot
     for n = 1:length(theta)
         Dir(n) = (D(theta(n),pi/2, pi/2, P, N , lnr));
         GDdir(n) = (GD(theta(n),pi/2, pi/2, P, N , lnr))
         ArrPat(n) = AFabs(theta(n), pi/2, N, lnr);
     end 
     figure(1)
    subplot(3,2,pic)
     plot(theta, Dir)
    
xlabel(['Angle $\theta$ [rad], d$\lambda$ = ' num2str(vec(pic))],'Interpreter','latex','Fontsize',20)
ylabel('Radiation Pattern  [dBi]','Interpreter','latex','Fontsize',20)

     figure(2)
    subplot(3,2,pic)
     plot(theta, GDdir)
    
xlabel(['Angle $\theta$ [rad], d$\lambda$ = ' num2str(vec(pic))],'Interpreter','latex','Fontsize',20)
ylabel('Far field Pattern  [dBi]','Interpreter','latex','Fontsize',20)


figure(3)
    subplot(3,2,pic)
     plot(theta, ArrPat)
xlabel(['Angle $\theta$ [rad], d$\lambda$ = ' num2str(vec(pic))],'Interpreter','latex','Fontsize',20)
ylabel('Array factor Pattern ','Interpreter','latex','Fontsize',20)
end 

%% Assume dipole in z direction
vec = [0.25 0.75 1.5 1.5 3.5 4]
for pic = 1:6
    lnr = vec(pic)
     N = 5;
     theta = linspace(0,pi);
     P= totalPwr(G);

    % element radiation pattern
    F = @(th, phi)  sin(th);

    % tot radiation pattern =   F * AF
    D = @(th, phi, thMax,  P, N, lnr) log(4*pi/P *norm(F(th, phi)*AFabs(th, thMax,N, lnr))^2);

    % plot
     for n = 1:length(theta)
         Dir(n) = abs(D(theta(n),pi/2, pi/2, P, N, lnr ));
         ArrPat(n) = AFabs(theta(n), pi/2, N, lnr);
     end 
     figure(2)
    subplot(3,2,pic)
     plot(theta, Dir)
xlabel(['Angle $\theta$ [rad], d$\lambda$ = ' num2str(vec(pic))],'Interpreter','latex','Fontsize',20)
ylabel('Radiation Pattern  [dBi]','Interpreter','latex','Fontsize',20)

 figure(3)
    subplot(3,2,pic)
     plot(theta, ArrPat)
xlabel(['Angle $\theta$ [rad], d$\lambda$ = ' num2str(vec(pic))],'Interpreter','latex','Fontsize',20)
ylabel('Array factor Pattern  [dBi]','Interpreter','latex','Fontsize',20)
end





