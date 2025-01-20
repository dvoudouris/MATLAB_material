%%% Introduction to programming with MATLAB
%%% Topic #10 - IF-expressions
%%% Objectives: Introduction to if-expressions, nested if-expressions
%%%
%%% Dimitris Voudouris, January 2025


%% Intro
% IF-expressions are conditional operations.
% In other words, they determine whether a condition is true (== 1) or false (== 0).
% The idea is that, depending on the condition, a different operation can be later executed.
% Think for instance:
% If tired == true
%      sleep
% end
%
% Let's see an example
year = 2025;            % set the variable 'year' to 2025
if year == 2025         % if year is 2025, then
    disp('congrats')    % display this text
end                     % each if-statement *MUST* close with an *end*

% Note the double equal sign! This is because we want the statement to reflect a logical operation (true or false)

% If 'expression'
%   'statement'
% end

if year == 2021                     % is the variable 'year' equal to 2021? No.
    disp('condition is met')        % so nothing will be displayed
end

% How we can adjust the following statement so that we can display the message?
if year == 2021+4                   % is the variable 'year' equal to 2025? Yes.
    disp('condition is met')        % so the text will be displayed
end

% We can extend the statement by adding alternative 'else' expressions.
if year == 2025
    disp('year is 2025')
else                            % if year is not 2025, then...
    disp('year is not 2025')    % this message will appear
end                             % do not forget the *end*!

% We can add more alternatives with the form of 'elseif' expressions.
if year == 2025
    disp('year is 2025')
elseif year < 2025
    disp('year is before 2025')
elseif year > 2025
    disp('year is after 2025')
end

% The last 'elseif' expression is  redundant and the expression can be simplified:
if year == 2025
    disp('year is 2025')
elseif year < 2025
    disp('year is before 2025')
else
    disp('year is after 2025')
end
% Can you explain why?


%% Execute conditionals after user's input
% Let's now imagine that we are looking for participants for an experiment.
% Say that each participant fills out their age and studies status in an online invitation.
% Eligible participants are those who are  between 18 and 21 years old, independently of whether they study or not.
age = inputdlg('Please type in your age: ');
% The variable 'age' will take the value that you will type in.
% Because you are allowed to type in any type of value, numerical or string, 
% MATLAB will set the variable 'age' into a string within a cell.
% To evaluate the numerical value of the input, we need to convert the string into a number.
% Here we will use the function 'str2double' but you can also use the function 'str2num'. See the summary PDF for differences between the two!
if str2double(age) >= 18 && str2double(age) <= 21
    disp('Congratulations, you are eligible!')
else
    disp('I am sorry, next time!')
end

% We do not have enough eligible subjects, so let's extend our criteria:
% An interested person can now participate if they are between 18-21 years old
% OR if they are older than 18 as long as they are students.
info = inputdlg( {'Please type in your age:', 'Are you a student (Y/N)?'} );
% We use a comma to separate the two questions, so that two input areas are created.
if str2double(info{1}) >= 18 && str2double(info{1}) <= 21 || str2double(info{1}) >= 18 && strcmpi(info(2), 'Y')
    disp('Congratulations, you are eligible!')
else
    disp('I am sorry, next time!')
end
% The function *strcmp* is case sensitive. 
% If you are a student but typed a lower-case 'y', the above expression will be false.
% Use *strcmpi* for case insensitive operations!


%% Generic if-expressions on arrays
% Can we apply IF-expressions to complete arrays? Yes, we can.
rng(1)
temperature = randi([-2 15], 1, 14);

if any(temperature < 0)     % if any element is below zero...
    disp('at least one value below zero')
else
    disp('all values equal or greater than zero')
end

if all(temperature > 0)     % if all elements are greater than zero...
    disp('all days were warm')
else
    disp('not all days were warm')
end


%% Nested if-expressions
% We want to inform the user what is the weather for each of these days.
if temperature(1) >= 1              % temperature for day 1 (first vector element)
    disp('temperature is positive')
elseif temperature(1) == 0          % again for day 1, but alternative category (equal to zero)
    disp('temperature is zero')
else                                % again for day 1, but now the remaining category (neither larger than zero, nor zero, so below zero)
    disp('temperature is negative')
end

% Before we see a nested if-expression, we shortly introduce a more sophisticated way to present text in our command window.
% Using fprintf, we can display text that not only can be formatted in several ways, but can also take formatting commands.
% This is similar to the *sprintf* command that we had seen some time ago.
% The difference is that *sprintf* creates a string variable, 
% whereas % *fprintf* allows you to display stuff on the command window (or even write to a file, which we won't cover)
fprintf('this is a line')
fprintf('\nand this is another line')
fprintf('\n\nwhereas now...\n\tI go to an intendated new line!\n')

% So, a nested-if-expression allows us to add more conditions within a condition.
% Say, we do not care if the temperature is just positive but we want to also see how does the temperature feel.
if temperature(2) >= 1              % day 1
    fprintf('temperature is positive...\t')
    if temperature(1) <= 5
        fprintf('but very cold\n')
    elseif temperature(1) > 5 && temperature(1) <= 10
        fprintf('and somewhat cold\n')
    elseif temperature(1) > 10
        fprintf('and mild\n')
    end
elseif temperature(1) == 0
    fprintf('temperature is zero\n')
else
    fprintf('temperature is negative\n')
end
% If-expressions allow 'automated' decision-making.
% We saw how to do this when working with scalars.
% To apply conditionals on each of several elements of an array, you need to wait for the next topic, 
%   where we will talk about iterations with for-loops.
% This will be useful to apply the same commands over and over again.


%% Take home messages - summary
%
% 1. Conditionals are true or false expressions (with alternatives).
%   The expression is true if, and only if, it is not empty and nonzero.
%   Otherwise, it is false.
% 2. Each evaluated expressions needs to be a logical operation.
%       For instance, use '==' than '='
% 3. Apply generic conditionals (any, all) in complete vectors to check broad expressions.
% 4. Nested if(-else) expressions include an if(-else) statement within another.


%% The end


