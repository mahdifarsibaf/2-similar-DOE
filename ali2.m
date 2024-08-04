clc; clear all; close all; workspace

format bank

[num,txt,raw] = xlsread('Main.xlsx');
[num1,txt1,raw1] = xlsread('Test_1.xlsx');
[num2,txt2,raw2] = xlsread('Test_2.xlsx');

% Assuming numeric data in columns 2, 3, and 4 for all matrices
Main_data = num(:, 2:4);
Test_1_data = num1(:, 2:4);
Test_2_data = num2(:, 2:4);

% Set tolerance for similarity
tolerance = 0.1; % Adjust tolerance as needed

% Find similar rows between Main and Test_1
similar_rows_main_test1 = find_similar_rows(Main_data, Test_1_data, tolerance);
similar_rows_main_test1_data = num(similar_rows_main_test1 + 1, :);
disp('Similar rows between Main and Test_1:')
disp(similar_rows_main_test1_data);

% Find similar rows between Main and Test_2
similar_rows_main_test2 = find_similar_rows(Main_data, Test_2_data, tolerance);
similar_rows_main_test2_data = num(similar_rows_main_test2 + 1, :);
disp('Similar rows between Main and Test_2:')
disp(similar_rows_main_test2_data);

% Find similar rows between Test_1 and Test_2
similar_rows_test1_test2 = find_similar_rows(Test_1_data, Test_2_data, tolerance);
similar_rows_test1_test2_data = num1(similar_rows_test1_test2 + 1, :);
disp('Similar rows between Test_1 and Test_2:')
disp(similar_rows_test1_test2_data);
