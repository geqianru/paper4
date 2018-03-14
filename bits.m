function T = bits(k, n, num)
 % change the index of each instance to a Ternary number (????)
      for i = 1 : n
          T(i) = mod(floor(k./num^(i - 1)),num);
      end
end