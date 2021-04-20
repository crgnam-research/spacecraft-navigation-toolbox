KPL/FK
 
   FILE: dss_17_prelim_itrf93_161110.tf
 
   This file was created by PINPOINT.
 
   PINPOINT Version 3.1.0 --- July 2, 2014
   PINPOINT RUN DATE/TIME:    2016-11-10T14:06:09
   PINPOINT DEFINITIONS FILE: dss_17_prelim_itrf93_161110.pinpoint
   PINPOINT PCK FILE:         earth_wgs84.tpc
   PINPOINT SPK FILE:         dss_17_prelim_itrf93_161110.bsp
 
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
 
      Topocentric frame DSS-17_TOPO is centered at the site DSS-17
      which has Cartesian coordinates
 
         X (km):                  0.5735522979778E+03
         Y (km):                 -0.4986698778989E+04
         Z (km):                  0.3922430274647E+04
 
      and planetodetic coordinates
 
         Longitude (deg):       -83.4388744400000
         Latitude  (deg):        38.1918813900000
         Altitude   (km):         0.3636479999998E+00
 
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
   TKFRAME_1399017_ANGLES              =  ( -276.5611255600000,
                                             -51.8081186100000,
                                             180.0000000000000 )
 
\begintext
 
 
Definitions file dss_17_prelim_itrf93_161110.pinpoint
--------------------------------------------------------------------------------
 
 
 
   SPK/FK for Preliminary DSS-17, DSS-36 Station Locations
   =====================================================================
 
   Original SPK file name:               dss_17_prelim_itrf93_161110.bsp
   Original FK file name:                dss_17_prelim_itrf93_161110.tf
   Creation date:                        10-NOV-2016
   Created by:                           Boris Semenov  (NAIF/JPL)
 
 
   Data for DSS-17 are based on an email from Dr. Stephen Slobin dated
   November 09, 2016. The position data from that email are shown below:
 
      LAT =   38.19188139 deg
      LON =  276.56112556 deg
      ALT =  363.648 meters
 
   The email states that the position in the ITRF93 reference frame,
   Epoch 2003.0, with respect to the WGS84 spheroid (Re = 6378137 meters,
   Rp = 6356752.314 meters) and might be in error by several centimeters.
 
   No velocity data were provided with the position information.
 
      begindata
 
 
      SITES              +=      'DSS-17'
      DSS-17_FRAME       =       'ITRF93'
      DSS-17_CENTER      =       399
      DSS-17_IDCODE      =       399017
      DSS-17_BOUNDS      =    (  @1950-JAN-01/00:00,  @2050-JAN-01/00:00  )
      DSS-17_LATLON      =    (
                                    38.19188139
                                   276.56112556
                                     0.363648
                               )
 
      DSS-17_UP          =     'Z'
      DSS-17_NORTH       =     'X'
 
      begintext
 
   Earth RADII for DSN kernel generation
   =====================================
 
   Author:                                        Boris Semenov  (NAIF/JPL)
   File creation date:                            10-NOV-2016
 
 
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
 
