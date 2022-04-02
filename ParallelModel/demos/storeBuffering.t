  $ (./storeBufferingNoBarsSC.exe)
  Code:
  
  x<-1   ||| y<-1
  r1<-y  ||| r2<-x
  
  	EXECUTION STATISTICS
  0 executions finished and have following behavior: r1 = 0 and r2 = 0
  6 executions finished but don't have following behavior: r1 = 0 and r2 = 0
  	execution 1
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 2
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 3
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 4
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 5
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 6
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  $ (./storeBufferingWithBarsSC.exe)
  Code:
  
  x<-1   ||| y<-1
  smp_mb ||| smp_mb
  r1<-y  ||| r2<-x
  
  	EXECUTION STATISTICS
  0 executions finished and have following behavior: r1 = 0 and r2 = 0
  20 executions finished but don't have following behavior: r1 = 0 and r2 = 0
  	execution 1
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 0)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (SMP_MB))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (SMP_MB))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 2
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (SMP_MB))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (SMP_MB))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 3
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (SMP_MB))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (SMP_MB))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 4
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (SMP_MB))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (SMP_MB))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 5
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (SMP_MB))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (SMP_MB))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 6
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (SMP_MB))
  	(1, STMT (SMP_MB))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 7
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (SMP_MB))
  	(1, STMT (SMP_MB))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 8
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (SMP_MB))
  	(0, STMT (SMP_MB))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 9
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (SMP_MB))
  	(0, STMT (SMP_MB))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 10
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (SMP_MB))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (SMP_MB))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 11
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (SMP_MB))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (SMP_MB))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 12
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (SMP_MB))
  	(1, STMT (SMP_MB))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 13
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (SMP_MB))
  	(1, STMT (SMP_MB))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 14
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (SMP_MB))
  	(0, STMT (SMP_MB))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 15
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (SMP_MB))
  	(0, STMT (SMP_MB))
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
  	(1, STMT (SMP_MB))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (SMP_MB))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 17
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (SMP_MB))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (SMP_MB))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 18
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (SMP_MB))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (SMP_MB))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 19
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (SMP_MB))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (SMP_MB))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 20
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r1", 1)]
  	[("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (SMP_MB))
  	(1, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (SMP_MB))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  $ (./storeBufferingNoBarsTSO.exe)
  Code:
  
  x<-1   ||| y<-1
  r1<-y  ||| r2<-x
  
  	EXECUTION STATISTICS
  12 executions finished and have following behavior: r1 = 0 and r2 = 0
  62 executions finished but don't have following behavior: r1 = 0 and r2 = 0
  	execution 1
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
  	execution 2
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
  	execution 3
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
  	execution 4
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
  	execution 5
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
  	execution 6
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
  	execution 7
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
  	execution 8
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
  	execution 9
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
  	execution 10
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
  	execution 11
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
  	execution 12
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
  	execution 13
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
  	execution 14
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
  	execution 15
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
  	execution 16
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
  	execution 17
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
  	execution 18
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
  	execution 19
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
  	execution 20
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
  	execution 21
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
  	execution 22
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
  	execution 23
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
  	execution 24
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
  	execution 25
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
  	execution 26
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
  	execution 27
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
  	execution 28
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
  	execution 29
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
  	execution 30
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
  	execution 31
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
  	execution 32
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
  	execution 33
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
  	execution 34
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
  	execution 35
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
  	execution 36
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
  	execution 37
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
  	execution 38
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
  	execution 39
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
  	execution 40
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
  	execution 41
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
  	execution 42
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
  	execution 43
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
  	execution 44
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
  	execution 45
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
  	execution 46
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
  	execution 47
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
  	execution 48
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
  	execution 49
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
  	execution 50
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
  	execution 51
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
  	execution 52
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
  	execution 53
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
  	execution 54
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
  	execution 55
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
  	execution 56
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
  	execution 57
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
  	execution 58
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
  	execution 59
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
  	execution 60
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
  	execution 61
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
  	execution 62
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
  	execution 63
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
  	execution 64
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
  	execution 65
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
  	execution 66
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
  	execution 67
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
  	execution 68
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
  	execution 69
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
  	execution 70
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
  	execution 71
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
  	execution 72
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
  	execution 73
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
  	execution 74
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
  $ (./storeBufferingWithBarsTSO.exe)
  Code:
  
  x<-1   ||| y<-1
  smp_mb ||| smp_mb
  r1<-y  ||| r2<-x
  
  	EXECUTION STATISTICS
  0 executions finished and have following behavior: r1 = 0 and r2 = 0
  160 executions finished but don't have following behavior: r1 = 0 and r2 = 0
  	execution 1
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
  	execution 2
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
  	execution 3
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
  	execution 4
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
  	execution 5
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
  	execution 6
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
  	execution 7
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
  	execution 8
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
  	execution 9
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
  	execution 10
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
  	execution 11
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
  	execution 12
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
  	execution 13
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
  	execution 14
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
  	execution 15
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
  	execution 16
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
  	execution 17
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
  	execution 18
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
  	execution 19
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
  	execution 20
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
  	execution 21
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
  	execution 22
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
  	execution 23
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
  	execution 24
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
  	execution 25
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
  	execution 26
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
  	execution 27
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
  	execution 28
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
  	execution 29
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
  	execution 30
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
  	execution 31
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
  	execution 32
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
  	execution 33
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
  	execution 34
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
  	execution 35
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
  	execution 36
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
  	execution 37
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
  	execution 38
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
  	execution 39
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
  	execution 40
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
  	execution 41
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
  	execution 42
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
  	execution 43
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
  	execution 44
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
  	execution 45
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
  	execution 46
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
  	execution 47
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
  	execution 48
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
  	execution 49
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
  	execution 50
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
  	execution 51
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
  	execution 52
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
  	execution 53
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
  	execution 54
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
  	execution 55
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
  	execution 56
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
  	execution 57
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
  	execution 58
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
  	execution 59
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
  	execution 60
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
  	execution 61
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
  	execution 62
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
  	execution 63
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
  	execution 64
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
  	execution 65
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
  	execution 66
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
  	execution 67
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
  	execution 68
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
  	execution 69
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
  	execution 70
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
  	execution 71
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
  	execution 72
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
  	execution 73
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
  	execution 74
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
  	execution 75
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
  	execution 76
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
  	execution 77
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
  	execution 78
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
  	execution 79
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
  	execution 80
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
  	execution 81
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
  	execution 82
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
  	execution 83
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
  	execution 84
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
  	execution 85
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
  	execution 86
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
  	execution 87
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
  	execution 88
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
  	execution 89
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
  	execution 90
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
  	execution 91
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
  	execution 92
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
  	execution 93
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
  	execution 94
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
  	execution 95
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
  	execution 96
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
  	execution 97
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
  	execution 98
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
  	execution 99
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
  	execution 100
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
  	execution 101
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
  	execution 102
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
  	execution 103
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
  	execution 104
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
  	execution 105
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
  	execution 106
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
  	execution 107
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
  	execution 108
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
  	execution 109
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
  	execution 110
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
  	execution 111
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
  	execution 112
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
  	execution 113
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
  	execution 114
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
  	execution 115
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
  	execution 116
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
  	execution 117
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
  	execution 118
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
  	execution 119
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
  	execution 120
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
  	execution 121
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
  	execution 122
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
  	execution 123
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
  	execution 124
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
  	execution 125
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
  	execution 126
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
  	execution 127
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
  	execution 128
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
  	execution 129
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
  	execution 130
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
  	execution 131
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
  	execution 132
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
  	execution 133
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
  	execution 134
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
  	execution 135
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
  	execution 136
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
  	execution 137
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
  	execution 138
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
  	execution 139
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
  	execution 140
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
  	execution 141
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
  	execution 142
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
  	execution 143
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
  	execution 144
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
  	execution 145
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
  	execution 146
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
  	execution 147
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
  	execution 148
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
  	execution 149
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
  	execution 150
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
  	execution 151
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
  	execution 152
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
  	execution 153
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
  	execution 154
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
  	execution 155
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
  	execution 156
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
  	execution 157
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
  	execution 158
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
  	execution 159
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
  	execution 160
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
