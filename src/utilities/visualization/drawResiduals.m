function [h] = drawResiduals(tspan,x_hat,truth,sig3,dim,YLABELS,XLABELS,TITLE)
    % Validate inputs:
    dim1 = str2double(dim(1));
    dim2 = str2double(dim(2));
    assert(size(x_hat,2) == size(tspan,2),'The length of tspan must be equal to length of x_hat')
    assert(all(size(x_hat) == size(truth)),'The inputs x_hat and truth must be the same size')
    assert(all(size(x_hat) == size(sig3)),'The inputs x_hat and sig3 must be the same size')
    assert(size(x_hat,1) <= dim1*dim2,'Not enough subplots defined for number of states given')
    
    % Generate the plots:
    figure()
    for ii = 1:(dim1*dim2)
        subplot(dim1,dim2,ii)
            plot(tspan,x_hat(ii,:) - truth(ii,:)); hold on
            drawBounds(tspan,sig3)
            grid on
            ylabel(YLABELS{ii});
            xlabel(XLABELS{ii});
    end
    title(TITLE)
end