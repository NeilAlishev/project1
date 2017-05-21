function [] = ws_display()

x = [];
y = [];
z = [];
robot = get_robot;
for theta4 = 0 : pi/6 : 2*pi
    for theta5 = 0 : pi/6 : 2*pi
        t = robot.fkine([0 -pi/2 0 theta4 theta5 0]);
        pos = t(:,4)
        x(end + 1) = pos(1);
        y(end + 1) = pos(2);
        z(end + 1) = pos(3);
    end
end

scatter3(x, y, z);
plot_robot(robot);

end