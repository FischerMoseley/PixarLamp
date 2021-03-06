function [tout zout uout indices] = hybrid_simulation_sol(z0,ctrl,p,tspan, k_ground, d_ground)

    t0 = tspan(1); tend = tspan(end);   % set initial and final times
    dt = 0.001;
    num_step = floor((tend-t0)/dt);
    tout = linspace(t0, tend, num_step);
    zout(:,1) = z0;
    uout = zeros(1,1);
    iphase_list = 1;
    for i = 1:num_step-1
        t = tout(i);
        
        iphase = iphase_list(i);
        [dz, u] = dynamics_continuous(t,zout(:,i),ctrl,p,iphase);
        zout(:,i+1) = zout(:,i) + dz*dt;
        zout(3:4,i+1) = discrete_impact_contact(zout(:,i+1), p, k_ground, d_ground);
        zout(1:2,i+1) = zout(1:2,i) + zout(3:4, i+1)*dt;
        uout(:,i+1) = u; 
        
        if(zout(1, i+1) > 0 && iphase == 1) % jump
            iphase = 2;
        elseif(zout(1,i+1) < 0 && iphase == 2) % max height
            iphase = 3;
        end
        iphase_list(i+1) = iphase;
    end
    
    j=1;
    indices = 0;
    for i = 1:num_step-1
        if (iphase_list(i+1) == iphase_list(i))
            indices(j) = indices(j)+1;
        else
            j = j+1;
            indices(j) = 0;
        end
    end
end

%% Discrete Contact
function qdot = discrete_impact_contact(z,p, k_ground, d_ground)
    qdot = z(3:4);
    rE = z(1); 
    vE = z(3); 

    if(rE<0 && vE < 0)
      J  = [1, 0];
      M = A_jumping_leg(z,p);
      Ainv = inv(M);
      
      lambda_z = 1/(J * Ainv * J.');
      F_z = lambda_z*(-d_ground*vE - k_ground*rE);
      qdot = qdot + Ainv*J.'*F_z;
    end
end

%% Continuous dynamics
function [dz, u] = dynamics_continuous(t,z,ctrl,p,iphase)

    u = control_laws(t,z,ctrl,iphase);  % get controls at this instant

    A = A_jumping_leg(z,p);                 % get full A matrix
    b = b_jumping_leg(z,u,0,p);               % get full b vector
    
    x = A\b;                % solve system for accelerations (and possibly forces)
    dz(1:2,1) = z(3:4); % assign velocities to time derivative of state vector
    dz(3:4,1) = x(1:2);   % assign accelerations to time derivative of state vector

end

%% Control
function u = control_laws(t,z,ctrl,iphase)

    if iphase == 1
        u = BezierCurve(ctrl.T, t/ctrl.tf);
    else
        th = z(2,:);            % leg angle
        dth = z(4,:);           % leg angular velocity

        thd = pi/4;             % desired leg angle
        k = 5;                  % stiffness (N/rad)
        b = .5;                 % damping (N/(rad/s))

        u = -k*(th-thd) - b*dth;% apply PD control
    end

end
