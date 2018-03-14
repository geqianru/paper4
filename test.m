

dim = 2;
t = 3;
T = 4;
redecost(1) = 500;
redecost(2) = 500;
period = T - t;
cr(1) = 1;
cr(2) = 1;
cr(3) = 1;
cr(4) = 1;
cp(1) = 0;
cp(2) = 0;
cp(3) = 0;
cp(4) = 100;
D0 = 0;
r = 10;
beta0 = 1;

failurebound(1) = 1;
failurebound(2) = 22;
failurebound(3) = 61;
failurebound(4) = 100;
failurebound(5) = 139;
failurebound(6) = 178;

%for i = 415: 439
%for  i = 3830 : 3844
   i = 3830;
   alphatra = bits1(i - 1, dim, failurebound(t) + 1);
   %[minLCCnew(i - 3829), R(i - 3829), P(i - 3829), optact(i - 3829, :), optalpha(i - 3829, :), cost(i - 3829, :)] = muloptexpactbeg(alphatra, beta0 + t, minLCC(:, period), redecost, D0, r, cp(t), cr(t), t, T);
   [minLCCnew(i - 3829), R(i - 3829), P(i - 3829)] = mulexpreward2Dbeg(alphatra, beta0 + t, [1 1], minLCC(:, period), redecost, D0, r, cp(t), cr(t), t, T);
   %R(i - 414) = sum(alphatra) * cr(t) / (beta0 + t) ;
   %[g(i - 414), optact(i - 414, :), optalpha(i - 414, :), cost(i - 414, :)] = muloptexpact(alphatra, beta0 + t, minLCC(:, period), redecost, t, T);
%end

