% Simone Cimolato, 27/06/2022

clear 
close all
clc

%% DATA

fast = false;

n = 1e4;
count = 0;
waitTime = 0.1; % seconds

th = 0:0.01:2*pi;
        
% modulo 1
x = cos(th);
y = sin(th);

probT = zeros(1,n);

%% COMPUTATION

for i = 1:n    
    tri = rand([3,1]) * 2*pi;
    
    % length 1
    xp = cos(tri);
    yp = sin(tri);
    
    if inpolygon(0,0,xp(1:3),yp(1:3))
        count = count +1;
    end

    probU = count /i;

    probT(i) = probU;
    
    if not(fast)
        probU

        plot(x,y, LineWidth = 2)
    
        hold on
        grid on
        axis equal
        
        tri = rand([3,1]) * 2*pi;
        
        tri(4) = tri(1); % merely for visual reasons

        % length 1
        xp = cos(tri);
        yp = sin(tri);

        plot(xp,yp, LineWidth = 2)
        plot(0,0,'*', LineWidth = 2)
        
        hold off
        pause(waitTime);
    end
end

%% FINAL OUTPUT

prob = count/n

% probability plot
plot(probT)
grid on
xlabel('iterations')
ylabel('probability')
