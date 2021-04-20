KPL/FK
 
   FILE: dss_30_itrf93_210201.tf
 
   This file was created by PINPOINT.
 
   PINPOINT Version 3.2.0 --- September 6, 2016
   PINPOINT RUN DATE/TIME:    2021-02-01T16:08:46
   PINPOINT DEFINITIONS FILE: dss_30_itrf93_210201.cmt
   PINPOINT PCK FILE:         earthstns_itrf93_201023.tpc
   PINPOINT SPK FILE:         dss_30_itrf93_210201.bsp
 
   The input definitions file is appended to this
   file as a comment block.
 
 
   Body-name mapping follows:
 
\begindata
 
   NAIF_BODY_NAME                      += 'DSS-30'
   NAIF_BODY_CODE                      += 399030
 
\begintext
 
 
   Reference frame specifications follow:
 
 
   Topocentric frame DSS-30_TOPO
 
      The Z axis of this frame points toward the zenith.
      The X axis of this frame points North.
 
      Topocentric frame DSS-30_TOPO is centered at the
      site DSS-30, which at the epoch
 
          2021 JAN 21 00:00:00.000 TDB
 
      has Cartesian coordinates
 
         X (km):                 -0.3854373744123E+04
         Y (km):                  0.3427836338495E+04
         Z (km):                  0.3741812872551E+04
 
      and planetodetic coordinates
 
         Longitude (deg):       138.3521283430469
         Latitude  (deg):        36.1409828715320
         Altitude   (km):         0.1655994180053E+01
 
      These planetodetic coordinates are expressed relative to
      a reference spheroid having the dimensions
 
         Equatorial radius (km):  6.3781370000000E+03
         Polar radius      (km):  6.3567523142478E+03
 
      All of the above coordinates are relative to the frame ITRF93.
 
 
\begindata
 
   FRAME_DSS-30_TOPO                   =  1399030
   FRAME_1399030_NAME                  =  'DSS-30_TOPO'
   FRAME_1399030_CLASS                 =  4
   FRAME_1399030_CLASS_ID              =  1399030
   FRAME_1399030_CENTER                =  399030
 
   OBJECT_399030_FRAME                 =  'DSS-30_TOPO'
 
   TKFRAME_1399030_RELATIVE            =  'ITRF93'
   TKFRAME_1399030_SPEC                =  'ANGLES'
   TKFRAME_1399030_UNITS               =  'DEGREES'
   TKFRAME_1399030_AXES                =  ( 3, 2, 3 )
   TKFRAME_1399030_ANGLES              =  ( -138.3521283430469,
                                             -53.8590171284680,
                                             180.0000000000000 )
 
\begintext
 
 
Definitions file dss_30_itrf93_210201.cmt
--------------------------------------------------------------------------------
 
 
  SPK for DSS-30
  =====================================================================
 
  Original file name:                   dss_30_itrf93_210201.bsp
  Creation date:                        2021-02-02 16:10
  Created by:                           Nat Bachman  (NAIF/JPL)
 
  Introduction
  =====================================================================
 
  This file provides geocentric states---position and velocity---as a
  slowly varying function of time for DSS-30, which is the JAXA 54m
  "Misasa" station located at Usuda, Japan. Note that this station is
  not located near the city of Misasa, Japan.
 
  Station position vectors point from the earth's barycenter to the
  station; the vectors are expressed in the ITRF93 terrestrial
  reference frame. Station velocities are estimates of the derivative
  with respect to time of these vectors; in this file, velocity is
  constant. The station velocity has magnitude on the order of a few
  cm/year.
 
  States obtained from this file are given relative to the terrestrial
  reference frame ITRF93.
 
  Using this kernel
  =====================================================================
 
  Kernel loading
  --------------
 
  In order for a SPICE-based program to make use of this kernel, the
  kernel must be loaded via the SPICE routine FURNSH. If you are
  running application software created by a third party, see the
  documentation for that software for instructions on kernel
  management.
 
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
     is the epoch of the last datum in the EOP file: data from
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
 
     dss_30_itrf93_210201.tf
 
  defines a topocentric reference frame associated with the station
  covered by this file. That kernel supports computations such
  as finding the azimuth and elevation of a target as seen from a
  specified station.
 
 
  Data sources
  =====================================================================
 
  The data provided here are taken from
 
     [1] Email communication Connie Dang, containing Excel spreadsheet
         from Bill Folkner, dated 2021-01-14.
 
  Coordinates were converted by Bill Folkner to the "JPL ITRF93" frame at
  epoch 2015 Jan. 1.
 
 begindata
 
   SITES                +=      'DSS-30'
   DSS-30_FRAME         =       'ITRF93'
   DSS-30_CENTER        =       399
   DSS-30_IDCODE        =       399030
   DSS-30_EPOCH         =       @2015-JAN-01/00:00
   DSS-30_BOUNDS        =    (  @1950-JAN-01/00:00,  @2050-JAN-01/00:00  )
   DSS-30_XYZ           =    (  -3854.373623
                                     3427.836393
                                     3741.812921 )
 begintext
 
    By convention the topocentric frame epoch is set to a recent date.
    Compared to use of the epoch of the location, when the two differ, this
    provides more accurate topocentric frame orientation for computations
    performed for epochs near the present date, since the topocentric
    frame orientation relative to the ITRF93 frame is implemented as a fixed
    offset (TK) frame.
 
 begindata
 
   DSS-30_TOPO_EPOCH    =       @2021-JAN-21/00:00
   DSS-30_UP            =       'Z'
   DSS-30_NORTH         =       'X'
   DSS-30_DXYZ          =    (   -0.02
                                 -0.009
                                 -0.008 )
 begintext
 
begintext
 
[End of definitions file]
 
