function [state, numlen, numstate, minLCC, R, P, optalpha, optact, e] = valuefunnew(T)
tt = cputime;
dim = 2; % dimension: number of failure modes
cr(1) = 1;
cr(2) = 1;
cr(3) = 1;
cr(4) = 1;
cp(1) = 100;
cp(2) = 100;
cp(3) = 100;
cp(4) = 100;
D0 = 30;
r = 10;
beta0 = 1;
alpha0(1) = 1;
alpha0(2) = 1;
redecost(1) = 800;
redecost(2) = 1000;

% creating failure bound in each dimension
failurebound(1) = 1;
failurebound(2) = 22;
failurebound(3) = 61;
failurebound(4) = 100;
failurebound(5) = 139;
failurebound(6) = 178;

state = cell(T, 1);
optalpha = cell(T, 1);
optact = cell(T, 1);

    function sta = bitsnew(k, n, num)
        for jt = 1 : n
            sta(jt) = mod( floor( k./num^( jt - 1) ), num); 
        end
    end

   for period = 0 : (T - 1)
       t = T - period;
       display(t);
       if (t ~= 1)
           numlen(period + 1) = failurebound(t) + 1;  % compute the number of states in each dimention
           numstate(period + 1) =  ( numlen(period + 1) ) ^ dim; % compute the total number of states
           for i = 1 : numstate(period + 1)
               %disp(i);
               alphatra = bitsnew(i - 1, dim, numlen(period + 1)); % creating state space
               state{period + 1}(i, :) = alphatra;
               if (t == T)
                   [minLCC(i, period + 1), R(i, period + 1), P(i, period + 1), optact{period+1}(i, :), optalpha{period + 1}(i, :), ~] = muloptexpactbeg(alphatra, beta0 + t, 0, redecost, D0, r, cp(t), cr(t), t, T);
               else
                   [minLCC(i, period + 1), R(i, period + 1), P(i, period + 1), optact{period+1}(i, :), optalpha{period + 1}(i, :), ~] = muloptexpactbeg(alphatra, beta0 + t, minLCC(:, period), redecost, D0, r, cp(t), cr(t), t, T);
               end                                                
           end
       else
           alphatra = alpha0;
           state{period + 1} = alphatra;
           [minLCC(1, period + 1), R(i, period + 1), P(i, period + 1), optact{period + 1}(1, :), optalpha{period + 1}(1, :), ~] = muloptexpactbeg(alphatra, beta0 + t, minLCC(:, period), redecost, D0, r, cp(t), cr(t), t, T);
       end
   end
   
e = cputime - tt;
end