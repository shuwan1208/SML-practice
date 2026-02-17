fun twice f = fn x => f (f x)

val S = fn x => x + 1
val Z = 0

val ans0 = twice S Z
val ans1 = twice twice S Z
val ans2 = twice (twice twice) S Z
val ans3 = twice (twice (twice twice)) S Z

val _ = print ("ans0 = " ^ Int.toString(ans0) ^ "\n")
val _ = print ("ans1 = " ^ Int.toString(ans1) ^ "\n")
val _ = print ("ans2 = " ^ Int.toString(res2) ^ "\n")