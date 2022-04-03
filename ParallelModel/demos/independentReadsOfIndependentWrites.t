  $ (./independentReadsOfIndependentWritesSC.exe)
  Code:
  
  x<-1  ||| y<-1
  r1<-x ||| r3 <-y 
  r2<-y ||| r4 <-x 
  
  	EXECUTION STATISTICS
  0 executions finished and have following behavior: fails Independent Reads of Independent Writes litmus test
  20 executions finished but don't have following behavior: fails Independent Reads of Independent Writes litmus test
  	execution 1
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r2", 0); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 2
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 3
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 4
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 5
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 6
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 7
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 8
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 9
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 10
  ram: [("y", 1); ("x", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 11
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 12
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 13
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 14
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 15
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 16
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 17
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 18
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 19
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 1); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 20
  ram: [("x", 1); ("y", 1)]
  regs:
  	[("r2", 1); ("r1", 1)]
  	[("r4", 0); ("r3", 1)]
  trace:
  	(1, STMT (ASSIGN (VAR_NAME ("y"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r4"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  <><><><><><><><><><><><><><><><><><>
  $ (./independentReadsOfIndependentWritesTSO.exe)
  Code:
  
  x<-1   ||| y<-1 ||| r1<-x  ||| r3 <-y 
         |||      ||| r2<-y  ||| r4 <-x 
  
  	EXECUTION STATISTICS
  0 executions finished and have following behavior: fails Independent Reads of Independent Writes litmus test
  98280 executions finished but don't have following behavior: fails Independent Reads of Independent Writes litmus test
