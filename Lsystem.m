% THIS CODE WAS ORIGINALLY DOWNLOADED FROM THE FOLLOWING WEB SITE
% http://courses.cit.cornell.edu/bionb441/LSystem/index.html
% Modified by David Cohen & Paul D'Amora
% CS 302: Homework1A
% February 2, 2017

function [] = Lsystem(rules, delta, len, axiom, nReps) 
    lsys = LsysExpand(rules, axiom, nReps);
    % disp(lsys)
    LsysDraw(delta, lsys, len)
end