// -----------------------------------------------------
// FillTriangle edition in RDPBuffer
// Command has 4 words
// -----------------------------------------------------

    // FillTriangle base address
    ori a0,r0,Microcode_RSP_2DVT2RT_RDPBuffer_Triangle

    // Opcode 0x08 -> Fill_Triangle
    lui t0,$0800
    addi t1,r0,0

    // lft
    include "fill_triangle/compute_lft.asm"

    // level (disabled for now, we draw filled triangle)
    //li t2,0
    //sll t2,t2,19
    //or t0,t0,t2

    // tile (disabled for now, we draw filled triangle)
    //li t2,0
    //sll t2,t2,16
    //or t0,t0,t2

    include "fill_triangle/compute_y_coords.asm"

    // Store Word 0
    //sw t0,0(a0)
    //sw t1,4(a0)

    // Store Word 1
    //sw t0,8(a0)
    //sw t1,12(a0)

    // Word 2
    // IF ((Y2 - Y0) == 0) DxHDy = 0.0 
    // ELSE DxHDy = (X2 - X0) / (Y2 - Y0)
    //sw t0,16(a0)
    //sw t1,20(a0)

    // Word 3
    // IF ((Y2 - Y1) == 0) DxMDy = 0.0 
    // ELSE DxMDy = (X2 - X1) / (Y2 - Y1)
    //sw t0,24(a0)
    //sw t1,28(a0)
