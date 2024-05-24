function app = pnorm_app_pv(T)

    p = 3;
    % n1 = size(T, 1);
    % n2 = size(T, 2);
    % n3 = size(T, 3);
    app = norm(double(T(:)), p); % tenmat(T, 1:length(T.size), 't')

    % app = 0;

    % for ind1 = 1:n1

    %     for ind2 = 1:n2

    %         app = app + norm(double(T(ind1, ind2, :)), p);

    %     end

    % end

end
