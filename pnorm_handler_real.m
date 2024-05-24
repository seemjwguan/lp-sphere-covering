p = 3;
rep = 20;
tol = 0.05;
alpha = (5 + sqrt(33)) / 2;
beta = alpha + 1;

for n = flip([3, 4, 5, 6, 7, 8, 9, 10])

    for r = [1, 2, 3, 4, 5, 10]
        tensors = load(strcat('./nuclear_pnorm_data/tensor_', num2str(n), '_', num2str(r), '.mat')).tensorcell;
        norms = load(strcat('./nuclear_pnorm_data/norm_', num2str(n), '_', num2str(r), '.mat')).normcell;
        app_list = zeros(rep, 1);
        ratio_list = zeros(rep, 1);
        time_list = zeros(rep, 1);
        %% modify this
        % H = lp_hit1(n, alpha, beta);
        % H = lp_hit2(n, alpha, beta);
        % H = lp_hit3(n, tol);
        % size(H)
        % fprintf("The hitting set has been constructed.\n")

        parfor ind = 1:rep

            fprintf("This is %d-th iteration of n=%d and r=%d.\n", ind, n, r)
            gnd_tth = norms{ind, 1};
            test_tensor = tensor(tensors{ind, 1});
            tic
            % app = pnorm_app_pv(test_tensor);
            % app = pnorm_app_pm(test_tensor);
            app = pnorm_app_mu(test_tensor);
            % app = pnorm_app_sc(test_tensor, H);
            time_list(ind, 1) = toc;

            if app <= gnd_tth
                ratio = app / gnd_tth;
            else
                ratio = gnd_tth / app;
            end

            app_list(ind, 1) = app;
            ratio_list(ind, 1) = ratio;

        end

        model = 'mu'; %% modify this
        save(strcat('./nuclear_pnorm_data/', model, '_app_', num2str(n), '_', num2str(r), '.mat'), 'app_list');
        save(strcat('./nuclear_pnorm_data/', model, '_ratio_', num2str(n), '_', num2str(r), '.mat'), 'ratio_list');
        save(strcat('./nuclear_pnorm_data/', model, '_time_', num2str(n), '_', num2str(r), '.mat'), 'time_list');
    end

end
