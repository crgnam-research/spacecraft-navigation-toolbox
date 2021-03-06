/*

-Header_File SpiceZrnm.h ( CSPICE rename assignments )

-Abstract

   Reassign CSPICE symbol names to prevent symbol collisions.

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

-Literature_References

   None.

-Particulars

   Compiled symbol names in CSPICE may collide with symbols in other,
   non-SPICE libraries. This file redefines names which have or may
   cause a collision.

-Author_and_Institution

   N.J. Bachman       (JPL)
   E.D. Wright        (JPL)

-Version

   -CSPICE Version 1.0.0, 17-OCT-2011 (EDW)

-Index_Entries

   Rename assignments for CSPICE functions

*/


#ifndef HAVE_SPICERENAME_H

/*
Redefine names causing symbol conflicts:
*/
#define HAVE_SPICERENAME_H

   /* dpstrf_ may exist in the LAPACK library. */

   #define   dpstrf_   zz_dpstrf_

   /* Just in case. */

   #define   pi_       zz_pi_
   #define   vnorm_    zz_vnorm_
   #define   vdist_    zz_vdist_

#endif

