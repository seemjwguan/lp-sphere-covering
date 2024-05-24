function H_1 = lp_hit1(n, alpha, beta)

    p = 3;
    n1 = ceil(log(n));
    n2 = floor(n / n1);
    n3 = n - n1 * n2;
    HHn1 = lp_hit0(n1, alpha, beta);
    In2 = eye(n2);
    temp1 = [];

    for ind1 = 1:n2

        for ind2 = 1:size(HHn1, 2)
            temp1 = [temp1, kron(In2(:, ind1), HHn1(:, ind2))];
        end

    end

    temp1 = [temp1; zeros(n3, size(temp1, 2))];

    if n3 == 0
        temp2 = [];
    else
        HHn3 = lp_hit0(n3, alpha, beta);
        temp2 = [zeros(n1 * n2, size(HHn3, 2)); HHn3];
    end

    H_1 = [temp1, temp2];

end
