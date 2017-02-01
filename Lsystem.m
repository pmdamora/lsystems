function [] = Lsystem(rule, delta, len, axiom, nReps) 
    lsys = LsysExpand(rule, axiom, nReps);
    disp(lsys)
    LsysDraw(delta, lsys, len)
end







