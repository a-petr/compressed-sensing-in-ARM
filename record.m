function [myRecording] = record(hrtz,t)
% Record your voice for t seconds.
recObj = audiorecorder(hrtz,8,1);
disp('Start speaking.')
recordblocking(recObj, t);
disp('End of Recording.');



% Store data in double-precision array.
myRecording = getaudiodata(recObj);
end

