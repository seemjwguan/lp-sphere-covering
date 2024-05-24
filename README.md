# Welcome!
This repository contains the codes for reproducing the results in our paper *$\ell_p$-sphere covering and approximating nuclear $p$-norm*. 

# How to use?

1. Run the program titled *generate_tensor_handler.m* to generate random tensors as designated in our paper. (Since the random seed has been fixed in the file, the generated tensors should be the same across multiple runs, and in particular, identical to mine in my machine).
2. Run the program titled *pnorm_handler_real.m* to test various algorithms.

> **Notice**: Please uncomment the code for constructing the hitting set if you're using some algorithm based on sphere covering.

> **Comment**: I personally think the codes are easy-to-understand, so I believe the users can easily modify the codes as they wish.

# Dependencies
The following packages are required for running the programs:

- MATLAB Tensor Toolbox (downloadable from [here](https://www.tensortoolbox.org/))
- CVX (downloadable from [here](https://cvxr.com/cvx/download/))
- MOSEK (included within CVX, but you need to obtain a license from [here](https://www.mosek.com/products/academic-licenses/); not necessary, and you can use other solvers included within CVX, such as SeDuMi and SDPT3)
- MATLAB Parallel Computing Toolbox (not necessary, but if you want to use parallel computations for acceleration)
