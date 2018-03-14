function prob = tranprob1(S, Alphai, Beta)

%pij = gamma(S + Alphai)/ (gamma(Alphai) * gamma(S + 1)) * (Beta / (1 + Beta)) ^ Alphai * (1 / (1 + Beta)) ^ S; 
pij = (1 / gamma(S + 1)) * ((Beta / (1 + Beta)) ^ Alphai) * (1 / (1 + Beta)) ^ S;
   if (S == 0)
       prob = pij;
   else
       prob = pij;
       for t = 1 : S
           prob = (t + Alphai - 1) * prob;
       end
       if (isnan(prob))
           prob = 0;
       end
   end
       
end