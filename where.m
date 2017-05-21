% WHERE function
function [t_matrix] = where(q)

robot = get_robot;
workspace_axis = [-2 2 -2 2 -0.5 10];

robot.plot(q, 'workspace', workspace_axis);
robot.teach();

disp('FK: position and orientation of EE wrt robot basis frame:');
t_matrix = robot.fkine(q);
disp(t_matrix);

end