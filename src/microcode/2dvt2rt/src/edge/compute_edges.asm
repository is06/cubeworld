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

// DxMDy = (XM-XH) / (YM-YH)
// -------------------------------------------------

    vsub v8,v1,v0[e0]       // V8 = XM-XH
    vsub v9,v4,v3[e0]       // V9 = YM-YH

    vne v10,v4,v3[e0]       // IF (YM-YH) == 0, Merge Zero Data, For Zero Result (Divide by Zero)
    vmrg v8,v8,v9[e0]

    vrcp v10[e0],v9[e0]     // Result Fraction (Zero), Source Integer (YM-YH 1)
    vrcph v9[e0],v31[e0]    // Result Integer, Source Fraction (Zero)

    vadd v9,v9[e0]          // Multiply Reciprocal Numbers By 2.0, To Use With Double Multiply Of Signed Integer By Unsigned Fraction
    vmudm v8,v8,v9[e0]      // Result Signed Integer, Source Signed Integer, Source Unsigned Fraction (Reciprocal)
    vmadn v9,v31,v31[e0]    // Result Unsigned Fraction, Zero, Zero


// DxHDy = (XL-XH) / (YL-YH)
// -------------------------------------------------

    vsub v10,v2,v0[e0]      // V10 = XL-XH
    vsub v11,v5,v3[e0]      // V11 = YL-YH

    vne v12,v5,v3[e0]       // IF (YL-YH) == 0, Merge Zero Data, For Zero Result (Divide by Zero)
    vmrg v10,v10,v11[e0]

    vrcp v12[e0],v11[e0]    // Result Fraction (Zero), Source Integer (YL-YH 1)
    vrcph v11[e0],v31[e0]   // Result Integer, Source Fraction (Zero)

    vadd v11,v11[e0]        // Multiply Reciprocal Numbers By 2.0, To Use With Double Multiply Of Signed Integer By Unsigned Fraction
    vmudm v10,v10,v11[e0]   // Result Signed Integer, Source Signed Integer, Source Unsigned Fraction (Reciprocal)
    vmadn v11,v31,v31[e0]   // Result Unsigned Fraction, Zero, Zero
