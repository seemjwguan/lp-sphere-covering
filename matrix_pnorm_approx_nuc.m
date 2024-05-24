function [app] = matrix_pnorm_approx_nuc(A)
    p = 3;
    theta_p = (2 / p) ^ (2 / (p - 2)) - (2 / p) ^ (p / (p - 2));
    [m, n] = size(A);

    cvx_solver mosek
    cvx_begin sdp quiet
    variable Z(m, n)
    variable u1
    variable u2
    variable t(m + n)
    variable s(m + n)
    variable v(m + n)
    maximize trace(A * Z')
    subject to
    u1 + u2 + theta_p * sum(t) <= 1;
    u1 >= 0;
    u2 >= 0;
    t >= 0;
    s >= 0;
    v >= 0;

    for i = 1:m
        % quad_over_lin(v(i), u1) <= t(i);
        quad_over_lin(v(i), u1) <= s(i);
        quad_over_lin(s(i), v(i)) <= t(i);
    end

    for i = m + 1:m + n
        % quad_over_lin(v(i), u2) <= t(i);
        quad_over_lin(v(i), u2) <= s(i);
        quad_over_lin(s(i), v(i)) <= t(i);
    end

    diag(v) >= 0.5 .* [zeros(m, m), Z; Z', zeros(n, n)];
    cvx_end

    app = cvx_optval;
end
