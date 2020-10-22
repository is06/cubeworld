//--------------------------------------------------
// RSP microcode
// 2d-vertex triangle to rasterized triangle
//--------------------------------------------------

System_ByteAlign(8)
Microcode_RSP_2DVT2RT:
arch n64.rsp
base $0000

//--------------------------------------------------
Microcode_RSP_2DVT2RT_Start:

    ldv v0[e0],0(0)
    ldv v1[e0],8(0)
    ldv v2[e0],16(0)

// Make fill triangle command
// -----------------------------------------------------
    include "2dvt2rt/fill_triangle.asm"

// -----------------------------------------------------
    nop
    nop
    nop

// Run RDP command from RSP with edited RDP buffer data
// -----------------------------------------------------
    RSP_RunRDPCommand(Microcode_RSP_2DVT2RT_RDPBuffer, Microcode_RSP_2DVT2RT_RDPBuffer_End)

    break

//--------------------------------------------------
System_ByteAlign(8)
base Microcode_RSP_2DVT2RT+pc()
Microcode_RSP_2DVT2RT_End:

System_ByteAlign(8)
Microcode_RSP_2DVT2RT_Data:
base $0000

// 2D triangle coords
dh 188, 0, 208, 0   // v0: x, xfrac, y, yfrac
dh 236, 0, 45, 0    // v1: x, xfrac, y, yfrac
dh 42, 0, 112, 0    // v2: x, xfrac, y, yfrac

//--------------------------------------------------

System_ByteAlign(8)
Microcode_RSP_2DVT2RT_RDPBuffer:
arch n64.rdp

    Set_Scissor 0<<2, 0<<2, 0, 0, 320<<2, 240<<2
    Set_Color_Image IMAGE_DATA_FORMAT_RGBA, SIZE_OF_PIXEL_16B, 320-1, $00100000
    Set_Other_Modes CYCLE_TYPE_FILL
    Set_Fill_Color $3CED3CED

Microcode_RSP_2DVT2RT_RDPBuffer_Triangle:
    Fill_Triangle 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

    Sync_Full

//--------------------------------------------------
Microcode_RSP_2DVT2RT_RDPBuffer_End:

System_ByteAlign(8)
base Microcode_RSP_2DVT2RT_Data+pc()
Microcode_RSP_2DVT2RT_Data_End: