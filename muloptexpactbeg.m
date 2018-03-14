function [optLCC, R, P, optact, optalpha, cost] = muloptexpactbeg(alpha, betat, minLCC, redesigncost, D0, r, cp, cr, t, T)


dim = length(alpha);
fulcom = 2 ^ dim;  %number of options if one and more modes are allowed to remove
%reverse = ones(1, dim);

    function sta = bitsnew2(k, n)
        for jt = 1 : n
            sta(jt) = mod(floor( k./2^(jt - 1) ), 2);     
        end
    end

   for di = 1 : fulcom
       %display(di);
       act(di, :) = bitsnew2(di - 1, dim);
       %display(act(di, :));
       alphanew(di, :) = alpha .* act(di, :);
       %cost(di) = mulexpreward3D(alpha, betat, act(di, :), minLCC, redesigncost, t);
        [cost(di), Rep(di), Pen(di)] = mulexpreward2Dbeg(alpha, betat, act(di, :), minLCC, redesigncost, D0, r, cp, cr, t, T);
       %display(cost(di));
   end

 [optLCC, opta] = min(cost);  
 optact = act(opta, :);
 optalpha = alphanew(opta, :);
 R = Rep(opta);
 P = Pen(opta);
end