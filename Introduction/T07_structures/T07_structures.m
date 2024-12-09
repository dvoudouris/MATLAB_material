%%% Introduction to programming with MATLAB
%%% Topic #7 - Structures
%%% Objectives: Learn how to initiate structure arrays and work with fields
%%%
%%% Dimitris Voudouris, December 2024


%% Intro
% Structures are data types that can include several separate fields
% Each field can contain different types of variables, such as:
%   scalars, vectors, or matrices
%   characters
%   cell arrays
%   tables
%   other structures
%   ...
% You can think of structures as a big bookshelf where you can store: 
% folders with legal documents, folders with finances (numbers), piggy banks,
% decorative plants, toys for kids, other storage units, etc.
% They all belong to different 'categories' but can be combined under the same 'umbrella'
% Structures are a nice and tidy way to store data in a single variable.


%% Create a struct
subject = struct;                   % it will create a variable 'subject' as structure. This will be an empty structure.

% Faster way:
subject.name = 'Dimitris';          % a char in the structure 'subject', and in field 'name'
subject.age = 59;                   % a double in the same structure but in the field 'age'      
subject.attend = {sprintf('attended %d sessions', 10)};     % a char in a cell, in the field 'attend'

% First, what is this sprintf?
% It gives a command to 'print' (i.e. produce) the String specified in the following brackets
% For example:
% sprintf('Hello')
% will create a variable with the string 'Hello'
% The power of sprintf is that it can produce different strings based on
%   placeholders that take different values.
% For example: 
% sprintf('The temperature today is %d degrees', 45)
%   will present the text in the quotes and will assign the Double value specified after the quotes at the placeholder (%d) 
%
% sprintf('Today is %s', 'Tuesday')
%   will present the text in the quotes and will assign the String value specified after the quotes at the placeholder (%s)


%% Access the fieldnames
thenames = fieldnames(subject);         % returns a cell array with the name of each field in a different cell
thenames{1};                            % here we can access the contents of the first cell

subject.group = 2;                      % add field 'group' with the value 2
% say that you want to assign your subject in the second experimental group


%% Reorder fields
subject = orderfields(subject, [1 2 4 3]);    % the numbers in the square brackets indicate the order of the fields that we want our updated variable to have
% similarly as we had seen with re-ordering numerical matrices

% Alternatively, you can specify the order by using the fieldnames:
subject = orderfields(subject, {'name', 'age', 'attend', 'group'});
% Note that I use curly brackets for the second input because this input comprises strings, not numbers
% Obviously, this solution can be more straightforward but it is more time-consuming and can lead to spelling mistakes

% You can also use the command 'fieldnames' to re-order
% Use the text inside each cell and sort the fields in an alphabetical order
thenames = fieldnames(subject);                         % cell array with the fieldnames (as we saw earlier)
subject = orderfields(subject, sort(thenames));         % sort the fields in an alphabetical order


%% Let's add one more subject
% So far, we had a 1 (row) x 1 (column) structure array
% Here we extend this structure array by adding ***one more structure***.
% In other words, we create a 1x2 **structure array** (an array of structures)

subject(2).name = 'Jon';          % extends the structure array 'subject' by adding one more structure
subject(1).age                    % will show the age of subject 1 ('Dimitris')
subject(2).age                    % will show the age of subject 2 ('Jon'), which is, however, empty
subject(2).age = 34;              % Let's add an age for Jon
% Note that the second structure has only 2 defined fields, 'name' and 'age'
% The other fields (e.g, 'group', 'attend') will be automatically generated but will remain empty
%   because, as matrices, structures should have an equal number of elements along the critical (combining) direction:
subject(2)

% A structure array is similar to a numerical array (e.g., a = [12 34 67], has three elements)
% Here, we just have structures next to each other (e.g., sample = [structure(1), structure(2), ...])


%% Now let's add one more field to each structure
subject(1).test = randi([550 850], 5, 2);      % some test results (e.g., movement times) from 10 different 'tests' that we did during the experimental session
subject(2).test = randi([600 950], 5, 2);      % same, but for the other subject/structure
% We just created new fields for each structure!

% Embrace yourselves, it may start getting complicated now...

% Each structure of our subject-array has several fields, and some of these fields have several elements...
% This means, we can request specific elements, from specific fields and from specific structures...
% For example, we can access some test results of each subject:
subject(1).test                     % all elements of field 'test' from the first structure/subject
subject(2).test(3, 2)               % element at row = 3, column = 2, of field 'test' from second structure/subject
subject(2).test(4, 1) = 970;        % set the value at row = 4, column = 1 of the field 'test' from the second structure to 970

% Since we can access whichever value of whichever field of whichever structure we want, we can also plot stuff
% Plot the results of each subject in separate subplots
h = figure; 
h.WindowStyle = 'docked';
h.Color = 'k';
subplot(2, 2, 1); b1 = bar(subject(1).test(:, 1), 'b');     % here we plot and in the next lines we format the graph
    axis square; axis padded; ylim([0 1000]); 
    xticklabels({'1', '2', '3', '4', '5'}); xtickangle(45);
    xlabel('test nr', 'Color', 'w');
    ylabel('movement time (ms)', 'Color', 'white');
    title(sprintf('Subject %d', 1), 'Color', [1 1 1]); 
    ax = gca; ax.XColorMode = 'manual'; ax.XColor = 'w'; ax.YColorMode = 'manual'; ax.YColor = 'w'; ax.LabelFontSizeMultiplier = 1.5;
subplot(2, 2, 2); b2 = bar(subject(2).test(:, 1), 'r');     % again, here we plot, in the following we format the graph
    axis square; axis padded; ylim([0 1000]); 
    xticklabels({'1', '2', '3', '4', '5'}); xtickangle(45);
    xlabel('test nr', 'Color', 'w');
    title(sprintf('Subject %d', 2), 'Color', 'white');
    ax = gca; ax.XColorMode = 'manual'; ax.XColor = 'w'; ax.YColorMode = 'manual'; ax.YColor = 'w'; 
    ax.LabelFontSizeMultiplier = 1.5;
    
    
%% Let's add one more field about the endpoint error of their movement
rng(1)
subject(1).error = randi([0 100], 1, 1);            % one random integer for each structure/student
subject(2).error = randi([0 100], 1, 1);
subject(3).error = randi([0 100], 1, 1);            % this is for a third structure/student
% What fields will this third structure have?
% What will be the values of these fields?
% Check:
subject(3)

% take the average of the 'error' across structures/subject
mean(subject.error);                          
% Oh, problem.
% We expect that the command 'subject.error' will give us a vector with three values
% However, it gives us the elements of 'error' in three different variables (ans)
% So we should concatenate these three variables in a single vector:
vertcat(subject.error);         % for a vertical concatenation
horzcat(subject.error);         % or, for a horizontal concatenation

mean(vertcat(subject.error));   % now we have the average
std(vertcat(subject.error));    % ...and the standard deviation


%% Let's now remove a field, if we think it is redundant
subject = rmfield(subject, 'group');   % this will update/redefine the complete structure array 
% If we simply do:
%   rmfield(subject, 'group');
% then the struct variable 'subject' will *keep on having* the field 'group' 
% because our command will not update the variable 'subject'


%% Convert a structure to a table
% Simply convert your structure to a table if you want to work in such a way
subjects = struct2table(subject);

% ...or convert a table to a structure if you prefer that
my_new_subject_structure = table2struct(subjects);


%% Take home messages - summary
% 
% 1. Structures can take several fields of different data types.
% 2. Access a field by typing the struct-name, a dot and then the field-name: 
%   struct.field
% 3. Access a field-element by using a (curly) bracket after the field-name: 
%       struct.field(1);    % for elements in non-cell arrays
%       struct.field{1};    % for elements in cells
% 4. A structure can stand alone but can also be part of a structure array
%       (several structures next to each other, similar to numerical arrays)
% 5. Access a structure from a struct array by calling its index after the struct's name, 
%       then use a dot and the fieldname to access the respective field: 
%       struct(2).field{3}
%           ** pay attention whether you use a curly or normal bracket when accessing elements of a field **


%% The end