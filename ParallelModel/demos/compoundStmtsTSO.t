  $ (./compoundStmtsTSO.exe)
  Code:
  
  x<-1
  smp_mb         
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
  
  Fatal error: exception Not_found
  Raised at Stdlib__List.find in file "list.ml", line 224, characters 10-25
  Called from Parallelmodel_lib__Interpret.TSO.get_reg_val in file "lib/interpret.ml", line 969, characters 8-84
  Called from Dune__exe__CompoundStmtsTSO.check in file "demos/compoundStmtsTSO.ml", line 27, characters 11-36
  Called from Parallelmodel_lib__Interpret.TSO.show_execution_statistics.helper in file "lib/interpret.ml", line 921, characters 13-27
  Called from Parallelmodel_lib__Interpret.TSO.show_execution_statistics in file "lib/interpret.ml", line 925, characters 16-51
  Called from Dune__exe__CompoundStmtsTSO in file "demos/compoundStmtsTSO.ml", line 33, characters 9-80
  [2]
