Cram tests here. They run and compare program output to the expected output
https://dune.readthedocs.io/en/stable/tests.html#cram-tests
Use `dune promote` after you change things that should runned

  $ (./demoList.exe)
  cntBfr ~ Vint (6)
  ans0 ~ Vint (-100)
  ans1 ~ Vint (100)
  ans2 ~ Vint (200)
  ans3 ~ Vint (200)
  ans4 ~ Vint (400)
  ans5 ~ Vint (500)
  cntAft ~ Vint (0)

  $ (./demoFactorial.exe)
  ans0 ~ Vint (1)
  ans1 ~ Vint (1)
  ans2 ~ Vint (2)
  ans3 ~ Vint (6)
  ans4 ~ Vint (24)
  ans5 ~ Vint (120)

  $ (./demoMemcpy.exe)
  ans0 ~ Vint (100)
  ans1 ~ Vint (200)
  ans2 ~ Vint (300)
  ans3 ~ Vint (400)
  ans4 ~ Vint (500)
  cans0 ~ Vint (100)
  cans1 ~ Vint (200)
  cans2 ~ Vint (300)
  cans3 ~ Vint (400)
  cans4 ~ Vint (500)

  $ (./demoFib.exe)
  ans0 ~ Vint (0)
  ans1 ~ Vint (1)
  ans2 ~ Vint (1)
  ans3 ~ Vint (2)
  ans4 ~ Vint (3)
  ans5 ~ Vint (5)
  ans6 ~ Vint (8)
  ans7 ~ Vint (13)
  ans8 ~ Vint (21)
  ans9 ~ Vint (34)
  ans10 ~ Vint (55)

  $ (./demoFree.exe)
  ans0 ~ Vint (9)
  ans1 ~ Vint (9)

  $ (./demoMultiPtrs.exe)
  ans00 ~ Vint (0)
  ans01 ~ Vint (1)
  ans02 ~ Vint (2)
  ans10 ~ Vint (0)
  ans11 ~ Vint (2)
  ans12 ~ Vint (4)

