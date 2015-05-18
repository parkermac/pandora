function [smooth] = Z_8d(data)
% 8/28/2013  Parker MacCready
% ** use ONLY with hourly data! **
%
% This applies the Austin-Barth 8 day filter to a vector,
% or a matrix in which each COLUMN is a data record.
%
% NOTE this may be different than their definition - it just returns a
% weighted average of the data over the previous 8 days from time t,
% with the weighting decaying from 1 to 1/e at t - 8 days.  There are 192
% hours in 8 days.
% 
% It returns a dataset of the same size you started with, padded whth
% NaN's at the ends.
%

fl = 8*24;

filter = exp(linspace(-1,0,fl))';
filter = filter/sum(filter);

smooth = NaN*data;
for ii = fl+1:length(data)
    smooth(ii) = sum(filter.*data(ii-fl+1:ii));
end



