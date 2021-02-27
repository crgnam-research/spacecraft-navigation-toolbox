[]{#_top}

<div>

[Home](../../../../index.html) \> [..](#) \> [src](#) \> [utilities](#)
\> [time](index.html) \> Time.m

</div>

# Time

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

-   [Time](Time.html){.code}
-   [datetime2julianday](datetime2julianday.html "function [jd] = datetime2julianday(matlab_datetime)"){.code}
    Assumes that the matlab datetime is on UTC time
-   [gregorian2julianday](gregorian2julianday.html "function [jd] = gregorian2julianday(gregorian)"){.code}
    First unpack the time array into its components for the sake of
    clarity
-   [julianday2datetime](julianday2datetime.html "function [matlab_datetime] = julianday2datetime(jd)"){.code}
-   [julianday2gregorian](julianday2gregorian.html "function [gregorian] = julianday2gregorian(jd)"){.code}
-   [julianday2unix](julianday2unix.html "function [unix] = julianday2unix(jd)"){.code}
-   [unix2julianday](unix2julianday.html "function [jd] = unix2julianday(unix)"){.code}

This function is called by:

-   [Time](Time.html){.code}

## []{#_subfunctions}SUBFUNCTIONS [![\^](../../../../up.png)](#_top)

-   [function \[self\] = Time(time_system,start_time,dt)](#_sub1){.code}
-   [function \[\] = update(self,dt)](#_sub2){.code}
-   [function \[matlab_datetime\] = datetime(self)](#_sub3){.code}
-   [function \[u\] = unix(self)](#_sub4){.code}
-   [function \[greg\] = gregorian(self)](#_sub5){.code}

## []{#_source}SOURCE CODE [![\^](../../../../up.png)](#_top)

::: {.fragment}
    0001 classdef Time < handle
    0002     properties
    0003         % Tracked for the simulation:
    0004         dt %(sec)
    0005         
    0006         % Time tracked internally via julianday
    0007         jd
    0008     end
    0009     
    0010     %% Constructor
    0011     methods
    0012         function [self] = Time(time_system,start_time,dt)
    0013             self.dt = dt;
    0014             switch lower(time_system)
    0015                 case 'datetime'
    0016                     self.jd = datetime2julianday(start_time);
    0017                 case 'julianday'
    0018                     self.jd = start_time;
    0019                 case 'unix'
    0020                     self.jd = unix2julianday(start_time);
    0021                 case 'gregorian'
    0022                     self.jd = gregorian2julianday(start_time);
    0023                 case 'gmst'
    0024                     error('GMST NOT YET IMPLEMENTED')
    0025                 otherwise
    0026                     error(['The specified time_system must be one of the following: \n',...
    0027                            'julianday | unix | gregorian | gmst'])
    0028             end
    0029         end
    0030     end
    0031     
    0032     %% Public Methods
    0033     methods (Access = public)
    0034         function [] = update(self,dt)
    0035             % If a new timestep has been provided, save it:
    0036             if nargin == 2
    0037                 self.dt = dt;
    0038             end
    0039             
    0040             % Update the julian day:
    0041             self.jd = self.jd + self.dt/86400;
    0042             
    0043         end
    0044         
    0045         function [matlab_datetime] = datetime(self)
    0046             matlab_datetime = julianday2datetime(self.jd);
    0047         end
    0048         
    0049         function [u] = unix(self)
    0050            u = julianday2unix(self.jd); 
    0051         end
    0052         
    0053         function [greg] = gregorian(self)
    0054             greg = julianday2gregorian(self.jd);
    0055         end
    0056     end
    0057 end
:::

------------------------------------------------------------------------

Generated on Sat 27-Feb-2021 11:12:24 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005
