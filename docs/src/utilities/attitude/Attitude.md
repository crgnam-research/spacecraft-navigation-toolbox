[]{#_top}

<div>

[Home](../../../../index.html) \> [..](#) \> [src](#) \> [utilities](#)
\> [attitude](index.html) \> Attitude.m

</div>

# Attitude

## []{#_name}PURPOSE [![\^](../../../../up.png)](#_top)

::: {.box}
:::

## []{#_synopsis}SYNOPSIS [![\^](../../../../up.png)](#_top)

::: {.box}
**This is a script file.**
:::

## []{#_description}DESCRIPTION [![\^](../../../../up.png)](#_top)

::: {.fragment}
``` {.comment}
```
:::

## []{#_cross}CROSS-REFERENCE INFORMATION [![\^](../../../../up.png)](#_top)

This function calls:

-   [Attitude](Attitude.html){.code}
-   [ea2rotmat](ea2rotmat.html "function [rotmat] = ea2rotmat(rot1,rot2,rot3,sequence)"){.code}
    INPUT IN DEGREES!!!
-   [quat2rotmat](quat2rotmat.html "function A = quat2rotmat(q)"){.code}
-   [rotmat2quat](rotmat2quat.html "function q = rotmat2quat(rotmat)"){.code}

This function is called by:

-   [Attitude](Attitude.html){.code}

## []{#_subfunctions}SUBFUNCTIONS [![\^](../../../../up.png)](#_top)

-   [function \[self\] = Attitude(format,varargin)](#_sub1){.code}
-   [function \[quat\] = quat(self)](#_sub2){.code}
-   [function \[quat\] = quaternion(self)](#_sub3){.code}

## []{#_source}SOURCE CODE [![\^](../../../../up.png)](#_top)

::: {.fragment}
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
:::

------------------------------------------------------------------------

Generated on Sat 27-Feb-2021 11:12:24 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005
