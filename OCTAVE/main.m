%% Initialization
clear ; close all; clc

%% Setup the parameters you will use for this exercise
input_layer_size  = 24;  % 20x20 Input Images of Digits
hidden_layer_size = 50;  % 25 hidden units
num_labels = 2;          % 10 labels, from 1 to 10   
iter = 100;
                          % (note that we have mapped "0" to label 10)


% Load Training Data
fprintf('Loading Data ...\n')

Xtrain = csvread('data_trainX.csv');
ytrain = csvread('data_trainy.csv');
ytrain = ytrain .+ 1;
Xtest = csvread('data_testX.csv');
ytest = csvread('data_testy.csv');
ytest = ytest .+ 1;

fprintf('\nData Loaded, Press Any Key To Continue ...\n')
pause;


fprintf('\nInitializing Neural Network Parameters ...\n')

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, hidden_layer_size);
initial_Theta3 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:) ; initial_Theta3(:)];


fprintf('\nParameters Initialized, Press Any Key To Continue ...\n')
pause;



fprintf('\nTraining Neural Network... \n')

%  After you have completed the assignment, change the MaxIter to a larger
%  value to see how more training helps.
options = optimset('MaxIter', iter);

%  You should also try different values of lambda
lambda = 1;

% Create "short hand" for the cost function to be minimized
costFunction = @(p) nnCostFunction2(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, Xtrain, ytrain, lambda);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):(hidden_layer_size * (hidden_layer_size + input_layer_size + 2))), ...
                 hidden_layer_size, (hidden_layer_size + 1));
                 
Theta3 = reshape(nn_params((1 + (hidden_layer_size * (hidden_layer_size + input_layer_size + 2))):end), ...
                 num_labels, (hidden_layer_size + 1));

fprintf('\nTraining done. Press enter to continue.\n');
pause;


%% ================= Part 10: Implement Predict =================
%  After training the neural network, we would like to use it to predict
%  the labels. You will now implement the "predict" function to use the
%  neural network to predict the labels of the training set. This lets
%  you compute the training set accuracy.

pred = predict2(Theta1, Theta2, Theta3, Xtest);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == ytest)) * 100);


