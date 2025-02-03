%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rudimentary script to solve an initial value problem consisting of the
% following system of two differential equations on the interval a<=t<=b
%
% x1'(t) = alpha*x1+beta*x2,  x1(a) = x1_0
% x2'(t) = gamma*x1+delta*x2, x2(a) = x2_0
%
% Look for "*** Your entry i ***" where i=1,2,3,4,5,6 to make appropriate
% changes to solve your specific system
%
% Running the script as is outputs the unit circle as the trajectory with 
% x1(t) = cos t and x2(t) = -sin t for the time series
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Housekeeping

clc ;       % clear the command window
clear;      % clear all variables
close all;  % close all figures

    % ODE45 options

options = odeset('AbsTol',1e-10,'RelTol',1e-7);

    % Independent variable

a = 0;      % left endpoint of t interval  *** Your entry 1 ***
b = 2*pi;   % right endpoint of t interval *** Your entry 2 ***
h = 0.01;   % stepsize                     *** Your entry 3 ***
tt = a:h:b;

    % Initial value of dependent variables

x1_0 = 1;    % initial value of x1    *** Your entry 4 ***
x2_0 = 0;    % initial value of x2    *** Your entry 5 ***
x0 = [x1_0 x2_0];

    % Solve the system

[t,soln] = ode45(@(t,x) rhs(t,x),tt,x0,options);

    % Plot solutions

figure(1);    % time series of x1(t)
plot(t,soln(:,1));
xlabel('$t$','Interpreter','latex','FontSize',20);
ylabel('$x_1$','Interpreter','latex','FontSize',20,'Rotation',0)
grid on

figure(2);    % time series of x2(t)
plot(t,soln(:,2));
xlabel('$t$','Interpreter','latex','FontSize',20);
ylabel('$x_2$','Interpreter','latex','FontSize',20,'Rotation',0);
grid on

figure(3);    % phase portrait
plot(soln(:,1),soln(:,2));
xlabel('$x_1$','Interpreter','latex','FontSize',20);
ylabel('$x_2$','Interpreter','latex','FontSize',20,'Rotation',0)
grid on
axis square

    % Right hand side of the system differential equations

function [xp] = rhs(t,x)   % do not change this line
    % *** Your entry 6 ***  (start entering your system here)
    alpha = 0;
    beta = 1;
    gamma = -1;
    delta = 0;
    x1prime = alpha*x(1) + beta*x(2);
    x2prime = gamma*x(1) + delta*x(2);
    % *** Your entry 6 ***  (stop entering your system here)
    xp = [x1prime ; x2prime];  % do not change this line
end                            % do not change this line
