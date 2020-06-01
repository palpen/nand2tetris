// Listens to keyboard, if a key is pressed, returns current value of i

@ki
M=0

(LOOP)
    // If keyboard is pressed, jump to STOP
    @KBD
    D=M
    @STOP
    D;JGT

    // If keyboard is not pressed, keep looping
    @LOOP
    0;JMP

(STOP)
    @ki
    D=M
    @R0
    M=D

    @ki
    M=M+1

    @LOOP
    0;JMP

(END)
    @END
    0;JMP
