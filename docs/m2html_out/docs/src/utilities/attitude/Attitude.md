[Home](../../../../../index.md) \> [..](#) \> [src](../../../../../documentation.md) \> [utilities](#)
\> [attitude](index.md) \> Attitude.m



# Attitude

## Purpose 

``` 
```

## Overview 

``` 
**This is a script file.**
```

## Description 

```
 

```

## Cross-Reference Information 

This function calls:

   [Attitude](Attitude.md)
   [ea2rotmat](ea2rotmat.md "function [rotmat] = ea2rotmat(rot1,rot2,rot3,sequence)")
    INPUT IN DEGREES!!!
   [quat2rotmat](quat2rotmat.md "function A = quat2rotmat(q)")
   [rotmat2quat](rotmat2quat.md "function q = rotmat2quat(rotmat)")

This function is called by:

   [Attitude](Attitude.md)

## Sub-functions 

   [function \[self\] = Attitude(format,varargin)](#_sub1)
   [function \[quat\] = quat(self)](#_sub2)
   [function \[quat\] = quaternion(self)](#_sub3)

## Source Code 

```
    0001 classdef Attitude < handle
    0002     properties
    0003         rotmat
    0004     end
    0005     
    0006     %% Constructor
    0007     methods
    0008         function [self] = Attitude(format,varargin)
    0009             switch lower(format)
    0010                 case {'quaternion','quat'}
    0011                     self.rotmat = quat2rotmat(varargin{1});
    0012                 case {'rotmat'}
    0013                     self.rotmat = varargin{1};
    0014                 case {'euler'}
    0015                     sequence = varargin{1};
    0016                     assert(ischar(sequence) && length(sequence)==3,...
    0017                            'A valid euler angle sequence must be provided (example: ''321'')')
    0018                     angles = varargin{2};
    0019                     self.rotmat = ea2rotmat(angles(1),angles(2),angles(3),sequence);
    0020             end
    0021         end
    0022     end
    0023     
    0024     %% Public Methods
    0025     methods (Access = public)
    0026         function [quat] = quat(self)
    0027             quat = rotmat2quat(self.rotmat);
    0028         end
    0029         
    0030         function [quat] = quaternion(self)
    0031             quat = rotmat2quat(self.rotmat);
    0032         end
    0033     end
    0034     
    0035 end
```



Generated on Sat 27Feb2021 18:48:31 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005