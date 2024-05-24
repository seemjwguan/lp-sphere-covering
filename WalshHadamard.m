function mat = WalshHadamard(m, k)

    if k == 0
        mat = eye(m);
        return
    end

    mat = kron([1, 1; 1, -1], WalshHadamard(m, k - 1));
end
