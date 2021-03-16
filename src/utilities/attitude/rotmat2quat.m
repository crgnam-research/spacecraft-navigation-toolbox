function q = rotmat2quat(rotmat)
    A1 = rotmat(1,1);
    A2 = rotmat(2,2);
    A3 = rotmat(3,3);

    q = zeros(4,1);

    q(4) = sqrt(.25*(1+trace(rotmat)));
    q(1) = sqrt(.25*(1+A1-A2-A3));
    q(2) = sqrt(.25*(1-A1+A2-A3));
    q(3) = sqrt(.25*(1-A1-A2+A3));

    qmax = max(q(q==real(q)));

    if qmax == q(1)
        q(1) = q(1);
        q(2) = (rotmat(1,2)+rotmat(2,1))/(4*q(1));
        q(3) = (rotmat(3,1)+rotmat(1,3))/(4*q(1));
        q(4) = (rotmat(2,3)-rotmat(3,2))/(4*q(1));

    elseif qmax == q(2)
        q(1) = (rotmat(1,2)+rotmat(2,1))/(4*q(2));
        q(2) = q(2);
        q(3) = (rotmat(2,3)+rotmat(3,2))/(4*q(2));
        q(4) = (rotmat(3,1)-rotmat(1,3))/(4*q(2));

    elseif qmax == q(3)
        q(1) = (rotmat(3,1)+rotmat(1,3))/(4*q(3));
        q(2) = (rotmat(2,3)+rotmat(3,2))/(4*q(3));
        q(3) = q(3);
        q(4) = (rotmat(1,2)-rotmat(2,1))/(4*q(3));

    elseif qmax == q(4)
        q(1) = (rotmat(2,3)-rotmat(3,2))/(4*q(4));
        q(2) = (rotmat(3,1)-rotmat(1,3))/(4*q(4));
        q(3) = (rotmat(1,2)-rotmat(2,1))/(4*q(4));
        q(4) = q(4);

    end
end

