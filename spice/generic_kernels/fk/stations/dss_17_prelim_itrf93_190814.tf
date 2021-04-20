KPL/FK
 
   FILE: dss_17_prelim_itrf93_190814.tf
 
   This file was created by PINPOINT.
 
   PINPOINT Version 3.2.0 --- September 6, 2016
   PINPOINT RUN DATE/TIME:    2019-08-20T09:17:40
   PINPOINT DEFINITIONS FILE: dss_17_prelim_itrf93_190814.pinpoint
   PINPOINT PCK FILE:         earth_wgs84.tpc
   PINPOINT SPK FILE:         dss_17_prelim_itrf93_190814.bsp
 
   The input definitions file is appended to this
   file as a comment block.
 
 
   Body-name mapping follows:
 
\begindata
 
   NAIF_BODY_NAME                      += 'DSS-17'
   NAIF_BODY_CODE                      += 399017
 
\begintext
 
 
   Reference frame specifications follow:
 
 
   Topocentric frame DSS-17_TOPO
 
      The Z axis of this frame points toward the zenith.
      The X axis of this frame points North.
 
      Topocentric frame DSS-17_TOPO is centered at the
      site DSS-17, which has Cartesian coordinates
 
         X (km):                  0.5735492790000E+03
         Y (km):                 -0.4986672531000E+04
         Z (km):                  0.3922409488000E+04
 
      and planetodetic coordinates
 
         Longitude (deg):       -83.4388744403158
         Latitude  (deg):        38.1918813800665
         Altitude   (km):         0.3300302097390E+00
 
      These planetodetic coordinates are expressed relative to
      a reference spheroid having the dimensions
 
         Equatorial radius (km):  6.3781370000000E+03
         Polar radius      (km):  6.3567523140000E+03
 
      All of the above coordinates are relative to the frame ITRF93.
 
 
\begindata
 
   FRAME_DSS-17_TOPO                   =  1399017
   FRAME_1399017_NAME                  =  'DSS-17_TOPO'
   FRAME_1399017_CLASS                 =  4
   FRAME_1399017_CLASS_ID              =  1399017
   FRAME_1399017_CENTER                =  399017
 
   OBJECT_399017_FRAME                 =  'DSS-17_TOPO'
 
   TKFRAME_1399017_RELATIVE            =  'ITRF93'
   TKFRAME_1399017_SPEC                =  'ANGLES'
   TKFRAME_1399017_UNITS               =  'DEGREES'
   TKFRAME_1399017_AXES                =  ( 3, 2, 3 )
   TKFRAME_1399017_ANGLES              =  ( -276.5611255596842,
                                             -51.8081186199335,
                                             180.0000000000000 )
 
\begintext
 
 
Definitions file dss_17_prelim_itrf93_190814.pinpoint
--------------------------------------------------------------------------------
 
 
 
   SPK/FK for Preliminary DSS-17 Station Location
   =====================================================================
 
   Original SPK file name:               dss_17_prelim_itrf93_190814.bsp
   Original FK file name:                dss_17_prelim_itrf93_190814.tf
   Creation date:                        20-AUG-2019
   Created by:                           Boris Semenov  (NAIF/JPL)
 
 
   Data for DSS-17 are based on an email from Dr. Stephen Slobin dated
   August 14, 2019. The position data from that email are shown below:
 
      X =   573549.279 meters
      Y = -4986672.531 meters
      Z =  3922409.488 meters
 
 
   The email did not specifically state in which reference frame these
   coordinates are given but it compared them with the previous
   coordinates (from November 2016) that were provided in the ITRF93
   reference frame, Epoch 2003.0, so these coordinates are assumed to
   be in the same frame.
 
   No velocity data were provided with the position information.
 
      begindata
 
 
      SITES              +=      'DSS-17'
      DSS-17_FRAME       =       'ITRF93'
      DSS-17_CENTER      =       399
      DSS-17_IDCODE      =       399017
      DSS-17_BOUNDS      =    (  @1950-JAN-01/00:00,  @2050-JAN-01/00:00  )
      DSS-17_XYZ         =    (
                                    573.549279
                                  -4986.672531
                                   3922.409488
                               )
 
      DSS-17_UP          =     'Z'
      DSS-17_NORTH       =     'X'
 
      begintext
 
 
   Earth RADII for DSN-17 FK generation
   =====================================================================
 
   Author:                                        Boris Semenov  (NAIF/JPL)
   File creation date:                            20-AUG-2019
 
 
   Reference Spheroid
   ------------------
 
   The reference spheroid radii provided in an email from Dr. Stephen
   Slobin dated November 09, 2016 were:
 
      The semi-major axis of the WGS84 ellipsoid, outward in the
      x-direction from the geocenter to the equator = a = 6378137 meters.
      The semi-minor axis, upward in the z-direction from the geocenter
      to the poles = b = 6356752.314  meters.
 
      begindata
 
         BODY399_RADII = ( 6378.137, 6378.137, 6356.752314 )
 
      begintext
 
 
 
begintext
 
[End of definitions file]
 
