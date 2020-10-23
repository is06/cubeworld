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
    sw t0,0(a0)
    sw t1,4(a0)

    // Word 1
    ori a1,r0,Microcode_RSP_2DVT2RT_Data_L
    jal Microcode_RSP_2DVT2RT_ComputeEdge
    nop
    sw t0,8(a0)
    sw t1,12(a0)

    // Word 2
    ori a1,r0,Microcode_RSP_2DVT2RT_Data_H
    jal Microcode_RSP_2DVT2RT_ComputeEdge
    nop
    sw t0,16(a0)
    sw t1,20(a0)

    // Word 3
    ori a1,r0,Microcode_RSP_2DVT2RT_Data_M
    jal Microcode_RSP_2DVT2RT_ComputeEdge
    nop
    sw t0,24(a0)
    sw t1,28(a0)

    // End the fill triangle routine
    j Microcode_RSP_2DVT2RT_FillTriangleEnd
    nop

Microcode_RSP_2DVT2RT_ComputeEdge:
    // Register to zero
    addi t0,r0,0
    addi t1,r0,0

    // X
    lh t2,0(a1)
    sll t2,t2,16
    or t0,t0,t2

    // Xfrac
    lh t2,2(a1)
    or t0,t0,t2

    // DxDy
    lh t2,4(a1)
    sll t2,t2,16
    or t1,t1,t2

    // DxDyfrac
    lh t2,6(a1)
    or t1,t1,t2

    // Return
    jr ra
    nop

Microcode_RSP_2DVT2RT_FillTriangleEnd:
