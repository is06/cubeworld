
    // Zero vector
    vsub v31,v31[e0]

// Calculate Triangle Coefficiants
// -------------------------------------------------

    // Sort Of Parallel X Elements Within 3 Vectors (Uses Vector Merge To Sort Y Elements Within 3 Vectors)
    vge v6,v0,v1[e0] // VGE TMP1,  MIN, MID
    vmrg v8,v3,v4[e0]

    vlt v10,v0,v1[e0] // VLT  MIN,  MIN, MID
    vmrg v3,v3,v4[e0]

    vge v7,v10,v2[e0] // VGE TMP2,  MIN, MAX
    vmrg v9,v3,v5[e0]

    vlt v10,v10,v2[e0] // VLT  MIN,  MIN, MAX
    vmrg v3,v3,v5[e0]

    vge v2,v6,v7[e0] // VGE  MAX, TMP1, TMP2
    vmrg v5,v8,v9[e0]

    vlt v11,v6,v7[e0] // VLT  MID, TMP1, TMP2
    vmrg v4,v8,v9[e0]

    // Sort Of Parallel Y Elements Within 3 Vectors (Uses Vector Merge To Sort X Elements Within 3 Vectors)
    vge v6,v3,v4[e0] // VGE TMP1,  MIN, MID
    vmrg v8,v10,v11[e0]

    vlt v3,v3,v4[e0] // VLT  MIN,  MIN, MID
    vmrg v10,v10,v11[e0]

    vge v7,v3,v5[e0] // VGE TMP2,  MIN, MAX
    vmrg v9,v10,v2[e0]

    vlt v3,v3,v5[e0] // VLT  MIN,  MIN, MAX
    vmrg v10,v10,v2[e0]

    vge v5,v6,v7[e0] // VGE  MAX, TMP1, TMP2
    vmrg v2,v8,v9[e0]

    vlt v4,v6,v7[e0] // VLT  MID, TMP1, TMP2
    vmrg v11,v8,v9[e0]

    // IF Coordinate 0 & 1 Share Same Y: Sort By X Coordinates (Lowest To Highest)
    vlt v6,v3,v4[e0] // VLT TMP1, MIN, MID
    vmrg v0,v10,v11[e0]

    vge v6,v3,v4[e0] // VGE TMP1, MIN, MID
    vmrg v1,v10,v11[e0]

    nop
    nop
    nop

// DxLDy (XL-XM) / (YL-YM)
// -------------------------------------------------

    vsub v6,v2,v1[e0]       // V6 = XL-XM
    vsub v7,v5,v4[e0]       // V7 = YL-YM

    vne v8,v5,v4[e0]        // IF (YL-YM) == 0, Merge Zero Data, For Zero Result (Divide by Zero)
    vmrg v6,v6,v7[e0]

    vrcp v8[e0],v7[e0]      // Result Fraction (Zero), Source Integer (YL-YM 1)
    vrcph v7[e0],v31[e0]    // Result Integer, Source Fraction (Zero)

    vadd v7,v7[e0]          // Multiply Reciprocal Numbers By 2.0, To Use With Double Multiply Of Signed Integer By Unsigned Fraction
    vmudm v6,v6,v7[e0]      // Result Signed Integer, Source Signed Integer, Source Unsigned Fraction (Reciprocal)
    vmadn v7,v31,v31[e0]    // Result Unsigned Fraction, Zero, Zero

    nop
    nop
    nop

// DxMDy = (XM-XH) / (YM-YH)
// -------------------------------------------------

    vsub v8,v1,v0[e0] // V8 = XM-XH
    vsub v9,v4,v3[e0] // V9 = YM-YH

    vne v10,v4,v3[e0] // IF (YM-YH) == 0, Merge Zero Data, For Zero Result (Divide by Zero)
    vmrg v8,v8,v9[e0]

    vrcp v10[e0],v9[e0]  // Result Fraction (Zero), Source Integer (YM-YH 1)
    vrcph v9[e0],v31[e0] // Result Integer, Source Fraction (Zero)

    vadd v9,v9[e0] // Multiply Reciprocal Numbers By 2.0, To Use With Double Multiply Of Signed Integer By Unsigned Fraction
    vmudm v8,v8,v9[e0]   // Result Signed Integer, Source Signed Integer, Source Unsigned Fraction (Reciprocal)
    vmadn v9,v31,v31[e0] // Result Unsigned Fraction, Zero, Zero

    nop
    nop
    nop


// DxHDy = (XL-XH) / (YL-YH)
// -------------------------------------------------

    vsub v10,v2,v0[e0] // V10 = XL-XH
    vsub v11,v5,v3[e0] // V11 = YL-YH

    vne v12,v5,v3[e0] // IF (YL-YH) == 0, Merge Zero Data, For Zero Result (Divide by Zero)
    vmrg v10,v10,v11[e0]

    vrcp v12[e0],v11[e0]  // Result Fraction (Zero), Source Integer (YL-YH 1)
    vrcph v11[e0],v31[e0] // Result Integer, Source Fraction (Zero)

    vadd v11,v11[e0] // Multiply Reciprocal Numbers By 2.0, To Use With Double Multiply Of Signed Integer By Unsigned Fraction
    vmudm v10,v10,v11[e0] // Result Signed Integer, Source Signed Integer, Source Unsigned Fraction (Reciprocal)
    vmadn v11,v31,v31[e0] // Result Unsigned Fraction, Zero, Zero

    nop
    nop
    nop

// Preparing to store values in RDP Buffer
// -------------------------------------------------

    addi t1,r0,4
    mtc2 t1,v13[e0]

    vmudn v3,v13[e0] // YH <<= 2
    vmudn v4,v13[e0] // YM <<= 2
    vmudn v5,v13[e0] // YL <<= 2

    la a0,Microcode_RSP_2DVT2RT_RDPBuffer_Triangle

    li t0,$80
    sb t0,1(a0)         // Store Triangle 1: Direction Left/Right Major

    ssv v5[e0],2(a0) // Store Triangle 1: YL Integer
    ssv v4[e0],4(a0) // Store Triangle 1: YM Integer
    ssv v3[e0],6(a0) // Store Triangle 1: YH Integer

    ssv v1[e0],8(a0)  // Store Triangle 1: XL Integer
    ssv v6[e0],12(a0) // Store Triangle 1: DxLDy Integer
    ssv v7[e0],14(a0) // Store Triangle 1: DxLDy Fraction

    ssv v0[e0],16(a0)  // Store Triangle 1: XH Integer
    ssv v10[e0],20(a0) // Store Triangle 1: DxHDy Integer
    ssv v11[e0],22(a0) // Store Triangle 1: DxHDy Fraction

    ssv v0[e0],24(a0) // Store Triangle 1: XM Integer
    ssv v8[e0],28(a0) // Store Triangle 1: DxMDy Integer
    ssv v9[e0],30(a0) // Store Triangle 1: DxMDy Fraction
