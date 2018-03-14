function [optg, optact, optalpha] = muloptexpactT(alpha, betat, redesigncost)

% betat, minLCC, failurebound,

dim = length(alpha);
fulcom = 2 ^ dim;  %number of options if one and more modes are allowed to remove
%reverse = ones(1, dim);

    function sta = bits2(k, n)
        for jt = 1 : n
            sta(jt) = mod(floor( k./2^(jt - 1) ), 2);
        end
    end

   for di = 1 : fulcom
       %disp(di);
       act(di, :) = bits2(di - 1, dim);
       alphanew(di, :) = alpha .* act(di, :);
       %cost(di) = sum(redesigncost .* (reverse - act(di, :))) + sum(act(di, :) .* [5000 5000 5000]);
       cost(di) = mulexpreward3D(alpha, betat, act(di, :), minLCC, failurebound, redesigncost);
   end

 [optg, opta] = min(cost);  
 optact = act(opta, :);
 optalpha = alphanew(opta, :);
 %optalpha = optalp(opta, :);
%     for dj = 1 : dim
%         if (optalp(dj) == 0)
%             redesigncost(dj) = 0;
%         end
%     end
    
%     if (sum(optalp)==0)
%         optalpha = 0;
%     else
%         redesigncost = redesigncost(redesigncost ~= 0);
%         optalpha = optalp(optalp ~= 0);
%         optaction = optact(optact ~= 0);
%     end
  
end