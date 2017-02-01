function [] = LsysDraw(delta, lsys, len)
    % Now draw the string as turtle graphics
    %Upper case (e.g. F or G) causes a line to be drawn in the current direction of the turtle
    %Lower case causes a move with no draw
    %angle +operator means turn left; -operator means turn right

    % Init the turtle
    T.x = 0;
    T.y = 0;
    T.angle = 0;
    T.dangle = delta*pi/180; %convert degrees to radians
    
    
    % Init the turtle stack
    stkPtr = 1;
    
    % Preallocate the stack
    stack = zeros(1, 100);
    
    % Initliaze multiplier variables
    multiplier = 1;
    number = '';
    
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
     
        switch cmdT
        case 'F'
            newxT = T.x + len.F*cos(T.angle);
            newyT = T.y + len.F*sin(T.angle);
            line([T.y newyT], [T.x newxT],'color',[.3 .3 0], 'linewidth',2);
            T.x = newxT;
            T.y = newyT;
        case 'G'
            newxT = T.x + len.G*cos(T.angle);
            newyT = T.y + len.G*sin(T.angle);
            line([T.y newyT], [T.x newxT],'color','g', 'linewidth',2);
            T.x = newxT;
            T.y = newyT;
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
            disp('error')
            return
        end
    end

    axis equal
    figure(gcf)
end
