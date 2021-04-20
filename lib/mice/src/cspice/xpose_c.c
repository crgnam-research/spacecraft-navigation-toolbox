/*

-Procedure  xpose_c ( Transpose a matrix, 3x3 )

-Abstract

   Transpose a 3x3 matrix.

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

-Keywords

   None.

*/
   #include "SpiceUsr.h"
   #undef    xpose_c
   

   void xpose_c ( ConstSpiceDouble m1[3][3],  SpiceDouble mout[3][3] )

/*

-Brief_I/O

   VARIABLE  I/O  DESCRIPTION
   --------  ---  --------------------------------------------------
    m1        I   3x3 matrix to be transposed.
    mout      O   Transpose of m1.  mout can overwrite m1.
 
-Detailed_Input

    m1            This variable may contain any double precision 3x3
                  matrix.
 
-Detailed_Output

    mout          This variable is a double precision, 3x3 matrix which
                  contains the transpose of m1.  mout may overwrite m1.

-Parameters

   None.

-Exceptions

   Error free.

-Files

   None.

-Particulars

   xpose_c first copies the diagonal elements of m1 to mout.  Then
   the off-diagonal elements are transposed using a temporary
   variable in the following order: 
   
      (1,2) <---> (2,1) 
      (1,3) <---> (3,1) 
      (2,3) <---> (3,2)   
      
   Since a temporary variable is used, it is possible to transpose a
   matrix in place.  In other words, mout may overwrite m1.

-Examples

   Given below is one example of a matrix m1 with the output matrix
   mout which is implied by m1.

           | 1  2  3 |                | 1  0  0 |
      m1 = | 0  4  5 |   then  mout = | 2  4  6 |
           | 0  6  0 |                | 3  5  0 |

-Restrictions

   None.

-Literature_References

   None.

-Author_and_Institution

   N.J. Bachman       (JPL)
   W.L. Taber         (JPL)
   W.M. Owen          (JPL)

-Version

   -CSPICE Version 1.2.3, 08-JAN-2014 (BVS)

      Corrected a minor typo in the header.

   -CSPICE Version 1.2.2, 16-JAN-2008   (EDW)

      Corrected typos in header titles:
      
      Detailed Input to Detailed_Input
      Detailed Output to Detailed_Output

   -CSPICE Version 1.2.1, 10-NOV-2006   (EDW)

      Added Keywords and Parameters section headers. 
      Reordered section headers.

   -CSPICE Version 1.2.0, 22-OCT-1998 (NJB)

      Made input matrix const.

   -CSPICE Version 1.1.0, 06-MAR-1998 (EDW)

      Minor correction to header.

   -CSPICE Version 1.0.0, 08-FEB-1998 (NJB) (WLT) (WMO)
   
      Based on SPICELIB Version 1.0.1, 10-MAR-1992.

-Index_Entries

      transpose a 3x3_matrix

-&
*/

{  /* Begin xpose_c */


   /*
   Local variables
   */
   SpiceDouble                        temp;


   /*
   Move the three diagonal elements from m1 to mout.
   */
   mout[0][0] = m1[0][0];
   mout[1][1] = m1[1][1];
   mout[2][2] = m1[2][2];
 
   /*
   Switch the three pairs of off-diagonal elements.
   */
   temp       = m1[0][1];
   mout[0][1] = m1[1][0];
   mout[1][0] = temp;

   temp       = m1[0][2];
   mout[0][2] = m1[2][0];
   mout[2][0] = temp;

   temp       = m1[1][2];
   mout[1][2] = m1[2][1];
   mout[2][1] = temp;


} /* End xpose_c */
