// Initialize values
@SCREEN
D=A
@addr
M=D
@si
M=0

// Fill entire screen
@8192
D=A
@n
M=D

(LOOP)

    // if i > n, jump to END
    @si
    D=M
    @n
    D=D-M
    @END
    D;JGT

    @addr
    A=M  // go to address addr and assign RAM[addr]=-1
    M=-1

    @si
    M=M+1

    @addr
    M=M+1

    @LOOP
    0;JMP

(END)
    @END
    0;JMP
