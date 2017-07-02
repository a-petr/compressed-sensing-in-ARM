function [sqcoef,spcoef,sppic,nnzero] = haarcoef(v,HH,THR)
sqcoef=HH*v*HH';
spcoef=sqcoef;
spcoef(abs(sqcoef)<THR)=0; % thresholded square coeff

sppic=HH'*spcoef*HH; % recovered piece 
nnzero = length(find(abs(spcoef)>THR)); % the indeces where > THR
end