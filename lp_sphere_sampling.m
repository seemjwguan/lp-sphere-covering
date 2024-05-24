function generators = lp_sphere_sampling(n, card, boundary, stepsize)

    p = 3;
    denom = 2 * gamma(1 / p);
    x = -boundary:stepsize:boundary;
    pdf = zeros(length(x), 1);

    for ind = 1:length(x)
        pdf(ind) = p * exp(- (abs(x(ind))) ^ p) / denom;
    end

    cdf = cumtrapz(x, pdf);

    unif_pts = rand(n * card, 1);

    [cdf, index] = unique(cdf, 'stable');
    x = x(index);
    generators = interp1(cdf, x, unif_pts);
    generators = reshape(generators, [n, card]);
    generators = generators ./ vecnorm(generators, p);

end
