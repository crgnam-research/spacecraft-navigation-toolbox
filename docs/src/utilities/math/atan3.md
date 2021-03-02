[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [math](math_index.md)  

 
 # function: atan3



**Inputs:** a,  b

**Outputs:** y

 ***

## Sub-Functions

*No Sub-Functions*

[*Default Method Attributs*](https://www.mathworks.com/help/matlab/matlab_oop/method-attributes.html)

 ***

## Detailed Description



 ***

## Sub-Function Descriptions

*No Sub-Functions*

 
 *** 

 # Source Code:

 ```matlab 
 % INCLUDECODE>{true}
function y = atan3 (a, b)
    % four quadrant inverse tangent

    % input

    %  a = sine of angle
    %  b = cosine of angle

    % output

    %  y = angle (radians; 0 =< c <= 2 * pi)

    % Celestial Computing with MATLAB

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    epsilon = 0.0000000001;

    pidiv2 = 0.5 * pi;

    if (abs(a) < epsilon)
       y = (1 - sign(b)) * pidiv2;
       return;
    else
       c = (2 - sign(a)) * pidiv2;
    end

    if (abs(b) < epsilon)
       y = c;
       return;
    else
       y = c + sign(a) * sign(b) * (abs(atan(a / b)) - pidiv2);
    end
end 
 ``` 
  
 ***

*Generated on 02-Mar-2021 00:52:50 by [m2md](https://github.com/crgnam-research/m2md) © 2021*