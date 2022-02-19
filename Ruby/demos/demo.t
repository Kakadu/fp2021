Cram tests here. They run and compare program output to the expected output
https://dune.readthedocs.io/en/stable/tests.html#cram-tests
Use `dune promote` after you change things that should runned

  $ ./anonymous.exe
  タイムマシン

  $ ruby ./rbs/anonymous.rb
  タイムマシン

  $ ./closure.exe
  2

  $ ruby ./rbs/closure.rb
  2

  $ ./method_missing.exe
  42
  no such method!

  $ ruby ./rbs/method_missing.rb
  42
  no such method!

  $ ./multiple_assignment.exe
  1
  2
  13
  :)
  20

  $ ruby ./rbs/multiple_assignment.rb
  1
  2
  13
  :)
  20

  $ ./object.exe
  13
  1998

  $ ruby ./rbs/object.rb
  13
  1998

  $ ./recursion.exe
  55
  3628800

  $ ruby ./rbs/recursion.rb
  55
  3628800
