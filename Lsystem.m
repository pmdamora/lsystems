function Lsystem(rules, delta, len, axiom, nReps) 
% Lsystem: Make calls to LsysExpand and LsysDraw to perform the
% expansion and display of the lsystem
% function Lsystem(rules, delta, len, axiom, nReps)
%
% INPUTS:
% rules == a structure containing string definitions of the lsys grammar
% delta == scalar incremental angle size in Degrees
% len == base length for terminal symbols (len must be <= 1)
% (if scalar, applies to all; if vector, one element per unique terminal symbol)
% axiom == string containing starting seed
% nReps == an integer defining the number of iterations to expand
%
% OUTPUTS:
% no output variables
%
% Sample test call: Lsystem(struct('before', 'F', 'after', 'F[-F]F[+F]F'), 27.5, 1, 'F', 1)

% Original code at http://courses.cit.cornell.edu/bionb441/LSystem/index.html
% Modified by David Cohen & Paul D'Amora
% CS 302: Homework1A
% February 2, 2017
    lsys = LsysExpand(rules, axiom, nReps);
    LsysDraw(delta, lsys, len)
end