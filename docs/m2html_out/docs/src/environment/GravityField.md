[Home](../../../../index.md) \> [..](#) \> [src](../../../../documentation.md) \>
[environment](index.md) \> GravityField.m



# GravityField

## Purpose 

``` 
```

## Overview 

``` 
**This is a script file.**
```

## Description 

```
 

```

## Cross-Reference Information 

This function calls:

   [GravityField](GravityField.md)

This function is called by:

   [GravityField](GravityField.md)

## Sub-functions 

   [function \[self\] =
    GravityField(fieldType,varargin)](#_sub1)
   [function \[accel\] =
    acceleration(self,r,rotmat,method)](#_sub2)
   [function \[accel_vec,accel_mag\] =
    accelFiniteSphere(self,r,rotmat)](#_sub3)
   [function \[accel_vec,accel_mag\] = accelSphHarm(self, r,
    rotmat)](#_sub4)
   [function \[accel,accel_mag\] =
    batchAcceleration(self,r,rotmat,varargin)](#_sub5)
   [function \[\] =
    generateSphHarm(self,N,M,ref_radius,truthType,options)](#_sub6)
   [function \[pnm, dpnm\] = Legendre(\~,n,m,fi)](#_sub7)
   [function \[eval\] = cost(self,x,accel_ref,r)](#_sub8)

## Source Code 

```
    0001 classdef GravityField < handle
    0002     properties
    0003         % Sphere harmonic model:
    0004         mu  %(m^3/s^2)
    0005         Cnm %
    0006         Snm %
    0007         ref_radius % (m)
    0008         
    0009         defaultMethod
    0010         
    0011         % Gravitational Constant:
    0012         G = 6.67430*10^11;
    0013         
    0014         % Finite sphere model:
    0015         spheres
    0016         
    0017         % Finite cube model:
    0018         cubes
    0019         
    0020         % Polygon model:
    0021         polygons
    0022     end
    0023     
    0024     %% Constructor
    0025     methods
    0026         function [self] = GravityField(fieldType,varargin)
    0027             switch lower(fieldType)
    0028                 case 'sphharm'
    0029                     self.ref_radius   = varargin{1};
    0030                     self.mu  = varargin{2};
    0031                     self.Cnm = varargin{3};
    0032                     self.Snm = varargin{4};
    0033                     self.defaultMethod = 'SphHarm';
    0034                 case 'finitesphere'
    0035                     self.spheres = varargin{1};
    0036                     self.mu = self.G*sum(self.spheres(:,end));
    0037                     self.defaultMethod = 'FiniteSphere';
    0038                 case 'finitecube'
    0039                     error('NOT YET IMPLEMENTED')
    0040                 case 'polygon'
    0041                     error('NOT YET IMPLEMENTED')
    0042                 otherwise
    0043                     error(['No valid field type was provided.  Must be one of:\n',...
    0044                            'SphHarm | FiniteSphere | FiniteCube | Polygon'])
    0045             end
    0046         end
    0047     end
    0048     
    0049     %% Public Methods
    0050     methods (Access = public)
    0051         % Calculate the acceleration:
    0052         function [accel] = acceleration(self,r,rotmat,method)
    0053             if nargin == 3
    0054                 method = self.defaultMethod;
    0055             end
    0056             
    0057             switch lower(method)
    0058                 case 'sphharm'
    0059                     accel = accelSphHarm(self,r,rotmat);
    0060                 case 'finitesphere'
    0061                     accel = accelFiniteSphere(self,r,rotmat);
    0062                 case 'finitecube'
    0063                     error('NOT YET IMPLEMENTED')
    0064                 case 'polygon'
    0065                     error('NOT YET IMPLEMENTED')
    0066                 otherwise
    0067                     error(['Invalid Option for Gravity Model.  Must be one of:\n',...
    0068                            '    SphHarm | FiniteSphere | FiniteCube | Polygon'])
    0069             end
    0070         end
    0071         
    0072         % Calculate acceleration for a finite sphere model:
    0073         function [accel_vec,accel_mag] = accelFiniteSphere(self,r,rotmat)
    0074             % Calculate relative position to all test masses:
    0075             r_rel = self.spheres(:,1:3)  (rotmat*r)';
    0076             m = self.spheres(:,end);
    0077             [r_rel_u, r_rel_mag] = normr(r_rel);
    0078 
    0079             % Acceleration due to gravity:
    0080             accel_vec = rotmat'*(self.G*(sum(m.*r_rel_u./(r_rel_mag.^2),1)))';
    0081             accel_mag = norm(accel_vec);
    0082         end
    0083         
    0084         % Calculate acceleration for a spherical harmonic model:
    0085         function [accel_vec,accel_mag] = accelSphHarm(self, r, rotmat)               
    0086             % Bodyfixed position
    0087             r_bf = rotmat*r;
    0088             
    0089             % Calculate nmax values:
    0090             n_max = size(self.Cnm,1)1;
    0091             m_max = n_max1;
    0092 
    0093             % Auxiliary quantities
    0094             d = norm(r_bf);
    0095             latgc = asin(r_bf(3)/d);
    0096             lon = atan2(r_bf(2),r_bf(1));
    0097 
    0098             [pnm, dpnm] = self.Legendre(n_max, m_max, latgc);
    0099 
    0100             dUdr = 0;
    0101             dUdlatgc = 0;
    0102             dUdlon = 0;
    0103             q3 = 0; q2 = q3; q1 = q2;
    0104             for n = 0:n_max
    0105                 b1 = (self.mu/d^2)*(self.ref_radius/d)^n*(n+1);
    0106                 b2 =  (self.mu/d)*(self.ref_radius/d)^n;
    0107                 b3 =  (self.mu/d)*(self.ref_radius/d)^n;
    0108                 for m = 0:n
    0109                     q1 = q1 + pnm(n+1,m+1)*(self.Cnm(n+1,m+1)*cos(m*lon)+self.Snm(n+1,m+1)*sin(m*lon));
    0110                     q2 = q2 + dpnm(n+1,m+1)*(self.Cnm(n+1,m+1)*cos(m*lon)+self.Snm(n+1,m+1)*sin(m*lon));
    0111                     q3 = q3 + m*pnm(n+1,m+1)*(self.Snm(n+1,m+1)*cos(m*lon)self.Cnm(n+1,m+1)*sin(m*lon));
    0112                 end
    0113                 dUdr     = dUdr     + q1*b1;
    0114                 dUdlatgc = dUdlatgc + q2*b2;
    0115                 dUdlon   = dUdlon   + q3*b3;
    0116                 q3 = 0; q2 = q3; q1 = q2;
    0117             end
    0118 
    0119             % Bodyfixed acceleration
    0120             r2xy = r_bf(1)^2+r_bf(2)^2;
    0121 
    0122             ax = (1/d*dUdrr_bf(3)/(d^2*sqrt(r2xy))*dUdlatgc)*r_bf(1)(1/r2xy*dUdlon)*r_bf(2);
    0123             ay = (1/d*dUdrr_bf(3)/(d^2*sqrt(r2xy))*dUdlatgc)*r_bf(2)+(1/r2xy*dUdlon)*r_bf(1);
    0124             az =  1/d*dUdr*r_bf(3)+sqrt(r2xy)/d^2*dUdlatgc;
    0125 
    0126             a_bf = [ax ay az]';
    0127 
    0128             % Inertial acceleration
    0129             accel_vec = rotmat'*a_bf;
    0130             accel_mag = norm(accel_vec);
    0131         end
    0132         
    0133         % Get Acceleration Field:
    0134         function [accel,accel_mag] = batchAcceleration(self,r,rotmat,varargin)
    0135             % Evaluate the field for specified test point:
    0136             accel = zeros(size(r));
    0137             if size(r,3) == 3
    0138                 for ii = 1:size(r,1)
    0139                     for jj = 1:size(r,2)
    0140                         accel(ii,jj,:) = self.acceleration(squeeze(r(ii,jj,:)), rotmat, varargin{:});
    0141                     end
    0142                 end
    0143             else
    0144                 if size(r,2) == 3
    0145                     r = r';
    0146                     accel = accel';
    0147                 end
    0148                 for ii = 1:size(r,2)
    0149                     accel(:,ii) = self.acceleration(r(:,ii), rotmat, varargin{:});
    0150                 end
    0151             end
    0152             
    0153             % Calculate the magnitude of each field location:
    0154             [~,accel_mag] = normw(accel);
    0155         end
    0156         
    0157         % Generate a spherical harmonic model from a provided finite
    0158         % sphere/cube/polygon model:
    0159         function [] = generateSphHarm(self,N,M,ref_radius,truthType,options)
    0160             self.ref_radius = ref_radius;
    0161                                
    0162             % Initialize Coefficients based on defined input dimensions:
    0163             [Cnm_vec, Snm_vec] = coeffs2vec(zeros(N+1),zeros(M+1));
    0164             num_coeffs = length(Cnm_vec)+length(Snm_vec);
    0165             x0 = zeros(num_coeffs, 1);
    0166             
    0167             % Generate the set of test points:
    0168             v = icosphere(3); % Icosphere used as it is unbiased
    0169             scale = 2*max(max(abs(self.spheres(:,1:3))));
    0170             r = scale*v.Vertices;
    0171 
    0172             % Obtain the truth field to be fit:
    0173             accel_truth = self.batchAcceleration(r,eye(3),truthType);
    0174             
    0175             % Run optimization for whichever model was provided:
    0176             x_out = fmincon(@(x) self.cost(x,accel_truth,r), x0,...
    0177                             [],[],[],[],[],[],[],options);
    0178             [self.Cnm, self.Snm] = vec2coeffs(x_out);
    0179         end
    0180     end
    0181     
    0182     %% Public Visualization Methods:
    0183     methods (Access = public)
    0184 
    0185     end
    0186     
    0187     %% Private Methods:
    0188     methods (Access = private)
    0189         function [pnm, dpnm] = Legendre(~,n,m,fi)
    0190             pnm = zeros(n+1,m+1);
    0191             dpnm = zeros(n+1,m+1);
    0192 
    0193             pnm(1,1)=1;
    0194             dpnm(1,1)=0;
    0195             pnm(2,2)=sqrt(3)*cos(fi);
    0196             dpnm(2,2)=sqrt(3)*sin(fi);
    0197             % diagonal coefficients
    0198             for i=2:n    
    0199                 pnm(i+1,i+1)= sqrt((2*i+1)/(2*i))*cos(fi)*pnm(i,i);
    0200             end
    0201             for i=2:n
    0202                 dpnm(i+1,i+1)= sqrt((2*i+1)/(2*i))*((cos(fi)*dpnm(i,i)) ...
    0203                               (sin(fi)*pnm(i,i)));
    0204             end
    0205             % horizontal first step coefficients
    0206             for i=1:n
    0207                 pnm(i+1,i)= sqrt(2*i+1)*sin(fi)*pnm(i,i);
    0208             end
    0209             for i=1:n
    0210                 dpnm(i+1,i)= sqrt(2*i+1)*((cos(fi)*pnm(i,i))+(sin(fi)*dpnm(i,i)));
    0211             end
    0212             % horizontal second step coefficients
    0213             j=0;
    0214             k=2;
    0215             while(1)
    0216                 for i=k:n        
    0217                     pnm(i+1,j+1)=sqrt((2*i+1)/((ij)*(i+j)))*((sqrt(2*i1)*sin(fi)*pnm(i,j+1))...
    0218                         (sqrt(((i+j1)*(ij1))/(2*i3))*pnm(i1,j+1)));
    0219                 end
    0220                 j = j+1;
    0221                 k = k+1;
    0222                 if (j>m)
    0223                     break
    0224                 end
    0225             end
    0226             j = 0;
    0227             k = 2;
    0228             while(1)
    0229                 for i=k:n        
    0230                     dpnm(i+1,j+1)=sqrt((2*i+1)/((ij)*(i+j)))*((sqrt(2*i1)*sin(fi)*dpnm(i,j+1))...
    0231                          +(sqrt(2*i1)*cos(fi)*pnm(i,j+1))(sqrt(((i+j1)*(ij1))/(2*i3))*dpnm(i1,j+1)));
    0232                 end
    0233                 j = j+1;
    0234                 k = k+1;
    0235                 if (j>m)
    0236                     break
    0237                 end
    0238             end
    0239         end
    0240         
    0241         % Cost function for fitting spherical harmonic field:
    0242         function [eval] = cost(self,x,accel_ref,r)
    0243             % Unpack spherical harmonic components and store:
    0244             [self.Cnm, self.Snm] = vec2coeffs(x);
    0245 
    0246             % Evaluate the current field:
    0247             [accel,~] = self.batchAcceleration(r,eye(3),'SphHarm');
    0248             
    0249             % Remove nans (numerical issues) TODO: Fix whatever is causing
    0250             % them
    0251             remove = sum(isnan(accel),1) > 0;
    0252             accel_ref(:,remove) = [];
    0253             accel(:,remove) = [];
    0254 
    0255             % Calculate cost:
    0256             max_accel = max(max(accel));
    0257             max_accel_ref = max(max(accel_ref));
    0258             [~,n] = normc(accel/max_accel  accel_ref/max_accel_ref);
    0259             eval = norm(n(:));
    0260             
    0261 %             disp(Cnm_est)
    0262 %             disp(eval)
    0263         end 
    0264     end
    0265 end
```



Generated on Sat 27Feb2021 18:48:31 by
**[m2html](http://www.artefact.tk/software/matlab/m2html/ "Matlab Documentation in HTML")**
© 2005