[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [filtering](../filtering_index.md) > [ukf](ukf_index.md)  

 
 # function: u_sigmas



**Inputs:** X_hat, P, alpha, beta, kappa

**Outputs:** SIGMAS, Wm, Wc, L

 ***

## Sub-Functions

*No Sub-Functions*

[*Default Method Attributs*](https://www.mathworks.com/help/matlab/matlab_oop/method-attributes.html)

 ***

## Detailed Description



 ***

## Sub-Function Descriptions

*No Sub-Functions*

 
 *** 

 # Source Code:

 ```matlab 
 % INCLUDECODE>{true}
function [SIGMAS,Wm,Wc,L] = u_sigmas(X_hat,P,alpha,beta,kappa)
    L = size(X_hat,1);

    % Initial calculations:
    lambda = alpha^2*(L + kappa) - L;
    gamma = sqrt(L + lambda);

    % Weights (3.259):
    Wm = [lambda/(L+lambda), 1/(2*(L+lambda)) + zeros(1,2*L)]; %Mean
    Wc = Wm;
    Wc(1) = Wc(1) + (1 - (alpha^2) + beta); %Covariance
    
    % Calculate matrix square root via Choleksy Decomposition:
    sig = gamma*chol(P)';

    % Generate set of sigma points, with estimate as mean (3.253):
    SIGMAS = [X_hat, X_hat(:, ones(1,L))+sig, X_hat(:, ones(1,L))-sig];
end 
 ``` 
  
 ***

*Generated on 02-Mar-2021 00:52:50 by [m2md](https://github.com/crgnam-research/m2md) © 2021*