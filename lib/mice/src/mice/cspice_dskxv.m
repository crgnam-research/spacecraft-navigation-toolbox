%-Abstract
%
%   CSPICE_DSKXV computes ray-surface intercepts for a set of rays,
%   using data provided by multiple loaded DSK segments.
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
%      pri        is a logical flag indicating whether to perform
%                 a prioritized or unprioritized DSK segment search.
%                 In an unprioritized search, no segment masks another:
%                 data from all specified segments are used to
%                 define the surface of interest.
%
%                 [1,1] = size(pri); logical = class(pri)
%
%                 The search is unprioritized if and only if `pri'
%                 is set to false. In the N0066 SPICE Toolkit, this
%                 is the only allowed value.
%
%      target     is the name of the target body on which a surface
%                 intercept is sought.
%
%                 [1,c1] = size(target); char = class(target)
%
%                    or
%
%                 [1,1] = size(target); cell = class(target)
%
%      nsurf,
%      srflst     are, respectively, a count of surface ID codes in a
%                 list and an containing the list. Only DSK segments for
%                 for the body designated by `target' and having surface
%                 IDs in this list will considered in the intercept
%                 computation. If the list is empty, all DSK segments
%                 for `target' will be considered.
%
%      et         is the epoch of the intersection computation,
%                 expressed as seconds past J2000 TDB. This epoch is
%                 used only for DSK segment selection. Segments used
%                 the intercept computation must include `et' in their
%                 time coverage intervals.
%
%      fixref     is the name of a body-fixed, body-centered reference
%                 frame associated with the target. The input ray vectors
%                 are specified in this frame, as is the output intercept
%                 point.
%
%                 [1,c2] = size(fixref); char = class(fixref)
%
%                    or
%
%                 [1,1] = size(fixref); cell = class(fixref)
%
%                 The frame designated by `fixref' must have a fixed
%                 orientation relative to the frame of any DSK segment
%                 used in the computation.
%
%      vtxarr,
%      dirarr     are, respectively, a count of rays, an array containing
%                 the vertices of rays, and an array containing the
%                 direction vectors of the rays.
%
%
%                 [3,n] = size(vtxarr); double = class(vtxarr)
%                 [3,n] = size(dirarr); double = class(dirarr)
%
%                 The ray's vertices are considered to represent offsets
%                 from the center of the target body.
%
%                 The rays' vertices and direction vectors are
%                 represented in the reference frame designated by
%                 `fixref'.
%
%   the call:
%
%      [ xptarr, fndarr] = cspice_dskxsi( pri,             ...
%                                         target, nsurf,   ...
%                                         srflst, et,      ...
%                                         fixref, vtxarr,  ...
%                                         dirarr )
%
%   returns:
%
%      xptarr     is an array containing the intercepts of the input
%                 rays on the surface specified by the inputs
%
%                    pri
%                    target
%                    nsurf
%                    srflst
%                    et
%
%                 [3,n] = size(xptarr); double = class(xptarr)
%
%                 The ith element of `xptarr' is the intercept
%                 corresponding to the ith ray, if such an intercept
%                 exists. If a ray intersects the surface at multiple
%                 points, the intercept closest to the ray's vertex is
%                 selected.
%
%                 The ith element of `xptarr' is defined if and only if the
%                 ith element of `fndarr' is true.
%
%                 Units are km.
%
%      fndarr     is an array of logical flags indicating whether the
%                 input rays intersect the surface. The ith element of
%                 `fndarr' is set to true if and only if an intercept
%                 was found for the ith ray.
%
%                 [1,n] = size(fndarr); logical = class(fndarr)
%
%-Examples
%
%   Any numerical results shown for this example may differ between
%   platforms as the results depend on the SPICE kernels used as input
%   and the machine specific arithmetic implementation.
%
%   Example (1):
%
%      Compute surface intercepts of rays emanating from a set of
%      vertices distributed on a longitude-latitude grid. All
%      vertices are outside the target body, and all rays point
%      toward the target's center.
%
%      Check intercepts against expected values. Indicate the
%      number of errors, the number of computations, and the
%      number of intercepts found.
%
%      Use the meta-kernel shown below to load example SPICE
%      kernels.
%
%          KPL/MK
%
%          File: dskxv_ex1.tm
%
%          This meta-kernel is intended to support operation of SPICE
%          example programs. The kernels shown here should not be
%          assumed to contain adequate or correct versions of data
%          required by SPICE-based user applications.
%
%          In order for an application to use this meta-kernel, the
%          kernels referenced here must be present in the user's
%          current working directory.
%
%          The names and contents of the kernels referenced
%          by this meta-kernel are as follows:
%
%             File name                        Contents
%             ---------                        --------
%             phobos512.bds                    DSK based on
%                                              Gaskell ICQ Q=512
%                                              plate model
%          \begindata
%
%             PATH_SYMBOLS    = 'GEN'
%             PATH_VALUES     = '/ftp/pub/naif/generic_kernels'
%
%             KERNELS_TO_LOAD = ( '$GEN/dsk/phobos/phobos512.bds' )
%
%          \begintext
%
%
%      function dskxv_t( META )
%
%         % This program expects all loaded DSKs
%         % to represent the same body and surface.
%
%         %
%         % MiceUser globally defines DSK parameters.
%         % For more information, please see DSKMiceUser.m and
%         % DSKMice02.m.
%         %
%         MiceUser
%
%         DTOL  = 1.0e-14;
%         MAXN  = 100000;
%         dirarr = zeros( 3, MAXN );
%         vtxarr = zeros( 3, MAXN );
%
%         %
%         % Get meta-kernel name from the command line.
%         %
%         switch nargin
%            case 1
%
%               %
%               % Load the meta-kernel.
%               %
%               cspice_furnsh( META )
%
%            otherwise
%
%               error( 'Command syntax:  dskxv_t( <meta-kernel> )' )
%
%         end
%
%
%         %
%         % Get a handle for one of the loaded DSKs,
%         % then find the first segment and extract
%         % the body and surface IDs.
%         %
%         [file, filtyp, source, handle, found] = cspice_kdata(1, 'DSK');
%
%         if ~found
%            error('SPICE(NOINFO)' )
%         end
%
%         [dladsc, found] = cspice_dlabfs( handle );
%
%         if ~found
%            error('SPICE(NOSEGMENT)' )
%         end
%
%         dskdsc = cspice_dskgd( handle, dladsc );
%
%         bodyid = dskdsc(SPICE_DSK_CTRIDX);
%         surfid = dskdsc(SPICE_DSK_SRFIDX);
%         framid = dskdsc(SPICE_DSK_FRMIDX);
%
%         [target, found ] = cspice_bodc2n( bodyid );
%
%         if ~found
%
%            txt = sprintf( ...
%          ['SPICE(BODYNAMENOTFOUND): Cannot map body ID %s to a name.'], ...
%          bodyid);
%
%            error(txt)
%         end
%
%         fixref = cspice_frmnam(framid);
%
%         if fixref == ' '
%
%            txt = sprintf( ...
%          ['SPICE(BODYNAMENOTFOUND): Cannot map frame ID %s to a name.'], ...
%          framid);
%
%            error(txt)
%         end
%
%
%         %
%         % Set the magnitude of the ray vertices. Use a large
%         % number to ensure the vertices are outside of
%         % any realistic target.
%         %
%         r = 1.0e10;
%
%         %
%         % Spear the target with rays pointing toward
%         % the origin.  Use a grid of ray vertices
%         % located on a sphere enclosing the target.
%         %
%         % The variable `polmrg' ("pole margin") can
%         % be set to a small positive value to reduce
%         % the number of intercepts done at the poles.
%         % This may speed up the computation for
%         % the multi-segment case, since rays parallel
%         % to the Z axis will cause all segments converging
%         % at the pole of interest to be tested for an
%         % intersection.
%         %
%
%         polmrg =    0.5;
%         latstp =    1.0;
%         lonstp =    2.0;
%
%         nhits  =    0;
%         nderr  =    0;
%
%         lon    = -180.0;
%         lat    =   90.0;
%         nlstep =    0;
%         nrays  =    1;
%
%         %
%         % Generate rays.
%         %
%         while ( lon < 180.0 )
%
%            while ( nlstep <= 180 )
%
%               if ( lon == 180.0 )
%
%                  lat = 90.0 - nlstep*latstp;
%
%               else
%
%                  if ( nlstep == 0 )
%                     lat =  90.0 - polmrg;
%                  elseif ( nlstep == 180 )
%                     lat = -90.0 + polmrg;
%                  else
%                     lat =  90.0 - nlstep*latstp;
%                  end
%               end
%
%               vtxarr(:,nrays) = cspice_latrec( r, ...
%                                 lon*cspice_rpd(), lat*cspice_rpd() );
%
%               nrays  = nrays  + 1;
%               nlstep = nlstep + 1;
%            end
%
%            lon    = lon + lonstp;
%            lat    = 90.0;
%            nlstep = 0;
%         end
%
%         dirarr = -vtxarr;
%
%         %
%         % Assign surface ID list.
%         %
%         % Note that, if we knew that all files had the desired
%         % surface ID, we could set `nsurf' to 0 and omit the
%         % initialization of the surface ID list.
%         %
%         nsurf     = 1;
%         srflst(1) = surfid;
%
%         disp( 'Computing intercepts...' )
%
%         nrays = nrays-1;
%
%
%         %
%         % Find the surface intercept of the ith ray.
%         %
%
%         [xptarr, fndarr] = cspice_dskxv( false, ...
%                                         target, ...
%                                         nsurf,  ...
%                                         srflst, ...
%                                         0,      ...
%                                         fixref, ...
%                                         vtxarr(:,1:nrays), ...
%                                         dirarr(:,1:nrays) );
%
%         for i = 1:nrays
%
%            if ( fndarr(i) )
%
%               %
%               % Record that a new intercept was found.
%               %
%               nhits = nhits + 1;
%
%               %
%               % Check results.
%               %
%               %
%               % Compute the latitude and longitude of
%               % the intercept. Make sure these agree
%               % well with those of the vertex.
%               %
%               [ radius, lon, lat ] = cspice_reclat( xptarr(:,i) );
%
%               %
%               % Recover the vertex longitude and latitude.
%               %
%               [vrad, vlon, vlat ] = cspice_reclat( vtxarr(:,i) );
%               xyzhit = cspice_latrec ( radius, vlon,  vlat );
%
%               d = cspice_vdist( xptarr(:,i), xyzhit );
%
%               if ( d/r > DTOL )
%
%                  fprintf( '===========================\n' );
%                  fprintf( 'Lon = %f;  Lat = %f\n', lon, lat );
%                  fprintf( 'Bad intercept\n'               );
%                  fprintf( 'Distance error = %e\n', d      );
%                  fprintf( 'xpt    = (%e %e %e)\n', ...
%                            xpt(1), xpt(2), xpt(3) );
%                  fprintf( 'xyzhit = (%e %e %e)\n', ...
%                            xyzhit(1), xyzhit(2), xyzhit(3) );
%
%                  nderr = nderr + 1;
%               end
%
%            else
%
%               %
%               % Missing the target entirely is a fatal error.
%               %
%               % This is true only for this program, not in
%               % general. For example, if the target shape is
%               % a torus, many rays would miss the target.
%               %
%               fprintf( '===========================\n' );
%               fprintf( 'Lon = %f;  Lat = %f\n', lon, lat );
%
%               error( 'No intercept' );
%
%            end
%
%         end
%
%         fprintf ( 'Done.\n\n' )
%
%         fprintf( 'nrays = %d\n', nrays )
%         fprintf( 'nhits = %d\n', nhits )
%         fprintf( 'nderr = %d\n', nderr )
%
%         %
%         % It's always good form to unload kernels after use,
%         % particularly in Matlab due to data persistence.
%         %
%         cspice_kclear
%
%   Matlab outputs:
%
%      dskxv_t( 'dskxv_ex1.tm' )
%
%      Computing intercepts...
%      Done.
%
%      nrays = 32580
%      nhits = 32580
%      nderr = 0
%
%-Particulars
%
%   This routine is suitable for efficient ray-surface intercept
%   computations in which the relative observer-target geometry is
%   constant but the rays vary.
%
%   For cases in which it is necessary to know the source of the
%   data defining the surface on which an intercept was found,
%   use the CSPICE routine cspice_dskxsi.
%
%   For cases in which a ray's vertex is not explicitly known but is
%   defined by relative observer-target geometry, the Mice
%   ray-surface intercept routine cspice_sincpt should be used.
%
%   This routine works with multiple DSK files. It places no
%   restrictions on the data types or coordinate systems of the DSK
%   segments used in the computation. DSK segments using different
%   reference frames may be used in a single computation. The only
%   restriction is that any pair of reference frames used directly or
%   indirectly are related by a constant rotation.
%
%   Using DSK data
%   ==============
%
%      DSK loading and unloading
%      -------------------------
%
%      DSK files providing data used by this routine are loaded by
%      calling cspice_furnsh and can be unloaded by calling cspice_unload or
%      cspice_kclear. See the documentation of cspice_furnsh for limits on
%      numbers of loaded DSK files.
%
%      For run-time efficiency, it's desirable to avoid frequent
%      loading and unloading of DSK files. When there is a reason to
%      use multiple versions of data for a given target body---for
%      example, if topographic data at varying resolutions are to be
%      used---the surface list can be used to select DSK data to be
%      used for a given computation. It is not necessary to unload
%      the data that are not to be used. This recommendation presumes
%      that DSKs containing different versions of surface data for a
%      given body have different surface ID codes.
%
%
%      DSK data priority
%      -----------------
%
%      A DSK coverage overlap occurs when two segments in loaded DSK
%      files cover part or all of the same domain---for example, a
%      given longitude-latitude rectangle---and when the time
%      intervals of the segments overlap as well.
%
%      When DSK data selection is prioritized, in case of a coverage
%      overlap, if the two competing segments are in different DSK
%      files, the segment in the DSK file loaded last takes
%      precedence. If the two segments are in the same file, the
%      segment located closer to the end of the file takes
%      precedence.
%
%      When DSK data selection is unprioritized, data from competing
%      segments are combined. For example, if two competing segments
%      both represent a surface as sets of triangular plates, the
%      union of those sets of plates is considered to represent the
%      surface.
%
%      Currently only unprioritized data selection is supported.
%      Because prioritized data selection may be the default behavior
%      in a later version of the routine, the presence of the `pri'
%      argument is required.
%
%
%      Round-off errors and mitigating algorithms
%      ------------------------------------------
%
%      When topographic data are used to represent the surface of a
%      target body, round-off errors can produce some results that
%      may seem surprising.
%
%      Note that, since the surface in question might have mountains,
%      valleys, and cliffs, the points of intersection found for
%      nearly identical sets of inputs may be quite far apart from
%      each other: for example, a ray that hits a mountain side in a
%      nearly tangent fashion may, on a different host computer, be
%      found to miss the mountain and hit a valley floor much farther
%      from the observer, or even miss the target altogether.
%
%      Round-off errors can affect segment selection: for example, a
%      ray that is expected to intersect the target body's surface
%      near the boundary between two segments might hit either
%      segment, or neither of them; the result may be
%      platform-dependent.
%
%      A similar situation exists when a surface is modeled by a set
%      of triangular plates, and the ray is expected to intersect the
%      surface near a plate boundary.
%
%      To avoid having the routine fail to find an intersection when
%      one clearly should exist, this routine uses two "greedy"
%      algorithms:
%
%         1) If the ray passes sufficiently close to any of the
%            boundary surfaces of a segment (for example, surfaces of
%            maximum and minimum longitude or latitude), that segment
%            is tested for an intersection of the ray with the
%            surface represented by the segment's data.
%
%            This choice prevents all of the segments from being
%            missed when at least one should be hit, but it could, on
%            rare occasions, cause an intersection to be found in a
%            segment other than the one that would be found if higher
%            precision arithmetic were used.
%
%         2) For type 2 segments, which represent surfaces as
%            sets of triangular plates, each plate is expanded very
%            slightly before a ray-plate intersection test is
%            performed. The default plate expansion factor is
%
%               1 + SPICE_DSK_XFRACT
%
%            where XFRACT is declared in
%
%               DSKtol.m
%
%            For example, given a value for XFRACT of 1.e-10, the
%            sides of the plate are lengthened by 1/10 of a micron
%            per km. The expansion keeps the centroid of the plate
%            fixed.
%
%            Plate expansion prevents all plates from being missed
%            in cases where clearly at least one should be hit.
%
%            As with the greedy segment selection algorithm, plate
%            expansion can occasionally cause an intercept to be
%            found on a different plate than would be found if higher
%            precision arithmetic were used. It also can occasionally
%            cause an intersection to be found when the ray misses
%            the target by a very small distance.
%
%-Required Reading
%
%   For important details concerning this module's function, please
%   refer to the CSPICE routine dskxv_c.
%
%   MICE.REQ
%   DAS.REQ
%   DSK.REQ
%
%-Version
%
%   -Mice Version 1.0.0, 21-APR-2014, EDW (JPL), NJB (JPL)
%
%-Index_Entries
%
%   vectorized ray-surface intercept
%   vectorized ray-dsk intercept
%
%-&

function [ xptarr, fndarr] = cspice_dskxsi( pri,             ...
                                            target, nsurf,   ...
                                            srflst, et,      ...
                                            fixref, vtxarr,  ...
                                            dirarr )

   switch nargin
      case 8

         pri     = zzmice_int(pri);
         target  = zzmice_str(target);
         nsurf   = zzmice_int(nsurf);
         srflst  = zzmice_int(srflst);
         et      = zzmice_dp(et);
         fixref  = zzmice_str(fixref);
         vtxarr  = zzmice_dp(vtxarr);
         dirarr  = zzmice_dp(dirarr);

      otherwise

         error ( [ 'Usage:' ] )
   end

   %
   % Call the MEX library.
   %
   try

      [ xptarr, fndarr] = mice( 'dskxv_c', pri,    target, ...
                                           nsurf,  srflst, ...
                                           et,     fixref, ...
                                           vtxarr, dirarr );

      %
      % Convert the integer flags to MATLAB logicals for return to
      % the caller.
      %
      fndarr = zzmice_logical(fndarr);
   catch
      rethrow(lasterror)
   end

