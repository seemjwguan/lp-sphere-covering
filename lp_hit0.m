function H_H = lp_hit0(n, alpha, beta)
    p = 3;
    m = ceil(log(alpha * n) / log(beta));
    cards = zeros(m, 1);
    sum2tom = 0;

    for ind = 2:m
        temp = floor(alpha * n / (beta ^ (ind - 1)));
        cards(ind, 1) = temp;
        sum2tom = sum2tom + temp;
    end

    cards(1, 1) = n - sum2tom;

    val_cell = cell(1, m);
    val_cell{1} = [1; -1];

    for ind = 2:m
        val_cell{ind} = [1; -1; beta ^ ((ind - 1) / p); -beta ^ ((ind - 1) / p)];
    end

    H_H = [];
    allcombs = multinomial_combinations([1:n], cards);

    for ind = 1:size(allcombs, 1)
        temp = allcombs(ind, :);
        candi_cell = cell(1, n);

        for ind2 = 1:m

            for val = temp(:, sum(cards(1:ind2 - 1)) + 1:sum(cards(1:ind2)))
                candi_cell{val} = val_cell{ind2};
            end

        end

        H_H = [H_H; allcomb(candi_cell{:})];

    end

    H_H = unique(H_H, 'rows', 'stable'); % remove duplicates
    H_H = H_H';
    H_H = H_H ./ vecnorm(H_H, p);

    % cnt = size(H_H);

end
