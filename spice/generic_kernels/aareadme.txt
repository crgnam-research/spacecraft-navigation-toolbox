
Overview of Generic Kernels on NAIF
Last updated:  11/7/18   C. Acton

In the folders located under this one one may find all* of the so-called 
generic kernels created by NAIF--those kernels not tied to a specific mission.

*Small caveat: there are a few trial or temporary generic kernels on the 
NAIF server under other locations. You should not look for and use these without 
being directed to do so by someone from NAIF.

A summary of the generic kernels is provided below. More information about 
a given type may be provided in a "readme" file included in the folder for 
that type. Also, don't forget the tools available for examining individual kernels:

  - Text kernels contain meta-data within the kernel; just read the kernel 
    using any text display or word processing tool.

  - Binary kernels (usually) contain some meta-data within the kernel; 
    use the "commnt" utility to read such meta-data.

  - The contents and coverage of the SPK and the few binary PCK kernels 
    can be examined using the "brief" utility.

  - The contents and coverage of CK kernels can be examined using the 
    "ckbrief" utility.


DSK - Digital Shape Kernel
-----------------------------------
For a few important natural bodies, contains digital shape kernels that 
model the size/shape of the body using either:

  - a tessellated plate model, for small, irregular bodies, or
  - a digital elevation model, for large, rather spherically shaped bodies

(Note: as of August 2013 the DSK subsystem is still under development at NAIF.)



FK - Frames Kernel
-----------------------------------
Most SPICE frames kernels are made for a specific mission. But a few special, 
generic FKs exist:

  - for the earth
  - for the moon
  - for ground stations


LSK - Leapseconds Kernel
-----------------------------------
This is the home for the latest leapseconds kernel, used in almost any 
SPICE-based computation. Two versions are provided:
  - one for linux/unix/OSX platforms
  - one for Windows platforms


PCK - Planetary Constants Kernel
-----------------------------------
The most important kernel found here is the latest generic text-style 
planetary constants kernel, having name style of "pcknnnnn.tpc." This kernel 
is used in very many SPICE-based computations.

Also present are three versions each of the so-called "high precision 
earth orientation binary pck" and of the "high precision lunar orientation binary pck."

Several other miscellaneous PCKs are also present.

Read the "aareadme.txt" for more information about all of these PCKs.



SPK - Spacecraft and Planet Kernel (ephemeris kernel)
-----------------------------------
SPKs for planets, natural satellites, and a few comets and asteroids are 
found here. Also present are SPKs providing the locations of Deep Space 
Network (DSN) ground stations relative to the center of the earth. These 
DSN SPKs are typically used in conjunction with the DSN FK mentioned earlier 
when one wishes to compute assorted geometric items involving the ground stations.


STARS
-----------------------------------
Many years ago NAIF built a prototype subsystem for ingesting star catalogs, 
thus allowing stars to be objects in some kinds of SPICE-based computations. 
This folder holds the SPICE-equivalent data for three then popular star catalogs: 
Hipparcos, PPM and TYCHO2.  Read the included "readme.txt" file for more information.

Many years later (but still many years ago) NAIF undertook construction of a 
much more useful star catalog mechanism. Unfortunately we didn't finish this 
effort, and have not found the time since then to tie it off. Perhaps it will 
happen one day...

