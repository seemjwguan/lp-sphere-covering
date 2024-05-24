function [app] = pnorm_app_sc(T, H)
    p = 3;
    theta_p = (2 / p) ^ (2 / (p - 2)) - (2 / p) ^ (p / (p - 2));
    T = double(T);
    [n1, n2, n3] = size(T);
    num_hits = size(H, 2); % The first dimension of H should be n1.

    cvx_solver mosek
    cvx_begin sdp
    variable Z(n1, n2, n3)
    variable u1(num_hits)
    variable u2(num_hits)
    variable t(n2 + n3, num_hits)
    variable s(n2 + n3, num_hits)
    variable v(n2 + n3, num_hits)
    maximize dot(T(:), Z(:))
    subject to

    for hit = 1:num_hits
        u1(hit) + u2(hit) + theta_p * sum(t(:, hit)) <= 1;
    end

    u1 >= 0;
    u2 >= 0;
    t(:) >= 0;
    s(:) >= 0;
    v(:) >= 0;

    for hit = 1:num_hits

        for i = 1:n2
            % quad_over_lin(v(i, hit), u1(hit)) <= t(i, hit);
            quad_over_lin(v(i, hit), u1(hit)) <= s(i, hit);
            quad_over_lin(s(i, hit), v(i, hit)) <= t(i, hit);
        end

    end

    for hit = 1:num_hits

        for i = n2 + 1:n2 + n3
            % quad_over_lin(v(i, hit), u2(hit)) <= t(i, hit);
            quad_over_lin(v(i, hit), u2(hit)) <= s(i, hit);
            quad_over_lin(s(i, hit), v(i, hit)) <= t(i, hit);
        end

    end

    for hit = 1:num_hits

        temp = squeeze(nmodeproduct(Z, H(:, hit)', 1));
        diag(v(:, hit)) >= 0.5 .* [zeros(n2, n2), temp; temp', zeros(n3, n3)];

    end

    cvx_end

    app = cvx_optval;
end
