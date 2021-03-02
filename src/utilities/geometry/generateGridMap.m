% INCLUDECODE>{true}
function [longitude,latitude,r] = generateGridMap(num_long,num_lat,rho)
    longitude = linspace(-pi,pi,num_long)';
    latitude = linspace(-pi/2,pi/2,num_lat)';
    r = zeros(length(longitude),length(latitude),3);
    for ii = 1:length(longitude)
        for jj = 1:length(latitude)
            [x,y,z] = sph2cart(longitude(ii),latitude(jj),rho);
            r(ii,jj,:) = [x;y;z];
        end
    end
    [latitude,longitude] = meshgrid(latitude,longitude);
end