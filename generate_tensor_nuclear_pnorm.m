function [T, nnorm_p] = generate_tensor_nuclear_pnorm(d, n, r)
    T = zeros(n .* ones(1, d));
    nnorm_p = 0;

    for ind = 1:r

        x = rand(n, 1);
        x = x ./ norm(x, d);
        inputs = repmat({x}, [1 d]);
        temp = outprod(inputs{:});
        lambda = rand;
        T = T + lambda .* temp;
        nnorm_p = nnorm_p + lambda;

    end

end
