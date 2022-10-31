g = 9.81;

% ===========Vector--form============
%
% ms'' = -ks' + mg 
% s'' = (-k/m)s' + g
%
% ===========Scalar--form============
%
% x:
%   x'' = (-k/m)x' = (-k/m)vx
% y:
%   y'' = (-k/m)y' - g = (-k/m)vy - g
%
% ===================================
%
% x' = vx 
% ->
% vx' = (-k/m)vx
% 
% y' = vy
% ->
% vy' = (-k/m)vy - g
%
% ========Our system of ODE:=========
%
% x' = vx;
% y' = vy;
% vx' = (-k/m)vx;
% vy' = (-k/m)vy - g;
%
% ===================================

k = 0.1;
m = 1;

T = 50;
dt = 0.01;
t = 0:dt:T;

v0 = 100;
distances = zeros(1, 91);
alphas = linspace(0, 90, 91);
N = size(alphas, 1);
for alpha = alphas
    [x, y] = FlightTrajectory(v0, alpha*pi/180, k, m, g, t);
    if mod(alpha, 5)==0
        subplot(2, 1, 1);
        plot(x, y);
        hold on;
        xlim([0 600]);
        ylim([0 400]);
        xlabel('x, meters');
        ylabel('y, meters');
        title('Projectile trajectories (k=0.1)');
    end
    distances(1+alpha) = x(size(x, 1));
end
subplot(2, 1, 2);
plot(alphas, distances,...
     'LineWidth',       2,...
     'HandleVisibility','off');
hold on;

max_distance = max(distances);
index = find(distances==max_distance);

plot([alphas(index) alphas(index)], [0 max_distance],'--',...
     'Color',           '[0 0 0]',...
     'LineWidth',       1,...
     'HandleVisibility','off');
plot(alphas(index),max_distance,'o',...
     'Color',          '[0.9 0.32 0]',...
     'MarkerFaceColor','[0.9 0.32 0]');
str = ['Angle of max distance:  ', num2str(alphas(index)), ' degrees'];
disp(str);
str = ['Max distance:  ', num2str(max_distance), ' meters'];
disp(str);
xlabel('alpha, degrees');
ylabel('distance, meters');
title('Dependence distance of flight on initial angle (k=0.1)');
legend('Max distance');
