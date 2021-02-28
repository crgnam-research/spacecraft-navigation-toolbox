[Home](../../../../../index.md) \> [..](#) \> [src](../../../../../documentation.md) \> [utilities](#)
\> [visualization](index.md) \> drawBounds.m



# drawBounds

## Purpose 

``` 
```

## Overview 

``` 
**function \[\] = drawBounds(t,sig,num)**
```

## Description 

```
 

```

## Cross-Reference Information 

This function calls:

This function is called by:

   [drawResiduals](drawResiduals.md "function [h] = drawResiduals(dim1,dim2,tspan,x_hat,truth,sig3,varargin)")
    Validate inputs:

## Source Code 

```
    0001 function [] = drawBounds(t,sig,num)
    0002     if nargin == 2
    0003         t = t(1,:);
    0004     else
    0005         t = t(1,1:num:end);
    0006         sig = sig(1:num:end);
    0007     end
    0008     FA = 0.2;
    0009     
    0010     % Draw the 3sigma bounds above:
    0011     a = area(t,[sig; sig; sig]'); hold on
    0012     a(1).FaceColor = 'g';
    0013     a(1).FaceAlpha = FA;
    0014     a(1).EdgeColor = 'none';
    0015     a(2).FaceColor = 'y';
    0016     a(2).FaceAlpha = FA;
    0017     a(2).EdgeColor = 'none';
    0018     a(3).FaceColor = 'r';
    0019     a(3).FaceAlpha = FA;
    0020     a(3).EdgeColor = 'none';
    0021     
    0022     % Draw the 3sigma bounds below:
    0023     a = area(t,[sig; sig; sig]');
    0024     a(1).FaceColor = 'g';
    0025     a(1).FaceAlpha = FA;
    0026     a(1).EdgeColor = 'none';
    0027     a(2).FaceColor = 'y';
    0028     a(2).FaceAlpha = FA;
    0029     a(2).EdgeColor = 'none';
    0030     a(3).FaceColor = 'r';
    0031     a(3).FaceAlpha = FA;
    0032     a(3).EdgeColor = 'none';
    0033 end
```



Generated on Sat 27Feb2021 18:48:31 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005