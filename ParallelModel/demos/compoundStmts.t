  $ (./compoundStmts.exe)
  Code:
  
  x<-1          
  if (x) {      
    r1<-1       
    if (y) {    
      r2<-2     
    }           
    else {      
      r3<-3     
    }           
    r4<-4       
  }             
  
  	EXECUTION STATISTICS
  1 executions finished and have following behavior: pass compound stmts test
  0 executions finished but don't have following behavior: pass compound stmts test
  	execution 1
  ram: [("x", 1)]
  regs:
  	[("r4", 4); ("r3", 3); ("r1", 1)]
  trace:
  	(0, STMT (ASSIGN (VAR_NAME ("x"), INT (1))))
  	(0, STMT (IF (VAR_NAME ("x"), [])))
  	(0, STMT (ASSIGN (REGISTER ("r1"), INT (1))))
  	(0, STMT (IF_ELSE (VAR_NAME ("y"), [], [])))
  	(0, STMT (ASSIGN (REGISTER ("r3"), INT (3))))
  	(0, STMT (ASSIGN (REGISTER ("r4"), INT (4))))
  <><><><><><><><><><><><><><><><><><>
