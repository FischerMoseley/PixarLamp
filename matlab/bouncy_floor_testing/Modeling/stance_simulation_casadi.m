function [t,q] = stance_simulation_casadi(q0,ctrl,params,timesteps)
    % Declare casadi symbolic variables
    t = casadi.MX(zeros(1,timesteps));
    q = casadi.MX(zeros(4,timesteps));
    u = ctrl.u;

    m1 = params.m1;
    m2 = params.m2;
    k  = params.k;
    d  = params.d;
    g  = params.g;
    xd = params.xd;
    
    % Discretize time
    dt = ctrl.tf/(timesteps-1);
    for i = 2:timesteps
        t(i) = t(i-1) + dt;
    end
    
    % Set initial state
    q(:,1) = q0;

    % Simulate
    for step = 2:timesteps
        x1 = q(1, step-1);
        x2 = q(2, step-1);
        dx1 = q(3, step-1);
        dx2 = q(4, step-1);
        
        q(3,step) = q(3, step-1) + ((-m1*g-k*(x1-x2-xd) - d*(dx1-dx2) - u(step-1))/m1) * dt;
        q(4,step) = q(4, step-1) + ((-m2*g+k*(x1-x2-xd) + d*(dx1-dx2) + u(step-1))/m2) * dt;

        q(1,step) = q(1, step-1) + q(3, step) * dt;
        q(2,step) = q(2, step-1) + q(4, step) * dt;
    end 
end