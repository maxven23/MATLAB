a = 0; b = 1;
N = 100;
h = (b-a)/N;

lambda = 0.25; 

T = 0.05;
tau = lambda*h^2; 
M = round(T/tau);

u = zeros(N,M);
x = linspace(a,b,N);
t = linspace(0,T,M);

%Начальное условие
u(:,1) = sin(4*pi*x);

%Граничные условия
u(1,:) = 0;
u(N,:) = 0;

figure;
plot(x, u(:, 1));
ylim([-1.5 1.5]);

%Решение
for n = 1:M-1
    W = u(1:N-2,n);
    E = u(3:N,n);
    S = u(2:N-1,n);
    u(2:N-1,n+1) = S + tau/h^2 * (W - 2*S + E);
    if mod(n, 100) == 0
        figure;
        plot(x, u(:, n));
        ylim([-1.5 1.5]);
    end
end

figure;
plot(x, u(:, M));
ylim([-1.5 1.5]);

%-------------------------

[Xs, Ts] = meshgrid(x, t);

% Реальное решение решение
u_real = sin(4*pi*Xs).*exp(-16*pi^2*Ts);

figure('Position', [500, 150, 1000, 400]);

subplot(1, 2, 1)
colormap('cool');
s = surf(Xs, Ts, u_real);
s.EdgeColor = 'none';

xlabel('x');
ylabel('t');
zlabel('u(x,t)');
title('Real solution');


subplot(1, 2, 2)
colormap('cool');
mesh(x,t,u');

xlabel('x');
ylabel('t');
zlabel('u(x,t)');
title('Numerical solution');
