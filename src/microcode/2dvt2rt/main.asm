// -----------------------------------------------------
// RSP microcode
// 2d-vertex triangle to rasterized triangle
// -----------------------------------------------------

System_ByteAlign(8)
Microcode_RSP_2DVT2RT:
arch n64.rsp
base $0000

// -----------------------------------------------------
Microcode_RSP_2DVT2RT_Start:

    include "sort_y_coords.asm"
    include "fill_triangle.asm"

    RSP_RunRDPCommand(Microcode_RSP_2DVT2RT_RDPBuffer, Microcode_RSP_2DVT2RT_RDPBuffer_End)

    break

// -----------------------------------------------------
System_ByteAlign(8)
base Microcode_RSP_2DVT2RT+pc()
Microcode_RSP_2DVT2RT_End:

System_ByteAlign(8)
Microcode_RSP_2DVT2RT_Data:
base $0000

Microcode_RSP_2DVT2RT_Data_2DTriangleCoords:
    // 2D triangle coords
    dh 100, 0, 50, 0    // v0: x, xfrac, y, yfrac
    dh 50, 0, 150, 0    // v1: x, xfrac, y, yfrac
    dh 150, 0, 100, 0   // v2: x, xfrac, y, yfrac

Microcode_RSP_2DVT2RT_Data_L:
    dh 150
    dh 0
    dh -3
    dh 0

Microcode_RSP_2DVT2RT_Data_H:
    dh 100
    dh 0
    dh -1
    dh $8888

Microcode_RSP_2DVT2RT_Data_M:
    dh 100
    dh 0
    dh 1
    dh 0

// -----------------------------------------------------

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

// -----------------------------------------------------
Microcode_RSP_2DVT2RT_RDPBuffer_End:

System_ByteAlign(8)
base Microcode_RSP_2DVT2RT_Data+pc()
Microcode_RSP_2DVT2RT_Data_End: