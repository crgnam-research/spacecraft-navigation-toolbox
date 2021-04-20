%-Abstract
%
%   CSPICE_DASEC extracts comments from the comment area of a binary
%   DAS file.
%
%-Disclaimer
%
%   THIS SOFTWARE AND ANY RELATED MATERIALS WERE CREATED BY THE
%   CALIFORNIA  INSTITUTE OF TECHNOLOGY (CALTECH) UNDER A U.S.
%   GOVERNMENT CONTRACT WITH THE NATIONAL AERONAUTICS AND SPACE
%   ADMINISTRATION (NASA). THE SOFTWARE IS TECHNOLOGY AND SOFTWARE
%   PUBLICLY AVAILABLE UNDER U.S. EXPORT LAWS AND IS PROVIDED
%   "AS-IS" TO THE RECIPIENT WITHOUT WARRANTY OF ANY KIND, INCLUDING
%   ANY WARRANTIES OF PERFORMANCE OR MERCHANTABILITY OR FITNESS FOR
%   A PARTICULAR USE OR PURPOSE (AS SET FORTH IN UNITED STATES UCC
%   SECTIONS 2312-2313) OR FOR ANY PURPOSE WHATSOEVER, FOR THE
%   SOFTWARE AND RELATED MATERIALS, HOWEVER USED.
%
%   IN NO EVENT SHALL CALTECH, ITS JET PROPULSION LABORATORY,
%   OR NASA BE LIABLE FOR ANY DAMAGES AND/OR COSTS, INCLUDING,
%   BUT NOT LIMITED TO, INCIDENTAL OR CONSEQUENTIAL DAMAGES OF
%   ANY KIND, INCLUDING ECONOMIC DAMAGE OR INJURY TO PROPERTY
%   AND LOST PROFITS, REGARDLESS OF WHETHER CALTECH, JPL, OR
%   NASA BE ADVISED, HAVE REASON TO KNOW, OR, IN FACT, SHALL
%   KNOW OF THE POSSIBILITY.
%
%   RECIPIENT BEARS ALL RISK RELATING TO QUALITY AND PERFORMANCE
%   OF THE SOFTWARE AND ANY RELATED MATERIALS, AND AGREES TO
%   INDEMNIFY CALTECH AND NASA FOR ALL THIRD-PARTY CLAIMS RESULTING
%   FROM THE ACTIONS OF RECIPIENT IN THE USE OF THE SOFTWARE.
%
%-I/O
%
%   Given:
%
%      handle   the file handle of a binary DAS file which has been
%               opened with read access.
%
%               [1,1] = size(handle); int32 = class(handle)
%
%      bufsiz   the maximum number of comments that may be placed into
%               `buffer'.
%
%               [1,1] = size(bufsiz); int32 = class(bufsiz)
%
%      buflen   the allowed length of each string element of the output
%               `buffer'. This length must be large enough to hold the
%               longest output string. The SPICE system imposes no limit
%               on the length of comment lines, so 'buflen' normally
%               should be set to a "generous" value that is unlikely
%               to be exceeded.
%
%               [1,1] = size(buflen); int32 = class(buflen)
%
%   the call:
%
%      [buffer, done] = cspice_dasec( handle, bufsiz, buflen )
%
%   returns:
%
%      buffer   a list of at most bufsiz comments which have been
%               extracted from the comment area of the binary DAS
%               file attached to handle. `buffer' should be declared as
%               follows:
%
%               On output, `buffer' contains `bufsiz' or less strings of comment
%               text, with one comment line per string ( bufsiz >= n).
%
%               [n,c1] = size(buffer); char = class(buffer)
%
%      done     a boolean flag indicating whether or not all of the
%               comment lines from the comment area of the DAS file have
%               been read. This variable has the value true after the
%               last comment line has been read. It will have the value
%               false otherwise.
%
%               If no comments exist in the comment area, this variable
%               returns as true.
%
%               [1,1] = size(done); logical = class(done)
%
%-Examples
%
%   Any numerical results shown for this example may differ between
%   platforms as the results depend on the SPICE kernels used as input
%   and the machine specific arithmetic implementation.
%
%   The following example will extract the comment area of a
%   binary DAS file attached to `handle', displaying the comments on
%   the terminal screen.
%
%      function dasec_t( das )
%
%         BUFSIZE    = 40;
%         LINLEN     = 115;
%
%         %
%         % Open for reading the DAS, return the corresponding
%         % file handle to 'handle'.
%         %
%         handle = cspice_dasopr( das );
%
%         done = false;
%
%         [buf, done] = cspice_dasec( handle, BUFSIZE, LINLEN );
%         output = cellstr(buf);
%
%         for i=1:numel(output)
%            fprintf( '%s\n', char(output(i)) );
%         end
%
%         if done
%            fprintf( 'All comments read from file.\n' );
%         else
%            fprintf( 'Not all comments read from file.\n' );
%         end
%
%         %
%         % SAFELY close the file.
%         %
%         cspice_dascls( handle )
%
%   Matlab outputs:
%
%      >> dasec_t( 'phobos512.bds' )
%
%      ************************************************************************
%      MKDSK RUN DATE/TIME: 2010-06-30T16:52:12
%      MKDSK SETUP FILE:    phobos512.cmd
%      MKDSK INPUT FILE:    phobos_q512.txt
%      MKDSK OUTPUT FILE:   phobos512.bds
%      OUTPUT FILE STATUS:    NEW FILE
%      ************************************************************************
%
%                 \begindata
%
%                 INPUT_SHAPE_FILE    = 'phobos_q512.txt'
%                 OUTPUT_DSK_FILE     = 'phobos512.bds'
%                 COMMENT_FILE        = ' '
%                 LEAPSECONDS_FILE    = 'naif0009.tls'
%                 SURFACE_NAME        = 'phobos'
%                 CENTER_NAME         = 'phobos'
%                 REF_FRAME_NAME      = 'IAU_PHOBOS'
%                 START_TIME          = '1950-JAN-1/00:00:00'
%                 STOP_TIME           = '2050-JAN-1/00:00:00'
%                 DATA_CLASS          = 1
%                 INPUT_DATA_UNITS    = ( 'ANGLES    = DEGREES'
%                                         'DISTANCES = KILOMETERS' )
%                 COORDINATE_SYSTEM   = 'LATITUDINAL'
%                 MINIMUM_LATITUDE    = -90
%                 MAXIMUM_LATITUDE    =  90
%                 MINIMUM_LONGITUDE   = -180
%                 MAXIMUM_LONGITUDE   =  180
%                 DATA_TYPE           = 2
%                 PLATE_TYPE          = 2
%                 FINE_VOXEL_SCALE    = 4.0
%                 COARSE_VOXEL_SCALE  = 5
%
%                 \begintext
%
%
%      ************************************************************************
%      All comments read from file.
%
%   The program outputs `buffsiz' or less lines from the DAS comment area.
%
%   Reading all comment lines from a DAS may require a large value for
%   `buffsiz'. In this case, a BUFSIZ value of 50 will read all comment
%   lines from a DAS in a single cspice_dasec call. Otherwise, additional
%   calls to cspice_dasec will read more comment lines
%   from the DAS in slices of `buffsiz'.
%
%-Particulars
%
%   Binary DAS files contain an area which is reserved for storing
%   annotations or descriptive textual information describing the data
%   contained in a file. This area is referred to as the "comment
%   area" of the file. The comment area of a DAS file is a line
%   oriented medium for storing textual information. The comment
%   area preserves any leading or embedded white space in the line(s)
%   of text which are stored, so that the appearance of the
%   information will be unchanged when it is retrieved (extracted) at
%   some other time. Trailing blanks, however, are NOT preserved,
%   due to the way that character strings are represented in
%   standard Fortran 77.
%
%   This routine will read the comments from the comment area of
%   a binary DAS file, placing them into a line buffer. If the line
%   buffer is not large enough to hold the entire comment area,
%   the portion read will be returned to the caller, and the done
%   flag will be set to SPICEFALSE. This allows the comment area to be
%   read in "chunks," a buffer at a time. After all of the comment
%   lines have been read, the done flag will be set to SPICETRUE.
%
%   After all of the comments in DAS file have been read, the next
%   call to this routine will start reading comments at the start
%   of the comment area.
%
%   This routine can be used to "simultaneously" extract comments
%   from the comment areas of multiple binary DAS files.
%
%-Required Reading
%
%   For important details concerning this module's function, please refer to
%   the CSPICE routine dasec_c.
%
%   MICE.REQ
%   DAS.REQ
%
%-Version
%
%   -Mice Version 1.0.0, 05-JAN-2016, EDW (JPL)
%
%-Index_Entries
%
%    extract comments from a das file
%
%-&

function [buffer, done] = cspice_dasec( handle, bufsiz, buflen )

   switch nargin
      case 3

         handle  = zzmice_int(handle);
         bufsiz  = zzmice_int(bufsiz);
         buflen  = zzmice_int(buflen);

      otherwise

         error ( ['Usage: [buffer, done] = ' ...
                          'cspice_dasec( handle, bufsiz, buflen )'] )

   end

   %
   % Call the MEX library.
   %
   try
      [buffer, done] = mice( 'dasec_c', handle, bufsiz, buflen );
   catch
      rethrow(lasterror)
      done = zzmice_logical(done);
   end




