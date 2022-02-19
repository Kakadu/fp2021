open Ruby_lib.Interpreter

let () = run_ruby [%blob "./rbs/method_missing.rb"]
