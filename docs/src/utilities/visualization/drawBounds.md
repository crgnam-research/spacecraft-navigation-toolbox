[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [visualization](visualization_index.md)  


# function: drawBounds



**Inputs:** t, sig, num

**Outputs:** 

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
 function [] = drawBounds(t,sig,num)
    %@code{true}
    if nargin == 2
        t = t(1,:);
    else
        t = t(1,1:num:end);
        sig = sig(1:num:end);
    end
    FA = 0.2;
    
    % Draw the 3-sigma bounds above:
    a = area(t,[sig; sig; sig]'); hold on
    a(1).FaceColor = 'g';
    a(1).FaceAlpha = FA;
    a(1).EdgeColor = 'none';
    a(2).FaceColor = 'y';
    a(2).FaceAlpha = FA;
    a(2).EdgeColor = 'none';
    a(3).FaceColor = 'r';
    a(3).FaceAlpha = FA;
    a(3).EdgeColor = 'none';
    
    % Draw the 3-sigma bounds below:
    a = area(t,-[sig; sig; sig]');
    a(1).FaceColor = 'g';
    a(1).FaceAlpha = FA;
    a(1).EdgeColor = 'none';
    a(2).FaceColor = 'y';
    a(2).FaceAlpha = FA;
    a(2).EdgeColor = 'none';
    a(3).FaceColor = 'r';
    a(3).FaceAlpha = FA;
    a(3).EdgeColor = 'none';
end 
``` 
 
***

*Generated on 05-Mar-2021 16:40:51 by [m2docs](https://github.com/crgnam-research/m2docs) © 2021*
