%%% Introduction to programming with MATLAB
%%% Topic #9 - Logicals
%%% Objectives: Introduction to logical data types (true, false), basic operations (&, |, ~), and comparison operators (==, <, >, ~=)
%%%
%%% Dimitris Voudouris, January 2025


%% Intro
% You can think of logical operations as operations that ask a question.
% This question should expect an answer of yes or no. 
% You cannot ask the question: "What is your name?", but you can ask: "Is your name Dimitris?"
% MATLAB answers the question with a true (yes - 1) or false (no - 0).

% Example:
1 == 1      % Is one equal to one? YES!
1 == 2-1    % Is one equal to two minus one? YES!
40 == 39+2  % Is forty equal to 39+2? NO!
39+2 == 41  % Is 39+2 equal to 41? YES!

% You can assign the answer of the question into a variable:
var = 50 == 100/2   % the variable 'var' will take a value of 1 because 50 is indeed equal to 100/2
whos                % See that the Class of 'var' is 'logical' (neither double, nor char)

% You can also ask if something is smaller or larger than something else:
40 > 2      % YES, it is
2 > 40      % NO, it is not
40 > 40     % NO, it is not
40 >= 40    % YES, because we ask for equal OR greater than.
3 <= 5      % YES
3 <= 3      % YES


%% Logical operations with vectors
% Let's create a vector 'temperature' with the minimum temperature during each of the last 14 days
rng(1)      % Standardize the seed so that we all get the same random values
temperature = randi([-2 5], 1, 14)

temperature == 0    % Is this value equal to zero? 
% This operation will be evaluated for each element of the vector, 
% and the result will be a vector of zeros and ones, and will have a a length of = length(temperature)
temperature == -2   % As above
temperature > -2    % As above
temperature > 5     % As above

% Let's now make our question more specific
temperature > -1 & temperature < 2      % Is each of the variable's values greater than -1 AND smaller than 2?
and(temperature > -1, temperature < 2)      % Is each of the variable's values greater than -1 AND smaller than 2?
% Note the difference with the following:
temperature > -1 & temperature <= 2     % Is each of the variable's values greater than -1 AND smaller or equal than 2?
% Of course, the previous statement can also be written as:
temperature > -1 & temperature < 3  % There is no difference between these two

temperature > 2 | temperature == -1      % Is each of the variable's values greater than 2 OR equal to -1?
or(temperature > 2, temperature == -1)      % Is each of the variable's values greater than 2 OR equal to -1?

% Ask MATLAB if a value is NOT equal to some standard value:
temperature ~= 1    % Is this value different from one?


%% The command 'find'
% So far, MATLAB returns a true of false answer for each element of our vector. 
% What if we want to find the index of the element that is true or false?
find(temperature == -2)      % Find the index of these elements of temperature that are equal to -2
% The answer is 3 and 6. Can we double check this?
temperature([3, 6])     
% or, more efficiently:
temperature(find(temperature == -2))    % This is better because it is automated (imagine if you had to type 30 numbers in the bracket)
temperature(temperature == -2)    

% Let's pick up the first value that is true to a question:
find(temperature == -1, 1)  % The index number 5 of our vector is the first index with a value equal to -1

% Find the element that has a value equal to something OR equal to something else
find(temperature == 0 | temperature >= 4)
% The answer is 4, 8, 14. Let's validate it:
temperature(find(temperature == 0 | temperature >= 4))

% Combine logical AND with logical OR
find(temperature >= 0 & temperature <= 2 | temperature < -1)
% MATLAB gives priority to logical AND over the logical OR operator


%% Logical operations with matrices
% Two more things for today...
% First, let's see what happens when working with a matrix
rng(1)
matrix = [ (1:14)', randi([-2 5], 14, 1) ];  
% Column 1 is the day, column 2 is the temperature on that day
% Note that we reset the seed to 1, so the second column should have identical values with our original vector 'temperature'

find(matrix == 0)       % Should this give us the same result as find(temperature == 0)? Why?
find(temperature == 0)
find(matrix(:, 2) == 0)


%% Logicals with strings
% Second, we see how we ask questions related to strings:
group = ["Alex", "Tobias", "Katja", "Maggie", "Mathias"]
% Try out the following and see the difference between single and double quotes: 
% group = ['Alex', 'Tobias', 'Katja', 'Maggie', 'Mathias']
strcmp(group, 'Tobias')      % or: strcmp(group, "Tobias")
find(strcmp(group, 'Tobias'))
strfind(group, 'ias')


%% Take home messages - summary
% 
% 1. Logical operators return a true or false answer
% 2. Use two consecutive equal signs, or a single greater-than/less-than sign
% 3. The command 'find' will return the element of your array that
%           fulfills the logical conditions specified in the argument 
% 4. Use the & and | signs to apply logical AND and logical OR statements
%           AND statements are prioritized over OR statements
% 5. You can apply logical operations also to strings.
%           Note the difference when using a single and a double quote. 


%% The end


