[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [math](math_index.md)  

 
 # function: cpm



**Inputs:** invec

**Outputs:** outmat

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
function outmat = cpm(invec)
    % Function cpm computes the standard cross-product matrix for a given
    % 3-vector.

    i1 = invec(1);
    i2 = invec(2);
    i3 = invec(3);

    outmat = [0, -i3, i2;
              i3, 0, -i1;
              -i2, i1, 0];
end 
 ``` 
  
 ***

*Generated on 02-Mar-2021 01:01:24 by [m2md](https://github.com/crgnam-research/m2md) © 2021*