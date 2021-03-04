[Home](../../index.md) > [docs](../../docs_index.md) > [src](../src_index.md) > [environment](environment_index.md)  


# classdef: GravityField

**SuperClasses:** handle



 ***

## Class Attributes

| Attribute         | Status   | 
| ----------------- | -------- | 
| Abstract | false | 
| ConstructOnLoad | false | 
| HandleCompatible | true | 
| Hidden | false | 
| Sealed | false | 


[*Default Class Attributes*](https://www.mathworks.com/help/matlab/matlab_oop/class-attributes.html)

 ***

## Properties

| Property | Attributes  | Type | Default Value | Description |
| -------- | ----------- | ---- | ------------- | ----------- |
| mu |   |  |  | (m^3/s^2) |
| Cnm |   |  |  |  |
| Snm |   |  |  |  |
| ref_radius |   |  |  | (m) |
| defaultMethod |   |  |  |  |
| G |   |  | 6.6743e-11 |  |
| spheres |   |  |  |  |
| cubes |   |  |  |  |
| polygons |   |  |  |  |

[*Default Property Attributes*](https://www.mathworks.com/help/matlab/matlab_oop/property-attributes.html)

 ***

## Methods

| Method | Attributes | Inputs | Outputs | Brief Description |
| ------ | ---------- | ------ | ------- | ----------------- |
| [GravityField](#gravityfield) |   | fieldType, varargin | self |  |
| [generateSphHarm](#generatesphharm) |   | self, N, M, ref_radius, truthType, options |  |  |
| [batchAcceleration](#batchacceleration) |   | self, r, rotmat, varargin | accel, accel_mag |  |
| [accelSphHarm](#accelsphharm) |   | self, r, rotmat | accel_vec, accel_mag |  |
| [accelFiniteSphere](#accelfinitesphere) |   | self, r, rotmat | accel_vec, accel_mag |  |
| [acceleration](#acceleration) |   | self, r, rotmat, method | accel |  |
| [cost](#cost) | Access = private | self, x, accel_ref, r | eval |  |
| [Legendre](#legendre) | Access = private | ~, n, m, fi | pnm, dpnm |  |


[*Default Method Attributs*](https://www.mathworks.com/help/matlab/matlab_oop/method-attributes.html)

 ***

## Detailed Description



 ***

## Method Descriptions

### GravityField

```matlab
function [self] = GravityField(fieldType, varargin)
```

### generateSphHarm

```matlab
function [] = generateSphHarm(self, N, M, ref_radius, truthType, options)
```

### batchAcceleration

```matlab
function [accel, accel_mag] = batchAcceleration(self, r, rotmat, varargin)
```

### accelSphHarm

```matlab
function [accel_vec, accel_mag] = accelSphHarm(self, r, rotmat)
```

### accelFiniteSphere

```matlab
function [accel_vec, accel_mag] = accelFiniteSphere(self, r, rotmat)
```

### acceleration

```matlab
function [accel] = acceleration(self, r, rotmat, method)
```

### cost

```matlab
function [eval] = cost(self, x, accel_ref, r)
```

### Legendre

```matlab
function [pnm, dpnm] = Legendre(~, n, m, fi)
```



 
 *** 

# Source Code:

 ```matlab 
 classdef GravityField < handle
    %@code{true}
    properties
        % Sphere harmonic model:
        mu  %(m^3/s^2)
        Cnm %
        Snm %
        ref_radius % (m)
        
        defaultMethod
        
        % Gravitational Constant:
        G = 6.67430*10^-11;
        
        % Finite sphere model:
        spheres
        
        % Finite cube model:
        cubes
        
        % Polygon model:
        polygons
    end
    
    %% Constructor 
    methods
        function [self] = GravityField(fieldType,varargin)
            switch lower(fieldType)
                case 'sphharm'
                    self.ref_radius   = varargin{1};
                    self.mu  = varargin{2};
                    self.Cnm = varargin{3};
                    self.Snm = varargin{4};
                    self.defaultMethod = 'SphHarm';
                case 'finitesphere'
                    self.spheres = varargin{1};
                    self.mu = self.G*sum(self.spheres(:,end));
                    self.defaultMethod = 'FiniteSphere';
                case 'finitecube'
                    error('NOT YET IMPLEMENTED')
                case 'polygon'
                    error('NOT YET IMPLEMENTED')
                otherwise
                    error(['No valid field type was provided.  Must be one of:\n',...
                           'SphHarm | FiniteSphere | FiniteCube | Polygon'])
            end
        end
    end
    
    %% Public Methods
    methods (Access = public)
        % Calculate the acceleration:
        function [accel] = acceleration(self,r,rotmat,method)
            if nargin == 3
                method = self.defaultMethod;
            end
            
            switch lower(method)
                case 'sphharm'
                    accel = accelSphHarm(self,r,rotmat);
                case 'finitesphere'
                    accel = accelFiniteSphere(self,r,rotmat);
                case 'finitecube'
                    error('NOT YET IMPLEMENTED')
                case 'polygon'
                    error('NOT YET IMPLEMENTED')
                otherwise
                    error(['Invalid Option for Gravity Model.  Must be one of:\n',...
                           '    SphHarm | FiniteSphere | FiniteCube | Polygon'])
            end
        end
        
        % Calculate acceleration for a finite sphere model:
        function [accel_vec,accel_mag] = accelFiniteSphere(self,r,rotmat)
            % Calculate relative position to all test masses:
            r_rel = self.spheres(:,1:3) - (rotmat*r)';
            m = self.spheres(:,end);
            [r_rel_u, r_rel_mag] = normr(r_rel);

            % Acceleration due to gravity:
            accel_vec = rotmat'*(self.G*(sum(m.*r_rel_u./(r_rel_mag.^2),1)))';
            accel_mag = norm(accel_vec);
        end
        
        % Calculate acceleration for a spherical harmonic model:
        function [accel_vec,accel_mag] = accelSphHarm(self, r, rotmat)               
            % Body-fixed position 
            r_bf = rotmat*r;
            
            % Calculate nmax values:
            n_max = size(self.Cnm,1)-1;
            m_max = n_max-1;

            % Auxiliary quantities
            d = norm(r_bf);
            latgc = asin(r_bf(3)/d);
            lon = atan2(r_bf(2),r_bf(1));

            [pnm, dpnm] = self.Legendre(n_max, m_max, latgc);

            dUdr = 0;
            dUdlatgc = 0;
            dUdlon = 0;
            q3 = 0; q2 = q3; q1 = q2;
            for n = 0:n_max
                b1 = (-self.mu/d^2)*(self.ref_radius/d)^n*(n+1);
                b2 =  (self.mu/d)*(self.ref_radius/d)^n;
                b3 =  (self.mu/d)*(self.ref_radius/d)^n;
                for m = 0:n
                    q1 = q1 + pnm(n+1,m+1)*(self.Cnm(n+1,m+1)*cos(m*lon)+self.Snm(n+1,m+1)*sin(m*lon));
                    q2 = q2 + dpnm(n+1,m+1)*(self.Cnm(n+1,m+1)*cos(m*lon)+self.Snm(n+1,m+1)*sin(m*lon));
                    q3 = q3 + m*pnm(n+1,m+1)*(self.Snm(n+1,m+1)*cos(m*lon)-self.Cnm(n+1,m+1)*sin(m*lon));
                end
                dUdr     = dUdr     + q1*b1;
                dUdlatgc = dUdlatgc + q2*b2;
                dUdlon   = dUdlon   + q3*b3;
                q3 = 0; q2 = q3; q1 = q2;
            end

            % Body-fixed acceleration
            r2xy = r_bf(1)^2+r_bf(2)^2;

            ax = (1/d*dUdr-r_bf(3)/(d^2*sqrt(r2xy))*dUdlatgc)*r_bf(1)-(1/r2xy*dUdlon)*r_bf(2);
            ay = (1/d*dUdr-r_bf(3)/(d^2*sqrt(r2xy))*dUdlatgc)*r_bf(2)+(1/r2xy*dUdlon)*r_bf(1);
            az =  1/d*dUdr*r_bf(3)+sqrt(r2xy)/d^2*dUdlatgc;

            a_bf = [ax ay az]';

            % Inertial acceleration 
            accel_vec = rotmat'*a_bf;
            accel_mag = norm(accel_vec);
        end
        
        % Get Acceleration Field:
        function [accel,accel_mag] = batchAcceleration(self,r,rotmat,varargin)
            % Evaluate the field for specified test point:
            accel = zeros(size(r));
            if size(r,3) == 3
                for ii = 1:size(r,1)
                    for jj = 1:size(r,2)
                        accel(ii,jj,:) = self.acceleration(squeeze(r(ii,jj,:)), rotmat, varargin{:});
                    end
                end
            else
                if size(r,2) == 3
                    r = r';
                    accel = accel';
                end
                for ii = 1:size(r,2)
                    accel(:,ii) = self.acceleration(r(:,ii), rotmat, varargin{:});
                end
            end
            
            % Calculate the magnitude of each field location:
            [~,accel_mag] = normw(accel);
        end
        
        % Generate a spherical harmonic model from a provided finite
        % sphere/cube/polygon model:
        function [] = generateSphHarm(self,N,M,ref_radius,truthType,options)
            self.ref_radius = ref_radius;
                               
            % Initialize Coefficients based on defined input dimensions:
            [Cnm_vec, Snm_vec] = coeffs2vec(zeros(N+1),zeros(M+1));
            num_coeffs = length(Cnm_vec)+length(Snm_vec);
            x0 = zeros(num_coeffs, 1);
            
            % Generate the set of test points:
            v = icosphere(3); % Icosphere used as it is unbiased
            scale = 2*max(max(abs(self.spheres(:,1:3))));
            r = scale*v.Vertices;

            % Obtain the truth field to be fit:
            accel_truth = self.batchAcceleration(r,eye(3),truthType);
            
            % Run optimization for whichever model was provided:
            x_out = fmincon(@(x) self.cost(x,accel_truth,r), x0,...
                            [],[],[],[],[],[],[],options);
            [self.Cnm, self.Snm] = vec2coeffs(x_out);
        end
    end
    
    %% Public Visualization Methods:
    methods (Access = public)

    end
    
    %% Private Methods:
    methods (Access = private)
        function [pnm, dpnm] = Legendre(~,n,m,fi)
            pnm = zeros(n+1,m+1);
            dpnm = zeros(n+1,m+1);

            pnm(1,1)=1;
            dpnm(1,1)=0;
            pnm(2,2)=sqrt(3)*cos(fi);
            dpnm(2,2)=-sqrt(3)*sin(fi);
            % diagonal coefficients
            for i=2:n    
                pnm(i+1,i+1)= sqrt((2*i+1)/(2*i))*cos(fi)*pnm(i,i);
            end
            for i=2:n
                dpnm(i+1,i+1)= sqrt((2*i+1)/(2*i))*((cos(fi)*dpnm(i,i))- ...
                              (sin(fi)*pnm(i,i)));
            end
            % horizontal first step coefficients
            for i=1:n
                pnm(i+1,i)= sqrt(2*i+1)*sin(fi)*pnm(i,i);
            end
            for i=1:n
                dpnm(i+1,i)= sqrt(2*i+1)*((cos(fi)*pnm(i,i))+(sin(fi)*dpnm(i,i)));
            end
            % horizontal second step coefficients
            j=0;
            k=2;
            while(1)
                for i=k:n        
                    pnm(i+1,j+1)=sqrt((2*i+1)/((i-j)*(i+j)))*((sqrt(2*i-1)*sin(fi)*pnm(i,j+1))...
                        -(sqrt(((i+j-1)*(i-j-1))/(2*i-3))*pnm(i-1,j+1)));
                end
                j = j+1;
                k = k+1;
                if (j>m)
                    break
                end
            end
            j = 0;
            k = 2;
            while(1)
                for i=k:n        
                    dpnm(i+1,j+1)=sqrt((2*i+1)/((i-j)*(i+j)))*((sqrt(2*i-1)*sin(fi)*dpnm(i,j+1))...
                         +(sqrt(2*i-1)*cos(fi)*pnm(i,j+1))-(sqrt(((i+j-1)*(i-j-1))/(2*i-3))*dpnm(i-1,j+1)));
                end
                j = j+1;
                k = k+1;
                if (j>m)
                    break
                end
            end
        end
        
        % Cost function for fitting spherical harmonic field:
        function [eval] = cost(self,x,accel_ref,r)
            % Unpack spherical harmonic components and store:
            [self.Cnm, self.Snm] = vec2coeffs(x);

            % Evaluate the current field:
            [accel,~] = self.batchAcceleration(r,eye(3),'SphHarm');
            
            % Remove nans (numerical issues) TODO: Fix whatever is causing
            % them
            remove = sum(isnan(accel),1) > 0;
            accel_ref(:,remove) = [];
            accel(:,remove) = [];

            % Calculate cost:
            max_accel = max(max(accel));
            max_accel_ref = max(max(accel_ref));
            [~,n] = normc(accel/max_accel - accel_ref/max_accel_ref);
            eval = norm(n(:));
            
%             disp(Cnm_est)
%             disp(eval)
        end 
    end
end 
``` 
 
***

*Generated on 04-Mar-2021 00:18:22 by [m2docs](https://github.com/crgnam-research/m2docs) © 2021*
