%%% Introduction to programming with MATLAB
%%% Topic #1 - Introductory operations
%%% Objectives: Familiarize with MATLAB environment - Operations with scalars and vectors
%%% 
%%% Dimitris Voudouris, October 2024


%% Environment

% By default, the MATLAB environment will most likely include 5 panels:
%   1. The Editor, where you can write your scripts, something like a Notepad
%   2. The Command Window, where commands are executed and relevant information is 'printed'
%   3. The Command History, where you can see what commands you executed previously 
%   4. The Workspace, where you can see what variables are created from the commands you executed
%   5. The Current Folder, which is the reference location that MATLAB uses to find and save files
%
% You can also identify:
%   the Menu Bar, where you see the tabs 'Home', 'Plots', 'Apps', 'Editor', ...
%   the Toolstrip, with icons related to each of the tabs
%   the Address Line, where you can see the address of your working directory (aka Current Folder)
%
% If you can't see your Command History, please go to Home > Layout > Command History > Docked
% We will explore more properties of the Menu Bar and Toolstrip options as we go


%% Basic operations

% You can use MATLAB as a fancy calculator
1 + 3
6 - 2
3 * 3
10 / 5
3 ^ 2

% Always follow the correct order of operations
% 1. Parentheses
% 2. Powers
% 3. Multiplication and division
% 4. Addition and subtraction
% -- For similar operations, order is from left to right
2 * 3 ^ 2 - 8
(2 * 3) ^ 2 - 8
(1 + 2) * 3 ^ 2
3 * 3 ^ 2

% QUIZ
5 * 2 / 4 * 2


%% Variables and help

5 * 2 / 4 * 2
%%%%%%%%%%%%

% Variables and output suppression
a = 6
% But we can *not* do: 6 = a

% A valid variable name starts with a letter, followed by other letters, digits or underscores. 
% No other symbols are accepted!

a = 6;              % this is a comment, MATLAB will ignore this text.
b = 5;

% Basic operations with variables
a = 2;              % replaces the previously assigned value to variable a
b = 3;              % same here
c = a * b ^ 2;      % first we do the exponent, then we do the multiplication
d = c - (b * a);    % first we execute the brackets, then we perform the subtraction
f = d + w;          % this won't work. Why?

% See your workspace
whos

% Display the value of a variable in a somewhat nice way
disp(d)

% Display some text together with a numerical value
disp('the answer is: ') 
disp(d); 
% You can have two or more commands in the same line, as long as they are
% separated by a semicolon (;). This makes your code more compact, but it
% can also make it sometimes harder to read.

% Look for some help
help disp           % help for the specific function

% Save your script
% Right now you are working in an already saved script
% Let's save this script under a different name
% Save > Save As... > myFirstDemo.m, at your Desktop

% clean up a bit
clc             % cleans the command window, but variables remain in memory
clear a c       % clears variables 'a' and 'c', but the other variables remain in memory
clear           % clears all variables from your workspace


%% Vectors

% Default vectors
ones(1, 5)      % *row* vector with 5 ones
ones(5, 1)      % *column* vector with 5 ones
zeros(1, 10)    % row vector with 10 zeros

% Create your own *row* vector
r = [1, 2, 3, 4, 5];    % you may or may not use commas. I encourage you to use commas so that you can better distinguish (visually) between values
r = 1:5;                % same as before, but more compact
r = 1:2:10;             % create vector starting from 1 and going up to 10, in steps of 2
r = 1:2:11;             % see the difference between this and the previous line
r = 6:3:27;             % start from 6 and go up to 27 in steps of 3

% Request the length of your vector (how many elements does it have?)
length(r)

% Create your own *column* vector
c = [1; 4; 7; 10; 13];  % use semicolon to bring next element to the next row
r_trans = r';           % or simply *transpose* a row vector
c_trans = c';           % transposition works for both row and column vectors

% Let's have another example
coffees_week1 = [2, 1, 2, 9, 1, 4, 4];     % this is a 7-element row vector. Each element is the number of coffees I drank on each day of a certain week

% Choose specific elements of your vector
coffees_week1(1)            % choose element at *index position* 1    
coffees_week1(end)          % choose element at the last *index position*
coffees_week1(1:3)          % choose elements at first 3 *index positions*
coffees_week1([2, 5, 7])    % choose elements at *indices* 2, 5, and 7. Note the use of square brackets within the parentheses
coffees_week1(2:end-1)      % choose all elements from *index position* 2 until the *index position* before the last element

% Replace values of certain elements
coffees_week1(4) = 0;      % replace the "accidentally" inserted value of 9 above, by the value 0
disp(coffees_week1)

% Perform operations with vectors
coffees_week2 = [2, 2, 1, 1, 2, 4, 3];          % my coffee consumption for 'week 2'
total_coffee = coffees_week1 + coffees_week2;   % total coffee consumption for each day across the two weeks
goal_week3 = coffees_week2 - 1;                 % I would like to reduce my coffee consumption by 1 cup less per day, for each day
% Similarly, you can apply all other operations (addition, multiplication, ...) to each element of your vector

% Combine (concatenate) vectors
coffees = [coffees_week1, coffees_week2];       % puts the 2 row vectors next to each other (use comma)
coffees = [coffees_week1; coffees_week2];       % puts the 2 row vectors on top of each other (use semicolon)
coffees = [coffees_week1', coffees_week2'];     % tranposes each row vector to a column, then puts these two columns next to each other
coffees = [coffees_week1', coffees_week2];      % this will crash because you cannot combine two vectors of unequal sizes
% If you want to concatenate vectors into a *matrix*, the vectors must have compatible sizes in the relevant dimension: 
%   - If you want to concatenate them horizontally, then they must have the same number of rows
%   - If you want to concatenate them vertically, then they must have the same number of columns


%% Take home messages - summary
% 1. Consider the correct order of operations when writing your calculations 
% 
% 2. MATLAB has its own default vector creation functions: 'ones' and 'zeros' 
% 
% 3. Create any other vector by using *square* brackets, with elements separated 
% either by comma (row vector) or by semicolon (column vector) 
% 
% 4. Concatenate vectors into a matrix by using square brackets and either a 
% comma or a semicolon