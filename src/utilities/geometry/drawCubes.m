function [h] = drawCubes(cubes,varargin)
    %@code{true}
    % Extract locations and dimensions of each sphere:
    h = gobjects(sum(cubes.shell),1);
    iter = 1;
    for ii = 1: size(cubes.locs,1)
        if cubes.shell(ii)
            h(iter) = drawCube([cubes.locs(ii,:),cubes.dim(ii)],varargin{:}); hold on
            iter = iter+1;
        end
    end
end