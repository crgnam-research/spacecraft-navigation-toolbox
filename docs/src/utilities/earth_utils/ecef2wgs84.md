[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [earth_utils](earth_utils_index.md)  


# function: ecef2wgs84



**Inputs:** r

**Outputs:** lla

 ***

## Sub-Functions

*No Sub-Functions*

 ***

## Detailed Description



 ***

## Sub-Function Descriptions

*No Sub-Functions*

 
 *** 

# Source Code:

 ```matlab 
 function lla = ecef2wgs84(r)
    %@code{true}
    % preallocate
    lla = zeros(3,1);

    % calculate
    a = 6378.1370;              % REquator
    b = 6356.7523142;           % RPole
    e = 0.081819190928905;      % sqrt(1 - b^2/a^2)
    eps = 0.082094438036852;    % sqrt(a^2/b^2 - 1)
    rho = sqrt(r(1)^2 + r(2)^2);
    p = abs(r(3))/eps^2;
    s = rho^2/(e^2*eps^2);
    q = p^2 - b^2 + s;
    u = p/sqrt(q);
    v = b^2*u^2/q;
    P = 27*v*s/q;
    Q = (sqrt(P + 1) + sqrt(P))^(2/3);
    t = (1 + Q + 1/Q)/6;
    c = sqrt(u^2 - 1 + 2*t);
    w = (c - u)/2;

    % NEED TO INCLUDE abs() CALL HERE TO KEEP FROM GOING IMAGINARY WHEN r(3)~0
    X = abs(sqrt(t^2 + v) - u*w - t/2 - 0.25);
    d = sign(r(3))*sqrt(q)*(w + sqrt(X));
    N = a*sqrt(1 + eps^2*d^2/b^2);
    lla(1) = asind((eps^2 + 1)*d/N);
    lla(2) = atan2(r(2), r(1))*180/pi;
    lla(3) = rho*cosd(lla(1)) + r(3)*sind(lla(1)) - a^2/N;
end 
``` 
 
***

*Generated on 05-Mar-2021 16:40:50 by [m2docs](https://github.com/crgnam-research/m2docs) © 2021*
