function [h] = drawCubes(cubes,varargin)
    %@code{true}
    % Extract locations and dimensions of each sphere:
    h = gobjects(sum(cubes(:,end)),1);
    iter = 1;
    for ii = 1: size(cubes,1)
        if cubes(ii,end)
            h(iter) = drawCube(cubes(ii,1:4),varargin{:}); hold on
            iter = iter+1;
        end
    end
end