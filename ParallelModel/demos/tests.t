  $ (./demoParse.exe)
  PROG ([THREAD ((0,
                  [ASSIGN (REGISTER ("EAX"), INT (6));
                   ASSIGN (VAR_NAME ("res"), INT (1));
                   WHILE
                   (REGISTER ("EAX"),
                    [ASSIGN
                     (VAR_NAME ("res"),
                      MUL (VAR_NAME ("res"), REGISTER ("EAX")));
                     ASSIGN (REGISTER ("EAX"), SUB (REGISTER ("EAX"), INT (1)))])]));
         THREAD ((1,
                  [ASSIGN (VAR_NAME ("x"), INT (1)); NO_OP;
                   ASSIGN (REGISTER ("EAX"), VAR_NAME ("y")); NO_OP; NO_OP;
                   NO_OP]));
         THREAD ((2,
                  [ASSIGN (VAR_NAME ("y"), INT (1)); NO_OP;
                   ASSIGN (REGISTER ("EBX"), VAR_NAME ("x")); NO_OP; NO_OP;
                   NO_OP]))])
  $ (./demoSC.exe)
  1, 1
