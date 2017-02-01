% THIS CODE WAS ORIGINALLY DOWNLOADED FROM THE FOLLOWING WEB SITE
%http://courses.cit.cornell.edu/bionb441/LSystem/index.html
%
%L-system
%2D
len.F = 1;
len.G = 1;
nReps = 5;

% FIGURE 6.5
% Rules-- Cell array {1,x} is the xth string to be replaced
%      -- {2,x}
axiom = 'F';
rules(1).before = 'F';
rules(1).after = 'F[-F]F[+F]F';
delta = 25;

Lsystem(rules, delta, len, axiom, nReps)
% 
% % FIGURE 6.9
% % Rules-- Cell array {1,x} is the xth string to be replaced
% %      -- {2,x}
% axiom = 'F18-F18-F18-F';
% rules(1).before = 'F';
% rules(1).after = 'F17-F34+F17-F';
% delta = 5;
% 
% Lsystem(rules, delta, len, axiom, nReps)