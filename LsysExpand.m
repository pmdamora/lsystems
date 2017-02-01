% THIS CODE WAS ORIGINALLY DOWNLOADED FROM THE FOLLOWING WEB SITE
% http://courses.cit.cornell.edu/bionb441/LSystem/index.html
% Modified by David Cohen & Paul D'Amora
% CS 302: Homework1A
% February 2, 2017

function [lsys] = LsysExpand(rules, axiom, nReps)
    lsys = axiom;
    cellRules = struct2cell(rules');
    for i=1:nReps
        % One-liner to perform a regex replacement on the entire string
        lsys = regexprep(lsys,cellRules(1,:),cellRules(2,:));
    end
end