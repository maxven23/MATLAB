fileName = 'TwoMaterials.gif';

T_left = 120+273;
T_right = 35+273;
T_0 = 20+273;

k_1 = 400;
k_2 = 237;
ro_1 = 8940;
ro_2 = 2700;
c_1 = 385;
c_2 = 920;

L = 1;
L_1 = 0.6;
L_2 = 0.4;

N = 51;
X = linspace(0, L, N);
dx = X(2) - X(1);

N_edge = 31;

t = 5000;
dt = dx^2*0.999/2 * min(ro_1*c_1/k_1, ro_2*c_2/k_2);
Time = 0:dt:t;
M = length(Time);
% dt / dx^2
cur_1 = ones(1, N_edge-1) * (c_1*ro_1);
cur_2 = ones(1, N-N_edge) * (c_2*ro_2);
cur = [cur_1 (c_1*ro_1 + c_2*ro_2)/2 cur_2];

k1 = ones(1, N_edge-1) * k_1;
k2 = ones(1, N-N_edge+1) * k_2;
k_minus_half = [k1 k2];

k1 = ones(1, N_edge) * k_1;
k2 = ones(1, N-N_edge) * k_2;
k_plus_half = [k1 k2];

u = zeros(M, N);

u(1, :) = T_0;

figure;
for m=1:M-1
    W = zeros(1, N);
    E = zeros(1, N);
    
    W(1:N-1) = u(m, 2:N);
    E(2:N)   = u(m, 1:N-1);
    S = u(m, :);
        
    u(m+1, :) = S + (dt/dx^2)*(k_plus_half.*(E-S) - k_minus_half.*(S-W)) ./ cur;
    
    u(m+1, 1) = T_left;
    u(m+1, N) = T_right;
    
end

f1 = @(x) (k_2/k_1*(T_right-T_left)/(L_1*k_2/k_1 - L_1 + L)).*x + T_left;
f2 = @(x) ((T_right - T_left)/(L_1*k_2/k_1-L_1+L)).*x + T_right - L*(T_right - T_left)/(L_1*k_2/k_1-L_1+L);

u1 = f1(X(1:N_edge));
u2= f2(X(N_edge:N));

u_analytic = [u1 u2(2:N-N_edge+1)];

for m = 1:50:M
    clf
    grid on;
    hold on;
    
    plot(X, u(m, :));
    plot(X, u_analytic);
    
    title('Temperature in cylinder');
    xlabel('x');
    ylabel('T');
    axes = [0 1 250 400];
    xlim([0 1]);
    ylim([250 400]);
    legend('Numerical', 'Analytical');
    
    frame = getframe(gca);
    img =  frame2im(frame);
    [img,cmap] = rgb2ind(img,256);
    if m == 1
        imwrite(img, cmap, fileName,'gif',...
                'LoopCount',Inf,'DelayTime',0);
    else
        imwrite(img, cmap, fileName,'gif',...
                'WriteMode','append','DelayTime',0);
    end
end

figure;
title('3D plot');
[Xs, Ts] = meshgrid(X, Time);
mesh(Xs, Ts, u);
xlabel('x');
ylabel('t');