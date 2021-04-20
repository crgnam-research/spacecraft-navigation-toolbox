/*

-Header_File SpiceOsc.h ( CSPICE osculating element definitions )

-Abstract

   Perform CSPICE definitions for osculating element routines.
            
-Disclaimer

   THIS SOFTWARE AND ANY RELATED MATERIALS WERE CREATED BY THE
   CALIFORNIA INSTITUTE OF TECHNOLOGY (CALTECH) UNDER A U.S.
   GOVERNMENT CONTRACT WITH THE NATIONAL AERONAUTICS AND SPACE
   ADMINISTRATION (NASA). THE SOFTWARE IS TECHNOLOGY AND SOFTWARE
   PUBLICLY AVAILABLE UNDER U.S. EXPORT LAWS AND IS PROVIDED "AS-IS"
   TO THE RECIPIENT WITHOUT WARRANTY OF ANY KIND, INCLUDING ANY
   WARRANTIES OF PERFORMANCE OR MERCHANTABILITY OR FITNESS FOR A
   PARTICULAR USE OR PURPOSE (AS SET FORTH IN UNITED STATES UCC
   SECTIONS 2312-2313) OR FOR ANY PURPOSE WHATSOEVER, FOR THE
   SOFTWARE AND RELATED MATERIALS, HOWEVER USED.

   IN NO EVENT SHALL CALTECH, ITS JET PROPULSION LABORATORY, OR NASA
   BE LIABLE FOR ANY DAMAGES AND/OR COSTS, INCLUDING, BUT NOT
   LIMITED TO, INCIDENTAL OR CONSEQUENTIAL DAMAGES OF ANY KIND,
   INCLUDING ECONOMIC DAMAGE OR INJURY TO PROPERTY AND LOST PROFITS,
   REGARDLESS OF WHETHER CALTECH, JPL, OR NASA BE ADVISED, HAVE
   REASON TO KNOW, OR, IN FACT, SHALL KNOW OF THE POSSIBILITY.

   RECIPIENT BEARS ALL RISK RELATING TO QUALITY AND PERFORMANCE OF
   THE SOFTWARE AND ANY RELATED MATERIALS, AND AGREES TO INDEMNIFY
   CALTECH AND NASA FOR ALL THIRD-PARTY CLAIMS RESULTING FROM THE
   ACTIONS OF RECIPIENT IN THE USE OF THE SOFTWARE.

-Required_Reading

   None.
   
-Particulars

   This header defines constants that may be referenced in application
   code that calls CSPICE osculating element functions.
   

      Constants
      ==========
   
         Name                  Description
         ----                  ----------
   
         SPICE_OSCLTX_NELTS    Length of output element array
                               returned by oscltx_c.

-Literature_References

   None.

-Author_and_Institution

   N.J. Bachman       (JPL)
   
-Restrictions

   None.
      
-Version

   -CSPICE Version 1.0.0, 25-JAN-2017 (NJB)  

*/

#ifndef HAVE_SPICE_OSC

  #define HAVE_SPICE_OSC
   
      
  /*
  Constants
  */   
  #define SPICE_OSCLTX_NELTS         20

#endif


/*
  End of header file SpiceOsc.h
*/
