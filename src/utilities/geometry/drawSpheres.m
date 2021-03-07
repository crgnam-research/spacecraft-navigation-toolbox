function [h] = drawSpheres(spheres,varargin)
    %@code{true}
    h = gobjects(sum(spheres(:,end)),1);
    iter = 1;
    for ii = 1: size(spheres,1)
        if spheres(ii,end)
            h(iter) = drawSphere(spheres(ii,1:4),'nPhi',16,'nTheta',8,varargin{:}); hold on
            iter = iter+1;
        end
    end
end