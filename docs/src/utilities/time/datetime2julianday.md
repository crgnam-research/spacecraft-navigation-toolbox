[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [time](time_index.md)  


# function: datetime2julianday



**Inputs:** matlab_datetime

**Outputs:** jd

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
 function [jd] = datetime2julianday(matlab_datetime)
    %@code{true}
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

*Generated on 05-Mar-2021 16:40:51 by [m2docs](https://github.com/crgnam-research/m2docs) © 2021*
