clear all

s=4000; % size of the analysis step
sec=9;
D=dctmtx(s); % discrete cosine
% D=dftmtx(size); % discrete fourier

THR=0.001;
Fs=40000; % typically it is set to 8000 samples per sec
N=Fs*sec; % length of audio array

%% Plot cosine function
% figure;
% x=(0:s-1);
% subplot(5,1,1), plot(x,D(2,:));
% subplot(5,1,2), plot(x,D(21,:));
% subplot(5,1,3), plot(x,D(51,:));
% subplot(5,1,4), plot(x,D(101,:));
% subplot(5,1,5), plot(x,D(201,:));
% pause

%% Record audio and save
% sound_arr=record(Fs,t); % say your name or sing
% save('data','sound_arr'); 
% load('data');

[y,Fss] = audioread('music.wav');
sound_arr=y(1:sec*Fs)';

%% Dividing to cells
N_cells=N/s;
vec=s*ones(1,N_cells);
sub_sound=mat2cell(sound_arr,vec,1); % subdivides 
sub_sound_thr=sub_sound;
SQ=sub_sound;
SP=sub_sound;
NN=zeros(1,40);

%% Thresholding
for i=1:N_cells
        [SQ{i},SP{i},sub_sound_thr{i},NN(i)] =...
            cosinecoef(sub_sound{i},D,THR);
end

%% From cell to aray
thr_sound_arr=cell2mat(sub_sound_thr); % thresholded sound
sq=cell2mat(SQ); % the actual coef
sp=cell2mat(SP);  % the thresholded coef


%% Plotting
figure;
xx=(0:N-1);
subplot(2,2,1), plot(xx,sound_arr); 
subplot(2,2,3), plot(xx,sq);

subplot(2,2,2), plot(xx,thr_sound_arr);
subplot(2,2,4), plot(xx,sp);


%% The non zero elements
n_orig=length(find(sq~=0));
n_thrsh=length(find(sp~=0));

fprintf('the number of non-zero coefs in original is %d\n',...
    n_orig);

fprintf('the number of non-zero coefs in thresholded is %d\n',...
    n_thrsh);

fprintf('the percentage of survivors is %3.1f%%\n',...
    (n_thrsh*100)/(sec*Fs));

%% Play back the recording.
pause; sound(sound_arr,Fs,8); % play original
pause;
sound(thr_sound_arr,Fs,8); % play thresholded

%% The error
% AA= (sound_arr-thr_sound_arr).^2;
% norm2=sqrt(sum(AA(:)));
% BB=abs(sound_arr-thr_sound_arr);
% normmax=max(BB(:));
% fprintf('emax = %5.2e,\n rms = %5.2e\n',normmax,norm2);