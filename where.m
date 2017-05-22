% WHERE function
function [t_matrix] = where(q)

robot = get_robot;
plot_robot(robot, 'q', q);

disp('FK: position and orientation of EE wrt robot basis frame:');
t_matrix = robot.fkine(q);
disp(t_matrix);

end