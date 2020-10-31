Game_Init:

Game_RSP_Triangle_Test:
    RSP_SetXBUS()
    RSP_Load(Microcode_RSP_2DVT2RT, Microcode_RSP_2DVT2RT_End, SP_IMEM)
    RSP_DMAWait()
    RSP_Load(Microcode_RSP_2DVT2RT_Data, Microcode_RSP_2DVT2RT_Data_End, SP_DMEM)
    RSP_DMAWait()
    RSP_SetProgramCounter(Microcode_RSP_2DVT2RT_Start)
    RSP_Start()

Game_Update:
    // Wait for vertical synchronization (60 Hz -> 60 fps)
    Video_WaitForScanline($200)

    j Game_Update
    nop
    