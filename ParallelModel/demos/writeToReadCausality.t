  $ (./writeToReadCausalitySC.exe)
  Code:
  
  x<-1   ||| r1 <- x ||| r2 <- y
         ||| y <- r1 ||| r3 <- x
  
  	EXECUTION STATISTICS
  0 executions finished and have following behavior: fails Write-to-Read Causality litmus test
  90 executions finished but don't have following behavior: fails Write-to-Read Causality litmus test
  	execution 1
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 2
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 3
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 4
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 5
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 6
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 7
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 8
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 9
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 10
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 11
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 12
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 13
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 14
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 15
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 16
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 17
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 18
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 19
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 20
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 21
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 22
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 23
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 24
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 25
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 26
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 27
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 28
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 29
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 30
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 31
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
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 32
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
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 33
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
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 34
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
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 35
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
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 36
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
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 37
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
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 38
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
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 39
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
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 40
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
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 41
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 42
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 43
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
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 44
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
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 45
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
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 46
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
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 47
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
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 48
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
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 49
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
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 50
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
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 51
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
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 52
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
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 53
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 54
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 55
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
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 56
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
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 57
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
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 58
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
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 59
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
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 60
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
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 61
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 62
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 63
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 64
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 65
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 66
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 67
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 68
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 69
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 70
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 71
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 72
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 73
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
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 74
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
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 75
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
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
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
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 77
  ram: [("y", 0); ("x", 1)]
  regs:
  	[]
  	[("r1", 0)]
  	[("r3", 1); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
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
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 79
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
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 80
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
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 81
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
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 82
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
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 83
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
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 85
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 86
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 87
  ram: [("y", 1); ("x", 1)]
  regs:
  	[]
  	[("r1", 1)]
  	[("r3", 0); ("r2", 0)]
  trace:
  	(2, STMT (ASSIGN (REGISTER ("r2"), VAR_NAME ("y"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(1, STMT (ASSIGN (REGISTER ("r1"), VAR_NAME ("x"))))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 88
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
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 89
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
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 90
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
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  $ (./writeToReadCausalityTSO.exe)
  Code:
  
  x<-1   ||| r1 <- x ||| r2 <- y
         ||| y <- r1 ||| r3 <- x
  
  	EXECUTION STATISTICS
  0 executions finished and have following behavior: fails Write-to-Read Causality litmus test
  1030 executions finished but don't have following behavior: fails Write-to-Read Causality litmus test
  	execution 1
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
  	execution 2
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
  	execution 3
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
  	execution 4
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
  	execution 5
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
  	execution 6
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
  	execution 7
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
  	execution 8
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
  	execution 9
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
  	execution 10
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
  	execution 11
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
  	execution 12
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
  	execution 13
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
  	execution 14
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
  	execution 15
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
  	execution 16
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
  	execution 17
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
  	execution 18
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
  	execution 19
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
  	execution 20
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
  	execution 21
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
  	execution 22
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
  	execution 23
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
  	execution 24
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
  	execution 25
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
  	execution 26
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
  	execution 27
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
  	execution 28
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
  	execution 29
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
  	execution 30
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
  	execution 31
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
  	execution 32
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
  	execution 33
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
  	execution 34
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
  	execution 35
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
  	execution 36
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
  	execution 37
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
  	execution 38
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
  	execution 39
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
  	execution 40
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
  	execution 41
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
  	execution 42
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
  	execution 43
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
  	execution 44
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
  	execution 45
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
  	execution 46
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
  	execution 47
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
  	execution 48
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
  	execution 49
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
  	execution 50
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
  	execution 51
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
  	execution 52
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
  	execution 53
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
  	execution 54
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
  	execution 55
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
  	execution 56
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
  	execution 57
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
  	execution 58
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
  	execution 59
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
  	execution 60
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
  	execution 61
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
  	execution 62
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
  	execution 63
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
  	execution 64
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
  	execution 65
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
  	execution 66
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
  	execution 67
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
  	execution 68
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
  	execution 69
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
  	execution 70
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
  	execution 71
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
  	execution 72
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
  	execution 73
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
  	execution 74
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
  	execution 75
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
  	execution 76
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
  	execution 77
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
  	execution 78
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
  	execution 79
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
  	execution 80
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
  	execution 81
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
  	execution 82
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
  	execution 83
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
  	execution 84
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
  	execution 85
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
  	execution 86
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
  	execution 87
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
  	execution 88
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
  	execution 89
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
  	execution 90
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
  	execution 91
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
  	execution 92
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
  	execution 93
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
  	execution 94
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
  	execution 95
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
  	execution 96
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
  	execution 97
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
  	execution 98
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
  	execution 99
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
  	execution 100
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
  	execution 101
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
  	execution 102
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
  	execution 103
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
  	execution 104
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
  	execution 105
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
  	execution 106
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
  	execution 107
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
  	execution 108
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
  	execution 109
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
  	execution 110
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
  	execution 111
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
  	execution 112
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
  	execution 113
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
  	execution 114
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
  	execution 115
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
  	execution 116
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
  	execution 117
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
  	execution 118
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
  	execution 119
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
  	execution 120
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
  	execution 121
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
  	execution 122
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
  	execution 123
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
  	execution 124
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
  	execution 125
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
  	execution 126
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
  	execution 127
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
  	execution 128
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
  	execution 129
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
  	execution 130
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
  	execution 131
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
  	execution 132
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
  	execution 133
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
  	execution 134
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
  	execution 135
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
  	execution 136
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
  	execution 137
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
  	execution 138
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
  	execution 139
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
  	execution 140
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
  	execution 141
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
  	execution 142
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
  	execution 143
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
  	execution 144
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
  	execution 145
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
  	execution 146
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
  	execution 147
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
  	execution 148
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
  	execution 149
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
  	execution 150
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
  	execution 151
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
  	execution 152
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
  	execution 153
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
  	execution 154
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
  	execution 155
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
  	execution 156
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
  	execution 157
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
  	execution 158
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
  	execution 159
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
  	execution 160
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
  	execution 161
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
  	execution 162
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
  	execution 163
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
  	execution 164
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
  	execution 165
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
  	execution 166
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
  	execution 167
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
  	execution 168
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
  	execution 169
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
  	execution 170
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
  	execution 171
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
  	execution 172
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
  	execution 173
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
  	execution 174
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
  	execution 175
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
  	execution 176
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
  	execution 177
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
  	execution 178
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
  	execution 179
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
  	execution 180
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
  	execution 181
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
  	execution 182
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
  	execution 183
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
  	execution 184
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
  	execution 185
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
  	execution 186
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
  	execution 187
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
  	execution 188
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
  	execution 189
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
  	execution 190
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
  	execution 191
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
  	execution 192
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
  	execution 193
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
  	execution 194
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
  	execution 195
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
  	execution 196
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
  	execution 197
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
  	execution 198
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
  	execution 199
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
  	execution 200
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
  	execution 201
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
  	execution 202
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
  	execution 203
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
  	execution 204
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
  	execution 205
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
  	execution 206
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
  	execution 207
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
  	execution 208
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
  	execution 209
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
  	execution 210
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
  	execution 211
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
  	execution 212
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
  	execution 213
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
  	execution 214
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
  	execution 215
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
  	execution 216
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
  	execution 217
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
  	execution 218
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
  	execution 219
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
  	execution 220
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
  	execution 221
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
  	execution 222
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
  	execution 223
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
  	execution 224
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
  	execution 225
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
  	execution 226
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
  	execution 227
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
  	execution 228
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
  	execution 229
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
  	execution 230
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
  	execution 231
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
  	execution 232
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
  	execution 233
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
  	execution 234
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
  	execution 235
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
  	execution 236
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
  	execution 237
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
  	execution 238
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
  	execution 239
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
  	execution 240
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
  	execution 241
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
  	execution 242
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
  	execution 243
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
  	execution 244
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
  	execution 245
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
  	execution 246
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
  	execution 247
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
  	execution 248
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
  	execution 249
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
  	execution 250
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
  	execution 251
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
  	execution 252
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
  	execution 253
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
  	execution 254
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
  	execution 255
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
  	execution 256
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
  	execution 257
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
  	execution 258
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
  	execution 259
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
  	execution 260
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
  	execution 261
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
  	execution 262
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
  	execution 263
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
  	execution 264
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
  	execution 265
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
  	execution 266
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
  	execution 267
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
  	execution 268
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
  	execution 269
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
  	execution 270
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
  	execution 271
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
  	execution 272
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
  	execution 273
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
  	execution 274
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
  	execution 275
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
  	execution 276
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
  	execution 277
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
  	execution 278
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
  	execution 279
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
  	execution 280
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
  	execution 281
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
  	execution 282
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
  	execution 283
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
  	execution 284
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
  	execution 285
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
  	execution 286
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
  	execution 287
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
  	execution 288
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
  	execution 289
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
  	execution 290
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
  	execution 291
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
  	execution 292
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
  	execution 293
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
  	execution 294
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
  	execution 295
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
  	execution 296
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
  	execution 297
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
  	execution 298
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
  	execution 299
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
  	execution 300
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
  	execution 301
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
  	execution 302
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
  	execution 303
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
  	execution 304
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
  	execution 305
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
  	execution 306
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
  	execution 307
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
  	execution 308
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
  	execution 309
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
  	execution 310
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
  	execution 311
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
  	execution 312
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
  	execution 313
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
  	execution 314
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
  	execution 315
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
  	execution 316
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
  	execution 317
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
  	execution 318
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
  	execution 319
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
  	execution 320
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
  	execution 321
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
  	execution 322
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
  	execution 323
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
  	execution 324
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
  	execution 325
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
  	execution 326
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
  	execution 327
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
  	execution 328
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
  	execution 329
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
  	execution 330
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
  	execution 331
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
  	execution 332
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
  	execution 333
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
  	execution 334
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
  	execution 335
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
  	execution 336
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
  	execution 337
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
  	execution 338
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
  	execution 339
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
  	execution 340
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
  	execution 341
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
  	execution 342
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
  	execution 343
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
  	execution 344
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
  	execution 345
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
  	execution 346
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
  	execution 347
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
  	execution 348
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
  	execution 349
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
  	execution 350
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
  	execution 351
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
  	execution 352
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
  	execution 353
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
  	execution 354
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
  	execution 355
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
  	execution 356
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
  	execution 357
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
  	execution 358
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
  	execution 359
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
  	execution 360
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
  	execution 361
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
  	execution 362
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
  	execution 363
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
  	execution 364
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
  	execution 365
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
  	execution 366
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
  	execution 367
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
  	execution 368
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
  	execution 369
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
  	execution 370
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
  	execution 371
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
  	execution 372
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
  	execution 373
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
  	execution 374
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
  	execution 375
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
  	execution 376
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
  	execution 377
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
  	execution 378
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
  	execution 379
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
  	execution 380
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
  	execution 381
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
  	execution 382
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
  	execution 383
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
  	execution 384
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
  	execution 385
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
  	execution 386
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
  	execution 387
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
  	execution 388
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
  	execution 389
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
  	execution 390
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
  	execution 391
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
  	execution 392
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
  	execution 393
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
  	execution 394
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
  	execution 395
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
  	execution 396
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
  	execution 397
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
  	execution 398
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
  	execution 399
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
  	execution 400
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
  	execution 401
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
  	execution 402
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
  	execution 403
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
  	execution 404
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
  	execution 405
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
  	execution 406
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
  	execution 407
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
  	execution 408
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
  	execution 409
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
  	execution 410
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
  	execution 411
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
  	execution 412
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
  	execution 413
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
  	execution 414
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
  	execution 415
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
  	execution 416
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
  	execution 417
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
  	execution 418
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
  	execution 419
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
  	execution 420
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
  	execution 421
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
  	execution 422
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
  	execution 423
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
  	execution 424
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
  	execution 425
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
  	execution 426
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
  	execution 427
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
  	execution 428
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
  	execution 429
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
  	execution 430
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
  	execution 431
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
  	execution 432
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
  	execution 433
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
  	execution 434
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
  	execution 435
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
  	execution 436
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
  	execution 437
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
  	execution 438
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
  	execution 439
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
  	execution 440
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
  	execution 441
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
  	execution 442
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
  	execution 443
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
  	execution 444
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
  	execution 445
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
  	execution 446
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
  	execution 447
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
  	execution 448
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
  	execution 449
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
  	execution 450
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
  	execution 451
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
  	execution 452
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
  	execution 453
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
  	execution 454
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
  	execution 455
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
  	execution 456
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
  	execution 457
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
  	execution 458
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
  	execution 459
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
  	execution 460
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
  	execution 461
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
  	execution 462
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
  	execution 463
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
  	execution 464
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
  	execution 465
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
  	execution 466
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
  	execution 467
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
  	execution 468
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
  	execution 469
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
  	execution 470
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
  	execution 471
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
  	execution 472
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
  	execution 473
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
  	execution 474
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
  	execution 475
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
  	execution 476
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
  	execution 477
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
  	execution 478
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
  	execution 479
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
  	execution 480
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
  	execution 481
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
  	execution 482
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
  	execution 483
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
  	execution 484
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
  	execution 485
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
  	execution 486
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
  	execution 487
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
  	execution 488
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
  	execution 489
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
  	execution 490
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
  	execution 491
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
  	execution 492
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
  	execution 493
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
  	execution 494
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
  	execution 498
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
  	execution 499
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
  	execution 500
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
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 505
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
  	execution 506
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
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 508
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
  	execution 509
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
  	execution 510
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
  	execution 511
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
  	execution 512
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
  	execution 513
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
  	execution 514
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
  	execution 515
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
  	execution 516
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
  	(0, STMT (NO_OP))
  	(1, STMT (ASSIGN (VAR_NAME ("y"), REGISTER ("r1"))))
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  <><><><><><><><><><><><><><><><><><>
  	execution 518
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
  	execution 519
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
  	(2, STMT (ASSIGN (REGISTER ("r3"), VAR_NAME ("x"))))
  	(1, PUSH_STORE (("y", 0)))
  	(0, STMT (NO_OP))
  <><><><><><><><><><><><><><><><><><>
  	execution 524
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
  	execution 525
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
  	execution 526
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
  	execution 527
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
  	execution 528
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
  	execution 529
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
  	execution 530
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
  	execution 531
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
  	execution 532
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
  	execution 533
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
  	execution 534
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
  	execution 535
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
  	execution 536
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
  	execution 537
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
  	execution 538
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
  	execution 539
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
  	execution 540
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
  	execution 541
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
  	execution 542
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
  	execution 543
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
  	execution 544
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
  	execution 545
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
  	execution 546
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
  	execution 547
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
  	execution 548
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
  	execution 549
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
  	execution 550
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
  	execution 551
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
  	execution 552
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
  	execution 553
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
  	execution 554
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
  	execution 555
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
  	execution 556
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
  	execution 557
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
  	execution 558
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
  	execution 559
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
  	execution 560
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
  	execution 561
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
  	execution 562
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
  	execution 563
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
  	execution 564
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
  	execution 565
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
  	execution 566
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
  	execution 567
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
  	execution 568
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
  	execution 569
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
  	execution 570
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
  	execution 571
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
  	execution 572
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
  	execution 573
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
  	execution 574
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
  	execution 575
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
  	execution 576
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
  	execution 577
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
  	execution 578
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
  	execution 579
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
  	execution 580
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
  	execution 581
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
  	execution 582
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
  	execution 583
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
  	execution 584
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
  	execution 585
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
  	execution 586
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
  	execution 587
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
  	execution 588
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
  	execution 589
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
  	execution 590
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
  	execution 591
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
  	execution 592
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
  	execution 593
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
  	execution 594
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
  	execution 595
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
  	execution 596
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
  	execution 597
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
  	execution 598
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
  	execution 599
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
  	execution 600
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
  	execution 601
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
  	execution 602
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
  	execution 603
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
  	execution 604
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
  	execution 605
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
  	execution 606
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
  	execution 607
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
  	execution 608
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
  	execution 609
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
  	execution 610
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
  	execution 611
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
  	execution 612
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
  	execution 613
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
  	execution 614
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
  	execution 615
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
  	execution 616
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
  	execution 617
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
  	execution 618
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
  	execution 619
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
  	execution 620
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
  	execution 621
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
  	execution 622
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
  	execution 623
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
  	execution 624
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
  	execution 625
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
  	execution 626
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
  	execution 627
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
  	execution 628
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
  	execution 629
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
  	execution 630
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
  	execution 631
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
  	execution 632
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
  	execution 633
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
  	execution 634
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
  	execution 635
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
  	execution 636
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
  	execution 637
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
  	execution 638
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
  	execution 639
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
  	execution 640
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
  	execution 641
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
  	execution 642
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
  	execution 643
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
  	execution 644
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
  	execution 645
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
  	execution 646
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
  	execution 647
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
  	execution 648
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
  	execution 649
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
  	execution 650
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
  	execution 651
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
  	execution 652
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
  	execution 653
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
  	execution 654
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
  	execution 655
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
  	execution 656
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
  	execution 657
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
  	execution 658
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
  	execution 659
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
  	execution 660
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
  	execution 661
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
  	execution 662
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
  	execution 663
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
  	execution 664
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
  	execution 665
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
  	execution 666
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
  	execution 667
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
  	execution 668
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
  	execution 669
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
  	execution 670
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
  	execution 671
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
  	execution 672
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
  	execution 673
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
  	execution 674
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
  	execution 675
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
  	execution 676
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
  	execution 677
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
  	execution 678
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
  	execution 679
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
  	execution 680
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
  	execution 681
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
  	execution 682
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
  	execution 683
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
  	execution 684
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
  	execution 685
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
  	execution 686
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
  	execution 687
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
  	execution 688
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
  	execution 689
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
  	execution 690
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
  	execution 691
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
  	execution 692
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
  	execution 693
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
  	execution 694
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
  	execution 695
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
  	execution 696
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
  	execution 697
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
  	execution 698
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
  	execution 699
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
  	execution 700
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
  	execution 701
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
  	execution 702
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
  	execution 703
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
  	execution 704
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
  	execution 705
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
  	execution 706
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
  	execution 707
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
  	execution 708
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
  	execution 709
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
  	execution 710
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
  	execution 711
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
  	execution 712
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
  	execution 713
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
  	execution 714
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
  	execution 715
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
  	execution 716
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
  	execution 717
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
  	execution 718
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
  	execution 719
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
  	execution 720
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
  	execution 721
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
  	execution 722
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
  	execution 723
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
  	execution 724
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
  	execution 725
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
  	execution 726
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
  	execution 727
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
  	execution 728
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
  	execution 729
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
  	execution 730
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
  	execution 731
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
  	execution 732
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
  	execution 733
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
  	execution 734
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
  	execution 735
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
  	execution 736
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
  	execution 737
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
  	execution 738
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
  	execution 739
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
  	execution 740
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
  	execution 741
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
  	execution 742
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
  	execution 743
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
  	execution 744
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
  	execution 745
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
  	execution 746
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
  	execution 747
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
  	execution 748
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
  	execution 749
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
  	execution 750
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
  	execution 751
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
  	execution 752
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
  	execution 753
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
  	execution 754
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
  	execution 755
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
  	execution 756
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
  	execution 757
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
  	execution 758
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
  	execution 759
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
  	execution 760
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
  	execution 761
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
  	execution 762
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
  	execution 763
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
  	execution 764
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
  	execution 765
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
  	execution 766
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
  	execution 767
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
  	execution 768
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
  	execution 769
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
  	execution 770
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
  	execution 771
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
  	execution 772
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
  	execution 773
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
  	execution 774
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
  	execution 775
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
  	execution 776
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
  	execution 777
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
  	execution 778
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
  	execution 779
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
  	execution 780
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
  	execution 781
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
  	execution 782
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
  	execution 783
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
  	execution 784
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
  	execution 785
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
  	execution 786
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
  	execution 787
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
  	execution 788
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
  	execution 789
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
  	execution 790
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
  	execution 791
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
  	execution 792
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
  	execution 793
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
  	execution 794
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
  	execution 795
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
  	execution 796
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
  	execution 797
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
  	execution 798
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
  	execution 799
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
  	execution 800
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
  	execution 801
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
  	execution 802
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
  	execution 803
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
  	execution 804
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
  	execution 805
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
  	execution 806
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
  	execution 807
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
  	execution 808
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
  	execution 809
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
  	execution 810
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
  	execution 811
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
  	execution 812
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
  	execution 813
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
  	execution 814
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
  	execution 815
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
  	execution 816
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
  	execution 817
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
  	execution 818
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
  	execution 819
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
  	execution 820
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
  	execution 821
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
  	execution 822
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
  	execution 823
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
  	execution 824
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
  	execution 825
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
  	execution 826
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
  	execution 827
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
  	execution 828
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
  	execution 829
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
  	execution 830
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
  	execution 831
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
  	execution 832
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
  	execution 833
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
  	execution 834
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
  	execution 835
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
  	execution 836
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
  	execution 837
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
  	execution 838
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
  	execution 839
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
  	execution 840
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
  	execution 841
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
  	execution 842
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
  	execution 843
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
  	execution 844
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
  	execution 845
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
  	execution 846
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
  	execution 847
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
  	execution 848
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
  	execution 849
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
  	execution 850
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
  	execution 851
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
  	execution 852
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
  	execution 853
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
  	execution 854
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
  	execution 855
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
  	execution 856
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
  	execution 857
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
  	execution 858
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
  	execution 859
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
  	execution 860
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
  	execution 861
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
  	execution 862
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
  	execution 863
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
  	execution 864
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
  	execution 865
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
  	execution 866
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
  	execution 867
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
  	execution 868
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
  	execution 869
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
  	execution 870
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
  	execution 871
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
  	execution 872
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
  	execution 873
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
  	execution 874
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
  	execution 875
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
  	execution 876
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
  	execution 877
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
  	execution 878
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
  	execution 879
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
  	execution 880
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
  	execution 881
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
  	execution 882
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
  	execution 883
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
  	execution 884
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
  	execution 885
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
  	execution 886
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
  	execution 887
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
  	execution 888
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
  	execution 889
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
  	execution 890
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
  	execution 891
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
  	execution 892
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
  	execution 893
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
  	execution 894
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
  	execution 895
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
  	execution 896
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
  	execution 897
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
  	execution 898
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
  	execution 899
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
  	execution 900
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
  	execution 901
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
  	execution 902
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
  	execution 903
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
  	execution 904
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
  	execution 905
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
  	execution 906
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
  	execution 907
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
  	execution 908
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
  	execution 909
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
  	execution 910
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
  	execution 911
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
  	execution 912
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
  	execution 913
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
  	execution 914
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
  	execution 915
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
  	execution 916
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
  	execution 917
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
  	execution 918
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
  	execution 919
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
  	execution 920
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
  	execution 921
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
  	execution 922
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
  	execution 923
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
  	execution 924
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
  	execution 925
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
  	execution 926
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
  	execution 927
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
  	execution 928
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
  	execution 929
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
  	execution 930
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
  	execution 931
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
  	execution 932
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
  	execution 933
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
  	execution 934
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
  	execution 935
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
  	execution 936
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
  	execution 937
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
  	execution 938
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
  	execution 939
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
  	execution 940
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
  	execution 941
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
  	execution 942
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
  	execution 943
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
  	execution 944
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
  	execution 945
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
  	execution 946
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
  	execution 947
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
  	execution 948
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
  	execution 949
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
  	execution 950
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
  	execution 951
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
  	execution 952
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
  	execution 953
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
  	execution 954
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
  	execution 955
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
  	execution 956
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
  	execution 957
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
  	execution 958
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
  	execution 959
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
  	execution 960
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
  	execution 961
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
  	execution 962
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
  	execution 963
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
  	execution 964
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
  	execution 965
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
  	execution 966
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
  	execution 967
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
  	execution 968
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
  	execution 969
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
  	execution 970
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
  	execution 971
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
  	execution 972
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
  	execution 973
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
  	execution 974
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
  	execution 975
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
  	execution 976
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
  	execution 977
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
  	execution 978
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
  	execution 979
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
  	execution 980
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
  	execution 981
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
  	execution 982
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
  	execution 983
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
  	execution 984
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
  	execution 985
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
  	execution 986
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
  	execution 987
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
  	execution 988
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
  	execution 989
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
  	execution 990
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
  	execution 991
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
  	execution 992
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
  	execution 993
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
  	execution 994
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
  	execution 995
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
  	execution 996
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
  	execution 997
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
  	execution 998
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
  	execution 999
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
  	execution 1000
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
  	execution 1001
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
  	execution 1002
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
  	execution 1003
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
  	execution 1004
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
  	execution 1005
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
  	execution 1006
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
  	execution 1007
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
  	execution 1008
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
  	execution 1009
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
  	execution 1010
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
  	execution 1011
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
  	execution 1012
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
  	execution 1013
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
  	execution 1014
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
  	execution 1015
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
  	execution 1016
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
  	execution 1017
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
  	execution 1018
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
  	execution 1019
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
  	execution 1020
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
  	execution 1021
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
  	execution 1022
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
  	execution 1023
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
  	execution 1024
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
  	execution 1025
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
  	execution 1026
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
  	execution 1027
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
  	execution 1028
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
  	execution 1029
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
  	execution 1030
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
