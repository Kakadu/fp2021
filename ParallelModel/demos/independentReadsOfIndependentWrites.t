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
