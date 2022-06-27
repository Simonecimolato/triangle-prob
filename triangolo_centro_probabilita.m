% Simone Cimolato, 27/06/2022

clear 
close all
clc

%% DATA

fast = true;

i = 1;
n = 10000;
count = 0;

%% COMPUTATION

while i < n    
    tri = rand([3,1]) * 2*pi;
    
    % modulo 1
    xp = cos(tri);
    yp = sin(tri);
    
    if inpolygon(0,0,xp(1:3),yp(1:3))
        count = count +1;
    end
    
    if not(fast)
        th = 0:0.01:2*pi;
        
        % modulo 1
        x = cos(th);
        y = sin(th);

        probU = count /i

        plot(x,y)
    
        hold on
        grid on
        axis equal
        
        tri = rand([3,1]) * 2*pi;
        
        tri(4) = tri(1); % solo ragioni grafiche

        % modulo 1
        xp = cos(tri);
        yp = sin(tri);

        plot(xp,yp)
        
        hold off
        pause(0.1);
    end

    i = i+1;
end

%% FINAL OUTPUT

prob = count/n