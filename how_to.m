% HOWTO function
function [q] = how_to(t_matrix)
warning('off','all');

% validate position vector
posZ = t_matrix(3, 4);
if posZ < 0
    throw(MException('how_to:posZ', 'Z coordinate in position vector must be bigger than 0'));
end

% limit of iterations.
L = 3000;

% step size
ALPHA = 0.2;

robot = get_robot;

% normalize transformation matrix to make it orthogonal.
[U, ~, V]=svd(t_matrix(1:3, 1:3));

t_corrected = U*V';
t_matrix = [t_corrected, t_matrix(1:3, end); 0 0 0 1];

q = robot.ikine(t_matrix, 'ilimit', L, 'alpha', ALPHA);

plot_robot(robot, 'q', q);

end