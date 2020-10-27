// -----------------------------------------------------
// FillTriangle edition in RDPBuffer
// Command has 4 words
// -----------------------------------------------------

    // Multiply Y coords by 4
    addi t1,r0,4
    mtc2 t1,v13[e0]
    vmudn v3,v13[e0] // YH <<= 2
    vmudn v4,v13[e0] // YM <<= 2
    vmudn v5,v13[e0] // YL <<= 2

    // Base address for RDP Buffer Fill_Triangle instruction
    la a0,Microcode_RSP_2DVT2RT_RDPBuffer_Triangle

    // Store Direction Left/Right Major
    li t0,$00
    sb t0,1(a0)

    // Store Y coords
    ssv v5[e0],2(a0)
    ssv v4[e0],4(a0)
    ssv v3[e0],6(a0)

    // Store L edge
    ssv v1[e0],8(a0)    // XL Integer
    ssv v6[e0],12(a0)   // DxLDy Integer
    ssv v7[e0],14(a0)   // DxLDy Fraction

    // Store H edge
    ssv v0[e0],16(a0)   // XH Integer
    ssv v10[e0],20(a0)  // DxHDy Integer
    ssv v11[e0],22(a0)  // DxHDy Fraction

    // Store M edge
    ssv v0[e0],24(a0)   // XM Integer
    ssv v8[e0],28(a0)   // DxMDy Integer
    ssv v9[e0],30(a0)   // DxMDy Fraction
