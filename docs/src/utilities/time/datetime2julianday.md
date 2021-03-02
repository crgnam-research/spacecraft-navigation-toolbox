[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [time](time_index.md)  

 
 # function: datetime2julianday



**Inputs:** matlab_datetime

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
function [jd] = datetime2julianday(matlab_datetime)
    % Assumes that the matlab datetime is on UTC time
    gregorian = [year(matlab_datetime),...
                 month(matlab_datetime),...
                 day(matlab_datetime),...
                 hour(matlab_datetime),...
                 minute(matlab_datetime),...
                 second(datetime)];
    jd = gregorian2julianday(gregorian);
end 
 ``` 
  
 ***

*Generated on 02-Mar-2021 01:01:24 by [m2md](https://github.com/crgnam-research/m2md) © 2021*