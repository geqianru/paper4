function [state, numlen, numstate, minLCC, R, P, g, optalpha, optact, e] = valuefun(T)
%dim(dimension): number of failure modes
tt = cputime;
dim = 2; % dimension
cr(1) = 1;
cr(2) = 1;
cr(3) = 1;
cr(4) = 1;
cp(1) = 0;
cp(2) = 0;
cp(3) = 0;
cp(4) = 100;
D0 = 30;
r = 10;
beta0 = 1;
alpha0(1) = 1;
alpha0(2) = 1;
%accur = 1; % the distance between each neighbor states 0:0.01:failurebound
redecost(1) = 500;
redecost(2) = 500;
%redecost(3) = 5000;

 failurebound(1) = 1;
 failurebound(2) = 22;
 failurebound(3) = 61;
 failurebound(4) = 100;
 failurebound(5) = 139;
 failurebound(6) = 178;
% failurebound(7) = 91;
% failurebound(8) = 105;
% failurebound(9) = 118;
% failurebound(10) = 131;
 
%failurebound(1) = 3;
%failurebound(2) = 5;
%failurebound(3) = 8;

state = cell(T, 1);
optalpha = cell(T, 1);
optact = cell(T, 1);

 %% change the index of each instance to a Ternary number (????)
    function sta = bits1(k, n, num)
        for jt = 1 : n
            sta(jt) = mod( floor( k./num^( jt - 1) ), num);
        end
    end
 
 %% backward induction
  
    for period = 0 : (T - 1)
        t = T - period;
        display(t);
        if (t ~= 1)
            numlen(period + 1) = failurebound(t) + 1; % compute the number of states in each dimention
            numstate(period + 1) =  ( numlen(period + 1) ) ^ dim; % compute the total number of states
            for i = 1 : numstate(period + 1)
%                 if  (mod(i, 10000) == 0)
%                     disp(i);
%                 end
               % disp(i);
                alphatra = bits1(i - 1, dim, numlen(period + 1));    % creating state space
                state{period + 1}(i, :) = alphatra;
                R(i, period + 1) = sum(alphatra) * cr(t) / (beta0 + t) ; % multidimentional repair costs
                P(i, period + 1) = pencostdim(sum(alphatra), beta0 + t, r, D0, cp(t), failurebound(t + 1), dim); % multidimentional penalty costs
                if (t == T)
                    %optalpha{period + 1}(i, :) = alphatra; %optimal state after redesign
                    %optact{period + 1}(i, :) = ones(dim, 1);
                    minLCCT = zeros(numstate, 1);
                    [g(i, period + 1), optact{period + 1}(i, :), optalpha{period + 1}(i, :), ~] = muloptexpact(alphatra, beta0 + t, minLCCT, redecost, t, T);
                    minLCC(i, period + 1) = R(i, period + 1) + P(i, period + 1) + g(i, period + 1);
                else
                    [g(i, period + 1), optact{period + 1}(i, :), optalpha{period + 1}(i, :), ~] = muloptexpact(alphatra, beta0 + t, minLCC(:, period), redecost, t, T);
                    minLCC(i, period + 1) = R(i, period + 1) + P(i, period + 1) + g(i, period + 1);
                end                           
            end
        else
            alphatra = alpha0;
            state{period + 1} = alphatra;
            R(1, period + 1) = sum(alphatra) * cr(t) / (beta0 + t) ;
            P(1, period + 1) = pencostdim(sum(alphatra), beta0 + t, r, D0, cp(t), failurebound(t + 1), dim);
            [g(1, period + 1), optact{period + 1}(1, :), optalpha{period + 1}(1, :)] = muloptexpact(alphatra, beta0 + t, minLCC(:, period), redecost, t, T);
            minLCC(1, period + 1) = R(1, period + 1) + P(1, period + 1) + g(1, period + 1);           
        end
                   
    end
e = cputime - tt; 
end

