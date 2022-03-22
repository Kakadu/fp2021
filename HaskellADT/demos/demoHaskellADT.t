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
xs = [10, 20, 30]
============================
$ ./demoHaskellADT.exe <<-EOF
> x = 2 + y
Unbound value y
============================
$ ./demoHaskellADT.exe <<-EOF
> data Point = Point Int Int
> data Shape = Circle Point Int | Rectangle Point Point
>
> surface (Circle _ r) = 3 * r * r
> surface (Rectangle (Point x1 y1) (Point x2 y2)) = (x2 - x1) * (y2 - y1)
>
> p1 = Point 0 0
> p2 = Point 3 4
>
> rect = Rectangle p1 p2
>
> s = surface rect
surface = <fun>
surface = <fun>
p1 = Point (0, 0)
p2 = Point (3, 4)
rect = Rectangle (Point (0, 0), Point (3, 4))
s = 12
============================
$ ./demoHaskellADT.exe <<-EOF
> fib n = if n < 1
>
>   then 1
>
>   else fib (n - 2) + fib (n - 1) 
> 
>
> x = fib 4
> x = fib 10
fib = <fun>
x = 8
x = 144
