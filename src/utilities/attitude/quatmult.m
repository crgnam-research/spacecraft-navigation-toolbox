function p = quatmult(q, r)
    %@code{true}
    phi = [q(4)*eye(3) - skew(q(1:3)) ; -q(1:3)'];

    p = [phi q]*r;
end
