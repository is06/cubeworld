Game_Init:
    Video_SetNTSC(320, 240, BPP16, $A0100000)

    RSP_SetXBUS()

    RSP_Load(Microcode_RSP_2DVT2RT, Microcode_RSP_2DVT2RT_End, SP_IMEM)
    RSP_DMAWait()
    RSP_Load(Microcode_RSP_2DVT2RT_Data, Microcode_RSP_2DVT2RT_Data_End, SP_DMEM)
    RSP_DMAWait()
    RSP_SetProgramCounter(Microcode_RSP_2DVT2RT_Start)
    RSP_Start()

Game_Update:
    Video_WaitForScanline($200)

    j Game_Update
    nop
    