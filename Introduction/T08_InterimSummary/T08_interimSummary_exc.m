%%% Introduction to programming with MATLAB
%%% Topic #8 - Interim summary
%%% Objectives: Refresh some basic functions and practice the taught material
%%%
%%% Dimitris Voudouris, December 2024
%%% Practice


%% Exercise 1

% Set the random number generator to 1

% Create a row vector named 'a' with 500 random integers between 30 and 40

% Create a column vector named 'b' with 500 uniformly distributed random numbers

% Create a column vector named 'c' with 500 normally distributed random numbers

% Show the distribution of the numbers within each vector by using a histogram
% Plot each distribution in separate subplots of the same figure


% Merge the three vectors in a 500 x 3 matrix named 'merged'. 

% Add a fourth column that has in each row the average of the three values of the same row in columns 1-3

% Add a fifth column that has in each row the product of the values in columns 2 and 3 

% Add one more column that shows the number of each row (so, from 1 to 500)
% Ensure that this column is on the very left of your matrix

% Update your variable 'merged' by sorting the rows of your matrix in a descending order 
% on the basis of the values in column 4 (rows with higher values in column 4 should appear first)

% Plot the data of the updated column 4 in a new figure
% Explain to your colleagues what you see

% In a new figure, plot the complete matrix (plot(merged))
% Explain to your colleagues what is each axis and what is each line

% If something does not work, ask why. Why? Why MATLAB?


%% Exercise 2

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

% Load the file about life expectancy

% Plot the average data along with the standard deviation for Japan (rows 21361:21581) separately for men (col 6) and women (col 7)
% Deal with NaNs

% Plot the timecourse of the life expectancy, separately for men and women
% Plot these two curves in another figure.


% Have you done these? Then run the following code:
% load handel
% sound(y, Fs)


%% Exercise 4

% This is "break" exercise: play a game. Type "fifteen" (without quotes) 
% on your command window and then hit Enter

% Read about this puzzle here: https://en.wikipedia.org/wiki/15_puzzle


%% END OF EXERCISES

