L1 = Revolute('alpha', -pi/2);
L2 = Revolute('a', 2.5);
L3 = Revolute('a', 2.5);
L4 = Revolute('alpha', -pi/2, 'd', -0.4);
L5 = Revolute('alpha', pi/2, 'd', -0.4);
L6 = Revolute('alpha', pi/2, 'd', -1);

robot = SerialLink([L1 L2 L3 L4 L5 L6]);

initial_q = [0 -pi/2 0 pi/2 0 0];
workspace_axis = [-2 2 -2 2 -0.5 10];

robot.plot(initial_q, 'workspace', workspace_axis);
robot.teach();

disp('Initial FK transformation matrix:');
disp(robot.fkine(initial_q));

% three attempts
for i=1:3
    new_q = input('Input the array of new joint variables: \n');
    
    disp('New FK transformation matrix:');
    disp(robot.fkine(new_q));
    
    robot.animate(new_q);
end