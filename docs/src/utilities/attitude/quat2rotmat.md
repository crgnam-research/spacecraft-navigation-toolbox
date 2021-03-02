[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [attitude](attitude_index.md)  

 
 # function: quat2rotmat



**Inputs:** q

**Outputs:** A

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
function A = quat2rotmat(q)
    A = [q(1)^2-q(2)^2-q(3)^2+q(4)^2, 2*(q(1)*q(2)+q(3)*q(4)), 2*(q(1)*q(3)-q(2)*q(4));
         2*(q(1)*q(2)-q(3)*q(4)), -q(1)^2+q(2)^2-q(3)^2+q(4)^2, 2*(q(2)*q(3)+q(1)*q(4));
         2*(q(1)*q(3)+q(2)*q(4)), 2*(q(2)*q(3)-q(1)*q(4)), -q(1)^2-q(2)^2+q(3)^2+q(4)^2];
end
 
 ``` 
  
 ***

*Generated on 02-Mar-2021 00:52:50 by [m2md](https://github.com/crgnam-research/m2md) © 2021*