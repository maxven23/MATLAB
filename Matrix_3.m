function [ condition_number, x ] = Matrix_3( n )
%MATRIX_3 Summary of this function goes here
%   Fill matrix A and vector b with random numbers...
%   and calculate the condition number of matrix A...
%   and find solution Ax = b

    A = rand(n, n);
    b = rand(n, 1);
    
    A
    b
    
    max_row_sum = 0;
    for row=1:n
        row_abs_sum = 0;
        for column=1:n
            row_abs_sum = row_abs_sum + abs(A(row, column));
        end
        max_row_sum = max(max_row_sum, row_abs_sum);
    end
    
    max_column_sum = 0;
    for column=1:n
        column_abs_sum = 0;
        for row=1:n
            column_abs_sum = column_abs_sum + abs(A(row, column));
        end
        max_column_sum = max(max_column_sum, column_abs_sum);
    condition_number = max_row_sum * max_column_sum;
    end
    
    x = linsolve(A, b);
    
    A*x - b
    
end

