rng(20240520)
for n = [3, 4, 5, 6, 7, 8, 9, 10]
% for n = [11, 12, 13, 14, 15]

    for r = [1, 2, 3, 4, 5, 10]

        rep = 20;
        tensorcell = cell(rep, 1);
        normcell = cell(rep, 1);

        for ind = 1:rep

            [T, nnorm_p] = generate_tensor_nuclear_pnorm(3, n, r);
            tensorcell{ind, 1} = T;
            normcell{ind, 1} = nnorm_p;

        end

        save(strcat('./nuclear_pnorm_data/tensor_', num2str(n), '_', num2str(r), '.mat'), 'tensorcell');
        save(strcat('./nuclear_pnorm_data/norm_', num2str(n), '_', num2str(r), '.mat'), 'normcell');

    end

end
