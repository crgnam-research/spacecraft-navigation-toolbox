[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [math](math_index.md)  


# function: atan3



**Inputs:** a, b

**Outputs:** y

 ***

## Sub-Functions

*No Sub-Functions*

 ***

## Detailed Description



 ***

## Sub-Function Descriptions

*No Sub-Functions*

 
 *** 

# Source Code:

 ```matlab 
 function y = atan3 (a, b)
    %@code{true}
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

*Generated on 04-Mar-2021 00:02:13 by [m2docs](https://github.com/crgnam-research/m2docs) © 2021*
