  $ (./storeBufferingSC.exe) 
  WITHOUT MEMORY BARRIER
  Code:
  
  x<-1   ||| y<-1
  r1<-y  ||| r2<-x
  
  	EXECUTION STATISTICS
  0 executions crushed
  0 executions finished and have following behavior: r1 = 0 and r2 = 0
  6 executions finished but don't have following behavior: r1 = 0 and r2 = 0
  	execution 1
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("y")))
  <><><><><><><><><><><><><><><><><><>
  	execution 2
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("y")))
  <><><><><><><><><><><><><><><><><><>
  	execution 3
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 4
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("y")))
  <><><><><><><><><><><><><><><><><><>
  	execution 5
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 6
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("y")))
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  WITH MEMORY BARRIER
  Code:
  
  x<-1   ||| y<-1
  smp_mb ||| smp_mb
  r1<-y  ||| r2<-x
  
  	EXECUTION STATISTICS
  0 executions crushed
  0 executions finished and have following behavior: r1 = 0 and r2 = 0
  20 executions finished but don't have following behavior: r1 = 0 and r2 = 0
  	execution 1
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(1, SMP_MB)
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, SMP_MB)
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("y")))
  <><><><><><><><><><><><><><><><><><>
  	execution 2
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(1, SMP_MB)
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  	(0, SMP_MB)
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("y")))
  <><><><><><><><><><><><><><><><><><>
  	execution 3
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(1, SMP_MB)
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, SMP_MB)
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("y")))
  <><><><><><><><><><><><><><><><><><>
  	execution 4
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(1, SMP_MB)
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, SMP_MB)
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 5
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, SMP_MB)
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  	(0, SMP_MB)
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("y")))
  <><><><><><><><><><><><><><><><><><>
  	execution 6
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, SMP_MB)
  	(0, SMP_MB)
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("y")))
  <><><><><><><><><><><><><><><><><><>
  	execution 7
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, SMP_MB)
  	(0, SMP_MB)
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 8
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, SMP_MB)
  	(1, SMP_MB)
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("y")))
  <><><><><><><><><><><><><><><><><><>
  	execution 9
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, SMP_MB)
  	(1, SMP_MB)
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 10
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, SMP_MB)
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("y")))
  	(1, SMP_MB)
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 11
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(1, SMP_MB)
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  	(0, SMP_MB)
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("y")))
  <><><><><><><><><><><><><><><><><><>
  	execution 12
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(1, SMP_MB)
  	(0, SMP_MB)
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("y")))
  <><><><><><><><><><><><><><><><><><>
  	execution 13
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(1, SMP_MB)
  	(0, SMP_MB)
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 14
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(0, SMP_MB)
  	(1, SMP_MB)
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("y")))
  <><><><><><><><><><><><><><><><><><>
  	execution 15
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(0, SMP_MB)
  	(1, SMP_MB)
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 16
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(0, SMP_MB)
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("y")))
  	(1, SMP_MB)
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 17
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, SMP_MB)
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(1, SMP_MB)
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("y")))
  <><><><><><><><><><><><><><><><><><>
  	execution 18
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, SMP_MB)
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(1, SMP_MB)
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 19
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, SMP_MB)
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("y")))
  	(1, SMP_MB)
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 20
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, SMP_MB)
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("y")))
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(1, SMP_MB)
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  $ (./storeBufferingTSO.exe)
  WITHOUT MEMORY BARRIER
  Code:
  
  x<-1   ||| y<-1
  r1<-y  ||| r2<-x
  
  	EXECUTION STATISTICS
  0 executions crushed
  12 executions finished and have following behavior: r1 = 0 and r2 = 0
  62 executions finished but don't have following behavior: r1 = 0 and r2 = 0
  	execution 1
  ram: []
  regs:
  	[("r1", 0)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 2
  ram: [("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 3
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 4
  ram: [("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 5
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 6
  ram: [("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 7
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 8
  ram: []
  regs:
  	[("r1", 0)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 9
  ram: [("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 10
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 11
  ram: [("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 12
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 13
  ram: []
  regs:
  	[("r1", 0)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 14
  ram: [("y", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 15
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 16
  ram: [("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 17
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 18
  ram: [("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 19
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 20
  ram: [("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 21
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 22
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 23
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 24
  ram: [("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 25
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 26
  ram: [("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 27
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 28
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 29
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 30
  ram: [("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 31
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 32
  ram: [("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 33
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 34
  ram: [("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 35
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 36
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 37
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 38
  ram: []
  regs:
  	[("r1", 0)]
  	[("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 39
  ram: [("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 40
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 41
  ram: [("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 42
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 43
  ram: []
  regs:
  	[("r1", 0)]
  	[("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 44
  ram: [("y", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 45
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 46
  ram: [("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 47
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 48
  ram: [("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 49
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 50
  ram: [("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 51
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 52
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 53
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 54
  ram: [("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 55
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 56
  ram: [("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 57
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 58
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 59
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 60
  ram: []
  regs:
  	[("r1", 0)]
  	[("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 61
  ram: [("y", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 62
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 63
  ram: [("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 64
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 65
  ram: [("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 66
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 67
  ram: [("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 68
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 69
  ram: [("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 70
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 71
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 72
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 73
  ram: [("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 74
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  WITH MEMORY BARRIER
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, FENCE ([]))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, FENCE ([]))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([]))
  Code:
  
  x<-1   ||| y<-1
  smp_mb ||| smp_mb
  r1<-y  ||| r2<-x
  
  	EXECUTION STATISTICS
  0 executions crushed
  0 executions finished and have following behavior: r1 = 0 and r2 = 0
  160 executions finished but don't have following behavior: r1 = 0 and r2 = 0
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, FENCE ([]))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, FENCE ([]))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([]))
  	execution 1
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 2
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 3
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([("x", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 4
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 5
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 6
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 7
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 8
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 9
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 10
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([("x", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 11
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 12
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(0, FENCE ([("x", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 13
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(0, FENCE ([("x", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 14
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 15
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 16
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 17
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(1, FENCE ([("y", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 18
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(1, FENCE ([("y", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 19
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([("y", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 20
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 21
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 22
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 23
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 24
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([("x", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 25
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 26
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, FENCE ([("x", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 27
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, FENCE ([("x", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 28
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 29
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 30
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 31
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, FENCE ([("x", 1)]))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 32
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, FENCE ([("x", 1)]))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 33
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, FENCE ([("x", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 34
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 35
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, FENCE ([]))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 36
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, FENCE ([]))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 37
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 38
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 39
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 40
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, FENCE ([("y", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 41
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, FENCE ([("y", 1)]))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 42
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, FENCE ([("y", 1)]))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 43
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, FENCE ([("y", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 44
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, FENCE ([("y", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 45
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([("y", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 46
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 47
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 48
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 49
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 50
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 51
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 52
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 53
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 1)))
  	(0, FENCE ([]))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 54
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 1)))
  	(0, FENCE ([]))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 55
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 56
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 57
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 58
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([("x", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 59
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 60
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 61
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 62
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 63
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 64
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 65
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([("x", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 66
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 67
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, FENCE ([]))
  	(0, FENCE ([("x", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 68
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, FENCE ([]))
  	(0, FENCE ([("x", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 69
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, FENCE ([]))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 70
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, FENCE ([]))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 71
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, FENCE ([]))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 72
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 73
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 74
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 75
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 76
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, FENCE ([]))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 77
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, FENCE ([]))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 78
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 79
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 80
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 81
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([("x", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 82
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 83
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(0, FENCE ([("x", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 84
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(0, FENCE ([("x", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 85
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 86
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 87
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 88
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(1, FENCE ([("y", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 89
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(1, FENCE ([("y", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 90
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([("y", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 91
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 92
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 93
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 94
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 95
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([("x", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 96
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 97
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, FENCE ([("x", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 98
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, FENCE ([("x", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 99
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 100
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 101
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 102
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, FENCE ([("x", 1)]))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 103
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, FENCE ([("x", 1)]))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 104
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, FENCE ([("x", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 105
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 106
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, FENCE ([]))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 107
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, PUSH_STORE (("x", 1)))
  	(1, FENCE ([]))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 108
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 109
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 110
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 111
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, FENCE ([("y", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 112
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, FENCE ([("y", 1)]))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 113
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, FENCE ([("y", 1)]))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 114
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, FENCE ([("y", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 115
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, FENCE ([("y", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 116
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([("y", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 117
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 118
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 119
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 120
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 121
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 122
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 123
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 124
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 1)))
  	(0, FENCE ([]))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 125
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 1)))
  	(0, FENCE ([]))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 126
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 127
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 128
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 129
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([("y", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 130
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 131
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 132
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 133
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 134
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 135
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, FENCE ([("x", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 136
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 137
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 138
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 139
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, FENCE ([]))
  	(1, FENCE ([("y", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 140
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, FENCE ([]))
  	(1, FENCE ([("y", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 141
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([("y", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 142
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 143
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, FENCE ([]))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 144
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, FENCE ([]))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 145
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, FENCE ([]))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 146
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 147
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 148
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 149
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, FENCE ([]))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 150
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, FENCE ([]))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 151
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 152
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 153
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 154
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([("y", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 155
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 156
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 157
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 158
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 159
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, FENCE ([("y", 1)]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 160
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, FENCE ([]))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, PUSH_STORE (("y", 1)))
  	(1, FENCE ([]))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  $ (./loadBufferingSC.exe)
  Code:
  
  r1<-x  ||| r2<-y
  y<-1   ||| x<-1
  
  	EXECUTION STATISTICS
  0 executions crushed
  0 executions finished and have following behavior: r1 = 1 and r2 = 1
  6 executions finished but don't have following behavior: r1 = 1 and r2 = 1
  	execution 1
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("y"), INT (1)))
  <><><><><><><><><><><><><><><><><><>
  	execution 2
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, ASSIGN (VAR_NAME ("y"), INT (1)))
  <><><><><><><><><><><><><><><><><><>
  	execution 3
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("x"), INT (1)))
  <><><><><><><><><><><><><><><><><><>
  	execution 4
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 0)]
  trace:
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, ASSIGN (VAR_NAME ("y"), INT (1)))
  <><><><><><><><><><><><><><><><><><>
  	execution 5
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 0)]
  trace:
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(0, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("x"), INT (1)))
  <><><><><><><><><><><><><><><><><><>
  	execution 6
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(1, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (VAR_NAME ("x"), INT (1)))
  <><><><><><><><><><><><><><><><><><>
  $ (./loadBufferingTSO.exe)
  Code:
  
  r1<-x  ||| r2<-y
  y<-1   ||| x<-1
  
  	EXECUTION STATISTICS
  0 executions crushed
  0 executions finished and have following behavior: r1 = 1 and r2 = 1
  14 executions finished but don't have following behavior: r1 = 1 and r2 = 1
  	execution 1
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
  	execution 2
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
  	execution 3
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
  	execution 4
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
  	execution 5
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
  	execution 6
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
  	execution 7
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
  	execution 8
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
  	execution 9
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
  	execution 10
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
  	execution 11
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
  	execution 12
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
  	execution 13
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
  	execution 14
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
  $ (./readReadCoherenceSC.exe)
  Code:
  
  x<-1  ||| x<-2
  r1<-x ||| r3 <-x 
  r2<-x ||| r4 <-x 
  
  	EXECUTION STATISTICS
  0 executions crushed
  0 executions finished and have following behavior: fails Coherence of Read-Read litmus test
  20 executions finished but don't have following behavior: fails Coherence of Read-Read litmus test
  	execution 1
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(1, ASSIGN (VAR_NAME ("x"), INT (2)))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 2
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, ASSIGN (VAR_NAME ("x"), INT (2)))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 3
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, ASSIGN (VAR_NAME ("x"), INT (2)))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 4
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 2)]
  trace:
  	(1, ASSIGN (VAR_NAME ("x"), INT (2)))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 5
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, ASSIGN (VAR_NAME ("x"), INT (2)))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 6
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, ASSIGN (VAR_NAME ("x"), INT (2)))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 7
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, ASSIGN (VAR_NAME ("x"), INT (2)))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 8
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, ASSIGN (VAR_NAME ("x"), INT (2)))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 9
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, ASSIGN (VAR_NAME ("x"), INT (2)))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 10
  ram: [("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, ASSIGN (VAR_NAME ("x"), INT (2)))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 11
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("x"), INT (2)))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 12
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("x"), INT (2)))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 13
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("x"), INT (2)))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 14
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("x"), INT (2)))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 15
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("x"), INT (2)))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 16
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 2)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("x"), INT (2)))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 17
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("x"), INT (2)))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 18
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("x"), INT (2)))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 19
  ram: [("x", 2)]
  regs:
  	[("r2", 2); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("x"), INT (2)))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 20
  ram: [("x", 2)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 2); ("r3", 2)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("x"), INT (2)))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  $ (./readReadCoherenceTSO.exe)
  Code:
  
  x<-1  ||| x<-2
  r1<-x ||| r3 <-x 
  r2<-x ||| r4 <-x 
  
  	EXECUTION STATISTICS
  0 executions crushed
  0 executions finished and have following behavior: fails Coherence of Read-Read litmus test
  610 executions finished but don't have following behavior: fails Coherence of Read-Read litmus test
  	execution 1
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
  	execution 2
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
  	execution 3
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
  	execution 4
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
  	execution 5
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
  	execution 6
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
  	execution 7
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
  	execution 8
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
  	execution 9
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
  	execution 10
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
  	execution 11
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
  	execution 12
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
  	execution 13
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
  	execution 14
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
  	execution 15
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
  	execution 16
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
  	execution 17
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
  	execution 18
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
  	execution 19
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
  	execution 20
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
  	execution 21
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
  	execution 22
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
  	execution 23
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
  	execution 24
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
  	execution 25
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
  	execution 26
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
  	execution 27
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
  	execution 28
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
  	execution 29
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
  	execution 30
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
  	execution 31
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
  	execution 32
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
  	execution 33
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
  	execution 34
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
  	execution 35
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
  	execution 36
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
  	execution 37
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
  	execution 38
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
  	execution 39
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
  	execution 40
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
  	execution 41
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
  	execution 42
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
  	execution 43
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
  	execution 44
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
  	execution 45
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
  	execution 46
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
  	execution 47
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
  	execution 48
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
  	execution 49
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
  	execution 50
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
  	execution 51
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
  	execution 52
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
  	execution 53
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
  	execution 54
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
  	execution 55
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
  	execution 56
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
  	execution 57
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
  	execution 58
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
  	execution 59
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
  	execution 60
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
  	execution 61
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
  	execution 62
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
  	execution 63
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
  	execution 64
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
  	execution 65
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
  	execution 66
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
  	execution 67
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
  	execution 68
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
  	execution 69
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
  	execution 70
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
  	execution 71
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
  	execution 72
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
  	execution 73
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
  	execution 74
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
  	execution 75
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
  	execution 76
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
  	execution 77
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
  	execution 78
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
  	execution 79
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
  	execution 80
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
  	execution 81
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
  	execution 82
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
  	execution 83
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
  	execution 84
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
  	execution 85
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
  	execution 86
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
  	execution 87
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
  	execution 88
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
  	execution 89
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
  	execution 90
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
  	execution 91
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
  	execution 92
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
  	execution 93
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
  	execution 94
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
  	execution 95
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
  	execution 96
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
  	execution 97
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
  	execution 98
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
  	execution 99
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
  	execution 100
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
  	execution 101
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
  	execution 102
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
  	execution 103
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
  	execution 104
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
  	execution 105
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
  	execution 106
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
  	execution 107
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
  	execution 108
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
  	execution 109
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
  	execution 110
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
  	execution 111
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
  	execution 112
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
  	execution 113
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
  	execution 114
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
  	execution 115
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
  	execution 116
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
  	execution 117
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
  	execution 118
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
  	execution 119
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
  	execution 120
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
  	execution 121
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
  	execution 122
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
  	execution 123
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
  	execution 124
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
  	execution 125
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
  	execution 126
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
  	execution 127
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
  	execution 128
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
  	execution 129
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
  	execution 130
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
  	execution 131
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
  	execution 132
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
  	execution 133
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
  	execution 134
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
  	execution 135
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
  	execution 136
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
  	execution 137
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
  	execution 138
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
  	execution 139
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
  	execution 140
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
  	execution 141
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
  	execution 142
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
  	execution 143
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
  	execution 144
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
  	execution 145
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
  	execution 146
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
  	execution 147
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
  	execution 148
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
  	execution 149
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
  	execution 150
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
  	execution 151
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
  	execution 152
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
  	execution 153
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
  	execution 154
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
  	execution 155
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
  	execution 156
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
  	execution 157
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
  	execution 158
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
  	execution 159
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
  	execution 160
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
  	execution 161
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
  	execution 162
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
  	execution 163
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
  	execution 164
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
  	execution 165
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
  	execution 166
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
  	execution 167
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
  	execution 168
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
  	execution 169
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
  	execution 170
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
  	execution 171
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
  	execution 172
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
  	execution 173
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
  	execution 174
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
  	execution 175
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
  	execution 176
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
  	execution 177
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
  	execution 178
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
  	execution 179
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
  	execution 180
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
  	execution 181
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
  	execution 182
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
  	execution 183
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
  	execution 184
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
  	execution 185
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
  	execution 186
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
  	execution 187
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
  	execution 188
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
  	execution 189
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
  	execution 190
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
  	execution 191
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
  	execution 192
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
  	execution 193
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
  	execution 194
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
  	execution 195
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
  	execution 196
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
  	execution 197
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
  	execution 198
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
  	execution 199
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
  	execution 200
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
  	execution 201
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
  	execution 202
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
  	execution 203
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
  	execution 204
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
  	execution 205
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
  	execution 206
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
  	execution 207
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
  	execution 208
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
  	execution 209
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
  	execution 210
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
  	execution 211
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
  	execution 212
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
  	execution 213
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
  	execution 214
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
  	execution 215
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
  	execution 216
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
  	execution 217
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
  	execution 218
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
  	execution 219
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
  	execution 220
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
  	execution 221
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
  	execution 222
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
  	execution 223
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
  	execution 224
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
  	execution 225
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
  	execution 226
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
  	execution 227
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
  	execution 228
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
  	execution 229
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
  	execution 230
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
  	execution 231
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
  	execution 232
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
  	execution 233
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
  	execution 234
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
  	execution 235
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
  	execution 236
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
  	execution 237
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
  	execution 238
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
  	execution 239
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
  	execution 240
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
  	execution 241
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
  	execution 242
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
  	execution 243
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
  	execution 244
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
  	execution 245
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
  	execution 246
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
  	execution 247
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
  	execution 248
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
  	execution 249
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
  	execution 250
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
  	execution 251
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
  	execution 252
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
  	execution 253
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
  	execution 254
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
  	execution 255
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
  	execution 256
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
  	execution 257
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
  	execution 258
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
  	execution 259
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
  	execution 260
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
  	execution 261
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
  	execution 262
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
  	execution 263
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
  	execution 264
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
  	execution 265
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
  	execution 266
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
  	execution 267
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
  	execution 268
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
  	execution 269
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
  	execution 270
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
  	execution 271
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
  	execution 272
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
  	execution 273
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
  	execution 274
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
  	execution 275
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
  	execution 276
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
  	execution 277
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
  	execution 278
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
  	execution 279
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
  	execution 280
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
  	execution 281
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
  	execution 282
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
  	execution 283
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
  	execution 284
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
  	execution 285
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
  	execution 286
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
  	execution 287
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
  	execution 288
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
  	execution 289
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
  	execution 290
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
  	execution 291
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
  	execution 292
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
  	execution 293
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
  	execution 294
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
  	execution 295
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
  	execution 296
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
  	execution 297
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
  	execution 298
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
  	execution 299
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
  	execution 300
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
  	execution 301
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
  	execution 302
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
  	execution 303
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
  	execution 304
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
  	execution 305
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
  	execution 306
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
  	execution 307
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
  	execution 308
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
  	execution 309
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
  	execution 310
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
  	execution 311
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
  	execution 312
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
  	execution 313
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
  	execution 314
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
  	execution 315
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
  	execution 316
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
  	execution 317
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
  	execution 318
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
  	execution 319
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
  	execution 320
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
  	execution 321
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
  	execution 322
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
  	execution 323
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
  	execution 324
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
  	execution 325
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
  	execution 326
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
  	execution 327
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
  	execution 328
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
  	execution 329
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
  	execution 330
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
  	execution 331
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
  	execution 332
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
  	execution 333
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
  	execution 334
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
  	execution 335
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
  	execution 336
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
  	execution 337
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
  	execution 338
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
  	execution 339
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
  	execution 340
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
  	execution 341
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
  	execution 342
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
  	execution 343
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
  	execution 344
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
  	execution 345
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
  	execution 346
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
  	execution 347
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
  	execution 348
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
  	execution 349
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
  	execution 350
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
  	execution 351
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
  	execution 352
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
  	execution 353
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
  	execution 354
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
  	execution 355
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
  	execution 356
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
  	execution 357
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
  	execution 358
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
  	execution 359
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
  	execution 360
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
  	execution 361
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
  	execution 362
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
  	execution 363
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
  	execution 364
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
  	execution 365
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
  	execution 366
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
  	execution 367
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
  	execution 368
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
  	execution 369
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
  	execution 370
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
  	execution 371
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
  	execution 372
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
  	execution 373
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
  	execution 374
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
  	execution 375
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
  	execution 376
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
  	execution 377
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
  	execution 378
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
  	execution 379
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
  	execution 380
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
  	execution 381
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
  	execution 382
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
  	execution 383
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
  	execution 384
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
  	execution 385
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
  	execution 386
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
  	execution 387
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
  	execution 388
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
  	execution 389
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
  	execution 390
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
  	execution 391
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
  	execution 392
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
  	execution 393
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
  	execution 394
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
  	execution 395
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
  	execution 396
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
  	execution 397
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
  	execution 398
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
  	execution 399
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
  	execution 400
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
  	execution 401
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
  	execution 402
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
  	execution 403
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
  	execution 404
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
  	execution 405
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
  	execution 406
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
  	execution 407
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
  	execution 408
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
  	execution 409
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
  	execution 410
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
  	execution 411
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
  	execution 412
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
  	execution 413
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
  	execution 414
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
  	execution 415
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
  	execution 416
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
  	execution 417
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
  	execution 418
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
  	execution 419
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
  	execution 420
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
  	execution 421
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
  	execution 422
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
  	execution 423
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
  	execution 424
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
  	execution 425
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
  	execution 426
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
  	execution 427
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
  	execution 428
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
  	execution 429
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
  	execution 430
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
  	execution 431
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
  	execution 432
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
  	execution 433
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
  	execution 434
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
  	execution 435
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
  	execution 436
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
  	execution 437
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
  	execution 438
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
  	execution 439
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
  	execution 440
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
  	execution 441
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
  	execution 442
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
  	execution 443
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
  	execution 444
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
  	execution 445
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
  	execution 446
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
  	execution 447
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
  	execution 448
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
  	execution 449
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
  	execution 450
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
  	execution 451
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
  	execution 452
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
  	execution 453
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
  	execution 454
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
  	execution 455
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
  	execution 456
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
  	execution 457
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
  	execution 458
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
  	execution 459
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
  	execution 460
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
  	execution 461
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
  	execution 462
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
  	execution 463
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
  	execution 464
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
  	execution 465
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
  	execution 466
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
  	execution 467
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
  	execution 468
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
  	execution 469
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
  	execution 470
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
  	execution 471
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
  	execution 472
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
  	execution 473
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
  	execution 474
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
  	execution 475
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
  	execution 476
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
  	execution 477
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
  	execution 478
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
  	execution 479
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
  	execution 480
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
  	execution 481
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
  	execution 482
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
  	execution 483
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
  	execution 484
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
  	execution 485
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
  	execution 486
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
  	execution 487
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
  	execution 488
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
  	execution 489
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
  	execution 490
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
  	execution 491
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
  	execution 492
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
  	execution 493
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
  	execution 494
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
  	execution 495
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
  	execution 496
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
  	execution 497
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
  	execution 498
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
  	execution 499
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
  	execution 500
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
  	execution 501
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
  	execution 502
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
  	execution 503
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
  	execution 504
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
  	execution 505
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
  	execution 506
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
  	execution 507
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
  	execution 508
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
  	execution 509
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
  	execution 510
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
  	execution 511
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
  	execution 512
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
  	execution 513
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
  	execution 514
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
  	execution 515
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
  	execution 516
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
  	execution 517
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
  	execution 518
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
  	execution 519
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
  	execution 520
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
  	execution 521
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
  	execution 522
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
  	execution 523
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
  	execution 524
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
  	execution 525
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
  	execution 526
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
  	execution 527
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
  	execution 528
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
  	execution 529
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
  	execution 530
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
  	execution 531
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
  	execution 532
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
  	execution 533
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
  	execution 534
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
  	execution 535
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
  	execution 536
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
  	execution 537
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
  	execution 538
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
  	execution 539
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
  	execution 540
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
  	execution 541
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
  	execution 542
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
  	execution 543
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
  	execution 544
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
  	execution 545
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
  	execution 546
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
  	execution 547
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
  	execution 548
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
  	execution 549
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
  	execution 550
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
  	execution 551
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
  	execution 552
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
  	execution 553
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
  	execution 554
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
  	execution 555
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
  	execution 556
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
  	execution 557
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
  	execution 558
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
  	execution 559
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
  	execution 560
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
  	execution 561
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
  	execution 562
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
  	execution 563
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
  	execution 564
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
  	execution 565
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
  	execution 566
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
  	execution 567
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
  	execution 568
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
  	execution 569
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
  	execution 570
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
  	execution 571
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
  	execution 572
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
  	execution 573
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
  	execution 574
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
  	execution 575
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
  	execution 576
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
  	execution 577
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
  	execution 578
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
  	execution 579
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
  	execution 580
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
  	execution 581
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
  	execution 582
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
  	execution 583
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
  	execution 584
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
  	execution 585
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
  	execution 586
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
  	execution 587
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
  	execution 588
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
  	execution 589
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
  	execution 590
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
  	execution 591
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
  	execution 592
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
  	execution 593
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
  	execution 594
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
  	execution 595
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
  	execution 596
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
  	execution 597
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
  	execution 598
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
  	execution 599
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
  	execution 600
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
  	execution 601
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
  	execution 602
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
  	execution 603
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
  	execution 604
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
  	execution 605
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
  	execution 606
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
  	execution 607
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
  	execution 608
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
  	execution 609
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
  	execution 610
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
  $ (./independentReadsOfIndependentWritesSC.exe)
  Code:
  
  x<-1  ||| y<-1
  r1<-x ||| r3 <-y 
  r2<-y ||| r4 <-x 
  
  	EXECUTION STATISTICS
  0 executions crushed
  0 executions finished and have following behavior: fails Independent Reads of Independent Writes litmus test
  20 executions finished but don't have following behavior: fails Independent Reads of Independent Writes litmus test
  	execution 1
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 0); ("r3", 1)]
  trace:
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  <><><><><><><><><><><><><><><><><><>
  	execution 2
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("y")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  <><><><><><><><><><><><><><><><><><>
  	execution 3
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("y")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  <><><><><><><><><><><><><><><><><><>
  	execution 4
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("y")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 5
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  <><><><><><><><><><><><><><><><><><>
  	execution 6
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("y")))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  <><><><><><><><><><><><><><><><><><>
  	execution 7
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("y")))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 8
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  <><><><><><><><><><><><><><><><><><>
  	execution 9
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("y")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 10
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 11
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  <><><><><><><><><><><><><><><><><><>
  	execution 12
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("y")))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  <><><><><><><><><><><><><><><><><><>
  	execution 13
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("y")))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 14
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  <><><><><><><><><><><><><><><><><><>
  	execution 15
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("y")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 16
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 17
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  <><><><><><><><><><><><><><><><><><>
  	execution 18
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("y")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 19
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 20
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r2", 0); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (VAR_NAME ("y"), INT (1)))
  	(1, ASSIGN (REGISTER ("r3"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r4"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  $ (./independentReadsOfIndependentWritesTSO.exe)
  Code:
  
  x<-1   ||| y<-1 ||| r1<-x  ||| r3 <-y 
         |||      ||| r2<-y  ||| r4 <-x 
  
  	EXECUTION STATISTICS
  0 executions crushed
  0 executions finished and have following behavior: fails Independent Reads of Independent Writes litmus test
  98280 executions finished but don't have following behavior: fails Independent Reads of Independent Writes litmus test
  $ (./writeToReadCausalitySC.exe)
  Code:
  
  x<-1   ||| r1 <- x ||| r2 <- y
         ||| y <- r1 ||| r3 <- x
  
  	EXECUTION STATISTICS
  0 executions crushed
  0 executions finished and have following behavior: fails Write-to-Read Causality litmus test
  90 executions finished but don't have following behavior: fails Write-to-Read Causality litmus test
  	execution 1
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, NO_OP)
  <><><><><><><><><><><><><><><><><><>
  	execution 2
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(0, NO_OP)
  <><><><><><><><><><><><><><><><><><>
  	execution 3
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, NO_OP)
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  <><><><><><><><><><><><><><><><><><>
  	execution 4
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(0, NO_OP)
  <><><><><><><><><><><><><><><><><><>
  	execution 5
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, NO_OP)
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  <><><><><><><><><><><><><><><><><><>
  	execution 6
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, NO_OP)
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  <><><><><><><><><><><><><><><><><><>
  	execution 7
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, NO_OP)
  <><><><><><><><><><><><><><><><><><>
  	execution 8
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(0, NO_OP)
  <><><><><><><><><><><><><><><><><><>
  	execution 9
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, NO_OP)
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  <><><><><><><><><><><><><><><><><><>
  	execution 10
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, NO_OP)
  <><><><><><><><><><><><><><><><><><>
  	execution 11
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, NO_OP)
  <><><><><><><><><><><><><><><><><><>
  	execution 12
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, NO_OP)
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 13
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(0, NO_OP)
  <><><><><><><><><><><><><><><><><><>
  	execution 14
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, NO_OP)
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  <><><><><><><><><><><><><><><><><><>
  	execution 15
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, NO_OP)
  <><><><><><><><><><><><><><><><><><>
  	execution 16
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(0, NO_OP)
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 17
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, NO_OP)
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  <><><><><><><><><><><><><><><><><><>
  	execution 18
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, NO_OP)
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 19
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(0, NO_OP)
  <><><><><><><><><><><><><><><><><><>
  	execution 20
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, NO_OP)
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  <><><><><><><><><><><><><><><><><><>
  	execution 21
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, NO_OP)
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  <><><><><><><><><><><><><><><><><><>
  	execution 22
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(0, NO_OP)
  <><><><><><><><><><><><><><><><><><>
  	execution 23
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, NO_OP)
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  <><><><><><><><><><><><><><><><><><>
  	execution 24
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, NO_OP)
  <><><><><><><><><><><><><><><><><><>
  	execution 25
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(0, NO_OP)
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 26
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, NO_OP)
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  <><><><><><><><><><><><><><><><><><>
  	execution 27
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, NO_OP)
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 28
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, NO_OP)
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  <><><><><><><><><><><><><><><><><><>
  	execution 29
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, NO_OP)
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  <><><><><><><><><><><><><><><><><><>
  	execution 30
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, NO_OP)
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 31
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, NO_OP)
  <><><><><><><><><><><><><><><><><><>
  	execution 32
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(0, NO_OP)
  <><><><><><><><><><><><><><><><><><>
  	execution 33
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, NO_OP)
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  <><><><><><><><><><><><><><><><><><>
  	execution 34
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, NO_OP)
  <><><><><><><><><><><><><><><><><><>
  	execution 35
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, NO_OP)
  <><><><><><><><><><><><><><><><><><>
  	execution 36
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, NO_OP)
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 37
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(0, NO_OP)
  <><><><><><><><><><><><><><><><><><>
  	execution 38
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, NO_OP)
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  <><><><><><><><><><><><><><><><><><>
  	execution 39
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, NO_OP)
  <><><><><><><><><><><><><><><><><><>
  	execution 40
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(0, NO_OP)
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 41
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, NO_OP)
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  <><><><><><><><><><><><><><><><><><>
  	execution 42
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, NO_OP)
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 43
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, NO_OP)
  <><><><><><><><><><><><><><><><><><>
  	execution 44
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, NO_OP)
  <><><><><><><><><><><><><><><><><><>
  	execution 45
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, NO_OP)
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 46
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, NO_OP)
  <><><><><><><><><><><><><><><><><><>
  	execution 47
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(0, NO_OP)
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 48
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, NO_OP)
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 49
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(0, NO_OP)
  <><><><><><><><><><><><><><><><><><>
  	execution 50
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, NO_OP)
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  <><><><><><><><><><><><><><><><><><>
  	execution 51
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, NO_OP)
  <><><><><><><><><><><><><><><><><><>
  	execution 52
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(0, NO_OP)
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 53
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(0, NO_OP)
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  <><><><><><><><><><><><><><><><><><>
  	execution 54
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(0, NO_OP)
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 55
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, NO_OP)
  <><><><><><><><><><><><><><><><><><>
  	execution 56
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(0, NO_OP)
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 57
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(0, NO_OP)
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 58
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, NO_OP)
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  <><><><><><><><><><><><><><><><><><>
  	execution 59
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, NO_OP)
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 60
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, NO_OP)
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 61
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(0, NO_OP)
  <><><><><><><><><><><><><><><><><><>
  	execution 62
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, NO_OP)
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  <><><><><><><><><><><><><><><><><><>
  	execution 63
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, NO_OP)
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  <><><><><><><><><><><><><><><><><><>
  	execution 64
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(0, NO_OP)
  <><><><><><><><><><><><><><><><><><>
  	execution 65
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, NO_OP)
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  <><><><><><><><><><><><><><><><><><>
  	execution 66
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, NO_OP)
  <><><><><><><><><><><><><><><><><><>
  	execution 67
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(0, NO_OP)
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 68
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, NO_OP)
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  <><><><><><><><><><><><><><><><><><>
  	execution 69
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, NO_OP)
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 70
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(0, NO_OP)
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  <><><><><><><><><><><><><><><><><><>
  	execution 71
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(0, NO_OP)
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  <><><><><><><><><><><><><><><><><><>
  	execution 72
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(0, NO_OP)
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 73
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(0, NO_OP)
  <><><><><><><><><><><><><><><><><><>
  	execution 74
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, NO_OP)
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  <><><><><><><><><><><><><><><><><><>
  	execution 75
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, NO_OP)
  <><><><><><><><><><><><><><><><><><>
  	execution 76
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(0, NO_OP)
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 77
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(0, NO_OP)
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  <><><><><><><><><><><><><><><><><><>
  	execution 78
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(0, NO_OP)
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 79
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 1)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(0, NO_OP)
  <><><><><><><><><><><><><><><><><><>
  	execution 80
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 1)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(0, NO_OP)
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 81
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 1)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(0, NO_OP)
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 82
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, NO_OP)
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  <><><><><><><><><><><><><><><><><><>
  	execution 83
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, NO_OP)
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 84
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 1)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(0, NO_OP)
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 85
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, NO_OP)
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  <><><><><><><><><><><><><><><><><><>
  	execution 86
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, NO_OP)
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  <><><><><><><><><><><><><><><><><><>
  	execution 87
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, NO_OP)
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 88
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, NO_OP)
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  <><><><><><><><><><><><><><><><><><>
  	execution 89
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, NO_OP)
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  	execution 90
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 1)]
  trace:
  	(0, ASSIGN (VAR_NAME ("x"), INT (1)))
  	(0, NO_OP)
  	(1, ASSIGN (REGISTER ("r1"), VAR_NAME ("x")))
  	(1, ASSIGN (VAR_NAME ("y"), REGISTER ("r1")))
  	(2, ASSIGN (REGISTER ("r2"), VAR_NAME ("y")))
  	(2, ASSIGN (REGISTER ("r3"), VAR_NAME ("x")))
  <><><><><><><><><><><><><><><><><><>
  $ (./writeToReadCausalityTSO.exe)
  Code:
  
  x<-1   ||| r1 <- x ||| r2 <- y
         ||| y <- r1 ||| r3 <- x
  
  	EXECUTION STATISTICS
  0 executions crushed
  0 executions finished and have following behavior: fails Write-to-Read Causality litmus test
  1030 executions finished but don't have following behavior: fails Write-to-Read Causality litmus test
  	execution 1
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 2
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 3
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 4
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 5
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 6
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 7
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 8
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 9
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 10
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 11
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 12
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 13
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 14
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 15
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 16
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 17
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 18
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 19
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 20
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 21
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 22
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 23
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 24
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 25
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 26
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 27
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 28
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 29
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 30
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 31
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 32
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 33
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 34
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 35
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 36
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 37
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 38
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 39
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 40
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 41
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 42
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 43
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 44
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 45
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 46
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 47
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 48
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 49
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 50
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 51
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 52
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 53
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 54
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 55
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 56
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 57
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 58
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 59
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 60
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 61
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 62
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 63
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 64
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 65
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 66
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 67
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 68
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 69
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 70
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 71
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 72
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 73
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 74
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 75
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 76
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 77
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 78
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 79
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 80
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 81
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 82
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 83
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 84
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 85
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 86
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 87
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 88
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 89
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 90
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 91
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 92
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 93
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 94
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 95
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 96
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 97
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 98
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 99
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 100
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 101
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 102
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 103
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 104
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 105
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 106
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 107
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 108
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 109
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 110
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 111
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 112
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 113
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 114
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 115
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 116
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 117
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 118
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 119
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 120
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 121
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 122
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 123
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 124
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 125
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 126
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 127
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 128
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 129
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 130
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 131
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 132
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 133
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 134
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 135
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 136
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 137
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 138
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 139
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 140
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 141
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 142
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 143
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 144
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 145
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 146
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 147
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 148
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 149
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 150
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 151
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 152
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 153
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 154
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 155
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 156
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 157
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 158
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 159
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 160
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 161
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 162
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 163
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 164
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 165
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 166
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 167
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 168
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 169
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 170
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 171
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 172
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 173
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 174
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 175
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 176
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 177
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 178
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 179
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 180
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 181
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 182
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 183
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 184
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 185
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 186
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 187
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 188
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 189
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 190
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 191
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 192
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 193
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 194
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 195
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 196
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 197
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 198
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 199
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 200
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 201
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 202
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 203
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 204
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 205
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 206
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 207
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 208
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 209
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 210
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 211
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 212
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 213
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 214
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 215
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 216
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 217
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 218
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 219
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 220
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 221
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 222
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 223
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 224
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 225
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 226
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 227
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 228
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 229
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 230
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 231
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 232
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 233
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 234
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 235
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 236
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 237
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 238
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 239
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 240
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 241
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 242
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 243
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 244
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 245
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 246
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 247
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 248
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 249
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 250
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 251
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 252
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 253
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 254
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 255
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 256
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 257
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 258
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 259
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 260
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 261
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 262
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 263
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 264
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 265
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 266
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 267
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 268
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 269
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 270
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 271
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 272
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 273
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 274
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 275
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 276
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 277
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 278
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 279
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 280
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 281
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 282
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 283
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 284
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 285
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 286
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 287
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 288
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 289
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 290
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 291
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 292
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 293
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 294
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 295
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 296
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 297
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 298
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 299
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 300
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 301
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 302
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 303
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 304
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 305
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 306
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 307
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 308
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 309
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 310
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 311
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 312
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 313
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 314
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 315
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 316
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 317
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 318
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 319
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 320
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 321
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 322
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 323
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 324
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 325
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 326
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 327
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 328
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 329
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 330
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 331
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 332
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 333
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 334
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 335
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 336
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 337
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 338
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 339
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 340
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 341
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 342
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 343
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 344
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 345
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 346
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 347
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 348
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 349
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 350
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 351
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 352
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 353
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 354
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 355
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 356
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 357
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 358
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 359
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 360
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 361
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 362
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 363
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 364
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 365
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 366
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 367
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 368
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 369
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 370
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 371
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 372
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 373
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 374
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 375
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 376
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 377
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 378
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 379
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 380
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 381
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 382
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 383
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 384
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 385
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 386
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 387
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 388
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 389
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 390
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 391
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 392
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 393
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 394
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 395
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 396
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 397
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 398
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 399
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 400
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 401
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 402
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 403
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 404
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 405
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 406
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 407
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 408
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 409
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 410
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 411
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 412
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 413
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 414
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 415
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 416
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 417
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 418
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 419
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 420
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 421
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 422
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 423
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 424
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 425
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 426
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 427
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 428
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 429
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 430
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 431
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 432
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 433
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 434
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 435
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 436
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 437
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 438
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 439
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 440
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 441
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 442
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 443
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 444
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 445
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 446
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 447
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 448
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 449
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 450
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 451
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 452
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 453
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 454
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 455
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 456
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 457
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 458
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 459
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 460
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 461
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 462
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 463
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 464
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 465
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 466
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 467
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 468
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 469
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 470
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 471
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 472
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 473
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 474
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 475
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 476
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 477
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 478
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 479
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 480
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 481
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 482
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 483
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 484
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 485
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 486
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 487
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 488
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 489
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 490
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 491
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 492
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 493
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 494
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 495
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 496
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 497
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 498
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 499
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 500
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 501
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 502
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 503
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 504
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 505
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 506
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 507
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 508
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 509
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 510
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 511
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 512
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 513
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 514
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 515
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 516
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 517
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 518
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 519
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 520
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 521
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 522
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 523
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 524
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 525
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 526
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 527
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 528
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 529
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 530
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 531
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 532
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 533
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 534
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 535
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 536
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 537
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 538
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 539
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 540
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 541
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 542
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 543
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 544
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 545
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 546
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 547
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 548
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 549
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 550
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 551
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 552
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 553
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 554
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 555
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 556
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 557
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 558
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 559
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 560
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 561
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 562
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 563
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 564
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 565
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 566
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 567
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 568
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 569
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 570
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 571
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 572
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 573
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 574
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 575
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 576
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 577
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 578
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 579
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 580
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 581
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 582
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 583
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 584
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 585
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 586
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 587
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 588
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 589
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 590
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 591
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 592
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 593
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 594
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 595
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 596
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 597
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 598
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 599
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 600
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 601
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 602
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 603
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 604
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 605
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 606
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 607
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 608
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 609
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 610
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 611
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 612
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 613
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 614
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 615
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 616
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 617
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 618
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 619
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 620
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 621
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 622
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 623
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 624
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 625
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 626
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 627
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 628
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 629
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 630
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 631
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 632
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 633
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 634
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 635
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 636
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 637
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 638
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 639
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 640
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 641
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 642
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 643
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 644
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 645
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 646
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 647
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 648
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 649
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 650
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 651
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 652
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 653
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 654
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 655
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 656
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 657
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 658
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 659
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 660
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 661
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 662
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 663
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 664
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 665
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 666
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 667
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 668
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 669
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 670
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 671
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 672
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 673
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 674
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 675
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 676
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 677
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 678
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 679
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 680
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 681
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 682
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 683
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 684
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 685
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 686
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 687
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 688
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 689
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 690
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 691
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 692
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 693
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 694
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 695
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 696
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 697
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 698
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 699
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 700
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 701
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 702
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 703
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 704
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 705
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 706
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 707
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 708
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 709
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 710
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 711
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 712
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 713
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 714
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 715
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 716
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 717
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 718
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 719
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 720
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 721
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 722
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 723
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 724
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 725
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 726
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 727
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 728
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 729
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 730
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 731
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 732
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 733
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 734
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 735
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 736
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 737
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 738
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 739
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 740
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 741
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 742
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 743
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 744
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 745
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 746
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 747
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 748
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 749
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 750
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 751
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 752
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 753
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 754
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 755
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 756
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 757
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 758
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 759
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 760
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 761
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 762
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 763
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 764
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 765
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 766
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 767
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 768
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 769
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 770
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 771
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 772
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 773
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 774
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 775
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 776
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 777
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 778
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 779
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 780
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 781
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 782
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 783
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 784
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 785
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 786
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 787
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 788
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 789
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 790
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 791
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 792
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 793
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 794
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 795
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 796
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 797
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 798
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 799
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 800
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 801
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 802
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 803
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 804
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 805
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 806
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 807
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 808
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 809
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 810
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 811
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 812
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 813
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 814
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 815
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 816
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 817
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 818
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 819
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 820
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 821
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 822
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 823
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 824
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 825
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 826
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 827
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 828
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 829
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 830
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 831
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 832
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 833
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 834
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 835
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 836
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 837
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 838
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 839
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 840
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 841
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 842
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 843
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 844
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 845
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 846
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 847
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 848
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 849
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 850
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 851
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 852
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 853
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 854
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 855
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 856
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 857
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 858
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 859
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 860
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 861
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 862
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 863
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 864
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 865
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 866
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 867
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 868
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 869
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 870
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 871
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 872
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 873
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 874
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 875
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 876
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 877
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 878
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 879
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 880
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 881
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 882
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 883
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 884
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 885
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 886
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 887
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 888
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 889
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 890
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 891
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 892
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 893
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 894
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 895
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 896
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 897
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 898
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 899
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 900
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 901
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 902
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 903
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 904
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 905
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 906
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 907
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 908
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 909
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 910
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 911
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 912
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 913
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 914
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 915
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 916
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 917
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 918
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 919
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 920
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 921
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 922
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 923
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 924
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 925
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 926
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 927
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 928
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 929
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 930
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 931
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 932
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 933
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 934
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 935
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 936
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 937
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 938
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 939
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 940
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 941
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 942
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 943
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 944
  ram: []
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 945
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 946
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 947
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 948
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 949
  ram: [("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 950
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 951
  ram: [("x", 1); ("y", 0)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 952
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 953
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 954
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 955
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 956
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 957
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 958
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 959
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 960
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 0)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 961
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 962
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 963
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 964
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 965
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 966
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 967
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 968
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 969
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 970
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 971
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 972
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 973
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 974
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 975
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 976
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 977
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 978
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 979
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 980
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 981
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 982
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 983
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 984
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 985
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 986
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 987
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 988
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 989
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 990
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 991
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 992
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 993
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 994
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 995
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 996
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 997
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 998
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 999
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 1000
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 1001
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 1002
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 1003
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 1004
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 1005
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 1006
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 1007
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 1008
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 1009
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 1010
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 1011
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 1012
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 1013
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 1014
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 1015
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 1016
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 1017
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 1018
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 1019
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 1020
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 1021
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 1022
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 1023
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 1024
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 1025
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 1026
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 1027
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 1028
  ram: [("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 1029
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 1030
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, PUSH_STORE (("x", 1)))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(1, PUSH_STORE (("y", 1)))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
