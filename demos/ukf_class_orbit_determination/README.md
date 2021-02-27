# Performing Orbit Determination with a UKF
## Overview:
This demo illustrates:
- How to create a spherical harmonic gravity field using `GravityField`
- How to create a model of the Earth using `CelestialBody`
- How to create a simple spacecraft using `Spacecraft`
- How to create multiple Earth based ground stations using `GroundStation`
- How to create an orbit determination filter using `UKF`
- How to create a simple visualization of this simulation
- How to plot filter post-fit residuals and their associated error bounds using `drawResiduals`

## Included Data:
- `CIP2006.mat`:  IAU 2006 precession-nutation model
- `egm.mat`: EGM96 spherical harmonic coefficients

## Demo Specific Code:
- `ukf_class_orbit_determination.m`: The demo script
- `ukf_models/ukf_measurement_model.m`: The measurement prediction model used by the UKF to generate predicted measurements via the unscented transform
- `ukf_models/ukf_orbit_model.m`: The dynamics model used by the UKF to propagate both the state estimate and estimation covariances via the unscented transform

## Results:
![Alt text](results/animation.gif?raw=true "Animation")
![Alt text](results/position_errors.png?raw=true "Position Errors")
![Alt text](results/velocity_errors.png?raw=true "Velocity Errors")
![Alt text](results/range_residuals.png?raw=true "Range Post-fit Residuals")
![Alt text](results/doppler_residuals.png?raw=true "Doppler Post-fit Residuals")
