function plotbeamcountour(rb,xcyc_b,xbyb)
    hold on
    scatter(xbyb(:,1),xbyb(:,2));
    th = 0:pi/50:2*pi;
    xunit = rb * cos(th) + xcyc_b(1);
    yunit = rb * sin(th) + xcyc_b(2);
    h = plot(xunit, yunit);
    hold off
end
