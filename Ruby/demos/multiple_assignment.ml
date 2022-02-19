open Ruby_lib.Interpreter

let () = run_ruby [%blob "./rbs/multiple_assignment.rb"]
