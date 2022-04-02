  $ (./loadBufferingSC.exe)
  Code:
  
  r1<-x  ||| r2<-y
  y<-1   ||| x<-1
  
  	EXECUTION STATISTICS
  0 executions finished and have following behavior: r1 = 1 and r2 = 1
  6 executions finished but don't have following behavior: r1 = 1 and r2 = 1
  	execution 1
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  <><><><><><><><><><><><><><><><><><>
  	execution 2
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  <><><><><><><><><><><><><><><><><><>
  	execution 3
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  <><><><><><><><><><><><><><><><><><>
  	execution 4
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  <><><><><><><><><><><><><><><><><><>
  	execution 5
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  <><><><><><><><><><><><><><><><><><>
  	execution 6
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  <><><><><><><><><><><><><><><><><><>
  $ (./loadBufferingTSO.exe)
  Code:
  
  r1<-x  ||| r2<-y
  y<-1   ||| x<-1
  
  	EXECUTION STATISTICS
  0 executions finished and have following behavior: r1 = 1 and r2 = 1
  14 executions finished but don't have following behavior: r1 = 1 and r2 = 1
  	execution 1
  ram: []
  regs:
  	[("r1", 0)]
  	[("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  <><><><><><><><><><><><><><><><><><>
  	execution 2
  ram: [("y", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("y", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  <><><><><><><><><><><><><><><><><><>
  	execution 3
  ram: [("y", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, PUSH_STORE (("y", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  <><><><><><><><><><><><><><><><><><>
  	execution 4
  ram: []
  regs:
  	[("r1", 0)]
  	[("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  <><><><><><><><><><><><><><><><><><>
  	execution 5
  ram: [("y", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, PUSH_STORE (("y", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  <><><><><><><><><><><><><><><><><><>
  	execution 6
  ram: []
  regs:
  	[("r1", 0)]
  	[("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  <><><><><><><><><><><><><><><><><><>
  	execution 7
  ram: [("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  <><><><><><><><><><><><><><><><><><>
  	execution 8
  ram: []
  regs:
  	[("r1", 0)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  <><><><><><><><><><><><><><><><><><>
  	execution 9
  ram: [("y", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, PUSH_STORE (("y", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  <><><><><><><><><><><><><><><><><><>
  	execution 10
  ram: []
  regs:
  	[("r1", 0)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  <><><><><><><><><><><><><><><><><><>
  	execution 11
  ram: [("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  <><><><><><><><><><><><><><><><><><>
  	execution 12
  ram: []
  regs:
  	[("r1", 0)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  <><><><><><><><><><><><><><><><><><>
  	execution 13
  ram: [("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  <><><><><><><><><><><><><><><><><><>
  	execution 14
  ram: [("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  <><><><><><><><><><><><><><><><><><>
