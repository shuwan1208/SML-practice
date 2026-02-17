fun bsearch_fun(f,x0,lb,ub)=
   if lb<ub then 
      let val mid = lb + (ub - lb) div 2
      in 
        if x0 < f(mid) then
                bsearch_fun (f, x0, lb, mid - 1)
            else
                bsearch_fun (f, x0, mid + 1, ub)
        end
       else  
           ub
fun icrt (x: int) =
    let
        fun cube n = n * n * n
    in
        bsearch_fun (cube, x, 0, 1260)
    end;
val res1 = icrt 30;   
val res2 = icrt 1000; 

