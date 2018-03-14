function [Pen, p] = pencostdim(alphat, betat, r, D0, cp, failurebound, dim)

Pen = 0;
% failurebound(1) = 1;
% failurebound(2) = 22;
% failurebound(3) = 61;
% failurebound(4) = 100;
% failurebound(5) = 139;
% failurebound(6) = 178;

xt = 1;
probt(1) = -1;
   for S = 0 : failurebound * dim
       probt(S + 2) = tranprob1(S, alphat, betat);
       if or(probt(S + 2) >= 1e-7, S<= (1/3) * failurebound * dim)
           p(xt) = probt(S + 2);
           xt = xt + 1;
       elseif and(probt(S + 2) <= 1e-7, true(probt(S + 2) < probt(S + 1)))
           p(xt - 1) = 1 - sum(p(1 : (xt - 2)));
           break;
       end
   end
   %display(xt);
   
   for st = 1 : (length(p) - 1)
       Pen = Pen + p(st + 1) * max(st * r - D0, 0) * cp;
       %Pen = Pen + p(st + 1) * max(st - D0/r, 0) * cp;
   end

end