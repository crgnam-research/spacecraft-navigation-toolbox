KPL/FK
 
   FILE: dss_23_placeholder_itrf93_201017.tf
 
   This file was created by PINPOINT.
 
   PINPOINT Version 3.2.0 --- September 6, 2016
   PINPOINT RUN DATE/TIME:    2020-10-17T10:13:10
   PINPOINT DEFINITIONS FILE: dss_23_placeholder_itrf93_201017.cmt
   PINPOINT PCK FILE:         pck00010.tpc
   PINPOINT SPK FILE:         dss_23_placeholder_itrf93_201017.bsp
 
   The input definitions file is appended to this
   file as a comment block.
 
 
   Body-name mapping follows:
 
\begindata
 
   NAIF_BODY_NAME                      += 'DSS-23'
   NAIF_BODY_CODE                      += 399023
 
\begintext
 
 
   Reference frame specifications follow:
 
 
   Topocentric frame DSS-23_TOPO
 
      The Z axis of this frame points toward the zenith.
      The X axis of this frame points North.
 
      Topocentric frame DSS-23_TOPO is centered at the
      site DSS-23, which at the epoch
 
          2020 OCT 16 00:00:00.000 TDB
 
      has Cartesian coordinates
 
         X (km):                 -0.2354701211153E+04
         Y (km):                 -0.4646970054123E+04
         Z (km):                  0.3669212578480E+04
 
      and planetodetic coordinates
 
         Longitude (deg):      -116.8721322222273
         Latitude  (deg):        35.3395541666691
         Altitude   (km):         0.9534999998479E+00
 
      These planetodetic coordinates are expressed relative to
      a reference spheroid having the dimensions
 
         Equatorial radius (km):  6.3781366000000E+03
         Polar radius      (km):  6.3567519000000E+03
 
      All of the above coordinates are relative to the frame ITRF93.
 
 
\begindata
 
   FRAME_DSS-23_TOPO                   =  1399023
   FRAME_1399023_NAME                  =  'DSS-23_TOPO'
   FRAME_1399023_CLASS                 =  4
   FRAME_1399023_CLASS_ID              =  1399023
   FRAME_1399023_CENTER                =  399023
 
   OBJECT_399023_FRAME                 =  'DSS-23_TOPO'
 
   TKFRAME_1399023_RELATIVE            =  'ITRF93'
   TKFRAME_1399023_SPEC                =  'ANGLES'
   TKFRAME_1399023_UNITS               =  'DEGREES'
   TKFRAME_1399023_AXES                =  ( 3, 2, 3 )
   TKFRAME_1399023_ANGLES              =  ( -243.1278677777727,
                                             -54.6604458333309,
                                             180.0000000000000 )
 
\begintext
 
 
Definitions file dss_23_placeholder_itrf93_201017.cmt
--------------------------------------------------------------------------------
 
 
  Placeholder SPK for DSN Station DSS 23
  =====================================================================
 
  Original file name:                   dss_23_placeholder_itrf93_201017.bsp
  Creation date:                        2020-10-17 10:15
  Created by:                           Nat Bachman  (NAIF/JPL)
 
  Introduction
  =====================================================================
 
  This file provides low accuracy, estimated geocentric states---position
  and velocity---as a slowly varying function of time for the DSN station
  DSS 23. Station DSS 23 is under construction as of the creation date
  of this kernel. Coordinates used to create this file may be in error by 3m
  or more. Inputs from Google Earth [sic] were used in combination with
  other data to derive an estimate of station height.
 
  Station position vectors point from the earth's barycenter
  to the station; the vectors are expressed in the ITRF93 terrestrial
  reference frame. Station velocities are estimates of the
  derivative with respect to time of these vectors; in this file,
  velocity is constant. The station velocity has magnitude on the
  order of a few cm/year.
 
  States obtained from this file are given relative to the terrestrial
  reference frame ITRF93.
 
  Using this kernel
  =====================================================================
 
  Kernel loading
  --------------
 
  In order for a SPICE-based program to make use of this kernel, the
  kernel must be loaded via the SPICE routine FURNSH.  If you are
  running application software created by a third party, see the
  documentation for that software for instructions on kernel
  management.
 
  This kernel must be loaded *after* the kernels
 
     earthstns_itrf93_050714.bsp
     earthstns_fx_050714.bsp
 
  if it is used together with those kernels.
 
  See also "Associated frame kernels" and "Associated PCK files"
  below.
 
  Associated PCK files
  --------------------
 
  This kernel should be used together with a binary Earth PCK file.
 
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
 
     NAIF also provides a low-accuracy, long-term predict binary Earth
     PCK file. See the path cited above for this file and accompanying
     documentation.
 
  Associated frame kernels
  ------------------------
 
  The frame kernel having (original) file name
 
     dss_23_placeholder_itrf93_201017.tf
 
  defines a topocentric reference frame associated with the station
  covered by this file. That kernel supports computations such
  as finding the azimuth and elevation of a target as seen from a
  specified station.
 
  The frame kernel
 
     earth_topo_050714.tf
 
  cannot be loaded concurrently with dss_23_placeholder_itrf93_201017.tf.
 
 
  Data sources
  =====================================================================
 
  The data provided here are taken from the following sources:
 
     Station geodetic longitude and latitude and elevation axis height:
     email communication from Stephen Slobin (JPL). Values were:
 
         longitude:  116 deg  52'  19.676" W
         latitude:    35 deg  20'  22.395" N
 
     Station height relative to reference ellipsoid: derived from Google
     Earth data, in combination with data for DSS-24: the difference
     between heights at DSS-23 and DSS-24 was added to the calibrated
     height of DSS-24. (Use of Google Earth was suggested by Stephen Slobin.)
 
     Radii of the reference ellipsoid were taken from the NAIF PCK file
     pck00010.tpc; the source of these radii was [1]. These radii agree with
     those of the WGS84 reference ellipsoid at the sub-meter level. Values
     for the X, Y, Z semi-axis lengths are:
 
        6378.1366   6378.1366   6356.7519 (km)
 
 
     [1]   Archinal, B.A., A'Hearn, M.F., Bowell, E., Conrad, A.,
                 Consolmagno, G.J., Courtin, R., Fukushima, T.,
                 Hestroffer, D., Hilton, J.L., Krasinsky, G.A.,
                 Neumann, G., Oberst, J., Seidelmann, P.K., Stooke, P.,
                 Tholen, D.J., Thomas, P.C., and Williams, I.P.
                 "Report of the IAU Working Group on Cartographic Coordinates
                 and Rotational Elements: 2009."
 
 
begindata
 
   SITES                +=      'DSS-23'
   DSS-23_FRAME         =       'ITRF93'
   DSS-23_CENTER        =       399
   DSS-23_IDCODE        =       399023
 
begintext
 
   The epoch below is based on the assumption that coordinate data reflect
   recent measurements. This epoch likely will be updated when calibrated
   data are available.
 
begindata
 
   DSS-23_EPOCH         =       @2020-OCT-16/00:00
   DSS-23_BOUNDS        =    (  @1950-JAN-01/00:00,  @2050-JAN-01/00:00  )
   DSS-23_XYZ           =    (  -2354.701211153
                                -4646.970054123
                                 3669.212578480  )
 
begintext
 
   By convention the topocentric frame epoch is set to a recent date.
   Compared to use of the epoch of the location, when the two differ, this
   provides more accurate topocentric frame orientation for computations
   performed for epochs near the present date, since the topocentric
   frame orientation relative to the ITRF93 frame is implemented as a fixed
   offset (TK) frame.
 
begindata
 
   DSS-23_TOPO_EPOCH    =       @2020-OCT-16/00:00
   DSS-23_UP            =       'Z'
   DSS-23_NORTH         =       'X'
   DSS-23_DXYZ          =    (     -0.0180
                                    0.0065
                                   -0.0038  )
begintext
 
begintext
 
[End of definitions file]
 
