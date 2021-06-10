%% Project IEOR 165, William Wijaya

%% Begin OLS
disp('Press enter to start OLS:');pause;clc;clear all;

data=readtable('winequality-red.csv');

bt=[];
b0t=[];

X=data{:,1:11}; %X Matrix
Y= data.quality; %Y matrix
bold_one=ones(length(Y),1); %bold one matrix
Xm=[bold_one,X]; % Concatenating bold_one and X matrix

cvx_setup % Use cvx to solve, since objective function is convex
cvx_begin
variables b(11) b0;
minimize (sum_square(Y-Xm*[b0;b]))
cvx_end

fprintf('\nFinal answer:\n')
display(b)
display(b0)

%% Begin RR

disp('Press enter to start RR:');pause;clc;clear all;

data=readtable('winequality-red.csv');

k=100; %Use Leave k-out cross validation

lambda=linspace(0,100,200);
error=zeros(1,length(lambda)); %Setting ej=0 for all j

random=randperm(1599,k); 
randomC=setdiff(1:1599,random);

data_1=data(random,:); % k data points
data_2=data(randomC,:); % n-k data points

X=data_1{:,1:11};
Y=data_1{:,12};

for j=1:length(error)
    beta=ridge(Y,X,lambda(j),0);
    Ypredict=[ones(length(randomC),1),data_2{:,1:11}]*beta;
    error(j)=error(j)+(1/k)*(sum((data_2{:,12}-Ypredict).^2));
end

[value,idx]=min(error);
mu=lambda(idx); % Optimal lambda
plot(lambda,error,'R-x')
xlabel('Lambda');
ylabel('Cross Validation Error');
title('Tuning Parameter vs Cross Validation Error');

X=data{:,1:11}; %X Matrix
Y= data.quality; %Y matrix
optbeta=ridge(Y,X,lambda(j),0); %Optimal beta

%% Begin Lasso

disp('Press enter to start Lasso:');pause;clc;clear all;

data=readtable('winequality-red.csv');
X=data{:,1:11}; %X Matrix
Y= data.quality; %Y matrix

k=39; %k fold cross validation,k is a factor of 1599

[B,Info] = lasso(X,Y,'CV',k); 

lambda = Info.LambdaMinMSE; % Optimal lambda with minimum MSE
min_error = Info.MSE(Info.IndexMinMSE); % Minimal error
b = B(:,Info.IndexMinMSE); % Beta value

% Including b0 in the solution of beta
b_sol=zeros(1,12)';
b0 = b(1) + Info.Intercept(Info.IndexMinMSE);
b_sol=[b0;b];

%plot
plot(Info.Lambda,Info.MSE,'R-x');
title('Lambda VS Cross Validation Error');
xlabel('Lambda');
ylabel('Cross Validation Error');

fprintf('\nIEOR 165 project, finished!\n')
