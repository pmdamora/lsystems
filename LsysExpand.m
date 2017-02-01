function [lsys] = LsysExpand(rule, axiom, nReps)
    lsys = axiom;
    nRules = length(rule);
  
    for i=1:nReps
        % One character/cell, with indexes the same as original lsys string
        lsysINcells = cellstr(lsys');
        for j=1:nRules
            % The indexes of each 'before' string
            hit = strfind(lsys, rule(j).before);
            if (length(hit)>=1)
                for k=hit
                    lsysINcells{k} = rule(j).after;
                end
            end
        end
        % Now convert individual cells back to a string
        lsys=[];
        for j=1:length(lsysINcells)
            lsys = [lsys, lsysINcells{j}];
        end
    end
end

