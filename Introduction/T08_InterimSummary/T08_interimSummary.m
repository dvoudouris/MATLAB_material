%%% Introduction to programming with MATLAB
%%% Topic #8 - Interim summary
%%% Objectives: Refresh some basic functions and practice the taught material
%%%
%%% Dimitris Voudouris, December 2024


%% Creating a matrix
% We can create a matrix (vector, scalar) in various ways:
scalar      = 10;                   % that's a 1x1 matrix (aka scalar)
vector      = [10, 10];             % that's a 1x2 matrix (aka vector)      
matrix      = [10, 10; 10, 10];     % that's a 2x2 matrix (aka matrix)
rscalar     = rand(1);              % random scalar between 0 and 1
rmatrix     = rand(2);              % 2x2 matrix with random scalars between 0 and 1

rvector     = rand(1, 5);           % 1x5 matrix with random scalars between 0 and 1
rnmatrix    = randn(2, 5);          % 2x5 matrix with random scalars from the normal distribution

% Fill out the following line to give a random integer between 1 and 10
% rint        = 

% Fill out the following line to give a 2x3 matrix with random integers between 5 and 20
% rintmatrix  = 


%% Different types of brackets

% Here we see two different types of brackets
% The parentheses () and the brackets []

% Parentheses () are used to enclose 
%   - arguments of functions --> plot(input), mean(input), randi(input)
%   - subscripts of matrices --> matrix(subscriptRow, subcscriptColumn)

% Brackets [] are used to create a matrix


%% Create and access matrix
vector      = [20 40 70 90];    % use brackets to create a vector
vector(1);                      % use parentheses to access the first element of the vector    
vector(2);                      % likewise...
vector([1 3]);                  % access the first and third element of the vector
% Note: Use parentheses () to tell MATLAB that you want to index the vector
%       Use square brackets inside the parentheses to create a vector which tells MATLAB what elements to choose (here the 1st and 3rd)


matrix      = [99 33 55 22; 45 56 23 65; 23 45 56 1515];   % use brackets to create your own matrix
matrix(1);      % the first element of the matrix
matrix(10);     % the tenth element of the matrix (after linear indexing it --> putting all columns below each other)
matrix(1, 2);   % first row, second column

% How should I choose the value at the third row and fourth column?

% How should I choose the value at the sixth row and first column?


% How can I replace the value at the first row and first column with a NaN?

% How can I replace the value at the second row and third column with 8888?


% Swap elements
matrix(1,1) = matrix(3, 4);    % set the element at row=1 and column=1 to the value that is found at the element at row=3, column=4

% What will the following commands reveal?
% Tell before executing!
matrix([1 2 3])
matrix([1 3 2])
matrix([1 2 3 4])
matrix([1 3 2 4])
matrix([1 2])
matrix([1 2], :)
matrix(:, 1)
matrix(2, :)
matrix(2, [1 2 3 4])
matrix(2, [1 3 4 2])
matrix(:, [4 3 2 1])

% What is the value of 'matrix' now?


%% Special characters

% There are many special characters, some of which we just saw. For example

% comma (,)         Use it to:
%   - separate row elements in an array
A       = [1, 5, 9; 2, 10, 20];     % a comma is not necessary but can be used to separate the three elements
%   - provide input/output arguments
A(1, 2);                            % a comma separates the two indexing inputs
[M, I] = max(randn(5));             % a comma separates the two requested outputs
%   - give multiple commands on a single line
A(1, 2), A(2, 1)                    % MATLAB will execute two commands: first the A(1, 2), then the A(2, 1)

% semicolon (;)     Use it to:
%   - signify the end of a row
A       = [1, 5, 9; 2, 10, 20]      % values 1,5,9 are in a single row, then a semicolon brings the next values to the next row
%   - suppress output on command window
A       = [1, 5, 9; 2, 10, 20];     % same as before but now the matrix will not appear on the command window

% colon (:)         Use it to:
%   - create a vector
B       = 1:10;     % create a vector with integers between 1 and 10 in increments of 1
B       = 4:2:10;   % create a vector with integers between 4 and 10 in steps of 2
B       = [3:2:9; 99, 2, 0, 7];  % create a 2x4 matrix. Row 1 has integers between 3 and 9 in steps of 2. Row 2 has the values 99,2,0,7


% tilde (~)         Use it to:
%   - create a placeholder for an argument
max(B)              % tells you the maximal value in the matrix B. This should be 99
Z = max(B);         % assigns the maximal value into variable Z, separately for each column
[maxvalue, wheremaxvalue] = max(B);    % assigns the maximal value into variable 'maxvalue'. Assigns the (linear) index position of this maximal to variable 'wheremaxvalue'. Both separately for each column
[~, wheremaxvalue] = max(B);            % if you only want to know the index position of the max value, you need to ask MATLAB to *not* give you the default, first output value of the function


%% Visualize a bit more

% normal density functions
rng(1)
C           = randn(20000, 1);      % vector with 20000 random numbers
figure;     h1 = histogram(C, 50);
figure,     h2 = histfit(C);        % superimposes fitted normal density

% kind-of violin plots
figure;     sw1 = swarmchart(repelem(1, 1000), C(1:1000));
hold on;    sw2 = swarmchart(repelem(2, 1000), C(1001:2000));
sw3         = swarmchart(repelem(3, 1000), C(2001:3000));

% 3D plots
data = readmatrix('trial_1')
figure(100); tiledlayout(2, 3)
nexttile;   plot(data(:, 1));   
nexttile;   plot(data(:, 2));
nexttile;   plot(data(:, 3));
nexttile;   plot(data(:, 1), data(:, 2)); xlabel('x direction'), ylabel('y direction');
nexttile;   plot(data(:, 2), data(:, 3)); xlabel('y direction'), ylabel('z direction');
nexttile;   plot3(data(:, 1), data(:, 2), data(:, 3)); xlabel('x direction'), ylabel('y direction'); zlabel('z direction')


%% The end