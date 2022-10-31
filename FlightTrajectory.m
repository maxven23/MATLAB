function [x, y] = FlightTrajectory(v0, angle, k, m, g, tspan)
%FLIGHTTRAJECTORY Summary of this function goes here
%   Get trajectory of flight of projectile with air resistance
    function dudt = trajODE(t, u)
        dudt = [u(3); u(4); u(3)*(-k/m); u(4)*(-k/m) - g];
    end
    vx0 = v0*cos(angle);
    vy0 = v0*sin(angle);
    [t, u] = ode45(@trajODE, tspan, [0; 0; vx0; vy0]);
    x = u(:, 1);
    y = u(:, 2);
    lim = find(y(:, 1) >= 0);
    N = -1;
    if size(lim, 1) > 0
        N = size(lim, 1);
    end
    x = x(1:N+0); 
    y = y(1:N+0);
end

