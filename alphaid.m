
alpha = [5 1 2];
failurebound = 5;
dim = length(alpha);
numlen = failurebound + 1;
numstate = (numlen) ^ dim;

id = 1;
   for dj = 1 : dim
       id = id + alpha(dj) * (numlen) ^ (dj - 1);
   end


    for d1 =  0 : failurebound
        id = id + d1;
        for d2 = 0 : failurebound
            id = id + d2 * (failurebound + 1);
            for d3 = 0 : failurebound
                id = id + d3 * (failurebound + 1) ^ 2;
                alphanew = alpha + [d1 d2 d3];
            end
        end
    end