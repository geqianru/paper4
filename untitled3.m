clear all;
clc;

dim = 2;
T = 4;
%[state, numlen, numstate, minLCC, R, P, g, optalpha, optact, e] = valuefun(dim, T);

cr = 100; 
cp = 1000;
D0 = 10;
r = 10;
beta0 = 1;
%alphar = 1;
%accur = 1; % the distance between each neighbor states 0:0.01:failurebound

redecost(1) = 20000;
redecost(2) = 10000;
% redecost(3) = 5000;
% failurebound(1) = 3;
% failurebound(2) = 5;
% failurebound(3) = 8;
 failurebound(1) = 1;
 failurebound(2) = 22;
 failurebound(3) = 61;
 failurebound(4) = 100;
 failurebound(5) = 139;
 %failurebound(6) = 178;
% failurebound(7) = 105;
% failurebound(8) = 118;
% failurebound(9) = 131;
% failurebound(10) = 143;
t = 4;
numlen(1) = failurebound(t) + 1; % compute the number of states in each dimention
numstate(1) =  ( numlen(1) ) ^ dim;
period = 0;

% 
% for i = 140393 : numstate(1)
% %i = 140393;
%     disp(i);
%     alphatra = bits1(i - 1, dim, numlen(1));    % creating state space
%     state(i - 140392, :) = alphatra;
%     R(i - 140392) = sum(alphatra) * cr / (beta0 + 3) ; % multidimentional repair costs
%     P(i - 140392) = pencost1(sum(alphatra), beta0 + 3, 3, r, D0, cp); % multidimentional penalty costs
%     minLCCT = zeros(numstate, 1);
%     [g(i  - 140392), optact(i  - 140392, :), optalpha(i  - 140392, :)] = muloptexpact(alphatra, beta0 + 3, minLCCT, failurebound(3), redecost);
%     minLCC(i  - 140392) = R(i  - 140392) + P(i  - 140392) + g(i  - 140392);
% end
% t = 1;
% period = 1;
% numlen(period + 1) = failurebound(t) + 1; % compute the number of states in each dimention
% numstate(period + 1) =  ( numlen(period + 1) ) ^ dim; 
%i = 209;
%for i = 1 : numstate(period + 1)
   % alphatra = bits1(i - 1, dim, numlen(period + 1));
   % [g1, optact1, optalpha1, cost] = muloptexpact(alphatra, beta0 + t, minLCC(:, period), failurebound, redecost, t);
%end

%[g, probstat, statatem, minLCCtran] = mulexpreward3D([0 2 0], beta0 + t, [1 1 1], minLCC(:, period), failurebound, redecost, t);


i = 4143;
alphatra = bits1(i - 1, dim, numlen(period + 1));    % creating state space
R = sum(alphatra) * cr / (beta0 + t) ; % multidimentional repair cost
P = pencost1(sum(alphatra), beta0 + t, r, D0, cp, failurebound(t + 1), dim);
minLCCT = zeros(numstate, 1);
[g, optact, optalpha] = muloptexpact(alphatra, beta0 + t, minLCCT, failurebound, redecost, t);
minLCC = R + P + g;


% for i = 0 : 44
%     P(i + 1) = pencost1(i, beta0 + t, r, D0, cp, failurebound(t + 1), dim);
% end

