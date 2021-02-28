[Home](../../../../../index.md) \> [..](#) \> [src](#) \> [utilities](#)
\> [visualization](index.md) \> drawResiduals.m



# drawResiduals

## Purpose 

``` 
**Validate inputs:**
```

## Overview 

``` 
**function \[h\] =
drawResiduals(dim1,dim2,tspan,x_hat,truth,sig3,varargin)**
```

## Description 

```
 
 Validate inputs:

```

## []{#_cross}CROSSREFERENCE INFORMATION 

This function calls:

   [drawBounds](drawBounds.md "function [] = drawBounds(t,sig,num)")

This function is called by:

## Source Code 

```
    0001 function [h] = drawResiduals(dim1,dim2,tspan,x_hat,truth,sig3,varargin)
    0002     % Validate inputs:
    0003     assert(size(x_hat,2) == size(tspan,2),'The length of tspan must be equal to length of x_hat')
    0004     assert(all(size(x_hat) == size(truth)),'The inputs x_hat and truth must be the same size')
    0005     assert(all(size(x_hat) == size(sig3)),'The inputs x_hat and sig3 must be the same size')
    0006     assert(size(x_hat,1) <= dim1*dim2,'Not enough subplots defined for number of states given')
    0007     
    0008     % Generate the plots:
    0009     h = cell(dim1*dim2,1);
    0010     for ii = 1:(dim1*dim2)
    0011         h{ii} = subplot(dim1,dim2,ii);
    0012                     plot(tspan,x_hat(ii,:)  truth(ii,:),varargin{:}); hold on
    0013                     drawBounds(tspan,sig3(ii,:)/3)
    0014                     xlim([0 inf]); grid on
    0015     end
    0016 end
```



Generated on Sat 27Feb2021 18:22:26 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005