%%% Introduction to programming with MATLAB
%%% Topic #12 - WHILE-loops
%%% Objectives: Introduction to iterations with while-loops
%%%
%%% Dimitris Voudouris, March 2025


%% Intro
% The last topic touched upon iterations performed with for-loops.
% Another way to perform iterations is by using while-loops.
% While-loops repeat an operation *while* a condition is true.
% In contrast to for-loops, while-loops can become eternal as they do not specify a deterministic number of iterations.
% To set up a while-loop:

% while expression
%     statement
% end

% A while-loop comprises a logical expression, a statement, and an end.
cnt = 1;
while cnt < 6                                       % logical expression
  fprintf('doing stuff in iteration %d \n', cnt);   % statement
  cnt = cnt + 1;                                    % we need to give a command to change the counter, otherwise the loop may be eternal
end                                                 % always close the loop
% changing the counter in while-loops is done by the programmer, 
%   in contrast to the for-loops where the counter changes automatically

% Remember: 
% The loop variable, defined at the logical expression, must be defined before setting up the while-loop
%       This is not the case when doing for-loops!
% The counter should change within the loop
%       Otherwise you will create an infinite loop. 
cnt = 1;
while cnt < 6                                       % logical expression
  fprintf('doing stuff in iteration %d \n', cnt);   % statement
%   cnt = cnt + 1;                                  % comment-out this line and see that the loop goes on forever
end  
% This is eternal because the variable 'cnt' is defined to be 1 and there is 
%   no command that changes its value. Therefore, the expression is always true. 
% This is an infinite loop and it won't stop unless you do so manually.
% Click on your command window and press ctrl+C (for Macintosh cmd+C)


%% Exiting after an indefinite number of iterations 
% The advantage of a while-loop over a for-loop is that, sometimes, 
% you do not know in advance *when* you want your loop to stop executing. 
% An example:
rng(1);
target_value = 0.56;        % we pre-define a value that, when a subsequent calculation will reach it, then the loop should end
iter = 0;                   % a variable that will be used as a counter (not necessary, but good for understanding the loop)
while 1                     % the expression is 1, so *true*, therefore the while-loop will be constantly running (unless a *break* is encountered, that will force the loop to break) 
    temp = rand;            % variable 'temp' is defined as a random value between 0 and 1 
    iter = iter + 1;        % add the value of 1 to the variable 'iter'. When the while-loop goes through here for the first time, iter = 0 + 1 = 1
    fprintf('in iteration %d, the value is %5.4f\n', iter, temp);
    if temp > target_value  % if the temporary value defined in line 52 is larger than the target value of 0.56 (set in line 49)...
        break               % ...then exit the while-loop
    end                     % close the if-expression
end                         % close the while-loop
% Do not forget to close if-expressions, for- and while-loops!

% What will happen in the following example?
rng(1);
target_value = 2;
iter = 0;
while temp <= target_value  
    temp = rand;
    iter = iter + 1;
    fprintf('in iteration %d, the value is %5.4f\n', iter, temp);
    if temp > target_value
        break
    end
end


%% Skipping an iteration
% Sometimes we may want to skip an iteration for whatever reason. 
% For instance, when you analyse your reaching experiment's 180 trials, 
%   you may want to calculate the amplitude of a trial's movement only if 
%   the calculated movement time is above a certain value.
% If movement time is below that value, then you can *continue* to the next iteration
%   by using *continue*. Anything else after this command will be skipped. 
rng(1)
trial = 1;
iter = 0;
amplitude = nan(180, 1);
while trial <= 180
    iter = iter + 1;
    fprintf('I am analysing trial %d\n', trial);
    MT(trial) = randi([500 700], 1, 1);         % pick up a random integer between 500 and 700. This is the simulated movement time in this trial (iteration)
    if MT(trial) < 550                          % if movement time in this trial is below 550, add the value of 1 to the variable 'trial' and 'continue' to the next iteration
        trial = trial + 1;                      % what will happen if this line is skipped?
        continue
    end
    amplitude(trial) = randi([25 35], 1, 1);    % you can reach this line if, and only if, you did NOT 'continue', so if movement trial is equal or larger than 550
    trial = trial + 1;                          % increase the value of 'trial' by 1
end


%% Take home messages - summary

% 1. While-loops need an expression, a statement, and an 'end'
% 2. The number of iterations is not predefined. A while-loop should include some command or condition that terminates execution. 
% 3. Having a counter-variable defined before the loop, and letting it increase in each iteration, can help you to follow how many iterations are performed.
%       However, such variable is not obligatory to run a while-loop.
%       You can state 'while 1', which means that the loop will go on until a 'break' is encountered. 
% 4. The command 'continue' will allow you to skip the current iteration and proceed to the next. 


%% The end

