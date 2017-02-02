function LsysDraw(delta, lsys, len)
% LsysDraw: Draw an already expanded L-system string using Turtle Graphics
% function LsysDraw(delta, lsys, len)
%
% INPUTS:
% delta == scalar incremental angle size in Degrees
% lsys == string containing Turtle Graphics instructions
% len == base length for terminal symbols (len must be <= 1)
% (if scalar, applies to all; if vector, one element per unique terminal symbol)
%
% OUTPUTS:
% no output variables
% direct output of 2D plot of string interpreted with Turtle Graphics
%
% Sample test call: LsysDraw('FF[-F[-G]+G]+F[-G]+G',27.5,1)

% Original code at http://courses.cit.cornell.edu/bionb441/LSystem/index.html
% Modified by David Cohen & Paul D'Amora
% CS 302: Homework1A
% February 2, 2017
    figure;
    % Now draw the string as turtle graphics
    % Upper case (e.g. F or G) causes a line to be drawn in the current direction of the turtle
    % Lower case causes a move with no draw
    % angle +operator means turn left; -operator means turn right

    % Init the turtle
    T.x = 0;
    T.y = 0;
    T.angle = 0;
    T.dangle = delta*pi/180; %convert degrees to radians
    if ~isstruct(len)
        len = struct('F',len,'G',len);
    end
     
    % Init the turtle stack
    stkPtr = 1;
    
    % Initliaze multiplier variables
    multiplier = 1;
    number = '';
    stack = struct();
    
    hold on
    
    % Loop through each character in the lsystem
    for i=1:length(lsys)
        cmdT = lsys(i);
        
        % Check if the string is a digit
        if isstrprop(lsys(i),'digit') 
            number = strcat(number, lsys(i));
            % If the next character is a + or a -, then set the multiplier
            % equal to the current value of the number string
            if (strcmp(lsys(i+1), '+') || strcmp(lsys(i+1), '-'))
                multiplier = str2double(number);
                number = '';
            end
            continue
        end
     
        % Change variables appropriately for each char
        switch cmdT
            case {'F','G'}
                newT.x = T.x + len.F*cos(T.angle);
                newT.y = T.y + len.F*sin(T.angle);
                line([T.y newT.y], [T.x newT.x],'color','k', 'linewidth',2);
                T.x = newT.x;
                T.y = newT.y;
            case '+'
                T.angle = T.angle + T.dangle*multiplier;
                multiplier = 1;
            case '-'
                T.angle = T.angle - T.dangle*multiplier;
                multiplier = 1;
            case '[' %push the stack
                stack(stkPtr).T.x = T.x ;
                stack(stkPtr).T.y = T.y ;
                stack(stkPtr).T.angle = T.angle ;
                stkPtr = stkPtr +1 ;
            case ']' %pop the stack
                stkPtr = stkPtr -1 ;
                T.x = stack(stkPtr).T.x ;
                T.y = stack(stkPtr).T.y ;
                T.angle = stack(stkPtr).T.angle ;
            otherwise
                disp('Error: invalid character')
                return
        end
    end

    axis equal
    figure(gcf)
end
