[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [misc](misc_index.md)  

 
 # function: vec2coeffs



**Inputs:** Cnm_Snm_vec

**Outputs:** Cnm, Snm

 ***

## Sub-Functions

| Function | Inputs | Outputs | Brief Description |
| -------- | ------ | ------- | ----------------- |
| [eval](#eval) | n | val |  |


[*Default Method Attributs*](https://www.mathworks.com/help/matlab/matlab_oop/method-attributes.html)

 ***

## Detailed Description



 ***

## Sub-Function Descriptions

### eval

**[val] = eval(n)**

DESCRIPTION: 


 
 *** 

# Source Code:

 ```matlab 
 % INCLUDECODE>{true}
function [Cnm,Snm] = vec2coeffs(Cnm_Snm_vec)
    % Calculate size of the Cnm coefficient matrix:
    L = size(Cnm_Snm_vec,1);
    for ii = 1:2000
        if L == eval(ii)
            N = ii+1;
            break
        end
    end
    Cnm = zeros(N);
    Snm = zeros(N);
    
    % Split appropriately:
    num_Snm = (L-N)/2 + 1;
    num_Cnm = L - num_Snm;
    Cnm_vec = Cnm_Snm_vec(1:num_Cnm);
    Snm_vec = Cnm_Snm_vec(num_Cnm+1:end);

    % Scale factor to try to maintain numerical stability:   
    kk = 1;
    for ii = 3:N
       for jj = 1:ii
          Cnm(ii,jj) = Cnm_vec(kk);
          kk = kk+1;
       end
    end
    Cnm(1) = 1;
    
    kk = 1;
    for ii = 3:N
        for jj = 2:ii
            Snm(ii,jj) = Snm_vec(kk);
            kk = kk+1;
        end
    end
end

% Function to get the appropriate size (guess and check is best approach
% for now):
function [val] = eval(n)
    step = 5;
    val = 0;
    for ii = 1:n-1
        val = val+step;
        step = step+2;
    end
end 
 ``` 
  
 ***

*Generated on 02-Mar-2021 01:01:24 by [m2md](https://github.com/crgnam-research/m2md) © 2021*