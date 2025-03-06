%%% Introduction to programming with MATLAB
%%% Topic #12 - WHILE-loops
%%% Objectives: Introduction to iterations with while-loops
%%%
%%% Dimitris Voudouris, March 2025
%%% Practice


%% Exercise 1

% Ask the user to provide a positive integer.
% Write a while-loop to calculate the sum of all numbers between 1 and the given integer



%% Exercise 2

% Write a while-loop that presents on the command window a countdown from 10 to 1,
% with a 1-sec duration between each number presentation (how can you add such a delay? Search for it!).
% After the value 1 is presented, make MATLAB present the word "GO!" in the command window.
% Use the command 'fprintf' to display stuff.



%% Exercise 3

% We have the following data:
data = readmatrix('trial_1');
data = data(:, 13);
plot(data)

% Use a while-loop to find the first element (index position) before the maximal value, 
%   where the value in index n is *smaller* than the value in the index n-1.
%       Hint: The maximal value occurs in index 234, and the answer of the exercise should be 203. 
%       Hint: If the explanation is still vague, look at the end of this script. 



%% Exercise 4

% a. Create a 100 x 3 matrix of random integers between 1 and 20
% Use rng(3) before doing so, it is important. 


% b. Use a for-loop to find the index of the last maximal value of each column.
% (so if the maximal value 20 occurs 3 times in a given column, find the index position where the last of these three values occurs).
% Use a while-loop to scan backwards the values of that column until you find the row that has a value equal to the median of this column's values.
%   (If the logical statement of the while-loop never becomes true, ensure that the program does not crash!)
% If the found value is smaller than 25, display in the command window the message: 'Column X: smaller than 25', 
%   and in the next line display the actual value of that row. 
% If the found value is larger or equal to 25, display the respective messages.
% Thus, you need to use an if-else-statement and a while-loop within a for-loop.
% Use fprintf to display messages.



%% END OF EXERCISES



%% Further explanation of Exercise 3
% The minimal value is found at row 234.
% Is value data(234) smaller than data(233)? 
% No. Check: is data(233) smaller than data(232)?
% No. Check: is data(232) smaller than data(231)?
% .....
% Do so until data(n) is smaller than data(n-1)
