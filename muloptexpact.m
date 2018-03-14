function [optg, optact, optalpha, cost] = muloptexpact(alpha, betat, minLCC, redesigncost, t, T)


dim = length(alpha);
fulcom = 2 ^ dim;  %number of options if one and more modes are allowed to remove
%reverse = ones(1, dim);

    function sta = bits2(k, n)
        for jt = 1 : n
            sta(jt) = mod(floor( k./2^(jt - 1) ), 2);
        end
    end

   for di = 1 : fulcom
       %display(di);
       act(di, :) = bits2(di - 1, dim);
       %display(act(di, :));
       alphanew(di, :) = alpha .* act(di, :);
       %cost(di) = mulexpreward3D(alpha, betat, act(di, :), minLCC, redesigncost, t);
       cost(di) = mulexpreward2D(alpha, betat, act(di, :), minLCC, redesigncost, t, T);
       %display(cost(di));
   end

 [optg, opta] = min(cost);  
 optact = act(opta, :);
 optalpha = alphanew(opta, :);

end