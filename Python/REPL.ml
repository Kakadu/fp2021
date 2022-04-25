open Python_lib.Parser;;

match Result.is_ok (parse prog "5+5") with
| _ -> "1"
