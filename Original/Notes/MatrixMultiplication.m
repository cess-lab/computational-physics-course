Matrix = magic(3)   % Generate a 3 x 3 magic square
InverseMatrix = inv(Matrix);
PredictedIdentityMatrix = Matrix * InverseMatrix;
IdentityMatrix = eye(3);
PredictionError = PredictedIdentityMatrix - IdentityMatrix;
SmallestInterval = eps;
for m = 1 : 3
    for n = 1 : 3
        if PredictionError(m, n) < SmallestInterval
            PredictedIdentityMatrix(m, n) = IdentityMatrix(m, n);
        end
    end
end
IdentityMatrix
PredictedIdentityMatrix