%% put key subdirectories in path if not already there
path(path,'.\Optimization');

% signal length
N=1000;
% N = 512;

% number of spikes in the signal
T=10;
% T = 20;
% number of observations to make
%K=20;
K = 120;

%% Save random settings
%s = rng; % this saves the current settings


%rng(s); % calls the saved settings


%% random +/- 1 signal
x = zeros(N,1);
q = randperm(N);
x(q(1:T)) = sign(randn(T,1));

%% measurement matrix
disp('Creating measurment matrix...');
A = randn(K,N);
A = orth(A')';
disp('Done.');
% observations
y = A*x;
% initial guess = min energy
x0 = A'*y;

%% solve the LP
xp = l1eq_pd(x0, A, [], y, 1e-3);

%% plotting
figure;
subplot(1,3,1); plot(x,'-'); axis([0 512 -1.5 1.5]); pbaspect([2 3 1]);
subplot(1,3,2); plot(x0,'-');  axis([0 512 -1.5 1.5]); pbaspect([2 3 1])
subplot(1,3,3); plot(xp,'-');  axis([0 512 -1.5 1.5]); pbaspect([2 3 1])

fprintf('the size of the original vector is %d\n',N);
fprintf('the number of measurements is %d\n',K);
fprintf('the sparsity of the original vector is %d\n',T);