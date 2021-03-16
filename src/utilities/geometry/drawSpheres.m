function [h] = drawSpheres(spheres,varargin)
    %@code{true}
    h = gobjects(sum(spheres.shell),1);
    iter = 1;
    for ii = 1: size(spheres.locs,1)
        if spheres.shell(ii)
            h(iter) = drawSphere([spheres.locs(ii,:),spheres.radii(ii)],'nPhi',16,'nTheta',8,varargin{:}); hold on
            iter = iter+1;
        end
    end
end