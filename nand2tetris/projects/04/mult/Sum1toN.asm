// Computes RAM[1] = 1+2+...+RAM[0]

@R0
D=M
@n    // @16
M=D
@i    // @17
M=0
@sum  // @18
M=0

(LOOP)
    @i
    D=M

    @n
    D=D-M  // i-n
    @STOP
    D;JGT  // JGT is jump if >0; this says if D=i-n is >0, jump to STOP

    // sum = sum + i
    @sum
    D=M    // get current value of sum from memory
    @i
    D=D+M  // increment current value of sum by value of i
    @sum
    M=D    // assign incremented value to sum in memory

    @i
    M=M+1

    @LOOP
    0;JMP  // Jump to LOOP

(STOP)
    // Return the value of sum into RAM address R1
    @sum
    D=M
    @R1
    M=D

(END)
    @END
    0;JMP

