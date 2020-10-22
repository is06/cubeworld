// -----------------------------------------------------
// FillTriangle edition in RDPBuffer
// Command has 4 words
// -----------------------------------------------------

    // FillTriangle base address
    // -----------------------------------------------------
    ori a0,r0,Microcode_RSP_2DVT2RT_RDPBuffer_Triangle

// WORD0.1
// -----------------------------------------------------

    // Opcode 0x08
    // -----------------------------------------------------
    lui t0,$0800

    // YL
    // -----------------------------------------------------
    li t1,150       // todo: get value from vector register
    sll t1,t1,2
    or t0,t0,t1

    // tile
    // -----------------------------------------------------
    li t1,0         // todo: get value from vector register
    sll t1,t1,16
    or t0,t0,t1

    // level
    // -----------------------------------------------------
    li t1,0         // todo: get value from vector register
    sll t1,t1,19
    or t0,t0,t1

    // lft
    // -----------------------------------------------------
    li t1,1         // todo: compute value to know if its left or right
    sll t1,t1,23
    or t0,t0,t1

    // Store word0.1
    // -----------------------------------------------------
    sw t0,0(a0)

// WORD0.2
// -----------------------------------------------------
    lui t0,0

    // YH
    // -----------------------------------------------------
    li t1,50         // todo: get value from vector register
    sll t1,t1,2
    or t0,t0,t1

    // YM
    // -----------------------------------------------------
    li t1,100        // todo: get value from vector register
    sll t1,t1,18
    or t0,t0,t1

    // Store word0.2
    // -----------------------------------------------------
    sw t0,4(a0)

// WORD1.1
// -----------------------------------------------------
    lui t0,0

    // XLfrac
    // -----------------------------------------------------
    li t1,0         // todo: get value from vector register
    or t0,t0,t1

    // XL
    // -----------------------------------------------------
    li t1,150         // todo: get value from vector register
    sll t1,t1,16
    or t0,t0,t1

    // Store word1.1
    // -----------------------------------------------------
    sw t0,8(a0)

// WORD1.2
// -----------------------------------------------------
    lui t0,0

    // DxLDyfrac
    // -----------------------------------------------------
    li t1,0         // todo: get value from vector register
    or t0,t0,t1

    // DxLDy
    // -----------------------------------------------------
    li t1,-3        // todo: get value from vector register
    sll t1,t1,16
    or t0,t0,t1

    // Store word1.2
    // -----------------------------------------------------
    sw t0,12(a0)

// WORD2.1
// -----------------------------------------------------
    lui t0,0

    // XHfrac
    // -----------------------------------------------------
    li t1,0        // todo: get value from vector register
    or t0,t0,t1

    // XH
    // -----------------------------------------------------
    li t1,100        // todo: get value from vector register
    sll t1,t1,16
    or t0,t0,t1

    // Store word2.1
    // -----------------------------------------------------
    sw t0,16(a0)

// WORD2.2
// -----------------------------------------------------
    lui t0,0

    // DxHDyfrac
    // -----------------------------------------------------
    li t1,$8888        // todo: get value from vector register
    or t0,t0,t1

    // DxHDy
    // -----------------------------------------------------
    li t1,-1        // todo: get value from vector register
    sll t1,t1,16
    or t0,t0,t1

    // Store word2.2
    // -----------------------------------------------------
    sw t0,20(a0)

// WORD3.1
// -----------------------------------------------------
    lui t0,0

    // XMfrac
    // -----------------------------------------------------
    li t1,0        // todo: get value from vector register
    or t0,t0,t1

    // XM
    // -----------------------------------------------------
    li t1,100        // todo: get value from vector register
    sll t1,t1,16
    or t0,t0,t1

    // Store word3.1 - address offset 24
    // -----------------------------------------------------
    sw t0,24(a0)

// -----------------------------------------------------
// Word3.2
// -----------------------------------------------------

    lui t0,0

    // DxHDyfrac
    // -----------------------------------------------------
    li t1,0        // todo: get value from vector register
    or t0,t0,t1

    // DxHDy
    // -----------------------------------------------------
    li t1,1        // todo: get value from vector register
    sll t1,t1,16
    or t0,t0,t1

    // Store word3.2 - address offset 28
    // -----------------------------------------------------
    sw t0,28(a0)
