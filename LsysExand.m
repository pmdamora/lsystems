function [] = LsysExpand 

nRules = length(rule);
for i=1:nReps
    
    %one character/cell, with indexes the same as original axiom string
    axiomINcells = cellstr(axiom');
    for j=1:nRules
        %the indexes of each 'before' string
        hit = strfind(axiom, rule(j).before);
        if (length(hit)>=1)
            for k=hit
                axiomINcells{k} = rule(j).after;
            end
        end
    end
    %now convert individual cells back to a string
    axiom=[];
    for j=1:length(axiomINcells)
        axiom = [axiom, axiomINcells{j}];
    end
end