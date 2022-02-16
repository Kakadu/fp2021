open Ruby_lib.Interpreter

let () =
  run_ruby
    {|
    puts "========================="
    puts "=al dente Smol Ruby Demo="
    puts "========================="

    class Magic
      def method_missing(m, args)
          if m == "fly"
            return args[0] + args[1]
          else
            return 0
          end
      end

      def fib(n)
        if n < 2
          return n
        end
      
        return fib(n-1) + fib(n-2)
      end

      def doxx(bool)
        while bool
          return bool
        end
      end
    end

    x = Magic.new

    puts "--"
    puts "<method missing>"

    puts x.fly(31, 11)
    puts x.walk()

    puts "--"
    puts "<recursion>"

    puts x.fib(42 / 2)

    puts "--"
    puts "<anonymous func>"

    puts x.doxx(lambda{| u, v | t = 3; (t >= 3) and (v == true) }.call(false, true))


    puts "--"
    puts "<list with index access>"

    list = [2 * 5, 0 , 1, x.fib(7)]
    puts list[0] * list[3] + list[2]


    puts "--"
    puts "<while with break and next>"

    i = 1
    while true
      if i * 5 >= 25
        break
      end
      puts i*5
      i = i + 1
    end

    puts "--"

    i = 1
    while true
      puts i
      i = i + 1
      if i > 9
        break
      end
    end
    |}
