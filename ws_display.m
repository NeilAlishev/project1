function [] = ws_display()

RATE = pi / 180;

x = [];
y = [];
z = [];
c = [];
robot = get_robot;

% plot separate joints workspaces.
for theta5 = 0 : RATE : 2*pi
    t = robot.fkine([0 -pi/2 0 pi/2 theta5 0]);
    pos = t(:,4);
    x(end + 1) = pos(1);
    y(end + 1) = pos(2);
    z(end + 1) = pos(3);
    c(end + 1) = 0.1;
end

for theta4 = 0 : RATE : 2*pi
    t = robot.fkine([0 -pi/2 0 theta4 0 0]);
    pos = t(:,4);
    x(end + 1) = pos(1);
    y(end + 1) = pos(2);
    z(end + 1) = pos(3);
    c(end + 1) = 0.3;
end

for theta3 = pi/60 : RATE : 2*pi - pi/60
    t = robot.fkine([0 -pi/2 theta3 pi/2 0 0]);
    pos = t(:,4);
    x(end + 1) = pos(1);
    y(end + 1) = pos(2);
    z(end + 1) = pos(3);
    c(end + 1) = 0.6;
end

for theta2 = -pi : RATE : 0
    t = robot.fkine([0 theta2 0 pi/2 0 0]);
    pos = t(:,4);
    x(end + 1) = pos(1);
    y(end + 1) = pos(2);
    z(end + 1) = pos(3);
    c(end + 1) = 0.8;
end

for theta1 = 0 : RATE : 2*pi
    t = robot.fkine([theta1 -pi/2 0 pi/2 0 0]);
    pos = t(:,4);
    x(end + 1) = pos(1);
    y(end + 1) = pos(2);
    z(end + 1) = pos(3);
    c(end + 1) = 1.0;
end

f = figure();
set(f,'name','Separate joint workspaces','numbertitle','off');
scatter3(x, y, z, 30, c);
plot_robot(robot, [-7 7 -7 7 -0.5 10]);

RATE = pi / 18;
x = [];
y = [];
z = [];

% plot for 4-5 joint pair
for theta4 = 0 : RATE : 2*pi
    for theta5 = 0 : RATE : 2*pi
        t = robot.fkine([0 -pi/2 0 theta4 theta5 0]);
        pos = t(:,4);
        x(end + 1) = pos(1);
        y(end + 1) = pos(2);
        z(end + 1) = pos(3);
    end
end

f = figure();
set(f,'name','4-5 joint pair workspace','numbertitle','off');
scatter3(x, y, z);
plot_robot(robot, [-7 7 -7 7 -0.5 10]);

x = [];
y = [];
z = [];

% plot for 3-4 joint pair
for theta2 = -pi : RATE : 0
    for theta3 = pi/60 : RATE : 2*pi - pi/60
        t = robot.fkine([0 theta2 theta3 pi/2 0 0]);
        pos = t(:,4);
        x(end + 1) = pos(1);
        y(end + 1) = pos(2);
        z(end + 1) = pos(3);
    end
end

f = figure();
set(f,'name','2-3 joint pair workspace','numbertitle','off');
scatter3(x, y, z);
plot_robot(robot, [-7 7 -7 7 -0.5 10]);

x = [];
y = [];
z = [];

% plot for 1-2 joint pair
for theta1 = 0 : RATE : 2*pi
    for theta2 = -pi : RATE : 0
        t = robot.fkine([theta1 theta2 0 pi/2 0 0]);
        pos = t(:,4);
        x(end + 1) = pos(1);
        y(end + 1) = pos(2);
        z(end + 1) = pos(3);
    end
end

f = figure();
set(f,'name','1-2 joint pair workspace','numbertitle','off');
scatter3(x, y, z);
plot_robot(robot, [-7 7 -7 7 -0.5 10]);


RATE = pi/4;
x = [];
y = [];
z = [];

% plot overall robot workspace
for theta1 = 0 : RATE : 2*pi
    for theta2 = -pi : RATE : 0
        for theta3 = pi/60 : RATE : 2*pi - pi/60
            for theta4 = 0 : RATE : 2*pi
                for theta5 = 0 : RATE : 2*pi
                    t = robot.fkine([theta1 theta2 theta3 theta4 theta5 0]);
                    pos = t(:,4);
                    x(end + 1) = pos(1);
                    y(end + 1) = pos(2);
                    z(end + 1) = pos(3);
                end
            end
        end
    end
end

f = figure();
set(f,'name','Overall robot workspace','numbertitle','off');
scatter3(x, y, z, 1);
plot_robot(robot, [-7 7 -7 7 -0.5 10]);

end