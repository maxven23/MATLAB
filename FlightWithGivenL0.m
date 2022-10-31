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
%
% We need to find such initial angle ALPHA,
% that we can hit L0 meters 
% with given accuracy epsilon
%
% ===================================

k = 0.1;
m = 1;

T = 50;
dt = 0.01;
t = 0:dt:T;

v0 = 100;
L0 = 400;

eps = 0.1;

% ===================================

distances = zeros(1, 91);
alphas = linspace(0, 90, 91);
N = size(alphas, 1);
for alpha = alphas
    [x, y] = FlightTrajectory(v0, alpha*pi/180, k, m, g, t);
    distances(1+alpha) = x(size(x, 1));
end

% Check if we can reach given L0 with current k and v0
max_distance = max(distances);
if L0 > max_distance + eps
    disp(['Can''t reach given L0, because max distance of flight with given k and v0 is ',...
        num2str(max_distance)])
    return
else
    % Check if our L0 is zero to give answer as fast as possible
    if L0==0
        disp('Distance L0=0 can be reached with angle 0 degrees or with angle 180 degrees.')
        return
    end
end

% ===================================

alpha_1 = 0;
alpha_2 = pi/2;
alpha_left = pi/4;
alpha_right = pi/4;

d_left = max_distance;
d_right = max_distance;

while abs(d_left - L0) > eps || abs(d_right - L0) > eps
    if abs(d_right - L0) > eps
        alpha = (alpha_right + alpha_2) / 2;
        
        [x, y] = FlightTrajectory(v0, alpha, k, m, g, t);
        d_right = x(size(x, 1));
        
        if d_right > L0
            alpha_right = alpha;
        else
            alpha_2     = alpha;
        end
    end
    
    if abs(d_left - L0) > eps
        alpha = (alpha_left + alpha_1) / 2;
        
        [x, y] = FlightTrajectory(v0, alpha, k, m, g, t);
        d_left = x(size(x, 1));
        
        if d_left > L0
            alpha_left = alpha;
        else
            alpha_1    = alpha;
        end
    end
   
    alphas = [alpha_left, alpha_right];
    
end

% ===================================

[x_left , y_left ] = FlightTrajectory(v0, alphas(1), k, m, g, t);
[x_right, y_right] = FlightTrajectory(v0, alphas(2), k, m, g, t);

hold on;
plot(x_left , y_left , 'b--');
plot(x_right, y_right, 'r--');
xlabel('x, meters');
ylabel('y, meters');
title('Shooting method ');

str1 = ['Alpha = ', num2str(alphas(1)*180/pi)];
str2 = ['Alpha = ', num2str(alphas(2)*180/pi)];


plot(L0, 0, 'o',...
     'Color',          '[0.9 0.32 0]',...
     'MarkerFaceColor','[0.9 0.32 0]');
    
legend(str1, str2, 'L0');
grid on;
