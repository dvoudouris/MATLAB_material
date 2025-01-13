%%% Introduction to programming with MATLAB - WS 2024/25
%%% Meeting #8 - Interim summary
%%% Objectives: Refresh some basic functions and practice the taught material
%%%
%%% Dimitris Voudouris, December 2024
%%% Practice


%% Exercise 1
disp('**************');
disp('Exercise #1');
disp('**************');

% Set the random number generator to 1
rng(1)

% Create a row vector named 'a' with 500 random integers between 30 and 40
a = randi([30 40], 1, 500);

% Create a column vector named 'b' with 500 uniformly distributed random numbers
b = rand(500, 1);

% Create a column vector named 'c' with 500 normally distributed random numbers
c = randn(500, 1);

% Show the distribution of the numbers within each vector by using a histogram
% Plot each distribution in separate subplots of the same figure
figure(1);
subplot(2, 3, 1); h1 = histogram(a); title('uniform integers'); ylabel('n of observations')
    axis square; axis padded
subplot(2, 3, 2); h2 = histogram(b); title('uniform distribution');
    axis square; axis padded
subplot(2, 3, 3); h3 = histogram(c); title('normal distribution');
    axis square; axis padded


% Merge the three vectors in a 500 x 3 matrix named 'merged'. 
merged = [a', b, c];

% Add a fourth column that has in each row the average of the three values of the same row in columns 1-3
merged(:, 4) = mean(merged, 2);

% Add a fifth column that has in each row the product of the values in columns 2 and 3 
merged(:, 5) = merged(:, 2) .* merged(:, 3);

% Add one more column that shows the number of each row (so, from 1 to 500)
% Ensure that this column is on the very left of your matrix
merged = [ (1:500)', merged];

% Update your variable 'merged' by sorting the rows of your matrix in a descending order 
% on the basis of the values in column 4 (rows with higher values in column 4 should appear first)
merged = sortrows(merged, 4, 'descend');

% Plot the data of the updated column 4 in a new figure
% Explain to your colleagues what you see
figure; plot(merged(:, 4))

% In a new figure, plot the complete matrix (plot(merged))
% Explain to your colleagues what is each axis and what is each line
figure; plot(merged)

% If something does not work, ask why. Why? Why MATLAB?


%% Exercise 2
disp('**************');
disp('Exercise #2');
disp('**************');

% Which of the following commands will create a plot of age vs chocolate consumption?
% A.    bar(age)
% B.    scatter(choc, age)
% C.    histogram(age, choc)
% D.    plot(age, choc)

% Which command will give you the average value of each column of a 3x3 matrix Q?
% A.    mean(Q)
% B.    mean(1, Q);
% C.    mean(Q, 2);
% D.    mean(Q, [1:3]);

% Which command will give you the standard deviation of each row of matrix Q?
% A.    std(Q);
% B.    std(Q, 1);
% C.    std(Q, 2);
% D.    std(Q, 0, 2);


%% Exercise 3
disp('**************');
disp('Exercise #3');
disp('**************');

% Load the file about life expectancy
life = readtable('life-expectancy.csv');

% Plot the average data along with the standard deviation for Japan (rows 21361:21581) separately for men (col 6) and women (col 7)
% Deal with NaNs
M_JAP_m = nanmean(life{21361:21581, 6});
M_JAP_f = nanmean(life{21361:21581, 7});
SD_JAP_m = nanstd(life{21361:21581, 6});
SD_JAP_f = nanstd(life{21361:21581, 7});

figure; errorbar(1, M_JAP_m, SD_JAP_m, 'mo', 'LineWidth', 2)
hold on
errorbar(2, M_JAP_f, SD_JAP_f, 'ko', 'LineWidth', 2)
legend('men', 'women', 'Location', 'Best')
title('Japan')
ylabel('life expectancy (years)')
axis square; axis padded

% Plot the timecourse of the life expectancy, separately for men and women
% Plot these two curves in another figure.
figure;
plot(life.Year(21361:21581), life{21361:21581, 6}, 'm', 'LineWidth', 3); hold on
plot(life.Year(21361:21581), life{21361:21581, 7}, 'k', 'LineWidth', 3);
axis square; axis padded
xlabel('year'); ylabel('year of age')
legend('men', 'women', 'Location', 'best')
title('Japan')

% Have you done these? Then run the following code:
% load handel
% sound(y, Fs)


%% Exercise 4
disp('**************');
disp('Exercise #4');
disp('**************');

% This is "break" exercise: play a game. Type "fifteen" (without quotes) 
% on your command window and then hit Enter

% Read about this puzzle here: https://en.wikipedia.org/wiki/15_puzzle


%% END OF EXERCISES

