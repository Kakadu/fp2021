$ ./demoHaskellADT.exe <<-EOF
> fast_fact x = 
>   let helper acc n = if n == 1        
>       then acc 
>       else helper (acc * n) (n - 1)  
>   in helper 1 x
>
>
> x = fast_fact 6
fast_fact = <fun>
x = 720
============================
$ ./demoHaskellADT.exe <<-EOF
> map f xs = case xs of
>              [] -> []
>              hs:tl -> (f hs) : map f tl
>
>
> xs = map (\x -> x * 10) [1,2,3,4]
map = <fun>
xs = [10, 20, 30, 40]
============================
$ ./demoHaskellADT.exe <<-EOF
> x = 2 + y
Unbound value y
============================
$ ./demoHaskellADT.exe <<-EOF
> data Point = Point Int Int
> data Shape = Circle Point Int | Rectangle Point Point
> abs x = if x > 0 then x else (0 - x)
> surface s = case s of
>   (Circle (Point x y) r) -> 3 * r * r
>   (Rectangle (Point x1 y1) (Point x2 y2)) -> abs (x1 - x2) * abs (y1 - y2)
> p1 = Point 0 0
> p2 = Point 3 4
> rect = Rectangle p1 p2
> circle = Circle p1 3
> s = surface rect
> c = surface circle
abs = <fun>
surface = <fun>
p1 = (Point 0 0)
p2 = (Point 3 4)
rect = (Rectangle (Point 0 0) (Point 3 4))
circle = (Circle (Point 0 0) 3)
s = 12
c = 27
============================
$ ./demoHaskellADT.exe <<-EOF
> fib n = if n < 1
>
>   then 1
>
>   else fib (n - 2) + fib (n - 1) 
> 
> x = fib 4
> x = fib 10
fib = <fun>
x = 8
x = 144
============================
$ ./demoHaskellADT.exe <<-EOF
> data Tree = Empty | Node Tree Int Tree
> 
> addToTree d t = case t of
>     Empty -> Node Empty d Empty
>     (Node l d' r) -> if d < d' 
>         then (Node (Node l d' r) d Empty)
>         else (Node (Node l d Empty) d' r) 
> 
> peekRoot t = case t of
>     Empty -> 0
>     (Node l d r) -> d
> 
> helper m t = case t of 
>         Empty -> Empty
>         (Node l d r) -> Node (helper m l) m (helper m r)
> 
> changeToMin t = helper (peekRoot t) t
> 
> size t = case t of
>     Empty -> 0
>     (Node l d r) -> size l + size r + 1
> 
> t = Empty
> t1 = addToTree 3 t
> t2 = addToTree 1 t1
> t3 = addToTree 0 t2
> t4 = changeToMin t3
addToTree = <fun>
peekRoot = <fun>
helper = <fun>
changeToMin = <fun>
size = <fun>
t = (Empty )
t1 = (Node (Empty ) 3 (Empty ))
t2 = (Node (Node (Empty ) 3 (Empty )) 1 (Empty ))
t3 = (Node (Node (Node (Empty ) 3 (Empty )) 1 (Empty )) 0 (Empty ))
t4 = (Node (Node (Node (Empty ) 0 (Empty )) 0 (Empty )) 0 (Empty ))
============================
$ ./demoHaskellADT.exe <<-EOF
> minus xs ys = case xs of
>     (x:xs) -> case ys of
>         (y:ys) -> if (x < y) then x : minus xs (y:ys) else
>                   if (x == y) then minus xs ys else
>                   minus (x:xs) ys
>         tl -> x:xs
>     tl -> tl
> 
> lstGen fst last step = if fst <= (last - step) then fst:(lstGen (fst+step) last step) else fst:[]
> 
> eratos n xs = case xs of 
>     [] -> []
>     (prim:tl) -> prim : eratos n (minus tl (lstGen (prim * prim) n prim))
> 
> primesTo n = eratos n (lstGen 2 n 1)
> 
> x = primesTo 100
minus = <fun>
lstGen = <fun>
eratos = <fun>
primesTo = <fun>
x = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
============================
