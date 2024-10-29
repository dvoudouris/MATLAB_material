%%% Introduction to programming with MATLAB
%%% Topic #2 - Operations with matrices
%%% Objectives: Create matrices - Access matrix elements - Do operations with matrices
%%% 
%%% Dimitris Voudouris, October 2024
%%% Practice


%% Exercise 1

% a. Create a matrix named "demo" that has values between 100 and 130 in the first row, 
% between 70 and 40 in the second row, 
% and between 0 and 30 in the third row.
% (Each column's values should be separated by a step of 1, e.g., column 1: 100 101 102 103...130)

% b. Replace all values in columns 3 and 9, as well as in the last column of your matrix, with NaNs


%% Exercise 2

% a. We start by assuming that we do not know the size of the previously created matrix "demo".
% Find the number of its rows and the number of its columns and assign these values in variables "r" and "c", respectively. 

% b. Calculate the number of elements of the matrix "demo" and assign this to the variable "n_elements"


%% Exercise 3

% a. Create a 30 x 4 matrix "D" containing the number 3 in each index position

% b. Change the value at index (29, 4) to the value 99

% c. Think whether it is possible to assign the value 999 at index (30, 10) - Please do not try this yet
% Think "why" do you think so
% Now try out


%% Exercise 4

% a. Given a vector a = [8, 6, 4] and an integer number n = 4000
% Write a script to create the matrix "b" that contains:
% 	...in the 1st column, the value a(1) repeated n-times (so, 4000 times)
% 	...in the 2nd column, the value a(2) repeated n-times, and
% 	...in the 3rd column, the value a(3) repeated n-times
% Check the size of your output, does it have 4000 rows and 3 columns?

% b. Create matrix m = [1, 2, 3; 2, 1, 5; 4, 6, 4; 2, 3, 2]
% Then, create the submatrix "n" that contains the data that are
% in the first and third column of the first two rows of matrix "m"


%% Exercise 5

% a. Create a matrix "team" that includes data about a basketball team’s players.
% Column 1 contains the player’s jersey number (4:15)
% Column 2 contains their age (years old): (19, 22, 23, 38, 30, 20, 22, 21, 27, 19, 31, 25)
% Column 3 contains their success rate in 2-point shots (%): (60, 55, 57, 62, 45, 61, 75, 80, 52, 64, 46, 89)
% Column 4 contains their success rate in free throws (%): (80, 85, 70, 60, 55, 78, 82, 66, 69, 74, 71, 87)
% Column 5 contains the average assists they make per game: (5.5, 2.1, 1.2, 0.5, 0.1, 0.9, 1.2, 3.8, 1.3, 0.7, 0.6, 1.3)

% b. Update (redefine) the matrix so that it has columns 3 and 4 swapped

% c. Update the matrix by adding a new column 6, where you include the height of the players (cm): (185, 187, 192, 195, 205, 199, 202, 189, 191, 204, 203, 209)


%% Exercise 6

% a. Create a new matrix "teamShort" that contains the data of the previous matrix "team" but only of those players who are shorter than 200 cm

% b. Create a new matrix "teamYoung" that contains the data of the previous matrix "team" but only of those players who are older than 26 years old

% c. Create a new matrix "teamSplit" that contains in the first few rows the data of those players who give more than 1 assist per game, 
% and in the subsequent rows the data of the players who give fewer than 1 assist per game


%% Exercise 7

% a. Given the previous matrix "team"
% Create a new matrix "teamSorted" that contains the data of "team" but in ascending order of the players' age.
% So, the first row should have the data of the youngest player and the last row should have the data of the oldest player.
% You can do this manually, but how would you do it if your matrix had thousands of rows? Can you find a way?

% b. Can we do this from the oldest to the youngest player?


%% Exercise 8

% Let "Q" be a 3x5 matrix of random integers between 90 and 100
% Create a variable "lastEntries" that contains the last 6 elements of matrix "Q"
% Think of an "optimal" way to create this variable.
% For instance, can you have a script that *always* gets the last 6 elements of a matrix, even if the size of matrix Q changes?


%% END OF THE EXERCISES
