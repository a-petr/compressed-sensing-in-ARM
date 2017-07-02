clear all;

load('HH128');
% HH128=dctmtx(128);
%THR=0.2;
THR=10;


% %% Plot 1D Haar function
% figure;
% x=(0:128-1);
% subplot(4,4,1), plot(x,HH128(1,:));
% subplot(4,4,5), plot(x,HH128(2,:));
% subplot(4,4,9), plot(x,HH128(3,:));
% subplot(4,4,10), plot(x,HH128(4,:));
% subplot(4,4,13), plot(x,HH128(5,:));
% subplot(4,4,14), plot(x,HH128(6,:));
% subplot(4,4,15), plot(x,HH128(7,:));
% subplot(4,4,16), plot(x,HH128(8,:));


% pause

%% Read and grayscale the image
im=imread('pic7.jpg'); % read pic7
I = mat2gray(rgb2gray(im)); % grayscale than to intensity matrix
IM=imresize(I,[1024, 1024]); %resize to the right size


%% Dividing to cells
submatr=mat2cell(IM,128*ones(1,8),128*ones(1,8)); % subdivides 
submatrthr=submatr;
SQ=submatr;
SP=submatr;
NN=zeros(8,8);

%% Thresholding
for i=1:8
    for j=1:8
        [SQ{i,j},SP{i,j},submatrthr{i,j},NN(i,j)] =...
            haarcoef(submatr{i,j},HH128,THR);
    end
end

%% From cell to mat
thrIM=cell2mat(submatrthr); % thresholded image
sq=cell2mat(SQ); % the actual coef
sp=cell2mat(SP);  % the thresholded coef

% %% Plotting
figure;
subplot(2,2,1), subimage(IM); 
subplot(2,2,3), subimage(sq);

subplot(2,2,2), subimage(thrIM);
subplot(2,2,4), subimage(sp);


%% The non zero elements
n_orig=length(find(sq~=0));
n_thrsh=length(find(sp~=0));

fprintf('the number of non-zero coefs in original is %d\n',...
    n_orig);

fprintf('the number of non-zero coefs in thresholded is %d\n',...
    n_thrsh);

fprintf('the percentage of survivors is %3.1f%%\n',...
    (n_thrsh*100)/(1024*1024));


% %% tensor product
% 
% AA=HH128(1,:)*HH128(2,:)';

% %% The error
% AA=(IM-thrIM).^2;
% norm2=sqrt(sum(AA(:))); % 2-norm
% rms=norm2/1024; % root mean square
% BB=abs(IM-thrIM);
% normmax=max(BB(:)); % max norm
% fprintf('emax = %f,\n e2 = %f,\n rms=%f\n',normmax,norm2,rms);

%% Coef error is 

% CC=(sq-sp).^2;
% norm2coef=sqrt(sum(CC(:)));
% DD=abs(sq-sp);
% normmax=max(DD(:));
% fprintf('emaxcoef = %f,\n e2coef = %f\n',normmax,norm2);
