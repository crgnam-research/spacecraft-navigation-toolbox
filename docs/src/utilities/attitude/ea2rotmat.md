[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [attitude](attitude_index.md)  


# function: ea2rotmat



**Inputs:** rot1, rot2, rot3, sequence

**Outputs:** rotmat

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
 function [rotmat] = ea2rotmat(rot1,rot2,rot3,sequence)
    %@code{true}
    % INPUT IN DEGREES!!!
    
    % Parse input:
    if nargin == 3
        sequence = '321';
    end
    
    % Generate basic rotaiton matrices:
    T{1} = @(rot_x) [1       0             0;
                     0   cosd(rot_x)   sind(rot_x);
                     0  -sind(rot_x)   cosd(rot_x)];
    T{2} = @(rot_y) [cosd(rot_y)  0  -sind(rot_y);
                           0      1       0;
                     sind(rot_y)  0   cosd(rot_y)];
    T{3} = @(rot_z) [ cosd(rot_z)   sind(rot_z)  0;
                     -sind(rot_z)   cosd(rot_z)  0;
                              0           0      1];

    % Calculate overall rotation matrix:
    rotmat = T{str2double(sequence(3))}(rot3)*...
             T{str2double(sequence(2))}(rot2)*...
             T{str2double(sequence(1))}(rot1);
end 
``` 
 
***

*Generated on 04-Mar-2021 00:02:13 by [m2docs](https://github.com/crgnam-research/m2docs) © 2021*
