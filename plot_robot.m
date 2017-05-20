% plot robot
function [] = plot_robot(robot)

initial_q = [0 -pi/2 0 pi/2 0 0];
workspace_axis = [-2 2 -2 2 -0.5 10];
robot.plot(initial_q, 'workspace', workspace_axis);
robot.teach();

end