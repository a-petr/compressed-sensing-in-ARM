function [sqcoef,spcoef,spsound,nnzero] = cosinecoef(v,D,THR)
% sqcoef is the original coefs
% spcoef is the threshholded coef
% spound  is recovered piece
sqcoef=D*v;
spcoef=sqcoef;
spcoef(abs(sqcoef)<THR)=0; % thresholded square coeff

spsound=D'*spcoef;  
nnzero = length(find(abs(spcoef)>THR)); % the indeces where > THR
end