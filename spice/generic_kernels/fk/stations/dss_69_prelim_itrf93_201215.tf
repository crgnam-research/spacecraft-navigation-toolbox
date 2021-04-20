KPL/FK

Preliminary Frame Kernel for the SRT, DSN ID 69
=====================================================================

Original file name:                   dss_69_prelim_itrf93_201215.tf
Creation date:                        2020-12-17 13:08
Created by:                           Nat Bachman  (NAIF/JPL)

Introduction
=====================================================================

This file provides a topocentric reference frame specification for the
Sardinia Radio Telescope (SRT) operated by the Istituto Nazionale di
Astrofisica (INAF), and identified by the DSN by the numeric code 69.

A body name-ID mapping assignment for this station, which associates the
station name and ID code

   'DSS-69'
   399069

is also provided in this kernel.

The reference frame is based on a preliminary estimated geocentric state---
location and velocity---of the station, determined for the epoch 2013 Dec. 1,
and extrapolated to the epoch of the reference frame: 2020 Dec. 14.

The station position vector points from the earth's barycenter to the station.
The station velocity is an estimate of the derivative with respect to time of
this vector; in this file, velocity is constant. The station velocity has
magnitude on the order of a few cm/year.

The topocentric frame orientation specified in this file is expressed as
a rotation relative to the terrestrial reference frame ITRF93.

Using this kernel
=====================================================================

Kernel loading
--------------

In order for a SPICE-based program to make use of this kernel, the
kernel must be loaded via the SPICE routine FURNSH.  If you are
running application software created by a third party, see the
documentation for that software for instructions on kernel
management.

See also "Associated frame kernels" and "Associated PCK files"
below.

Associated PCK files
--------------------

For high-accuracy work, this kernel should be used together with a
high-precision, binary earth PCK file.

   NAIF produces these kernels on a regular basis; they can be
   obtained via anonymous ftp from the NAIF server

      naif.jpl.nasa.gov

   The PCK is located in the path

      pub/naif/generic_kernels/pck

   The file name is of the form

      earth_000101_yymmdd_yymmdd.bpc

   The first two dates are the file's start and stop times; the third
   is the epoch of the last datum in the EOP file:  data from
   this epoch forward are predicted.

   The file's coverage starts at a fixed date (currently chosen to
   be 2000 Jan. 1) and extends to the end of the predict region,
   which has a duration of roughly 3 months.


Associated SPK files
--------------------

The SPK file having (original) file name

   dss69_prelim_itrf93_201215.bsp

provides station position and velocity data, specified relative to the
ITRF93 terrestrial reference frame.


Epoch
-----

The epoch of the topocentric reference frame specified by this kernel is

    2020 December 14 TDB

The position of the station at that epoch was used to define the center and
axis directions of the frame.

Note that this epoch is not that of the original state data, which is
2013 December 1 TDB.


Data sources
=====================================================================

Data used in this file were taken from an email message from
Dustin Buccino to Connie Dang, sent on December 6, 2020.
That message states

     The coordinates in ITRF2008 are:

      Reference Frame:  ITRF08
      Position: X = 4865183.218, Y = 791922.442, Z = 4035136.181 (m)
      Velocity: VX = -0.0147, VY = 0.0185, VZ = 0.0156 (m/y)
      Epoch: December 2013
      Reference point: Intersection between Elevation and Azimuth axes,
      at 35 m from the base of the antenna at the ground level.
      Not Invariant point

These inputs were translated to the ITRF93 frame by N. Bachman (JPL/NAIF).
Parameters used in the transformation were obtained from [1]. The
resulting station state at epoch 2013 Dec 1 were:

   4865.1830944493478
    791.92252600171813
   4035.1362126478120
        -2.1047837864086309E-002
         2.2274286620987818E-002
         1.7622377458614742E-002

 Units are km and m/year.

 [1] IERS Technical Note 36. 4 Terrestrial Reference Systems and Frames.


Data
=====================================================================

   FILE: dss_69_prelim_itrf93_201215.tf

   This file was created by PINPOINT.

   PINPOINT Version 3.2.0 --- September 6, 2016
   PINPOINT RUN DATE/TIME:    2020-12-17T13:05:47
   PINPOINT DEFINITIONS FILE: dss_69_prelim_itrf93_201215.cmt
   PINPOINT PCK FILE:         pck00010.tpc
   PINPOINT SPK FILE:         dss_69_prelim_itrf93_201215.bsp

   The input definitions file is appended to this
   file as a comment block.


   Body-name mapping follows:

\begindata

   NAIF_BODY_NAME                      += 'DSS-69'
   NAIF_BODY_CODE                      += 399069

\begintext


   Reference frame specifications follow:


   Topocentric frame DSS-69_TOPO

      The Z axis of this frame points toward the zenith.
      The X axis of this frame points North.

      Topocentric frame DSS-69_TOPO is centered at the
      site DSS-69, which at the epoch

          2020 DEC 14 00:00:00.000 TDB

      has Cartesian coordinates

         X (km):                  0.4865182946336E+04
         Y (km):                  0.7919226826996E+03
         Z (km):                  0.4035136336627E+04

      and planetodetic coordinates

         Longitude (deg):         9.2451508354804
         Latitude  (deg):        39.4930656804645
         Altitude   (km):         0.6716762703499E+00

      These planetodetic coordinates are expressed relative to
      a reference spheroid having the dimensions

         Equatorial radius (km):  6.3781366000000E+03
         Polar radius      (km):  6.3567519000000E+03

      All of the above coordinates are relative to the frame ITRF93.


\begindata

   FRAME_DSS-69_TOPO                   =  1399069
   FRAME_1399069_NAME                  =  'DSS-69_TOPO'
   FRAME_1399069_CLASS                 =  4
   FRAME_1399069_CLASS_ID              =  1399069
   FRAME_1399069_CENTER                =  399069

   OBJECT_399069_FRAME                 =  'DSS-69_TOPO'

   TKFRAME_1399069_RELATIVE            =  'ITRF93'
   TKFRAME_1399069_SPEC                =  'ANGLES'
   TKFRAME_1399069_UNITS               =  'DEGREES'
   TKFRAME_1399069_AXES                =  ( 3, 2, 3 )
   TKFRAME_1399069_ANGLES              =  (   -9.2451508354804,
                                             -50.5069343195355,
                                             180.0000000000000 )

\begintext


Definitions file dss_69_prelim_itrf93_201215.cmt
--------------------------------------------------------------------------------


  Preliminary SPK for the SRT, DSN ID 69
  =====================================================================

  Original file name:                   dss_69_prelim_itrf93_201215.bsp
  Creation date:                        2020-12-17 13:05
  Created by:                           Nat Bachman  (NAIF/JPL)

  Introduction
  =====================================================================

  This file provides a preliminary estimated geocentric ephemeris---location
  and velocity as a function of time, based on a single state vector and
  epoch---for the Sardinia Radio Telescope (SRT) operated by the Istituto
  Nazionale di Astrofisica (INAF), and identified by the DSN by the numeric
  code 69.

  The station (i.e. antenna) position vector points from the earth's
  barycenter to the station. The station velocity is an estimate of the
  derivative with respect to time of this vector; in this file, velocity is
  constant. The station velocity has magnitude on the order of a few cm/year.

  The state vector stored in this file is expressed relative to the
  terrestrial reference frame ITRF93.

  Using this kernel
  =====================================================================

  Kernel loading
  --------------

  In order for a SPICE-based program to make use of this kernel, the
  kernel must be loaded via the SPICE routine FURNSH.  If you are
  running application software created by a third party, see the
  documentation for that software for instructions on kernel
  management.

  See also "Associated frame kernels" and "Associated PCK files"
  below.

  Associated PCK files
  --------------------

  For high-accuracy work, this kernel should be used together with a
  high-precision, binary earth PCK file.

     NAIF produces these kernels on a regular basis; they can be
     obtained via anonymous ftp from the NAIF server

        naif.jpl.nasa.gov

     The PCK is located in the path

        pub/naif/generic_kernels/pck

     The file name is of the form

        earth_000101_yymmdd_yymmdd.bpc

     The first two dates are the file's start and stop times; the third
     is the epoch of the last datum in the EOP file:  data from
     this epoch forward are predicted.

     The file's coverage starts at a fixed date (currently chosen to
     be 2000 Jan. 1) and extends to the end of the predict region,
     which has a duration of roughly 3 months.


  Associated frame kernels
  ------------------------

  The frame kernel having (original) file name

     dss_69_prelim_itrf93_201215.tf

  defines a topocentric reference frame associated with the station
  covered by this file. That kernel supports computations such
  as finding the azimuth and elevation of a target as seen from a
  specified station.


  Data sources
  =====================================================================

  Data used in this file were taken from an email message from
  Dustin Buccino to Connie Dang, sent on December 6, 2020.
  That message states

       The coordinates in ITRF2008 are:

         Reference Frame:  ITRF08
         Position: X = 4865183.218, Y = 791922.442, Z = 4035136.181 (m)
         Velocity: VX = -0.0147, VY = 0.0185, VZ = 0.0156 (m/y)
         Epoch: December 2013
         Reference point: Intersection between Elevation and Azimuth axes,
         at 35 m from the base of the antenna at the ground level.
         Not Invariant point

  These inputs were translated to the ITRF93 frame by N. Bachman (JPL/NAIF).
  Parameters used in the transformation were obtained from [1]. The
  resulting station state at epoch 2013 Dec 1 were:

     4865.1830944493478
      791.92252600171813
     4035.1362126478120
          -2.1047837864086309E-002
           2.2274286620987818E-002
           1.7622377458614742E-002

   Units are km and m/year.

   [1] IERS Technical Note 36. 4 Terrestrial Reference Systems and Frames.

begindata

   SITES                +=      'DSS-69'
   DSS-69_FRAME         =       'ITRF93'
   DSS-69_CENTER        =       399
   DSS-69_IDCODE        =       399069
   DSS-69_EPOCH         =       @2013-DEC-01/00:00
   DSS-69_BOUNDS        =    (  @1950-JAN-01/00:00,  @2050-JAN-01/00:00  )
   DSS-69_XYZ           =    ( 4865.1830944493478
                                791.92252600171813
                               4035.1362126478120 )
   DSS-69_TOPO_EPOCH    =       @2020-DEC-14/00:00
   DSS-69_UP            =       'Z'
   DSS-69_NORTH         =       'X'
   DSS-69_DXYZ          =    ( -0.02105  0.02227  0.01762 )

begintext

begintext

[End of definitions file]
