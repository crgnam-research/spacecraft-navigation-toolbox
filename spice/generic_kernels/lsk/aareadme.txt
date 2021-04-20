

    LEAPSECONDS KERNEL VERSION NAIF0012

The file naif0012.tls is a unix-style text file. It is suitable for use
on all unix boxes, including PC/linux and MAC/OSX machines.

For PCs running Windows, use naif0012.tls.pc.

Use of one of these files is required for all SPICE computations
dealing with times on or after January 1, 2017 00:00:00 UTC if you want
accurate conversions between UTC and Ephemeris Time (a.k.a. TDB).
Failure to use naif0012 for times after this epoch will result
in a one second time conversion error.

The symbolic links

    latest_leapseconds.tls
    latest_leapseconds.tls.pc

refer respectively to the files

    naif0012.tls
    naif0012.tls.pc

These links are updated as necessary to point to the latest
versions of the unix and windows leapseconds kernels.
