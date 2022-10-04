function [ ] = sinGordon( w )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

    fileName = 'sinGordon.gif';
    u = @(x, t) [sqrt(1-w^2)*cos(w*t)./(w*cosh(sqrt(1-w^2)*x))];
    
    t = 0:0.1:50;
    x = -10:0.1:10;
    
    for k=1:length(t)
        plot(x, u(x, t(k)));
        axis([-10 10 -2 2])
        frame = getframe(gca);
        img =  frame2im(frame);
        [img,cmap] = rgb2ind(img,256);
        if k == 1
            imwrite(img, cmap, fileName,'gif',...
                    'LoopCount',Inf,'DelayTime',1);
        else
            imwrite(img, cmap, fileName,'gif',...
                    'WriteMode','append','DelayTime',1);
        end
    end
    
    
    
end

