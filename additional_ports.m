function beam = additional_ports(beam)

    arc_l = beam.rb * beam.theta_r;
    for i = 1:beam.N_add
        theta_rn = arc_l*i/((beam.N_add+1)*beam.rb);
        x_top(i) = beam.xcyc_b(1) - beam.rb*cos(theta_rn);
        y_top(i) = beam.xcyc_b(2) + beam.rb*sin(theta_rn);
        x_t_top(i) = beam.xcyc_t(1) - beam.rb_t*cos(theta_rn);
        y_t_top(i) = beam.xcyc_t(2) + beam.rb_t*sin(theta_rn);

    end
    for i = 1:beam.N_add
        theta_rn = arc_l*i/((beam.N_add+1)*beam.rb);
        x_bot(i) = beam.xcyc_b(1) - beam.rb*cos(theta_rn);
        y_bot(i) = beam.xcyc_b(2) - beam.rb*sin(theta_rn);
        x_t_bot(i) = beam.xcyc_t(1) - beam.rb_t*cos(theta_rn);
        y_t_bot(i) = beam.xcyc_b(2) - beam.rb_t*sin(theta_rn);
    end 

    x_bot = x_bot';
    y_bot = y_bot';
    x_top = fliplr(x_top)';
    y_top = fliplr(y_top)';
    beam.xb = [beam.xb(1); x_top; beam.xb(2); x_bot; beam.xb(3)];
    beam.yb = [beam.yb(1); y_top; beam.yb(2); y_bot; beam.yb(3)];
    beam.xbyb = [beam.xb beam.yb];

    x_t_bot = x_t_bot';
    y_t_bot = y_t_bot';
    x_t_top = fliplr(x_t_top)';
    y_t_top = fliplr(y_t_top)';
    beam.xb_t = [beam.xb_t(1); x_t_top; beam.xb_t(2); ...
        x_t_bot; beam.xb_t(3)];
    beam.yb_t = [beam.yb_t(1); y_t_top; beam.yb_t(2); ...
        y_t_bot; beam.yb_t(3)];
    beam.xbyb_t = [beam.xb_t beam.yb_t];
            
end
