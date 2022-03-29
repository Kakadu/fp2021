  $ (./storeBufferingNoBarsSC.exe)
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
  $ (./storeBufferingWithBarsSC.exe)
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
  $ (./storeBufferingNoBarsTSO.exe)
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
  $ (./storeBufferingWithBarsTSO.exe)
  Code:
  
  x<-1   ||| y<-1
  smp_mb ||| smp_mb
  r1<-y  ||| r2<-x
  
  	EXECUTION STATISTICS
  0 executions crushed
  0 executions finished and have following behavior: r1 = 0 and r2 = 0
  160 executions finished but don't have following behavior: r1 = 0 and r2 = 0
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
