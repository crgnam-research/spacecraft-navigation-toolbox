# Spacecraft Navigation Toolbox (SNT)

[![MIT License](https://img.shields.io/apm/l/atomic-design-ui.svg?)](https://github.com/crgnam-research/spacecraft-navigation-toolbox/blob/main/LICENSE)
[![Release](https://img.shields.io/github/v/release/crgnam-research/spacecraft-navigation-toolbox?include_prereleases)](https://github.com/crgnam-research/spacecraft-navigation-toolbox/releases/tag/v0.1)
[![Issues](https://img.shields.io/github/issues/crgnam-research/spacecraft-navigation-toolbox)](https://github.com/crgnam-research/spacecraft-navigation-toolbox/issues)

This is a collection of MATLAB utilities for simulating spacecraft navigation scenarios.  It provides the tools for both simulating spacecraft vehicle dynamics, simulating sensor measurements, and provides a suite of filteirng tools for optimal estimation.

**This software is currently in early development.  The goal is to take many of the techniques/tools I've developed over the past few years, and compile them into an easy to use toolbox, as such refactoring the code to fit into that framework will take several weeks.  Expect an Alpha release (0.9.0) by March 2021.**

**All Documentation for this project can be found at [sntoolbox.com](sntoolbox.com)**

## How to Install/Use:
### Dependencies:
*Coming Soon*
<!-- While most 3rd party libraries are included in `lib/`, some functionality of this toolkit also depends on the JPL's SPICE Toolkit.  If you wish to use any SPICE kernels, you will need to install the [Spice Toolkit's MATLAB bindings](https://naif.jpl.nasa.gov/naif/toolkit_MATLAB.html). -->

<!-- For the in the loop image processing steps, an installation of python3.7 and bpy2.83 or higher is required. -->

### Get up and Running:
- To clone for the first time (including all submodules):
  - `git clone --recurse-submodules -j8 git@github.com:crgnam-research/spacecraft-navigation-toolbox.git`

- To get updataes for each submodule down the line:
  - `git submodule foreach git pull origin main`

*Pre-release Coming in v0.9, No Later Than March 2021*

### Demos:
In order to make this code as accesible and easy to use as possible, several well documented demo files have been included.  These files aim to demonstrate the key functionalities, and also show how to effectively use the code found here.

*Pre-release Coming in v0.9, No Later Than March 2021*

***
## Features
### Orbital Dynamics:
*Pre-release Coming in v0.9, No Later Than March 2021*

### Optimal Estimation:
*Pre-release Coming in v0.9, No Later Than March 2021*

### Easy Use of SPICE:
*Planned Feature Coming in v1.0*

### Visualization:
*Pre-release Coming in v0.9, No Later Than March 2021*

### Nos3 Interface:
*Planned Feature Coming in v1.1*

### Rendering via Blender:
*Planned Feature Coming in v1.0*



***
## File Structure and Organization
 - `data/`  *Coming Soon*
- `demos/`  A directory containing several demo projects meant to showcase the functionality of this toolbox.
- `docs/`  The collection of html documentation for this toolbox.  *Coming Soon*
- `lib/`  All 3rd party matlab libraries used in this toolbox, with their appropriate licensing.
- `src/`  All of the source files for this toolbox:
    - `actuators/` *Coming Soon*
    - `environment/` 
    - `filtering/`
        - `classes/`
        - `functions/`
    - `measurement/`
    - `simple_models/`
    - `utilities/`
        - `attitude/`
        - `earth_utils/`
        - `math/`
        - `orbits/`
        - `time/`
        - `visualization/`
    - `vehicles/`

***
## Contact
For more information about my research, feel free to checkout my website: [chrisgnam.space](https://www.chrisgnam.space)

For questions on this paper or any other work of mine, please feel free to reach out to my email: [crgnam@buffalo.edu](mailto:crgnam@buffalo.edu)
