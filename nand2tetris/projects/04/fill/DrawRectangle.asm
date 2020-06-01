
//// INPUT: User input on number of loop iteration
//// Number of rows to fill
//@R0
//D=M
//@n
//M=D

//// INPUT: Type of fill
//// Put -1 in R1 to fill rectangular block
//@R1
//D=M
//@fillval
//M=D

//// INPUT: Column segments to fill
//// If RAM[2]=32, then it will only fill the first 16 columns
//// Need to set RAM[2]=1 and RAM[n]=8192 to fill whole screen
//@R2
//D=M
//@colseg
//M=D

// Initialize values
@SCREEN
D=A
@addr
M=D
@i
M=0

// Fill entire screen
@8192
D=A
@n
M=D

(LOOP)

    // if i > n, jump to END
    @i
    D=M
    @n
    D=D-M
    @END
    D;JGT

//    // In memory address addr in RAM, store -1 (which is 16 ones in binary)
//    // Precisely, RAM[addr]=1111111111111111
//    @fillval
//    D=M
//    @addr
//    A=M
//    M=D
    @addr
    A=M  // go to address addr and assign RAM[addr]=-1
    M=-1

    @i
    M=M+1

//    @colseg
//    D=M
//    @addr  // increment addr by 32, which corresponds to the next row on screen
//    M=M+D
    @addr
    M=M+1

    @LOOP
    0;JMP

(END)
    @END
    0;JMP
