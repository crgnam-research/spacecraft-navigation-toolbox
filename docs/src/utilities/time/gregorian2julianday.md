[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [time](time_index.md)  

 
 # function: gregorian2julianday



**Inputs:** gregorian

**Outputs:** jd

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
function [jd] = gregorian2julianday(gregorian)
    % First unpack the time array into its components for the sake of clarity
    year   = gregorian(1);
    month  = gregorian(2);
    day    = gregorian(3);
    hour   = gregorian(4);
    minute = gregorian(5);
    sec    = gregorian(6);

    % Now break the conversion up into different terms 
    term2 = floor(7*(year + floor((month+9)/12))/4);
    term3 = floor(275*month/9);

    % Perform the calculation
    jd = 367*year - term2 + term3 + day + 1721013.5 + hour/24 + minute/1440 + sec/86400;
end 
 ``` 
  
 ***

*Generated on 02-Mar-2021 01:01:24 by [m2md](https://github.com/crgnam-research/m2md) © 2021*