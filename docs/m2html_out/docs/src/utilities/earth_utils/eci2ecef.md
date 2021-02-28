[Home](../../../../../index.md) \> [..](#) \> [src](../../../../../documentation.md) \> [utilities](#)
\> [earth_utils](index.md) \> eci2ecef.m



# eci2ecef

## Purpose 

``` 
**A = dcmeci2ecef_codegen(JD,coefs)**
```

## Overview 

``` 
**function rotmat = eci2ecef(jd,coefs)**
```

## Description 

```
 
 A = dcmeci2ecef_codegen(JD,coefs)
 By Benjamin Reifler
 Implements the IAU2000/2006 reduction, partially adapted from MATLAB aero toolbox
 Inputs:   JD (Julian date)
           params
 Outputs:  A (DCM)

```

## Cross-Reference Information 

This function calls:

This function is called by:

   [eci2wgs84](eci2wgs84.md "function lla = eci2wgs84(r, eci2ecef)")
    lla = eci2geodetic(r,JD,coefs)
   [ned2eci](ned2eci.md "function [v_eci] = ned2eci(v_ned, lat, lon, eci2ecef) %# codegen")
    By Benjamin Reifler
   [wgs842eci](wgs842eci.md "function r = wgs842eci(lla, eci2ecef) %# codegen")
    r = geodetic2eci(lla,JD,xCoefs,yCoefs,sCoefs)

## Source Code 

```
    0001 % A = dcmeci2ecef_codegen(JD,coefs)
    0002 % By Benjamin Reifler
    0003 % Implements the IAU2000/2006 reduction, partially adapted from MATLAB aero toolbox
    0004 % Inputs:   JD (Julian date)
    0005 %           params
    0006 % Outputs:  A (DCM)
    0007 
    0008 function rotmat = eci2ecef(jd,coefs)
    0009     % convert JD to modified JD
    0010     jd = jd  2400000.5;
    0011     jd = jd  51544.5;
    0012 
    0013     % precompute powers of t (Julian centuries since epoch)
    0014     t = jd/36525;
    0015     t2 = t*t;
    0016     t3 = t2*t;
    0017     t4 = t3*t;
    0018     t5 = t4*t;
    0019 
    0020     % etc.
    0021     mMoon = 485868.249036 + 1717915923.2178*t + 31.8792*t2 + 0.051635*t3  0.00024470*t4;
    0022     mSun = 1287104.793048 + 129596581.0481*t  0.5532*t2 + 0.000136*t3  0.00001149*t4;
    0023     umMoon = 335779.526232 + 1739527262.8478*t  12.7512*t2  0.001037*t3 + 0.00000417*t4;
    0024     dSun = 1072260.703692 + 1602961601.2090*t  6.3706*t2 + 0.006593*t3  0.00003169*t4;
    0025     omegaMoon = 450160.398036  6962890.5431*t + 7.4722*t2 + 0.007702*t3  0.00005939*t4;
    0026 
    0027     lMercury = 4.402608842 + 2608.7903141574*t;
    0028     lVenus = 3.176146697 + 1021.3285546211*t;
    0029     lEarth = 1.753470314 + 628.3075849991*t;
    0030     lMars = 6.203480913 + 334.06124267*t;
    0031     lJupiter = 0.599546497 + 52.9690962641*t;
    0032     lSaturn = 0.874016757 + 21.329910496*t;
    0033     lUranus = 5.481293872 + 7.4781598567*t;
    0034     lNeptune = 5.311886287 + 3.8133035638*t;
    0035     pa = 0.02438175*t + 0.00000538691*t2;
    0036 
    0037     nutationV = mod([[mMoon; mSun; umMoon; dSun; omegaMoon]/3600*pi/180; lMercury; lVenus; lEarth; lMars; lJupiter; lSaturn; lUranus; lNeptune; pa],2*pi);
    0038 
    0039     X0 = 16617 + 2004191898*t  429782.9*t2  198618.34*t3 + 7.578*t4 + 5.9285*t5;
    0040     Y0 = 6951  25896*t  22407274.7*t2 + 1900.59*t3 + 1112.526*t4 + 0.1358*t5;
    0041 
    0042     S0 = 94 + 3808.65*t  122.68*t2  72574.11*t3 + 27.98*t4 + 15.62*t5;
    0043 
    0044     FX = zeros(length(coefs.X),1);
    0045     FX(1:1306,:) = ones(1306,1);
    0046     FX(1307:1559,:) = repmat(t,[253 1]);
    0047     FX(1560:1595,:) = repmat(t2,[36 1]);
    0048     FX(1596:1599,:) = repmat(t3,[4 1]);
    0049     FX(1600,:) = t4;
    0050     argX = coefs.X(:,4:17)*nutationV;
    0051     X = sum((coefs.X(:,2).*sin(argX(:,1)) + coefs.X(:,3).*cos(argX(:,1))).*FX(:,1));
    0052 
    0053     FY = zeros(length(coefs.Y),1);
    0054     FY(1:962,:) = ones(962,1);
    0055     FY(963:1239,:) = repmat(t,[277 1]);
    0056     FY(1240:1269,:) = repmat(t2,[30 1]);
    0057     FY(1270:1274,:) = repmat(t3,[5 1]);
    0058     FY(1275,:) = t4;
    0059     argY = coefs.Y(:,4:17)*nutationV;
    0060     Y = sum((coefs.Y(:,2).*sin(argY(:,1)) + coefs.Y(:,3).*cos(argY(:,1))).*FY(:,1));
    0061 
    0062     FS = zeros(length(coefs.S),1);
    0063     FS(1:33,:) = ones(33,1);
    0064     FS(34:36,:) = repmat(t,[3 1]);
    0065     FS(37:61,:) = repmat(t2,[25 1]);
    0066     FS(62:65,:) = repmat(t3,[4 1]);
    0067     FS(66,:) = t4;
    0068     argS = coefs.S(:,4:11)*[nutationV(1:5,:);nutationV(7:8,:);nutationV(14,:)];
    0069     S = sum((coefs.S(:,2).*sin(argS(:,1)) + coefs.S(:,3).*cos(argS(:,1))).*FS(:,1));
    0070 
    0071     X = X + X0;
    0072     Y = Y + Y0;
    0073     S = S + S0;
    0074 
    0075     X = X*1e6/3600*pi/180;
    0076     Y = Y*1e6/3600*pi/180;
    0077 
    0078     S = S*1e6/3600*pi/180  X*Y/2;
    0079     E = atan2(Y,X);
    0080     d = atan(sqrt((X.^2+Y.^2)./(1X.^2Y.^2)));
    0081 
    0082     % Exported Nutation Values:
    0083     cQ  = cos(E);
    0084     sQ  = sin(E);
    0085     cQ2 = cos(d);
    0086     sQ2 = sin(d);
    0087     cQ3 = cos(ES);
    0088     sQ3 = sin(ES);
    0089 
    0090     % Exported Polar Motion Values:
    0091     sp = 0.000047*t/3600*pi/180;
    0092     cW = cos(sp);
    0093     sW = sin(sp);
    0094 
    0095     % polar motion and nutation matrices:
    0096     W = [cW sW 0 ; sW cW 0 ; 0 0 1];
    0097     Q = [cQ3 sQ3 0 ; sQ3 cQ3 0 ; 0 0 1]*[cQ2 0 sQ2 ; 0 1 0 ; sQ2 0 cQ2]*[cQ sQ 0 ; sQ cQ 0 ; 0 0 1];
    0098     
    0099     % convert JD to modified JD
    0100     jdf = mod(jd, 1);
    0101 
    0102     % Earth rotation angle
    0103     thetaERA = mod(2*pi*(jdf + 0.7790572732640 + 0.00273781191135448*jd),2*pi);
    0104     cR = cos(thetaERA);
    0105     sR = sin(thetaERA);
    0106     R = [cR sR 0 ; sR cR 0 ; 0 0 1];
    0107     
    0108     % Full Attitude Matrix:
    0109     rotmat = W(:,:,1)*R(:,:,1)*Q(:,:,1);
    0110 end
```



Generated on Sat 27Feb2021 18:48:31 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005