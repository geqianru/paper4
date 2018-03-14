function [state, numlen, numstate, minLCC, R, P, optalpha, optact, e] = valuefunT(dim)
%dim(dimension): number of failure modes

tt = cputime;
cr = 100; 
cp = 1000;
D0 = 10;
r = 10;
beta0 = 1;
%alphar = 1;
%accur = 1; % the distance between each neighbor states 0:0.01:failurebound
redecost(1) = 20000;
redecost(2) = 10000;
redecost(3) = 5000;

 failurebound(1) = 22;
 failurebound(2) = 37;
 failurebound(3) = 51;
 failurebound(4) = 65;
% failurebound(5) = 78;
% failurebound(6) = 91;
% failurebound(7) = 105;
% failurebound(8) = 118;
% failurebound(9) = 131;
% failurebound(10) = 143; 
 
% failurebound(1) = 3;
% failurebound(2) = 5;
% failurebound(3) = 8;

% state = cell(T, 1);
% optalpha = cell(T, 1);
% optact = cell(T, 1);

 %% change the index of each instance to a Ternary number (????)
    function sta = bits1(k, n, num)
        for jt = 1 : n
            sta(jt) = mod( floor( k./num^( jt - 1) ), num);
        end
    end
 
 %% backward induction
    
        numlen(1) = failurebound(2) + 1; % compute the number of states in each dimention
        numstate(1) =  ( numlen(1) ) ^ dim; % compute the total number of states
        for i = 1 : numstate(1)
%             if (period > 0)
%                 disp(i);
%             end
            alphatra = bits1(i - 1, dim, numlen(1));    % creating state space
            state(i, :) = alphatra;
            R(i) = sum(alphatra) * cr / (beta0 + t) ; % multidimentional repair costs
            P(i) = pencost1(sum(alphatra), beta0 + 3, 3, r, D0, cp); % multidimentional penalty costs
            minLCCT = zeros(numstate, 1);
            [g(i), optact(i, :), optalpha(i, :)] = muloptexpact(alphatra, beta0 + 3, minLCCT, failurebound(3), redecost);
            minLCC(i) = R(i) + P(i) + g(i);
%             minLCC(i) = R(i) + P(i);
%             optalpha(i, :) = alphatra; %optimal state after redesign
%             optact(i, :) = ones(dim, 1);            
        end
        
e = cputime - tt; 
end

