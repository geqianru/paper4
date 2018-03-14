    function sta = bits1(k, n, num)
        for jt = 1 : n
            sta(jt) = mod( floor( k./num^( jt - 1) ), num);
        end
    end