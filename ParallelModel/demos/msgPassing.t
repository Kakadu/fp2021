  $ (./msgPassingSC.exe)
  Code:
  
  x<-1   ||| r1<-f
  f<-1   ||| r2<-x
  
  	EXECUTION STATISTICS
  0 executions crushed
  0 executions finished and have following behavior: r1 = 1 and r2 = 0
  6 executions finished but don't have following behavior: r1 = 1 and r2 = 0
  	execution 1
  ram: [("f", 1); ("x", 1)]
  regs:
  	[]
  	[("r2", 0); ("r1", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("f")))
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, ASSIGN (VAR_NAME ("f"), INT (1)))
  <><><><><><><><><><><><><><><><><><>
  	execution 2
  ram: [("f", 1); ("x", 1)]
  regs:
  	[]
  	[("r2", 1); ("r1", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("f")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("f"), INT (1)))
  <><><><><><><><><><><><><><><><><><>
  	execution 3
  ram: [("f", 1); ("x", 1)]
  regs:
  	[]
  	[("r2", 1); ("r1", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("f")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, ASSIGN (VAR_NAME ("f"), INT (1)))
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 4
  ram: [("f", 1); ("x", 1)]
  regs:
  	[]
  	[("r2", 1); ("r1", 0)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("f")))
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("f"), INT (1)))
  <><><><><><><><><><><><><><><><><><>
  	execution 5
  ram: [("f", 1); ("x", 1)]
  regs:
  	[]
  	[("r2", 1); ("r1", 0)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("f")))
  	(0, ASSIGN (VAR_NAME ("f"), INT (1)))
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 6
  ram: [("f", 1); ("x", 1)]
  regs:
  	[]
  	[("r2", 1); ("r1", 1)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, ASSIGN (VAR_NAME ("f"), INT (1)))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("f")))
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  $ (./msgPassingTSO.exe)
  Code:
  
  x<-1   ||| r1<-f
  f<-1   ||| r2<-x
  
  	EXECUTION STATISTICS
  0 executions crushed
  0 executions finished and have following behavior: r1 = 1 and r2 = 0
  30 executions finished but don't have following behavior: r1 = 1 and r2 = 0
  	execution 1
  ram: []
  regs:
  	[]
  	[("r2", 0); ("r1", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("f"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("f"), INT (1))))
  <><><><><><><><><><><><><><><><><><>
  	execution 2
  ram: [("x", 1)]
  regs:
  	[]
  	[("r2", 0); ("r1", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("f"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("f"), INT (1))))
  <><><><><><><><><><><><><><><><><><>
  	execution 3
  ram: []
  regs:
  	[]
  	[("r2", 0); ("r1", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("f"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("f"), INT (1))))
  <><><><><><><><><><><><><><><><><><>
  	execution 4
  ram: [("x", 1)]
  regs:
  	[]
  	[("r2", 0); ("r1", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("f"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("f"), INT (1))))
  <><><><><><><><><><><><><><><><><><>
  	execution 5
  ram: []
  regs:
  	[]
  	[("r2", 0); ("r1", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("f"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("f"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 6
  ram: [("x", 1)]
  regs:
  	[]
  	[("r2", 1); ("r1", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("f"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("f"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 7
  ram: [("f", 1); ("x", 1)]
  regs:
  	[]
  	[("r2", 1); ("r1", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("f"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("f"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, PUSH_STORE (("f", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 8
  ram: [("x", 1)]
  regs:
  	[]
  	[("r2", 1); ("r1", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("f"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("f"), INT (1))))
  <><><><><><><><><><><><><><><><><><>
  	execution 9
  ram: [("x", 1)]
  regs:
  	[]
  	[("r2", 1); ("r1", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("f"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("f"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 10
  ram: [("f", 1); ("x", 1)]
  regs:
  	[]
  	[("r2", 1); ("r1", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("f"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("f"), INT (1))))
  	(0, PUSH_STORE (("f", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 11
  ram: []
  regs:
  	[]
  	[("r2", 0); ("r1", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("f"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("f"), INT (1))))
  <><><><><><><><><><><><><><><><><><>
  	execution 12
  ram: [("x", 1)]
  regs:
  	[]
  	[("r2", 0); ("r1", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("f"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("f"), INT (1))))
  <><><><><><><><><><><><><><><><><><>
  	execution 13
  ram: []
  regs:
  	[]
  	[("r2", 0); ("r1", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("f"))))
  	(0, STMT (ASSIGN (VAR_NAME ("f"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 14
  ram: [("x", 1)]
  regs:
  	[]
  	[("r2", 1); ("r1", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("f"))))
  	(0, STMT (ASSIGN (VAR_NAME ("f"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 15
  ram: [("f", 1); ("x", 1)]
  regs:
  	[]
  	[("r2", 1); ("r1", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("f"))))
  	(0, STMT (ASSIGN (VAR_NAME ("f"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, PUSH_STORE (("f", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 16
  ram: [("x", 1)]
  regs:
  	[]
  	[("r2", 1); ("r1", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("f"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("f"), INT (1))))
  <><><><><><><><><><><><><><><><><><>
  	execution 17
  ram: [("x", 1)]
  regs:
  	[]
  	[("r2", 1); ("r1", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("f"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("f"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 18
  ram: [("f", 1); ("x", 1)]
  regs:
  	[]
  	[("r2", 1); ("r1", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("f"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("f"), INT (1))))
  	(0, PUSH_STORE (("f", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 19
  ram: []
  regs:
  	[]
  	[("r2", 0); ("r1", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("f"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("f"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 20
  ram: [("x", 1)]
  regs:
  	[]
  	[("r2", 1); ("r1", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("f"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("f"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 21
  ram: [("f", 1); ("x", 1)]
  regs:
  	[]
  	[("r2", 1); ("r1", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("f"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("f"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, PUSH_STORE (("f", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 22
  ram: [("x", 1)]
  regs:
  	[]
  	[("r2", 1); ("r1", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("f"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("f"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 23
  ram: [("f", 1); ("x", 1)]
  regs:
  	[]
  	[("r2", 1); ("r1", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("f"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("f"))))
  	(0, PUSH_STORE (("f", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 24
  ram: [("f", 1); ("x", 1)]
  regs:
  	[]
  	[("r2", 1); ("r1", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("f"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, PUSH_STORE (("f", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("f"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 25
  ram: [("x", 1)]
  regs:
  	[]
  	[("r2", 1); ("r1", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("f"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("f"), INT (1))))
  <><><><><><><><><><><><><><><><><><>
  	execution 26
  ram: [("x", 1)]
  regs:
  	[]
  	[("r2", 1); ("r1", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("f"))))
  	(0, STMT (ASSIGN (VAR_NAME ("f"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 27
  ram: [("f", 1); ("x", 1)]
  regs:
  	[]
  	[("r2", 1); ("r1", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("f"))))
  	(0, STMT (ASSIGN (VAR_NAME ("f"), INT (1))))
  	(0, PUSH_STORE (("f", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 28
  ram: [("x", 1)]
  regs:
  	[]
  	[("r2", 1); ("r1", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("f"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("f"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 29
  ram: [("f", 1); ("x", 1)]
  regs:
  	[]
  	[("r2", 1); ("r1", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("f"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("f"))))
  	(0, PUSH_STORE (("f", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 30
  ram: [("f", 1); ("x", 1)]
  regs:
  	[]
  	[("r2", 1); ("r1", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("f"), INT (1))))
  	(0, PUSH_STORE (("f", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("f"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
