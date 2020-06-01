// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Author: Palermo Penano

@R0
D=M
@x0
M=D

@R1
D=M
@x1
M=D

@R2
M=0

@i
M=1
@result
M=0

(LOOP)
    @i
    D=M
    @x1
    D=D-M
    @STOP
    D;JGT

    @result
    D=M
    @x0
    D=D+M
    @result
    M=D

    @i
    M=M+1

    @LOOP
    0;JMP

(STOP)
    @result
    D=M
    @R2
    M=D

(END)
    @END
    0;JMP

