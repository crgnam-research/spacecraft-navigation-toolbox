[Home](../../../../../index.html) \> [..](#) \> [src](#) \> [utilities](#)
\> [misc](index.md) \> coeffs2vec.m



# coeffs2vec

## Purpose 

``` 
**Ignore first two rows of Cnm, and Snm. Also, ignore first column of**
```

## Overview 

``` 
**function \[Cnm_vec, Snm_vec\] = coeffs2vec(Cnm,Snm)**
```

## Description 

```
 
 Ignore first two rows of Cnm, and Snm.  Also, ignore first column of
 Snm.  Finally, only consider lower triangular form of both (with
 above restrictions)

```

## []{#_cross}CROSSREFERENCE INFORMATION 

This function calls:

This function is called by:

## Source Code 

```
    0001 function [Cnm_vec, Snm_vec] = coeffs2vec(Cnm,Snm)
    0002     % Ignore first two rows of Cnm, and Snm.  Also, ignore first column of
    0003     % Snm.  Finally, only consider lower triangular form of both (with
    0004     % above restrictions)
    0005     N = size(Cnm,1);
    0006     Cnm_vec = zeros((1+N)*N/2  3,1);
    0007     Snm_vec = zeros((1+N)*N/2  N 1,1);
    0008     kk = 1;
    0009     for ii = 3:N
    0010        for jj = 1:ii
    0011           Cnm_vec(kk) = Cnm(ii,jj); 
    0012           kk = kk+1;
    0013        end
    0014     end
    0015     
    0016     kk = 1;
    0017     for ii = 3:N
    0018         for jj = 2:ii
    0019             Snm_vec(kk) = Snm(ii,jj);
    0020             kk = kk+1;
    0021         end
    0022     end
    0023 end
```



Generated on Sat 27Feb2021 18:37:41 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005