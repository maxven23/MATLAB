function [ ] = TriangleSerpent(iters, point1, point2, point3)
%SERPENT TRIANGLE Summary of this function goes here
%   Plot Serpent Triangle with set amount of iterations
    
    for k=1:iters
        
        plot([point1(1), point2(1), point3(1), point1(1)], ... 
             [point1(2), point2(2), point3(2), point1(2)], 'r');
        hold on;
        
        point12 = [(point1(1)+point2(1)) / 2 (point1(2)+point2(2))/2];
        point13 = [(point1(1)+point3(1)) / 2 (point1(2)+point3(2))/2];
        point23 = [(point2(1)+point3(1)) / 2 (point2(2)+point3(2))/2];
        
        TriangleSerpent(iters - k, point1, point12, point13)
        TriangleSerpent(iters - k, point2, point12, point23)
        TriangleSerpent(iters - k, point3, point13, point23)
    end

end

