% plot robot
function [] = plot_robot(robot, varargin)

initial_q = [0 -pi/2 0 pi/2 0 0];

if ~isempty(varargin)
    workspace_axis = varargin{1};
else
    % default value for workspace axis.
    workspace_axis = [-2 2 -2 2 -0.5 10];
end

robot.plot(initial_q, 'workspace', workspace_axis);
robot.teach();

end