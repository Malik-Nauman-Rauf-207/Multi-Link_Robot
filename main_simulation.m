% Number of gait cycles
period = 10; 

% Mapping from velocity to force on each link
K = diag([1;10]); 

% Link length (unit: cm)
L = 2; 

% Body joint angle as a function of time
% alpha is a function of time: at each input 't', ]

% alpha = @(t)       [pi/2*sin(t); pi/2*sin(t+pi/2)];
alpha = @(t)[ pi/2 * cos(t); -pi/2 * sin(t) ];

% Body joint anglular velocity as a function of time

% d_alpha = @(t)     [pi/2*cos(t); pi/2*cos(t+pi/2)];
d_alpha = @(t)     (alpha(t+0.01) - alpha(t))/0.01;

% current time
t = 0; 

% Time incremental
dt = 2*pi/100;

% Starting robot position
g_h = eye(3);

% Generate code to make the plot
figure()
hold on;
axis equal;
axis([-10 10 -10 10]*L);
xlabel('X (cm)','fontsize',15);
ylabel('Y (cm)','fontsize',15);

% Plot the robot at the initial position
[h] = drawActiveFrameSnake(g_h,alpha(t),L);

while t < period*2*pi

    % update time
    t = t + dt;
    
    % compute the body velocity at time t
    xi = computeBodyVelocity(alpha(t), d_alpha(t), K, L);   

    % Update the robot position
    g_h = g_h*expm(dt*xiHat(xi));
    


    % Delete the plot of robot at previous position 
    for i = 1:size(h,2)
        delete(h{i});
    end

    % Plot the robot at the current position
    [h] = drawActiveFrameSnake(g_h,alpha(t),L);

    % Get the drawings now
    drawnow;
end

displacement.xy = norm(g_h(1:2,3))/(3*L);
close(gcf)
