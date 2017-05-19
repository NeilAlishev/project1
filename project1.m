L1 = Link('alpha', -pi/2, 'a', 0, 'd', 0);
L2 = Link('alpha', 0, 'a', 3, 'd', 0);
L3 = Link('alpha', 0, 'a', 3, 'd', 0);
L4 = Link('alpha', -pi/2, 'a', 0, 'd', -0.4);
L5 = Link('alpha', pi/2, 'a', 0, 'd', -0.4);
L6 = Link('alpha', pi/2, 'a', 0, 'd', -1);

robot = SerialLink([L1 L2 L3 L4 L5 L6]);

initial_q = [0 degtorad(-90) 0 degtorad(90) 0 0];
workspace_axis = [-2 2 -2 2 -0.5 10];

robot.plot(initial_q, 'workspace', workspace_axis);
robot.teach();

display('Initial FK transformation matrix:');
display(robot.fkine(initial_q));

% three attempts
for i=1:3
    new_q = input('Input the array of new joint variables: \n');
    
    display('New FK transformation matrix:');
    display(robot.fkine(new_q));
    
    robot.animate(new_q);
end