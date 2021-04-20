

This document provides information about the organization and contents
of the directories contained herein.

AAREADMEs
---------------------
The underlying folders (directories) contain a topical AAREADME providing
an overview of the contents of the folder; be sure to read it. 


BINARY KERNELS
---------------------
In almost all cases only the IEEE-Little Endian style of binary kernel
is provided. This is the binary form native to PC/Linux, PC/Windows and
MAC/Intel machines.
 
In years past NAIF staff frequently provided so-called "SPICE transfer
format" files (typically named *.xsp) along with the binary versions
(*.bsp); this facilitated access to usable SPK files for people using
IEEE-Big Endian machines, such as Sun, HP, SGI and Mac PowerPC
(Motorola chip).
 
With the advent of "run-time translation" of binary DAF-based kernels
(SPK, CK and binary PCK) offered in Toolkits starting with version N52,
released in January 2002, the need for using "transfer format" to port
SPK, CK and binary PCK kernels between dissimilar computers began to
diminish. (Only VAX customers were still stuck with using transfer
format files.)  NAIF now assumes all SPICE users are using--or should
be using-- a SPICE Toolkit of Version N52 or later, thus obviating the
user's need to obtain a native binary kernel or to produce one locally
from a transfer format kernel.
 
Be sure to download binary kernels using binary mode of FTP (this is
the normal method for most browsers, and it is usually the default
method for most ftp clients).
 
If you are having problems using a binary kernel and have checked the
"Problems Using SPK Files" portion of the SPK tutorial, contact a NAIF
staff member for help.
 

SUMMARY FILES
------------------------
The SPK directories under the /pub/naif/generic_kernels directory on
the NAIF server are each broken into two pieces. The top-level
directory for any SPK subdirectory -- for instance
/pub/naif/generic_kernels/spk/satellites -- is intended to contain only
the "latest" data for the various objects.  A sub-directory named
"a_old_versions" is intended to contain "all" older versions of SPK
files that have been superseded.
 
CAUTION: it is unlikely that NAIF will be able to keep this situation
always up to date; we simply haven't the resources to make this happen.
But we'll do our best!
 
 
In each top level and "old_versions" directory we have provided three
files that provide some summary information, as follows.

   aa_summaries.txt:

      contains SPK content and coverage information for every .bsp
      file in that directory. These are produced using the Toolkit's
      "brief" utility program, with the -t option.

   aa_spk_production_dates_by-alpha.txt:   

      provides a simple alphabetically organized directory listing of
      all the *.bsp files in the directory.

   aa_spk_production_dates_by-date.txt:   

      provides a simple time ordered directory listing of all the *.bsp
      files in the directory.

CAUTION:  the date associated with each file is the date the SPK file
was produced on the NAIF machine. This is *NOT* the same as the date
the ephemeris solution was originally produced by the author of the
source product; in some cases there are many months or even years of
difference!
 
In most cases more metadata about a given kernel are provided within
the so-called "comment area" inside the binary kernel. You can examine
this metadata using the "commnt" or "spacit" utility program found in
each SPICE Toolkit.  NAIF strongly recommends that a potential user of
a given kernel first examine these metadata before making a decision
about whether or not to use the kernel.
 



