[Home](../../../index.md) > [docs](../../../docs_index.md) > [src](../../src_index.md) > [utilities](../utilities_index.md) > [visualization](visualization_index.md)  


# function: drawResiduals



**Inputs:** dim1, dim2, tspan, x_hat, truth, sig3, varargin

**Outputs:** h

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
 function [h] = drawResiduals(dim1,dim2,tspan,x_hat,truth,sig3,varargin)
    %@code{true}
    % Validate inputs:
    assert(size(x_hat,2) == size(tspan,2),'The length of tspan must be equal to length of x_hat')
    assert(all(size(x_hat) == size(truth)),'The inputs x_hat and truth must be the same size')
    assert(all(size(x_hat) == size(sig3)),'The inputs x_hat and sig3 must be the same size')
    assert(size(x_hat,1) <= dim1*dim2,'Not enough subplots defined for number of states given')
    
    % Generate the plots:
    h = cell(dim1*dim2,1);
    for ii = 1:(dim1*dim2)
        h{ii} = subplot(dim1,dim2,ii);
                    plot(tspan,x_hat(ii,:) - truth(ii,:),varargin{:}); hold on
                    drawBounds(tspan,sig3(ii,:)/3)
                    xlim([0 inf]); grid on
    end
end 
``` 
 
***

*Generated on 03-Mar-2021 23:38:27 by [m2docs](https://github.com/crgnam-research/m2docs) © 2021*
