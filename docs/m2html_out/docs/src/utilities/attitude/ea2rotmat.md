[Home](../../../../../index.html) \> [..](#) \> [src](#) \> [utilities](#)
\> [attitude](index.md) \> ea2rotmat.m



# ea2rotmat

## Purpose 

``` 
**INPUT IN DEGREES!!!**
```

## Overview 

``` 
**function \[rotmat\] = ea2rotmat(rot1,rot2,rot3,sequence)**
```

## Description 

```
 
 INPUT IN DEGREES!!!

```

## []{#_cross}CROSSREFERENCE INFORMATION 

This function calls:

This function is called by:

   [Attitude](Attitude.md)

## Source Code 

```
    0001 function [rotmat] = ea2rotmat(rot1,rot2,rot3,sequence)
    0002     % INPUT IN DEGREES!!!
    0003     
    0004     % Parse input:
    0005     if nargin == 3
    0006         sequence = '321';
    0007     end
    0008     
    0009     % Generate basic rotaiton matrices:
    0010     T{1} = @(rot_x) [1       0             0;
    0011                      0   cosd(rot_x)   sind(rot_x);
    0012                      0  sind(rot_x)   cosd(rot_x)];
    0013     T{2} = @(rot_y) [cosd(rot_y)  0  sind(rot_y);
    0014                            0      1       0;
    0015                      sind(rot_y)  0   cosd(rot_y)];
    0016     T{3} = @(rot_z) [ cosd(rot_z)   sind(rot_z)  0;
    0017                      sind(rot_z)   cosd(rot_z)  0;
    0018                               0           0      1];
    0019 
    0020     % Calculate overall rotation matrix:
    0021     rotmat = T{str2double(sequence(3))}(rot3)*...
    0022              T{str2double(sequence(2))}(rot2)*...
    0023              T{str2double(sequence(1))}(rot1);
    0024 end
```



Generated on Sat 27Feb2021 18:37:41 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005