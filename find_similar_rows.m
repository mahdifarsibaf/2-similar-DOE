function similar_rows = find_similar_rows(matrix1, matrix2, tolerance)
    % Finds similar rows between two matrices, excluding first row and column.
    %   SIMILAR_ROWS = FIND_SIMILAR_ROWS(MATRIX1, MATRIX2, TOLERANCE) finds rows in MATRIX1 that are similar to rows in MATRIX2, with a tolerance level specified by TOLERANCE.
    %   The function excludes the first row and column from both matrices.

    % Input validation
    if ~isnumeric(matrix1) || ~isnumeric(matrix2)
        error('Input matrices must be numeric.');
    end
    if ~isscalar(tolerance) || tolerance < 0
        error('Tolerance must be a non-negative scalar.');
    end

    % Exclude first row and column
    matrix1 = matrix1(2:end, 2:end);
    matrix2 = matrix2(2:end, 2:end);

    % Find similar rows using pdist2
    distances = pdist2(matrix1, matrix2);
    [~, indices] = min(distances, [], 2);

    % Determine similar rows based on tolerance
    similar_rows = find(min(distances, [], 2) <= tolerance);
end
