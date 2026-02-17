val N = 8
fun is_safe (i0, j0, [], _) = true
  | is_safe (i0, j0, j::js, i) =
    let
        val column_safe = (j0 <> j)
        val diagonal_safe = (abs(i0 - i) <> abs(j0 - j))
    in
        column_safe andalso diagonal_safe andalso is_safe (i0, j0, js, i - 1)
    end

fun print_board bd =
    let
        fun print_dots 0 = ()
          | print_dots n = (print ". "; print_dots (n-1))
        
        fun print_row col =
            (print_dots col; print "Q "; print_dots (N - col - 1); print "\n")
            
        fun loop [] = ()
          | loop (c::cs) = (print_row c; loop cs)
    in
        loop (rev bd); 
        print "\n"
    end
fun search (bd, row, nsol) =
    if row = N then
        (print ("Solution #" ^ Int.toString(nsol + 1) ^ ":\n");
         print_board bd;
         nsol + 1)
    else
        let
            fun try_cols (j, current_nsol) =
                if j = N then current_nsol
                else
                    if is_safe (row, j, bd, row - 1) then
                        let
                            val next_nsol = search (j::bd, row + 1, current_nsol)
                        in
                            try_cols (j + 1, next_nsol)
                        end
                    else
                        try_cols (j + 1, current_nsol)
        in
            try_cols (0, nsol)
        end

fun solve_8_queens () = search ([], 0, 0)