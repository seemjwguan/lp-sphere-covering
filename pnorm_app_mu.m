function app = pnorm_app_mu(T)

    p = 3;
    app = matrix_pnorm_approx_nuc(double(tenmat(T, [1, 2], [3])));

end
