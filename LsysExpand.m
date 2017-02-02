function [lsys] = LsysExpand(rules, axiom, nReps)
% LsysExpand: Expand an L-system from an axiom using given set of rules
% function [lsys] = LsysExpand(rules, axiom, nReps)
%
% INPUTS:
% rules == a structure containing string definitions of the lsys grammar
% axiom == string containing starting seed
% nReps == an integer defining the number of iterations to expand
%
% OUTPUTS:
% lsys == the expanded string
%
% Sample test call: LsysExpand(struct('before', 'F', 'after', 'F[-F]F[+F]F') , 'F' ,1)

% Original code at http://courses.cit.cornell.edu/bionb441/LSystem/index.html
% Modified by David Cohen & Paul D'Amora
% CS 302: Homework1A
% February 2, 2017
    lsys = axiom;
    cellRules = struct2cell(rules');
    for i=1:nReps
        % One-liner to perform a regex replacement on the entire string
        lsys = regexprep(lsys,cellRules(1,:),cellRules(2,:));
    end
end