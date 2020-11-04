constant GAME_DATA_BASE_ADDR($8000)

Game_Init:
    jal Game_Routine_Microcode_Load
    nop

Game_Update:
    // Wait for vertical synchronization (60 Hz -> 60 fps)
    Video_WaitForScanline($200)

    jal Game_Routine_Move_Coord
    nop

    jal Game_Routine_Draw_Scene
    nop

    j Game_Update
    nop

Game_Routine_Move_Coord:
    // load xcoord from ram
    lui a0,GAME_DATA_BASE_ADDR
    lh t0,Game_Data_Triangle_Coords_X0(a0)
    
    // xcoord++
    addi t0,t0,1

    // store into ram
    sh t0,Game_Data_Triangle_Coords_X0(a0)

    // store into rsp dmem
    lui a1,SP_MEM_BASE
    sh t0,Microcode_RSP_2DVT2RT_Data_2DTriangleCoords_XCoords0(a1)

    // if xcoord == 300 then reinit xcoord
    ori t1,r0,300
    beq t0,t1,Game_Routine_Reinit_Coord
    nop

    jr ra
    nop

Game_Routine_Reinit_Coord:
    lui a0,GAME_DATA_BASE_ADDR
    ori t0,r0,r0
    sh t0,Game_Data_Triangle_Coords_X0(a0)
    j Game_Routine_Move_Coord
    nop

Game_Routine_Microcode_Load:
    RSP_SetXBUS()
    RSP_Load(Microcode_RSP_2DVT2RT, Microcode_RSP_2DVT2RT_End, SP_IMEM)
    RSP_DMAWait()
    RSP_Load(Microcode_RSP_2DVT2RT_Data, Microcode_RSP_2DVT2RT_Data_End, SP_DMEM)
    RSP_DMAWait()
    jr ra
    nop

Game_Routine_Draw_Scene:
    RSP_SetProgramCounter(Microcode_RSP_2DVT2RT_Start)
    RSP_Start()
    jr ra
    nop

Game_Data_Triangle_Coords_X0:
    dh 0
