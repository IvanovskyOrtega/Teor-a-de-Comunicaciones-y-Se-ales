%% SUMA DE LAS SERIES DE FOURIER
clc
clear
close all
syms n t
A0 = 3;
An = 0;
Bn = -6/(pi*n);
T = 3;
w0 = 2*pi/T;
Arm = 500;
for n=1:Arm
%     f(n,:) = sum((An)*cos(n*w0*t)+(Bn)*sin(n*w0*t));
    f(n,:) = sum((-6/(pi*n))*sin(n*w0*t));
end
t = linspace(0, 3, 1000);
f = subs(f, 't', t);
f(n+1,:) = zeros(1,1000);
plot(t,A0+sum(f), 'Linewidth', 2); grid on
xlabel('\bfTIEMPO'); ylabel('\bfAMPLITUD'); title(['\bf SERIE DE FOURIER DE f(t)=2t (PRIMEROS ', num2str(Arm), ' ARMÓNICOS)'])

