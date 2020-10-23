System_ByteAlign(8)
arch n64.rdp
Microcode_RDP_Triangle:

    Set_Scissor 0<<2, 0<<2, 0, 0, 320<<2, 240<<2
    Set_Color_Image IMAGE_DATA_FORMAT_RGBA, SIZE_OF_PIXEL_16B, 320-1, $00100000
    Set_Other_Modes CYCLE_TYPE_FILL
    
    // Triangle parameters

    // WORD0: lft, Level, tile, YL, YM, YH
    // WORD1: XL, XLFrac, DxLDy, DxLDyFrac
    // WORD2: XH, XHFrac, DxDHDy, DxDHDyFrac
    // WORD3: XM, XMFrac, DxMDy, DxMDyFrac

    // Color: red
    Set_Fill_Color $3CED3CED
    // Left major triangle (lft = 1)
    Fill_Triangle 1, 0, 0, 150<<2, 100<<2, 50<<2, 150, 0, -3, 0, 100, 0, -1, $8888, 100, 0, 1, 0

    // Syncing pipe
    Sync_Full

Microcode_RDP_Triangle_End: