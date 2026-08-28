function K = crear_K(N)
    diagonal_principal = -2 * ones(N,1); 
    off_diagonal = 1 * ones(N-1, 1);
    K = diag(diagonal_principal) + diag(off_diagonal, 1) + diag(off_diagonal, -1);
end 
