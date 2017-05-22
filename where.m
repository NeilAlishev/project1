% WHERE function
function [t_matrix] = where(q)

% validate joint angles
theta2 = q(2);
if theta2 > 0 || theta2 < -pi/2
    throw(MException('where:theta2', 'theta2 must be in [-pi/2; 0]'));
end

robot = get_robot;
plot_robot(robot, 'q', q);

t_matrix = robot.fkine(q);

end