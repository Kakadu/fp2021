  $ (./demoParse.exe)
  PROG ([THREAD ((0,
                  [ASSIGN (REGISTER ("EAX"), INT (6));
                   ASSIGN (VAR_NAME ("res"), INT (1));
                   WHILE
                   (REGISTER ("EAX"),
                    [ASSIGN
                     (VAR_NAME ("res"),
                      MUL (VAR_NAME ("res"), REGISTER ("EAX")));
                     ASSIGN (REGISTER ("EAX"), SUB (REGISTER ("EAX"), INT (1)))])]));
         THREAD ((1,
                  [ASSIGN (VAR_NAME ("x"), INT (1)); NO_OP;
                   ASSIGN (REGISTER ("EAX"), VAR_NAME ("y")); NO_OP; NO_OP;
                   NO_OP]));
         THREAD ((2,
                  [ASSIGN (VAR_NAME ("y"), INT (1)); NO_OP;
                   ASSIGN (REGISTER ("EBX"), VAR_NAME ("x")); NO_OP; NO_OP;
                   NO_OP]))])
  $ (./demoSC1.exe)
  	execution 1
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("EAX", 1)]
  	[("EBX", 0)]
  trace:
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(1, ASSIGN (REGISTER ("EBX"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, ASSIGN (REGISTER ("EAX"), VAR_NAME ("y")))
  <><><><><><><><><><><><><><><><><><>
  	execution 2
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("EAX", 1)]
  	[("EBX", 1)]
  trace:
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (REGISTER ("EBX"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("EAX"), VAR_NAME ("y")))
  <><><><><><><><><><><><><><><><><><>
  	execution 3
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("EAX", 1)]
  	[("EBX", 1)]
  trace:
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, ASSIGN (REGISTER ("EAX"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("EBX"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 4
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("EAX", 1)]
  	[("EBX", 1)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(1, ASSIGN (REGISTER ("EBX"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("EAX"), VAR_NAME ("y")))
  <><><><><><><><><><><><><><><><><><>
  	execution 5
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("EAX", 1)]
  	[("EBX", 1)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(0, ASSIGN (REGISTER ("EAX"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("EBX"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 6
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("EAX", 0)]
  	[("EBX", 1)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, ASSIGN (REGISTER ("EAX"), VAR_NAME ("y")))
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(1, ASSIGN (REGISTER ("EBX"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>

  $ (./demoSC2.exe)
  	execution 1
  assertation failed: VAR_NAME ("x")
  <><><><><><><><><><><><><><><><><><>
  	execution 2
  ram: [("x", 1); ("y", 1)]
  regs:
  	[]
  	[]
  trace:
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSERT (VAR_NAME ("x")))
  	(0, ASSERT (VAR_NAME ("y")))
  <><><><><><><><><><><><><><><><><><>
  	execution 3
  ram: [("x", 1); ("y", 1)]
  regs:
  	[]
  	[]
  trace:
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, ASSERT (VAR_NAME ("y")))
  	(1, ASSERT (VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 4
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(1, ASSERT (VAR_NAME ("x")))
  	(0, ASSERT (VAR_NAME ("y")))
  <><><><><><><><><><><><><><><><><><>
  	execution 5
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(0, ASSERT (VAR_NAME ("y")))
  	(1, ASSERT (VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 6
  assertation failed: VAR_NAME ("y")
  <><><><><><><><><><><><><><><><><><>
	
  $ (./demoSC3.exe)
  	execution 1
  execution is too long
  <><><><><><><><><><><><><><><><><><>
  	execution 2
  execution is too long
  <><><><><><><><><><><><><><><><><><>
  	execution 3
  execution is too long
  <><><><><><><><><><><><><><><><><><>
  	execution 4
  execution is too long
  <><><><><><><><><><><><><><><><><><>
  	execution 5
  execution is too long
  <><><><><><><><><><><><><><><><><><>
  	execution 6
  execution is too long
  <><><><><><><><><><><><><><><><><><>
  	execution 7
  execution is too long
  <><><><><><><><><><><><><><><><><><>
  	execution 8
  execution is too long
  <><><><><><><><><><><><><><><><><><>
  	execution 9
  execution is too long
  <><><><><><><><><><><><><><><><><><>
  	execution 10
  execution is too long
  <><><><><><><><><><><><><><><><><><>
  	execution 11
  ram: [("flag", 1); ("data", 1)]
  regs:
  	[]
  	[]
  trace:
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(1, NO_OP)
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(1, NO_OP)
  	(0, ASSIGN (VAR_NAME ("data"), INT (1)))
  	(0, ASSIGN (VAR_NAME ("flag"), INT (1)))
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(1, ASSERT (VAR_NAME ("data")))
  <><><><><><><><><><><><><><><><><><>
  	execution 12
  execution is too long
  <><><><><><><><><><><><><><><><><><>
  	execution 13
  execution is too long
  <><><><><><><><><><><><><><><><><><>
  	execution 14
  execution is too long
  <><><><><><><><><><><><><><><><><><>
  	execution 15
  ram: [("flag", 1); ("data", 1)]
  regs:
  	[]
  	[]
  trace:
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(1, NO_OP)
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(0, ASSIGN (VAR_NAME ("data"), INT (1)))
  	(1, NO_OP)
  	(0, ASSIGN (VAR_NAME ("flag"), INT (1)))
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(1, ASSERT (VAR_NAME ("data")))
  <><><><><><><><><><><><><><><><><><>
  	execution 16
  ram: [("flag", 1); ("data", 1)]
  regs:
  	[]
  	[]
  trace:
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(1, NO_OP)
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(0, ASSIGN (VAR_NAME ("data"), INT (1)))
  	(0, ASSIGN (VAR_NAME ("flag"), INT (1)))
  	(1, NO_OP)
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(1, ASSERT (VAR_NAME ("data")))
  <><><><><><><><><><><><><><><><><><>
  	execution 17
  execution is too long
  <><><><><><><><><><><><><><><><><><>
  	execution 18
  execution is too long
  <><><><><><><><><><><><><><><><><><>
  	execution 19
  execution is too long
  <><><><><><><><><><><><><><><><><><>
  	execution 20
  ram: [("flag", 1); ("data", 1)]
  regs:
  	[]
  	[]
  trace:
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(1, NO_OP)
  	(0, ASSIGN (VAR_NAME ("data"), INT (1)))
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(1, NO_OP)
  	(0, ASSIGN (VAR_NAME ("flag"), INT (1)))
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(1, ASSERT (VAR_NAME ("data")))
  <><><><><><><><><><><><><><><><><><>
  	execution 21
  ram: [("flag", 1); ("data", 1)]
  regs:
  	[]
  	[]
  trace:
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(1, NO_OP)
  	(0, ASSIGN (VAR_NAME ("data"), INT (1)))
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(0, ASSIGN (VAR_NAME ("flag"), INT (1)))
  	(1, NO_OP)
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(1, ASSERT (VAR_NAME ("data")))
  <><><><><><><><><><><><><><><><><><>
  	execution 22
  ram: [("flag", 1); ("data", 1)]
  regs:
  	[]
  	[]
  trace:
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(1, NO_OP)
  	(0, ASSIGN (VAR_NAME ("data"), INT (1)))
  	(0, ASSIGN (VAR_NAME ("flag"), INT (1)))
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(1, ASSERT (VAR_NAME ("data")))
  <><><><><><><><><><><><><><><><><><>
  	execution 23
  execution is too long
  <><><><><><><><><><><><><><><><><><>
  	execution 24
  execution is too long
  <><><><><><><><><><><><><><><><><><>
  	execution 25
  execution is too long
  <><><><><><><><><><><><><><><><><><>
  	execution 26
  ram: [("flag", 1); ("data", 1)]
  regs:
  	[]
  	[]
  trace:
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(0, ASSIGN (VAR_NAME ("data"), INT (1)))
  	(1, NO_OP)
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(1, NO_OP)
  	(0, ASSIGN (VAR_NAME ("flag"), INT (1)))
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(1, ASSERT (VAR_NAME ("data")))
  <><><><><><><><><><><><><><><><><><>
  	execution 27
  ram: [("flag", 1); ("data", 1)]
  regs:
  	[]
  	[]
  trace:
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(0, ASSIGN (VAR_NAME ("data"), INT (1)))
  	(1, NO_OP)
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(0, ASSIGN (VAR_NAME ("flag"), INT (1)))
  	(1, NO_OP)
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(1, ASSERT (VAR_NAME ("data")))
  <><><><><><><><><><><><><><><><><><>
  	execution 28
  ram: [("flag", 1); ("data", 1)]
  regs:
  	[]
  	[]
  trace:
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(0, ASSIGN (VAR_NAME ("data"), INT (1)))
  	(1, NO_OP)
  	(0, ASSIGN (VAR_NAME ("flag"), INT (1)))
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(1, ASSERT (VAR_NAME ("data")))
  <><><><><><><><><><><><><><><><><><>
  	execution 29
  ram: [("flag", 1); ("data", 1)]
  regs:
  	[]
  	[]
  trace:
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(0, ASSIGN (VAR_NAME ("data"), INT (1)))
  	(0, ASSIGN (VAR_NAME ("flag"), INT (1)))
  	(1, NO_OP)
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(1, ASSERT (VAR_NAME ("data")))
  <><><><><><><><><><><><><><><><><><>
  	execution 30
  execution is too long
  <><><><><><><><><><><><><><><><><><>
  	execution 31
  execution is too long
  <><><><><><><><><><><><><><><><><><>
  	execution 32
  execution is too long
  <><><><><><><><><><><><><><><><><><>
  	execution 33
  ram: [("flag", 1); ("data", 1)]
  regs:
  	[]
  	[]
  trace:
  	(0, ASSIGN (VAR_NAME ("data"), INT (1)))
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(1, NO_OP)
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(1, NO_OP)
  	(0, ASSIGN (VAR_NAME ("flag"), INT (1)))
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(1, ASSERT (VAR_NAME ("data")))
  <><><><><><><><><><><><><><><><><><>
  	execution 34
  ram: [("flag", 1); ("data", 1)]
  regs:
  	[]
  	[]
  trace:
  	(0, ASSIGN (VAR_NAME ("data"), INT (1)))
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(1, NO_OP)
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(0, ASSIGN (VAR_NAME ("flag"), INT (1)))
  	(1, NO_OP)
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(1, ASSERT (VAR_NAME ("data")))
  <><><><><><><><><><><><><><><><><><>
  	execution 35
  ram: [("flag", 1); ("data", 1)]
  regs:
  	[]
  	[]
  trace:
  	(0, ASSIGN (VAR_NAME ("data"), INT (1)))
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(1, NO_OP)
  	(0, ASSIGN (VAR_NAME ("flag"), INT (1)))
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(1, ASSERT (VAR_NAME ("data")))
  <><><><><><><><><><><><><><><><><><>
  	execution 36
  ram: [("flag", 1); ("data", 1)]
  regs:
  	[]
  	[]
  trace:
  	(0, ASSIGN (VAR_NAME ("data"), INT (1)))
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(0, ASSIGN (VAR_NAME ("flag"), INT (1)))
  	(1, NO_OP)
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(1, ASSERT (VAR_NAME ("data")))
  <><><><><><><><><><><><><><><><><><>
  	execution 37
  ram: [("flag", 1); ("data", 1)]
  regs:
  	[]
  	[]
  trace:
  	(0, ASSIGN (VAR_NAME ("data"), INT (1)))
  	(0, ASSIGN (VAR_NAME ("flag"), INT (1)))
  	(1, WHILE (SUB (VAR_NAME ("flag"), INT (1)), []))
  	(1, ASSERT (VAR_NAME ("data")))
  <><><><><><><><><><><><><><><><><><>
