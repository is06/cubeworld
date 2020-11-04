// -----------------------------------------------------
// Set_Fill_Color edition in RDPBuffer
// -----------------------------------------------------

    // Base address for RDP Buffer Fill_Triangle instruction
    la a0,Microcode_RSP_2DVT2RT_RDPBuffer_FillColor

    // Packed color
    lh t0,Microcode_RSP_2DVT2RT_Data_FillColor(0)
    sh t0,4(a0)
    sh t0,6(a0)