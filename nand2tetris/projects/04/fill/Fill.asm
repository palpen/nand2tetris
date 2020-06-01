// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Author: Palermo Penano

// Keyboard parameters
@ki
M=0

// Screen parameters
@SCREEN
D=A
@addr
M=D
@si
M=0

// Fill entire screen
@8191
D=A
@n
M=D

(LOOP)
    // Line 12 to 17
    // If keyboard is pressed, jump to FILLSCREEN
    @KBD
    D=M
    @FILLSCREEN
    D;JGT

    // If keyboard is not pressed, keep looping
    @LOOP
    0;JMP

(FILLSCREEN)
    // Line 18 to 32
    @si
    D=M
    @n
    D=D-M
    @RESETPARAMS
    D;JGT

    // Replace RAM[addr]=1111111111111111
    @addr
    A=M
    M=-1

    @si
    M=M+1

    @addr
    M=M+1

    @FILLSCREEN
    0;JMP

(CLEARSCREEN)
    // Line 33 to 47
    // Once screen is cleared, return to LOOP
    // and continue listening to keyboard
    @si
    D=M
    @n
    D=D-M
    @RESETPARAMS
    D;JGT

    // Replace RAM[addr] = 0000000000000000
    @addr
    A=M
    M=0

    @si
    M=M+1

    @addr
    M=M+1

    @CLEARSCREEN
    0;JMP


(RESETPARAMS)
    // Line 48 to 61
    // Reset addr back to base address of screen mem. map
    @SCREEN
    D=A
    @addr
    M=D

    // Reset index used in loop to 0
    @si
    M=0

    // Reset n to base address of screen mem. map
    @8191
    D=A
    @n
    M=D

    // If key is still held down, go to
    // section PRESSEDLOOP section
    @KBD
    D=M
    @PRESSEDLOOP
    D;JGT

    @LOOP
    0;JMP

(PRESSEDLOOP)
    // If key is released, clear the screen
    // Otherwise, stay in this loop
    @KBD
    D=M
    @CLEARSCREEN
    D;JEQ

    @PRESSEDLOOP
    0;JMP

