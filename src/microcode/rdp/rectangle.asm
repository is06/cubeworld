System_ByteAlign(8)
arch n64.rdp
Microcode_RDP_Rectangle:

    Set_Scissor 0<<2, 0<<2, 0, 0, 320<<2, 240<<2
    Set_Color_Image IMAGE_DATA_FORMAT_RGBA, SIZE_OF_PIXEL_16B, 320-1, $00100000
    Set_Other_Modes CYCLE_TYPE_FILL
    Set_Fill_Color $F001F001
    
    Fill_Rectangle 319<<2, 239<<2, 0<<2, 0<<2

    Sync_Full

Microcode_RDP_Rectangle_End:
