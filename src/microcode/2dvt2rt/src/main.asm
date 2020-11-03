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

    include "edge/load_coords.asm"
    include "shade/load_colors.asm"

    // Fill color
    include "fill_color.asm"

    // Edge coefficients
    include "edge/sort_coords.asm"
    include "edge/poly_winding.asm"
    include "edge/compute_edges.asm"
    include "edge/triangle_command.asm"

    // Shade coefficients
    include "shade/compute_shading.asm"
    include "shade/shade_command.asm"

    // Texture coefficients

    // ZBuffer coefficients

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

Microcode_RSP_2DVT2RT_Data_2DTriangleCoords_XCoords0:
    dh 0
Microcode_RSP_2DVT2RT_Data_2DTriangleCoords_XCoords1:
    dh 200
Microcode_RSP_2DVT2RT_Data_2DTriangleCoords_XCoords2:
    dh 0

Microcode_RSP_2DVT2RT_Data_2DTriangleCoords_YCoords0:
    dh 0
Microcode_RSP_2DVT2RT_Data_2DTriangleCoords_YCoords1:
    dh 0
Microcode_RSP_2DVT2RT_Data_2DTriangleCoords_YCoords2:
    dh 200

Microcode_RSP_2DVT2RT_Data_FillColor:
    dh $F801

Microcode_RSP_2DVT2RT_Data_2DTriangleColors:

Microcode_RSP_2DVT2RT_Data_2DTriangleColors_0:
    dw $0000ff00
Microcode_RSP_2DVT2RT_Data_2DTriangleColors_1:
    dw $ff000000
Microcode_RSP_2DVT2RT_Data_2DTriangleColors_2:
    dw $00ff0000

// -----------------------------------------------------

System_ByteAlign(8)
Microcode_RSP_2DVT2RT_RDPBuffer:
arch n64.rdp

    Set_Scissor 0<<2, 0<<2, 0, 0, 320<<2, 240<<2
    Set_Color_Image IMAGE_DATA_FORMAT_RGBA, SIZE_OF_PIXEL_16B, 320-1, $00100000

    Set_Other_Modes CYCLE_TYPE_FILL
    Set_Fill_Color $00000000
    Fill_Rectangle 319<<2, 239<<2, 0<<2, 0<<2

    Set_Other_Modes SAMPLE_TYPE | ALPHA_DITHER_SEL_NO_DITHER
    Set_Combine_Mode $0, $00, 0, 0, $6, $01, $0, $F, 1, 0, 0, 0, 0, 4, 7, 7

Microcode_RSP_2DVT2RT_RDPBuffer_FillColor:
    Set_Fill_Color $FFFFFFFF

Microcode_RSP_2DVT2RT_RDPBuffer_Triangle:
    Shade_Triangle 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

Microcode_RSP_2DVT2RT_RDPBuffer_Shade:
    //                 | Color comp.   | Change per X coord | Color comp. frac | Change per X coord frac | Change along edge | Change per Y coord | Change along edge frac | Change per Y coord frac
    Shade_Coefficients   0,0,256,0,      1,0,0,0,             0,0,0,0,           $edff,0,0,0,              0,1,0,0,            0,0,0,0,             0,$edff,0,0,                 0,0,0,0

    Sync_Full

// -----------------------------------------------------
Microcode_RSP_2DVT2RT_RDPBuffer_End:

System_ByteAlign(8)
base Microcode_RSP_2DVT2RT_Data+pc()
Microcode_RSP_2DVT2RT_Data_End: