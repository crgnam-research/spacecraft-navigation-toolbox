             Notes on the Generic Asteroid Ephemerides
                            C. Acton   8/16/2013

This folder used to contain SPK files for a few popular asteroids: Eros, Kleopatra, Ceres,
Vesta, and Pallas. But those SPKs were produced many years ago and so may now be inaccurate.
They have been moved to the a_old_versions folder.

We have left here a single SPK containing orbits for a set of 300 asteroids, the orbits for which
were produced by Jim Baer in 2010 using his own CODES software. Some of these data may also be
not very accurate. But the convenience of having data for 300 objects in a single SPK filecould 
be useful for some purposes where high accuracy is not important.  Read the *.cmt" file for
details about this collection.

For most SPICE users it is probably best to generate your own SPK for an astoeroid of interest
using JPL's on-line HORIZONS system, thus ensuring you are getting the best results possible. Two
methods are available: an interactive (manual) www interface, and a telnet command line interface.
The former is easier to use, while the later offers the possibility of using a 
programmatic interface.

Horizons WWW interface:                   http://ssd.jpl.nasa.gov/x/spk.html

Horizons telnet command line interface:   telnet  ssd.jpl.nasa.gov 6775
  An example script is available at:  ftp://ssd.jpl.nasa.gov/pub/ssd/smb_spk


            ---------------------------------------------

For more details about SPICE ephemeris files, known as SPK files, including
how to read them using SPICE Toolkit software, see the SPK tutorial 
(PDF format file name is "19_spk") available from the NAIF website here:
  
   http://naif.jpl.nasa.gov/naif/tutorials.html

