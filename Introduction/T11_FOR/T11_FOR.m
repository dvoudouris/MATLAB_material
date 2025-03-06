%%% Introduction to programming with MATLAB
%%% Topic #11 - FOR-loops
%%% Objectives: Introduction to iterations with for-loops, nested for-loops
%%%
%%% Dimitris Voudouris, March 2025


%% Intro
% Last time we wanted to check whether the temperature in each of the 14 previous days was positive, negative or zero. 
% We had made it to check an individual day, but how can we apply the same IF-expression to a number of different days?
% In general, how can we repeat the same operation over and over without having to type much?
% For this, we can repeatedly apply the desired procedure using a for-loop.

% To create a for-loop, we need:
%   - an index that takes a predefined set of numbers (aka: counter)
%   - a statement (or statements)
%   - an 'end' to close the loop

% Example:
% for index = set_of_numbers
%       statement
% end


%% A simple for-loop
% Create an arbitrary variable "a" 
for a = 1:10    % in the first iteration, variable "a" is set to the first number (= 1)
    disp(a)     % display the value of "a"
end             % close the loop - Is "a" equal to the last value (10)? If not, re-iterate and set "a" to the next value (= 2). If yes, exit the loop.

for v = 2:2:10      % variable v takes the values 2, 4, 6, 8, 10
    disp(v)         % display the value of "v"
end                 % close the loop


% Let's now see this in 'slow motion'
for v = 2:2:10    
    disp(v)
    keyboard
    % 'keyboard' is a way to "debug" your programs; It freezes execution and returns the control back to the user's Keyboard. 
    % You will see a K before the prompt in your command window (K>>)
    % This means that you can now type something with your keyboard and execute it.
    % If you want the program to continue execution, type 'dbcont' (for DeBug CONTinue)
    % If you want the program to quit execution, type 'dbquit' (for DeBug QUIT)
end  


for v = 1:3
    disp(v)
    keyboard
    v = v + 2;
    keyboard    % what value will be displayed in the next line ?
    disp(v)   
    keyboard
end  


% Let's now calculate the sum of the first 10 natural numbers
mysum = 0;      % First, we define a variable equal to zero, in which we add the value of each "n"
for n = 1:10
    mysum = n + mysum;
end  


%% Display text during loop execution
for v = 1:3
    fprintf('the value of our variable is: %d\n', v);
%     keyboard
end 


%% Combine for-loops with if-expressions

% So far, we used rather simple for-loops, but now we can combine these with if-expressions.
% First, create a temperature array, same with that from previous week. 
rng(1)     
temperature = randi([-2 15], 1, 14);

% check the temperature of each of the last 14 days
for day = 1:length(temperature)         % same as 'for day = 1:14'
    keyboard
    fprintf('day %d - \t', day);
    if temperature(day) >= 1            % iteration 1 -> day = 1, so temperature(day) accesses the first element of the array 'temperature'
        disp('temperature is positive')
    elseif temperature(day) == 0
        disp('temperature is zero')
    else
        disp('temperature is negative')
    end
end                                     % end of loop. iteration 1 -> day = 1. Control goes back to the first line and day is set to the next value


%% Using indexing to let variables grow

% Sometimes you do not want only to check if a condition is met, 
%   but to also perform calculations for each iteration.
% For instance, when you analyze the 50 trials of your reaction time experiment, 
%   you may want to calculate the RT of each trial in a growing array.
% Or, if you have a matrix with RTs (columns are different participants, rows are different conditions)
%   you may want to calculate an average across participants.

rng(1); 
myRTs = randi([100 300], 30, 5);        % create a 30x5 matrix with integers between 100 and 300. Think of each row as separate 'participants', and of each column as different 'conditions'
for r = 1:size(myRTs, 1)                % size(matrix, 2) returns the number of columbs. So, iterate from counter 1 until counter 5
    myRTaverage(r) = mean(myRTs(r, :));     % 'average' is a variable that is being indexed by using the counter 'c'. 
    % In iteration 1, c = 1, so we set the first element of 'average', namely average(1), to the average of the complete column 1 --> matrix(:, c) = matrix(:, 1)
    % In iteration 2, c = 2, so we set the second element of 'average', namely average(2) to the average of the complete column 2 --> matrix(:, c) = matrix(:, 2)
    keyboard
end
% A much simpler way to obtain the average of this matrix would be to type:
%   mean(myRTs)
% and if you wanted to save these values into a variable, you could do:
%   average = mean(matrix)
% The above-mentioned for-loop is just to get a better idea how things
% work, but it is not the best way to calculate the average of each column.


% What will the following for-loop produce?
clear average
rng(1); 
matrix = randi([1 100], 20, 10);        
for c = 1:size(matrix, 2)               
    average(c, 3) = mean(matrix(:, c));
    % keyboard
end
% Possible answers:
% a. A 1 x 10 vector, as before (single row vector)
% b. A 10 x 1 vector (single column vector)
% c. A 10 x 3 matrix
% d. A 10 x 10 matrix
    

% What will the following for-loop produce?
clear average
rng(1); 
matrix = randi([1 100], 20, 10);        
for c = 9:10               
    average(c, 3) = mean(matrix(:, c));  
end
% Possible answers:
% a. A 1 x 10 vector (single row vector)
% b. A 10 x 1 vector (single column vector)
% c. A 2 x 3 matrix
% d. A 10 x 3 matrix


%% Nested for-loops
%   * Take a pen and paper and write these down *

% As with if-expressions, we can also created nested for-loops
for a = 1:5             % set a = 1
    for b = 1:8         % set b from 1 to 8
        c(a, b) = a + b;        
        % iteration 1: a = 1, b = 1, so the 1st row and 1st column of c is equal to 1 + 1 = 2
        % iteration 2: a = 1, b = 2, so the 1st row and 2nd column of c is equal to 1 + 2 = 3
        % After 8 iterations the second for-loop will be over. Control will be returned to the first for-loop and the counter 'a' will become equal to 2
        % Then we will enter immediately the second for-loop. Remember that counter 'a' is now equal to 2
        % so we will access c(a, b), so c(2, 1), therefore the 2nd row and 1st column of c will be equal to 2 + 1 = 3
        % then, the 2nd row and 2nd column of c will be equal to 2 + 2 = 4, and so on
        fprintf('a is %d and b is %d\n', a, b);
        % keyboard
    end     % to close the for-loop related to counter b
    % keyboard
end         % to close the for-loop related to counter a
% Add a keyboard after each for-line and execute the nested for-loop step-by-step


%% Take home messages - summary

% 1. For-loops use a counter variable to iterate over a following set of statements 
% 2. The number of iterations is predefined by the programmer.
%       For example, if our counter spans over 3 values (e.g., for a = 1:3 -- for a = 10:12), then the statements in the for-loop will be executed 3 times
% 3. The counter does not need to start from 1. It can take any value, but this value MUST be greater than zero. 
% 4. In nested for-loops, the second-level loop is exhausted before the previous loop goes to the next iteration. 
% 5. Use the command 'keyboard' in your script to stop execution at that line and enable interaction with the ongoing program 
%       Continue to the next line by typing 'dbcont' (or the green double-arrow on the toolbar)
%       Quit execution by typing 'dbquit' (or the red square on the toolbar)


%% The end


