function [g, probstat, statatem, minLCCtran] = mulexpreward2D(alpha, betat, act, minLCC, redesigncost, t, T)
% betat, act, minLCC, redesigncost, 
%% compute the index of alpha in minLCC
 failurebound(1) = 1;
 failurebound(2) = 22;
 failurebound(3) = 61;
 failurebound(4) = 100;
 failurebound(5) = 139;
 failurebound(6) = 178;

dim = length(alpha);
alpha = alpha .* act;
   if (t < T)
       numlen = failurebound(t + 1) + 1;
       numstate = (numlen) ^ dim;
   end
reverse = ones(1, dim);


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
           probt(d1 + 1, 1) = -1;
               for d2 = 0 : failurebound(t)
                   %display(d2);
                   %i = d1 * (failurebound + 1) ^ 2 + d2 * (failurebound + 1) + d3 + 1;
                   alphanew = alpha + [d1 d2];                
                   probt(d1 + 1, d2 + 2) = tranprob1(d2, alpha(2), betat);
                   %display(probt(d2 + 1, d3 + 2));
                   stat(d1 + 1, d2 + 1) = idalpha(alphanew, failurebound(t + 1));                
                   if and(probt(d1 + 1, d2 + 2) * probt1 > 1e-8, stat(d1 + 1, d2 + 1)<= numstate)
                       probstat(xt) = probt(d1 + 1, d2 + 2) * probt1;
                       statatem(xt) = stat(d1 + 1, d2 + 1);
                       xt = xt + 1;
                   elseif and(probt(d1 + 1, d2 + 2) * probt1 <= 1e-8, xt == 1)
                       break;
                   elseif or (and(probt(d1 + 1, d2 + 2) * probt1 <= 1e-8, true(probt(d1 + 1, d2 + 2)< probt(d1 + 1, d2 + 1) ) ), and(stat(d1 + 1, d2 + 1) > numstate, xt > 1) ) 
                       probstat(xt - 1) = (1 - sum( probt(d1 + 1, 2 : (length(probt(d1 + 1, :) ) - 2) ) ) ) * probt1; 
                       break;
                   else
                       break;
                   end
               end
       end
              for z = 1 : length(statatem)
                  %display(z);
                  minLCCtran(z) = minLCC(statatem(z));
              end
       g1 = sum(probstat .* minLCCtran);
   end
   
    g2 = sum( (reverse - act) .* redesigncost);
    g = g1 + g2;       
end