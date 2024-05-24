function app = pnorm_app_pm(T)

    p = 3;
    u = [];

    for ind = 1:size(T, 1)
        u = [u, matrix_pnorm_approx_nuc(double(T(ind, :, :)))];
    end

    app = norm(u, p);

end
