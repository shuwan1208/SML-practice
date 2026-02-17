fun count (0, _) = 1
  | count (_, []) = 0
  | count (sum, c::cs) =
    if sum < 0 then 0 
    else count (sum, cs) + count (sum - c, c::cs);

val test_result = count(10, [25, 10, 5, 1]);