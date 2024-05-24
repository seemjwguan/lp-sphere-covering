function H_3 = lp_hit3(n, tol)

    p = 3;
    q = p / (p - 1);
    delta_2 = 1/40;
    % delta_3 = 1296;
    delta_3 = 20;
    cardinality = ceil(delta_3 * n^delta_2 * ((1/2+1/q)*n*log(n)+log(1/tol)));
    H_3 = lp_sphere_sampling(n, cardinality, 3, 0.01);

end
