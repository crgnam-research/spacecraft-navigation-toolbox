[Home](../../../../../index.html) \> [..](#) \> [src](#) \> [utilities](#)
\> [misc](index.md) \> vec2coeffs.m



# vec2coeffs

## Purpose 

``` 
**Calculate size of the Cnm coefficient matrix:**
```

## Overview 

``` 
**function \[Cnm,Snm\] = vec2coeffs(Cnm_Snm_vec)**
```

## Description 

```
 
 Calculate size of the Cnm coefficient matrix:

```

## []{#_cross}CROSSREFERENCE INFORMATION 

This function calls:

This function is called by:

## Sub-functions 

   [function \[val\] = eval(n)](#_sub1)

## Source Code 

```
    0001 function [Cnm,Snm] = vec2coeffs(Cnm_Snm_vec)
    0002     % Calculate size of the Cnm coefficient matrix:
    0003     L = size(Cnm_Snm_vec,1);
    0004     for ii = 1:2000
    0005         if L == eval(ii)
    0006             N = ii+1;
    0007             break
    0008         end
    0009     end
    0010     Cnm = zeros(N);
    0011     Snm = zeros(N);
    0012     
    0013     % Split appropriately:
    0014     num_Snm = (LN)/2 + 1;
    0015     num_Cnm = L  num_Snm;
    0016     Cnm_vec = Cnm_Snm_vec(1:num_Cnm);
    0017     Snm_vec = Cnm_Snm_vec(num_Cnm+1:end);
    0018 
    0019     % Scale factor to try to maintain numerical stability:
    0020     kk = 1;
    0021     for ii = 3:N
    0022        for jj = 1:ii
    0023           Cnm(ii,jj) = Cnm_vec(kk);
    0024           kk = kk+1;
    0025        end
    0026     end
    0027     Cnm(1) = 1;
    0028     
    0029     kk = 1;
    0030     for ii = 3:N
    0031         for jj = 2:ii
    0032             Snm(ii,jj) = Snm_vec(kk);
    0033             kk = kk+1;
    0034         end
    0035     end
    0036 end
    0037 
    0038 % Function to get the appropriate size (guess and check is best approach
    0039 % for now):
    0040 function [val] = eval(n)
    0041     step = 5;
    0042     val = 0;
    0043     for ii = 1:n1
    0044         val = val+step;
    0045         step = step+2;
    0046     end
    0047 end
```



Generated on Sat 27Feb2021 18:37:41 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005