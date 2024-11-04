%%% Introduction to programming with MATLAB - WS 2024/2025
%%% Topic #2 - Opertations with matrices
%%% Objectives: Create matrices - Access matrix elements - Do operations with matrices
%%% 
%%% Dimitris Voudouris, October 2024


%% Default matrices

% You can create default matrices by calling built-in commands, similar to
% how you created default vectors
a = zeros( 3, 5 )               % matrix of zeros: 3 rows, 5 columns
a = ones( 5, 2 )                % matrix of ones: 5 rows, 2 columns
a = rand( 5, 3 )                % uniformly distributed random values between 0 and 1
a = randn( 3, 5 )               % normally distributed random values
a = randi( [3 9], 4, 6 )        % 4 rows and 6 columns with random integers between 3 and 9

% The generation of the matrices is not actually random but it depends on a
% built-in generator that creates pre-determined sequences of numbers. 
% The sequence of the generated pseudorandom numbers is determined by a "seed",
% which can depend, for instance, on the state of the computer (e.g., time). 
% You can think of the "seed" as a starting point of a pre-determined sequence of numbers. 
% Try:
a = rand( 1, 5 )    % creates a sequence of 5 values
a = rand( 1, 5 )    % creates a different sequence of 5 values
rng(1)              % specifies the seed to 1 (= a specific Random Number Generator)
a = rand( 1, 5 )    % creates a new sequence of 5 values
a = rand( 1, 5 )    % creates a different sequence of 5 values
rng(1)              % re-specifies the seed to 1
a = rand( 1, 5 )    % creates the sequence of 5 values that was generated in line 27
a = rand( 1, 5 )    % creates the sequence of 5 values that was generated in line 28

% Let's create our own matrix
a = [10, 40, 70, 90; 2, 4, 6, 8];   % values are put in the same row until a semicolon changes the line
% Remember that the two lines must have the same number of elements (columns)

b = [ 1:4; 4:-1:1];                 % row 1 has integers between 1 to 4, row 2 has integers between 4 and 1 (descending order!)


%% Operations with matrices
a + 5       % adds the constant scalar 5 to each element of matrix a
b - 3       % subtracts the constant scalar 3 from each element of matrix b
% NOTE: The matrices "a" and "b" maintain their original values as these were specified in lines 34 and 37
% If you want to change the values of the matrix, then you need to redefine each matrix,
% e.g., b = b - 3

a * 2       % multiplies each element of matrix "a" by 2
b / 3       % divides each element of matrix "b" with 3
a ^ 2       % raises each element of matrix "a" to the power of 2...oh no, problem
% Explanation of problem:
% Raising a matrix to the power of a value requires that the matrix is a square matrix (2x2, 3x3, ..., 9x9, etc.)
% If it is not, we need to apply an explicit command for an *element-by-element operation*
% We do this by using the dot before the symbol of our operation
a .^ 2      % this will raise each element of matrix "a" to the power of 2

% The dot is a very important consideration also when multiplying matrices
a * b       % this will try to perform an algebraic matrix multiplication, which is likely something you do NOT want to use at this stage
% It will even fail because, for such an operation, the number of rows of
% matrix "a" needs to be the same as the number of columns of matrix "b"
% We will NOT use matrix multiplications in this seminar -if you are
% interested in this mathematical topic, please do: help mtimes

% This highlights that, if we need an element-by-element multiplication, division, or exponentation, 
% we need to recruit the "dot"
b .* a
a ./ b
a .^ b


%% Combine matrices into larger matrices
c = [a, b];                         % c is a new matrix that combines matrices "a" and "b" next to each other (we separate them with a comma)
c = [a; b];                         % ...and now "b" is below "a" (separation with semicolon)

% Let's redefine our previous 2x4 matrix "b" to a 2x10 matrix
b = [ 1:10; 10:-1:1];               % row 1 has values between 1 and 10, row 2 has values between 10 and 1 (descending)
c = [a, b];                         % a and b can be combined if placed next to each other (as they have the same number of rows)
c = [a; b];                         % ...but they cannot be placed on top of each other, because of their unequal number of columns
c = [a'; b'];                       % ...of course, we can transpose each matrix so that each of them has now 2 columns

% To combine matrices, they need to have the same size in the "critical" dimension
% How to figure out the dimensions of a (say, huge) matrix?
% One option is to use the command "length", as we saw last week
length(b)           % Why 10? b has 2 rows, each with 10 values...

% The function "length" will return the length of the largest array dimension
% For scalars and vectors, this is straightforward, but for matrices it is not
% So, for matrices, we want to ask for the length (size) of each dimension
size(b)             % here we go
[r, c] = size(b);   % assign the number of rows in variable "r" and the number of columns in variable "c" (note that "c" now replaces the previously calculated variable "c" in line 78)
numel(b)            % the number of elements in matrix b is equal to 20 (across all dimensions, so 2 rows times 10 columns is 20)
c = repmat(c, 1, 3) % re-defines matrix "c" as a repetition (repmat = REPeat MATrix) of original matrix "c", 1 time along the row dimensions and 3 times along the column dimensions 

% Choose elements of a matrix
% 1) Call your matrix name, open brackets, add comma inside the bracket
% 2) Add the requested row(s) before the comma, add the requested column(s) after the comma
a(1, 1)         % the element of matrix "a" that is at row=1 and column=1
a(2, 4)         % the element of matrix "a" that is at row=2 and column=4
a(3, 4)         % error -there is no row=3 in matrix "a"
b(1:2, 3:5)     % the elements of matrix "b" that are in rows 1 and 2 and in columns 3, 4, and 5
b(:, 3:5)       % we can use ":" to choose ALL elements of that dimension (here rows)
b(2, :)         % here we ask for all columns of row=2 (so we "print" to the command window a row vector)
c(3:6, 2:5)     % choose a submatrix of matrix "c"
c(3, 1) = 999   % assign the value of 999 in row=3, column=1 of matrix "c"


%% Let's see a more meaningful example
Oct_week1 = [2, 1, 2, 9, 1, 4, 4];                   % how many coffees I drank in week 1 of October
Oct_week2 = [2, 2, 1, 1, 2, 4, 3];                   % in week 2
Oct_week3 = [3, 1, 2, 1, 9, 3, 2];                   % in week 3
Oct_week4 = [2, 1, 3, 2, 1, 3, 3];                   % in week 4
Oct = [Oct_week1; Oct_week2; Oct_week3; Oct_week4]   % each row is a week, each column is a day

% Let's replace some wrong value in our matrix
Oct(1, 4) = 2          % assigns a value of 2 to row=1, column=4
Oct(3, 5) = 0          % assigns a zero to row=3, column=5

% Continue for more weeks
Nov_week1 = [3, 2, 1, 2, 1, 3, 2];      % how much coffee I drank in each day of week 1 in November
Nov_week2 = [1, 2, 1, 1, 2, 5, 2];      % in week 
Nov_week3 = [3, 0, 2, 0];               % Say we do not have data for the last 3 days of this week
% Can we combine now the first two weeks of November together with the third (incomplete) week?
Nov = [Nov_week1; Nov_week2; Nov_week3] 
% Vector Nov_week3 has fewer elements than the other variables, so I cannot create a Nov matrix
% Let's solve this somehow
Nov_week3 = [3, 0, 2, 0, NaN, NaN, NaN]; % Assign NaNs (abbreviation for Not-A-Number) at the indices that do not yet have data
Nov = [Nov_week1; Nov_week2; Nov_week3]    

Oct_Nov = [Oct; Nov]        % each column is a day, each row a week starting from October until the current week of November

% Calculate the largest number of coffees that I drank in a given day
max(Oct_Nov)                % this will give me a 7-elements vector, each element showing the maximal across each column
max(Oct_Nov, [], 2)         % this will give me a vector with each element showing the maximal across the second dimension of this matrix (MATLAB prioritizes columns, so rows is the "second" priority)
max(Oct_Nov(:))             % this will give me a single value, the maximal of the matrix. 
% IMPORTANT! The single parenthesis containing the colon operator (:) after the name of the matrix will convert the matrix to a SINGLE COLUMN VECTOR!
% In other words, each column of matrix "Oct_Nov" will be placed below the previous column
[M, I] = max(Oct_Nov(:))    % M = the maximal value of the matrix (after it is converted to a single-column vector),
                            % I = the index of this vector where the maximal is found
% Now we have the index of the column vector with the maximal value.
% But what if we wanted to know when did this maximum occur ( e.g., row (week) AND column (day) )?

% Even if we work with *linear indexing*, we can still find the row and column of the matrix's maximum
[row, column] = ind2sub(size(Oct_Nov), I)   % use built-in function *ind2sub* to convert a linear index to a subscript for a matrix
% You need as inputs (a) the size of the matrix, and (b) the linear index that we want to locate
% As outputs you get (a) the row, and (b) the column of our matrix, to which the linear index corresponds


%% Take home messages - summary
% 
% 1. MATLAB has its own default matrix creation functions: 'ones' and 'zeros'
% 2. Create a matrix manually by using a semicolon to move to the next column
% 3. To create a matrix manually, your variable must have the same number of elements in each row
% 4. Combine vectors by using either a comma or a semicolon. Please remember the restrictions in the 'critical' dimension
% 5. Use the operation '(:)' after the name of your matrix to convert the matrix into a single-column-vector 



%% The end
