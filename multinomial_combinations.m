function res = multinomial_combinations(list, ks)

    if length(ks) == 1
        res = nchoosek(list, ks(1));
        return
    end

    temp = nchoosek(list, ks(1));
    res = [];

    for ind = 1:size(temp, 1)
        remaining = setdiff(list, temp(ind, :));
        temp_res = multinomial_combinations(remaining, ks(2:end));

        for ind2 = 1:size(temp_res, 1)
            res = [res; [temp(ind, :), temp_res(ind2, :)]];
        end

    end

end
