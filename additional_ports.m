function [xbyb, xbyb_t] = additional_ports(N_add,theta_r,rb,rb_t,xcyc_b, xcyc_t,...
    xb,yb,xb_t,yb_t)

    
    arc_l = rb*theta_r;
    for i = 1:N_add
        theta_rn = arc_l*i/((N_add+1)*rb);
        x_top(i) = xcyc_b(1) - rb*cos(theta_rn);
        y_top(i) = xcyc_b(2) + rb*sin(theta_rn);
        x_t_top(i) = xcyc_t(1) - rb_t*cos(theta_rn);
        y_t_top(i) = xcyc_t(2) + rb_t*sin(theta_rn);

    end
    for i = 1:N_add
        theta_rn = arc_l*i/((N_add+1)*rb);
        x_bot(i) = xcyc_b(1) - rb*cos(theta_rn);
        y_bot(i) = xcyc_b(2) - rb*sin(theta_rn);
        x_t_bot(i) = xcyc_t(1) - rb_t*cos(theta_rn);
        y_t_bot(i) = xcyc_b(2) - rb_t*sin(theta_rn);
    end 

    x_bot = x_bot';
    y_bot = y_bot';
    x_top = fliplr(x_top)';
    y_top = fliplr(y_top)';
    xb = [xb(1); x_top; xb(2); x_bot; xb(3)];
    yb = [yb(1); y_top; yb(2); y_bot; yb(3)];
    xbyb = [xb yb];

    x_t_bot = x_t_bot';
    y_t_bot = y_t_bot';
    x_t_top = fliplr(x_t_top)';
    y_t_top = fliplr(y_t_top)';
    xb_t = [xb_t(1); x_t_top; xb_t(2); x_t_bot; xb_t(3)];
    yb_t = [yb_t(1); y_t_top; yb_t(2); y_t_bot; yb_t(3)];
    xbyb_t = [xb_t yb_t];
            
end
