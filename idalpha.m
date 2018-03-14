function [id] = idalpha(alpha, failurebound)
dim = length(alpha);
numlen = failurebound + 1;
id = 1;
   for dj = 1 : dim
       id = id + alpha(dj) * (numlen) ^ (dj - 1);
   end
end