  $ (./readReadCoherenceSC.exe)
  Code:
  
  x<-1  ||| x<-2
  r1<-x ||| r3 <-x 
  r2<-x ||| r4 <-x 
  
  	EXECUTION STATISTICS
  0 executions finished and have following behavior: fails Coherence of Read-Read litmus test
  20 executions finished but don't have following behavior: fails Coherence of Read-Read litmus test
  	execution 1
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 2
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 3
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 4
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 5
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 6
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 7
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 8
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 9
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 10
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 11
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 12
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 13
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 14
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 15
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 16
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 17
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 18
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 19
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 20
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  $ (./readReadCoherenceTSO.exe)
  Code:
  
  x<-1  ||| x<-2
  r1<-x ||| r3 <-x 
  r2<-x ||| r4 <-x 
  
  	EXECUTION STATISTICS
  0 executions finished and have following behavior: fails Coherence of Read-Read litmus test
  610 executions finished but don't have following behavior: fails Coherence of Read-Read litmus test
  	execution 1
  ram: []
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 2
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 3
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 4
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 5
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 6
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 7
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 8
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 9
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 10
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 11
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 12
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 13
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 14
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 15
  ram: []
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 16
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 17
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 18
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 19
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 20
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 21
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 22
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 23
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 24
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 25
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 26
  ram: []
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 27
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 28
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 29
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 30
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 31
  ram: []
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 32
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 33
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 34
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 35
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 36
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 37
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 38
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 39
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 40
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 41
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 42
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 43
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 44
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 45
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 46
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 47
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 48
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 49
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 50
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 51
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 52
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 53
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 54
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 55
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 56
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 57
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 58
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 59
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 60
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 61
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 62
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 63
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 64
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 65
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 66
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 67
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 68
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 69
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 70
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 71
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 72
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 73
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 74
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 75
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 76
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 77
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 78
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 79
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 80
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 81
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 82
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 83
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 84
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 85
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 86
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 87
  ram: []
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 88
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 89
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 90
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 91
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 92
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 93
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 94
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 95
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 96
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 97
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 98
  ram: []
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 99
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 100
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 101
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 102
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 103
  ram: []
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 104
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 105
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 106
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 107
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 108
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 109
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 110
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 111
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 112
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 113
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 114
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 115
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 116
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 117
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 118
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 119
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 120
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 121
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 122
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 123
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 124
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 125
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 126
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 127
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 128
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 129
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 130
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 131
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 132
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 133
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 134
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 135
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 136
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 137
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 138
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 139
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 140
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 141
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 142
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 143
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 144
  ram: []
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 145
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 146
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 147
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 148
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 149
  ram: []
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 150
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 151
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 152
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 153
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 154
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 155
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 156
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 157
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 158
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 159
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 160
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 161
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 162
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 163
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 164
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 165
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 166
  ram: []
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 167
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 168
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 169
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 170
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 171
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 172
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 173
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 174
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 175
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 176
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 177
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 178
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 179
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 180
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 181
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 182
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 183
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 184
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 185
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 186
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 187
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 188
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 189
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 190
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 191
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 192
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 193
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 194
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 195
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 196
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 197
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 198
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 199
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 200
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 201
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 202
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 203
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 204
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 205
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 206
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 207
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 208
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 209
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 210
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 211
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 212
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 213
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 214
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 215
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 216
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 217
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 218
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 219
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 220
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 221
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 222
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 223
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 224
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 225
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 226
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 227
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 228
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 229
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 230
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 231
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 232
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 233
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 234
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 235
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 236
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 237
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 238
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 239
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 240
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 241
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 242
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 243
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 244
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 245
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 246
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 247
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 248
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 249
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 250
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 251
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 252
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 253
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 254
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 255
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 256
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 257
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 258
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 259
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 260
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 261
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 262
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 263
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 264
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 265
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 266
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 267
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 268
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 269
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 270
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 271
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 272
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 273
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 274
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 275
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 276
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 277
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 278
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 279
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 280
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 281
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 282
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 283
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 284
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 285
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 286
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 287
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 288
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 289
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 290
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 291
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 292
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 293
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 294
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 295
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 296
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 297
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 298
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 299
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 300
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 301
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 302
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 303
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 304
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 305
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 306
  ram: []
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 307
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 308
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 309
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 310
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 311
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 312
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 313
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 314
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 315
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 316
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 317
  ram: []
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 318
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 319
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 320
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 321
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 322
  ram: []
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 323
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 324
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 325
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 326
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 327
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 328
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 329
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 330
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 331
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 332
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 333
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 334
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 335
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 336
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 337
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 338
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 339
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 340
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 341
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 342
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 343
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 344
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 345
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 346
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 347
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 348
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 349
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 350
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 351
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 352
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 353
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 354
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 355
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 356
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 357
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 358
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 359
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 360
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 361
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 362
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 363
  ram: []
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 364
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 365
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 366
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 367
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 368
  ram: []
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 369
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 370
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 371
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 372
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 373
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 374
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 375
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 376
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 377
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 378
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 379
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 380
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 381
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 382
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 383
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 384
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 385
  ram: []
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 386
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 387
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 388
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 389
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 390
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 391
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 392
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 393
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 394
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 395
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 396
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 397
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 398
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 399
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 400
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 401
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 402
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 403
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 404
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 405
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 406
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 407
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 408
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 409
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 410
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 411
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 412
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 413
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 414
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 415
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 416
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 417
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 418
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 419
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 420
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 421
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 422
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 423
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 424
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 425
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 426
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 427
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 428
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 429
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 430
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 431
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 432
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 433
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 434
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 435
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 436
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 437
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 438
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 439
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 440
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 441
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 442
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 443
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 444
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 445
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 446
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 447
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 448
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 449
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 450
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 451
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 452
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 453
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 454
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 455
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 456
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 457
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 458
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 459
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 460
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 461
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 462
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 463
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 464
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 465
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 466
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 467
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 468
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 469
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 470
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 471
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 472
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 473
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 474
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 475
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 476
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 477
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 478
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 479
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 480
  ram: []
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 481
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 482
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 483
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 484
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 485
  ram: []
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 486
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 487
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 488
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 489
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 490
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 491
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 492
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 493
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 494
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 495
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 496
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 497
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 498
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 499
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 500
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 501
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 502
  ram: []
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 503
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 504
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 505
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 506
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 507
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 508
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 509
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 510
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 511
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 512
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 513
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 514
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 515
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 516
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 517
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 518
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 519
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 520
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 521
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 522
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 523
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 524
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 525
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 526
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 527
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 528
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 529
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 530
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 531
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 532
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 533
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 534
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 535
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 536
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 537
  ram: []
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 538
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 539
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 540
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 541
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 542
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 543
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 544
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 545
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 546
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 547
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 548
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 549
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 550
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 551
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 552
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 553
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 554
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 555
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 556
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 557
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 558
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 559
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 560
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 561
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 562
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 563
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 564
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 565
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 566
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 567
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 568
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 569
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 570
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 571
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 572
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 573
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 574
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 575
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 576
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 577
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 578
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 579
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 580
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 581
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 582
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 583
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 584
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 585
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 586
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 587
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 588
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 589
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 590
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 591
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 592
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 593
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 594
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 595
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 596
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 597
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 598
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 599
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 600
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 601
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 602
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 603
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 604
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 605
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 606
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 607
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 608
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 609
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 610
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("x"), INT (2))))
  	(1, PUSH_STORE (("x", 2)))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
