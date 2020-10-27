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

    // Load short integers into vectors

    // X coordinates
    lsv v0[e0],Microcode_RSP_2DVT2RT_Data_2DTriangleCoords_XCoords0(0)
    lsv v1[e0],Microcode_RSP_2DVT2RT_Data_2DTriangleCoords_XCoords1(0)
    lsv v2[e0],Microcode_RSP_2DVT2RT_Data_2DTriangleCoords_XCoords2(0)

    // Y coordinates
    lsv v3[e0],Microcode_RSP_2DVT2RT_Data_2DTriangleCoords_YCoords0(0)
    lsv v4[e0],Microcode_RSP_2DVT2RT_Data_2DTriangleCoords_YCoords1(0)
    lsv v5[e0],Microcode_RSP_2DVT2RT_Data_2DTriangleCoords_YCoords2(0)

    //include "sort_y_coords.asm"
    include "compute_edges.asm"
    //include "fill_triangle.asm"

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
    // dh 111, 0, 74, 0    // v0: x, xfrac, y, yfrac
    // dh 20, 0, 125, 0    // v1: x, xfrac, y, yfrac
    // dh 39, 0, 206, 0   // v2: x, xfrac, y, yfrac
    
Microcode_RSP_2DVT2RT_Data_2DTriangleCoords_XCoords0:
    dh 111
Microcode_RSP_2DVT2RT_Data_2DTriangleCoords_XCoords1:
    dh 20
Microcode_RSP_2DVT2RT_Data_2DTriangleCoords_XCoords2:
    dh 39

Microcode_RSP_2DVT2RT_Data_2DTriangleCoords_YCoords0:
    dh 74
Microcode_RSP_2DVT2RT_Data_2DTriangleCoords_YCoords1:
    dh 125
Microcode_RSP_2DVT2RT_Data_2DTriangleCoords_YCoords2:
    dh 206

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