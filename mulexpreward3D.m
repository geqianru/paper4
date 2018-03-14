function [g, probstat, statatem, minLCCtran] = mulexpreward3D(alpha, betat, act, minLCC, redesigncost, t)
% betat, act, minLCC, redesigncost, 
 failurebound(1) = 22;
 failurebound(2) = 37;
 failurebound(3) = 51;
 failurebound(4) = 65;

%% compute the index of alpha in minLCC
dim = length(alpha);
alpha = alpha .* act;
numlen = failurebound(t) + 1;
numstate = (numlen) ^ dim;
reverse = ones(1, dim);
T = length(failurebound) - 1;

   if(t == T)
       g1 = 0;
   else
       statatem = [];
       probstat = [];
       minLCCtran = [];
       xt = 1;
       for d1 =  0 : failurebound(t)
           %display(d1);
           probt1 = tranprob1(d1, alpha(1), betat);
           %display(probt1);
           if (probt1 <= 1e-8)
               break;
           end
           for d2 = 0 : failurebound(t)
               %display(d2);
               probt2 = tranprob1(d2, alpha(2), betat);
               %display(probt2);
               if (probt2 * probt1 <= 1e-8)
                   break;
               end
               probt(d2 + 1, 1) = -1;
               for d3 = 0 : failurebound(t)
                   %display(d3);
                   %i = d1 * (failurebound + 1) ^ 2 + d2 * (failurebound + 1) + d3 + 1;
                   alphanew = alpha + [d1 d2 d3];                
                   probt(d2 + 1, d3 + 2) = tranprob1(d3, alpha(3), betat);
                   %display(probt(d2 + 1, d3 + 2));
                   stat(d2 + 1, d3 + 1) = idalpha(alphanew, failurebound(t + 1));                
                   if and(probt(d2 + 1, d3 + 2) * probt1 * probt2 > 1e-8, stat(d2 + 1, d3 + 1)<= numstate)
                       probstat(xt) = probt(d2 + 1, d3 + 2) * probt1 * probt2;
                       statatem(xt) = stat(d2 + 1, d3 + 1);
                       xt = xt + 1;
                   elseif and(probt(d2 + 1, d3 + 2) * probt1 * probt2 <= 1e-8, xt == 1)
                       break;
                   elseif and(probt(d2 + 1, d3 + 2) * probt1 * probt2 <= 1e-8, true(probt(d2 + 1, d3 + 2)< probt(d2 + 1, d3 + 1) ) ) 
                       probstat(xt - 1) = (1 - sum( probt(d2 + 1, 2 : (length(probt(d2 + 1,:) ) - 2) ) ) ) * probt1 * probt2; 
                       break;
                   elseif and(stat(d2 + 1, d3 + 1) > numstate, xt > 1)
                       probstat(xt - 1) = (1 - sum( probt(d2 + 1, 2 : (length(probt(d2 + 1,:) ) - 2) ) ) ) * probt1 * probt2; 
                       break;
                   else
                       break;
                   end
               end
           end
           probt = 0;
           stat = 0;
       end
       
       for z = 1 : length(statatem)
           minLCCtran(z) = minLCC(statatem(z));
       end
       g1 = sum(probstat .* minLCCtran);
   end
   
    g2 = sum( (reverse - act) .* redesigncost);
    g = g1 + g2;       
end