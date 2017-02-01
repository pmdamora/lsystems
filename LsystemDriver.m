% THIS CODE WAS ORIGINALLY DOWNLOADED FROM THE FOLLOWING WEB SITE
% http://courses.cit.cornell.edu/bionb441/LSystem/index.html
% Modified by David Cohen & Paul D'Amora
% CS 302: Homework1A
% February 2, 2017
clc;
clear;

% Define constants
len.F = 1;
len.G = 1;
nReps = 5;

% Weed-1 FIGURE 6.5
axiom = 'F';
rules(1).before = 'F';
rules(1).after = 'F[-F]F[+F]F';
delta = 25;

Lsystem(rules, delta, len, axiom, nReps)

% % Square-spikes FIGURE 6.9
axiom = 'F18-F18-F18-F';
rules(1).before = 'F';
rules(1).after = 'F17-F34+F17-F';
delta = 5;

Lsystem(rules, delta, len, axiom, nReps)

% Part 3
axiom = 'F2+G2-F2-G';
rules(1).before = 'F';
rules(1).after = '[-F2+G]';
rules(2).before = 'G';
rules(2).after = '[+F2-G]';
delta = 45;

Lsystem(rules, delta, len, axiom, nReps)