      File:                   AAREADME.TXT
      Last update:            29-JUN-2017 (NJB)
 
 
SPICE DSK Files
===========================================================================
 
   The sub-directories (folders) below this one contain generic SPICE DSK 
   ("digital shape kernel") files. These files provide shape data for extended 
   solar system bodies such as planets, natural satellites, dwarf planets, 
   asteroids, and comets.
 
   For PDS archived DSK files and associated SPICE kernels, see the NAIF
   PDS archive area
 
      ftp://naif.jpl.nasa.gov/pub/naif/pds
 
   Binary DSK files in this directory tree have names of the form
 
         *.bds
      or
         *.BDS
 
   The binary files were created on a PC and have the "IEEE little-endian"
   binary file architecture.
 
   See the corresponding comment files, which have names of the form
 
      *.cmt
 
   for descriptions of the files' contents.
 
   Images of the models are provided in files having names of the form
 
      *.png
      *.jpg
 
   The image files may be created using artificial lighting, coloring, and
   viewing geometry, so they should not be construed as a reflection of the
   relative geometry of target bodies and other solar system objects,
   particularly the sun.
 
   For a detailed description of DSK files and related software, see the
   DSK Required Reading, dsk.req, which is included in the SPICE Toolkit.
 
 
Applicable SPICE Toolkit Versions
===========================================================================
 
   DSK files may be read and written using the N0066 or later versions of
   the SPICE Toolkit. The N0066 SPICE Toolkit is the first version to
   contain the DSK utility programs DSKBRIEF, DSKEXP, and MKDSK.
 
   See the NAIF web site
 
      naif.jpl.nasa.gov
 
   to download the current SPICE Toolkit.
 
   DSK files created using N0066 SPICE Toolkit software generally are
   readable by Alpha DSK Toolkit software. However, the N0066 SPICE Toolkit
   does allow creation of DSK segments larger than those allowed by the
   Alpha DSK Toolkit, so it is not guaranteed that all applications using
   the Alpha DSK Toolkit can ingest all DSKs provided on this server.
 
   Planned development by NAIF of new DSK data types will eventually
   necessitate upgrading from the Alpha version to an official SPICE
   Toolkit version to access DSK files containing segments of those types.
 
 
Porting DSK Files
===========================================================================
 
   DSK files use the SPICE DAS format. Starting with the N0066 version of
   the SPICE Toolkit, SPICE software supports run-time translation of
   non-native DAS files, meaning that IEEE little-endian DSKs may be read
   on IEEE big-endian platforms, and vice versa. DSK files need not be
   converted to the native format of the host system on which they're to be
   read.
 
   Run-time translation does degrade processing speed, so DSK users may
   still benefit from converting non-native DSKs to the native format of
   their host systems.
 
   Binary DSK files can be converted using the SPICE utility BINGO, which
   is available from the NAIF web site at the URL
 
         http://naif.jpl.nasa.gov/naif/utilities.html
 
   DSK files can also be converted using the SPICE utilities TOXFR and
   TOBIN. For details, see the Convert Required Reading convert.req in your
   installed SPICE Toolkit or at the URL
 
         ftp://naif.jpl.nasa.gov/pub/naif/toolkit_docs/
 
   Also see the Porting Kernels tutorial at the URL
 
         Tutorials/pdf/individual_docs/09_porting_kernels.pdf
 
 
Converting DSK Files to Alternative File Formats
===========================================================================
 
   The SPICE utility program DSKEXP (``DSK export'') can write the data
   contained in a DSK file to a variety of simple ASCII formats. See the
   DSKEXP User's Guide for details.
 
 
Reading DSK comments
===========================================================================
 
   The comments in a binary DSK file can be read using the SPICE utility
   COMMNT. For your convenience copies of the comment areas of these
   kernels are included in text format in this directory.
 
 
Summarizing DSK Files
===========================================================================
 
   Coverage summaries of binary DSK files may be displayed using the SPICE
   utility program DSKBRIEF. See the DSKBRIEF User's Guide for details.
 
 
Pre-DSK Plate Model Format Files
===========================================================================
 
   The current DSK file format was introduced in 2010. Shape models using
   the older plate model format---a precursor of the DSK format---are still
   available on the NAIF server in the path
 
         ftp://naif.jpl.nasa.gov/pub/naif/deprecated_kernels
 
   Do not confuse the old plate model format with plate models represented
   in the DSK format. Both kinds of files can represent topography using
   collections of triangular plates, but the file formats and associated
   API software are different. Future versions of the SPICE Toolkit will
   support only the DSK format.
 
   The SPICE Toolkit does not contain APIs that perform geometry
   computations using files in the old plate model format, nor will it be
   modified to do so in the future. However, the old plate model format is
   based on the E-kernel format, and the SPICE E-kernel readers can be used
   to extract data from plate model files.
 
   APIs that access the old plate model files are provided by the NAIF
   plate model library, which is not part of the SPICE Toolkit. Contact
   NAIF for details.
 
