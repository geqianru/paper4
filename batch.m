clear all;
close all;
clc;
%  [state, numlen, numstate, minLCC, R, P, g, optalpha, optact, e] = valuefun(4);
[state, numlen, numstate, minLCC, R, P, optalpha, optact, e] = valuefunnew(4);
plotswitchingcurve;