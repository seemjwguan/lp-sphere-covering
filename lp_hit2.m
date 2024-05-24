function H_2 = lp_hit2(n, alpha, beta)

    p = 3;
    k = floor(log2(n / log(n)));
    m = ceil(n * 2 ^ (-k));
    HHm = lp_hit0(m, alpha, beta);
    H_2 = [];
    I2k = eye(2 ^ k);
    Imk = WalshHadamard(m, k);

    for ind1 = 1:2 ^ k

        for ind2 = 1:size(HHm, 2)
            tempvec = 2 ^ (-k / p) * Imk * kron(I2k(:, ind1), HHm(:, ind2));
            tempvec = tempvec(1:n, 1);
            tempnorm = norm(tempvec, 4);

            if tempnorm ~= 0
                H_2 = [H_2, tempvec ./ tempnorm];
            end

        end

    end

end
