%%% Introduction to programming with MATLAB - WS 2024/2025
%%% Meeting #4 - Saving data
%%% Objectives: Practice various ways to save variables in datafiles of different formats
%%% 
%%% Dimitris Voudouris, November 2024
%%% Practice


%% 
warning off     % Calling table functions often produces warnings. If these warnings disturb you, you can deactivate warnings
% It is recommended to never have this setting at the beginning of your endeavors in order to ensure that you leverage all information that
% MATLAB can give you. Once you are confident that these warnings are of no use to you, then you may deactivate these messages.


%% Exercise 1 

% a. Load the file with the debt
% Calculate the average debt across all countries for x2019_Q2
%   The result should be just 1 number and not a NaN
% Choose a meaningful variable name

% b. Save the new variable (column vector) as:
%   - a mat-file
%   - an Excel file 


%% Exercise 2 

% a. With the same file as before...
% Calculate the debt for each year's Quarter 2, across all countries, *except for* EU (row = 1)
% When doing so, create a single vector variable with 3 elements, instead of three separate variables

% b. Save the new variable in a text file and ensure that the columns are separated by a tab
% Name the file 'average_debt_perQ.txt'

% c. Create one more variable for Quarter 3, as in (a)
% Save the new variable in the same text file, but below the previous data (append)

% d. Do the same for Q4, and append these variables to the same text file, as in (c)


%% Exercise 3

% You have hopefully created a text file with three sets of triplets (one row for each of the quarters Q2, Q3, and Q4)
% But what are these numbers? Will you remember what they are if you open this file in a year from now?
% Perhaps we should have placed some headers above each column and some names before each row.
% That's your next task. 

% a. First, add a header above each of the three columns. 
% To do so, convert the array to a table. How to do so? Think for a solution!


% b. Now add a variable column at the very left of your table. This column should have as many rows as your table, 
% ...and should contain a word explaining what we see in the respective row. For instance, Q2 for row 1 and Q4 for row 3?

% c. Save the new table in a spreadsheet file under the name 'average_debt_perQ'


%% Exercise 4

% a. Calculate the average debt for each quarter across the three years
% Add this as a fifth column in your table, together with an appropriate header

% b. Your original debt file contains empty columns (e.g., column 3, 5, ...) and some useless rows (toward the end)
% Redefine your debt variable so that it remains a table but these empty columns disappear. 
% Can you do this with a single command?


%% Exercise 5

% The following exercise contains tasks that we did not learn during the meeting. 
% You could still try to solve these by using online help.

% a. Ask MATLAB to create a new folder in your current directory. Name it as 'Homework'.

% b. Write a command to move in this folder all files that you saved during the previous exercises


%% END OF EXERCISES
