function [predicted_measurement] = ukf_measurement_model(~,X,earth_angularRate,gs1,gs2,gs3,avails)
    
    r = X(1:3);
    v = X(4:6);
    
    % Calculate predicted range measurements:
    [ray1,range1] = normc(r-gs1.position_frame);
    [ray2,range2] = normc(r-gs2.position_frame);
    [ray3,range3] = normc(r-gs3.position_frame);
    
    % Calculate the doppler measurements:
    v_rel = v - cross(earth_angularRate,gs1.position_frame);
    range_rate = scalarProjection(v_rel,ray1);
    doppler1 = (1 + range_rate/299792458)*gs1.frequency;
    
    v_rel = v - cross(earth_angularRate,gs2.position_frame);
    range_rate = scalarProjection(v_rel,ray2);
    doppler2 = (1 + range_rate/299792458)*gs2.frequency;
    
    v_rel = v - cross(earth_angularRate,gs3.position_frame);
    range_rate = scalarProjection(v_rel,ray3);
    doppler3 = (1 + range_rate/299792458)*gs3.frequency;

    
    % Format the predicted measurements:
    predicted_measurement = [range1;range2;range3;doppler1;doppler2;doppler3];
    
    % Only return the measurements that are actually available:
    predicted_measurement = predicted_measurement(avails);
end