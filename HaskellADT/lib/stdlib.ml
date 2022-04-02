let std_list =
  {|
  
  head xs = case xs of
     [] -> undefiend
     hd:tl -> hd
  
  
  length xs = let helper acc xs = case xs of
     [] -> acc
     hd:tl -> helper (acc + 1) tl
   in helper 0 xs 


  reverse  xs = let helper acc xs = case xs of
          [] -> acc
          hd:tl -> helper (hd:acc) tl 
        in helper [] xs
  
  
  map f xs = case xs of 
    [] -> [] 
    hd:tl -> f hd:map f tl
  
  
  foldl f acc xs = case xs of 
    [] -> acc
    hd:tl -> foldl f (f acc hd) tl
  
  
  foldr f acc xs = case xs of 
    [] -> acc
    hd:tl -> f hd (foldr f acc tl)
  
  
  take n xs = case xs of 
    [] -> []
    hd:tl -> if n == 0 then [] else hd:(take (n - 1) tl)
  
  
  drop n xs = case xs of
    [] -> []
    hd:tl -> if n == 1 then tl else drop (n - 1) tl
  
  |}
;;

let integer_ar =
  {|  
  
  succ x = x + 1

  pred x = x - 1

  mod x y = x - y * (x / y)

  gcd x y = if x == 0 || y == 0 then x + y else gcd y (mod x y)
  
  |}
;;

let stdlib = [ std_list; integer_ar ]
