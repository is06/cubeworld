//==============================
// N64 Reality Signal Processor
//==============================
// RSP MIPS 4000 CPU Registers R0..R31
// RSP CP2 128-Bit Vector Registers: V0..V31
// RSP CP2 Vector Elements (128-Bit Vector = 16 Elements): E0..E15

// RSP CP0 Control Registers (MTF0/MTC0):
constant c0(0)   // RSP CP0 Control Register 00: I/DMEM Address For DMA (RW) ($04040000)
constant c1(1)   // RSP CP0 Control Register 01:   DRAM Address For DMA (RW) ($04040004)
constant c2(2)   // RSP CP0 Control Register 02: DMA READ  Length (DRAM -> I/DMEM) (RW) ($04040008)
constant c3(3)   // RSP CP0 Control Register 03: DMA WRITE Length (DRAM <- I/DMEM) (RW) ($0404000C)
constant c4(4)   // RSP CP0 Control Register 04: RSP Status (RW) ($04040010)
constant c5(5)   // RSP CP0 Control Register 05: DMA Full (R) ($04040014)
constant c6(6)   // RSP CP0 Control Register 06: DMA Busy (R) ($04040018)
constant c7(7)   // RSP CP0 Control Register 07: CPU-RSP Semaphore (RW) ($0404001C)
constant c8(8)   // RSP CP0 Control Register 08: RDP Command Buffer START (RW) ($04100000)
constant c9(9)   // RSP CP0 Control Register 09: RDP Command Buffer END (RW) ($04100004)
constant c10(10) // RSP CP0 Control Register 10: RDP Command Buffer CURRENT (R) ($04100008)
constant c11(11) // RSP CP0 Control Register 11: RDP Status (RW) ($0410000C)
constant c12(12) // RSP CP0 Control Register 12: RDP Clock Counter (R) ($04100010)
constant c13(13) // RSP CP0 Control Register 13: RDP Command Buffer BUSY (R) ($04100014)
constant c14(14) // RSP CP0 Control Register 14: RDP Pipe BUSY (R) ($04100018)
constant c15(15) // RSP CP0 Control Register 15: RDP TMEM BUSY (R) ($0410001C)

// RSP CP2 Control Registers (CFC2/CTC2):
constant vco(0) // RSP CP2 Control Register 0: Vector Carry Out
constant vcc(1) // RSP CP2 Control Register 1: Vector Compare Code
constant vce(2) // RSP CP2 Control Register 2: Vector Compare Extension

// RSP Status Read Flags:
constant RSP_HLT($0001) // SP_STATUS: Halt (Bit 0)
constant RSP_BRK($0002) // SP_STATUS: Break (Bit 1)
constant RSP_BSY($0004) // SP_STATUS: DMA Busy (Bit 2)
constant RSP_FUL($0008) // SP_STATUS: DMA Full (Bit 3)
constant RSP_IOF($0010) // SP_STATUS: IO Full (Bit 4)
constant RSP_STP($0020) // SP_STATUS: Single Step (Bit 5)
constant RSP_IOB($0040) // SP_STATUS: Interrupt On Break (Bit 6)
constant RSP_SG0($0080) // SP_STATUS: Signal 0 Set (Bit 7)
constant RSP_SG1($0100) // SP_STATUS: Signal 1 Set (Bit 8)
constant RSP_SG2($0200) // SP_STATUS: Signal 2 Set (Bit 9)
constant RSP_SG3($0400) // SP_STATUS: Signal 3 Set (Bit 10)
constant RSP_SG4($0800) // SP_STATUS: Signal 4 Set (Bit 11)
constant RSP_SG5($1000) // SP_STATUS: Signal 5 Set (Bit 12)
constant RSP_SG6($2000) // SP_STATUS: Signal 6 Set (Bit 13)
constant RSP_SG7($4000) // SP_STATUS: Signal 7 Set (Bit 14)

// RSP Status Write Flags:
constant CLR_HLT($0000001) // SP_STATUS: Clear Halt (Bit 0)
constant SET_HLT($0000002) // SP_STATUS:   Set Halt (Bit 1)
constant CLR_BRK($0000004) // SP_STATUS: Clear Broke (Bit 2)
constant CLR_INT($0000008) // SP_STATUS: Clear Interrupt (Bit 3)
constant SET_INT($0000010) // SP_STATUS:   Set Interrupt (Bit 4)
constant CLR_STP($0000020) // SP_STATUS: Clear Single Step (Bit 5)
constant SET_STP($0000040) // SP_STATUS:   Set Single Step (Bit 6)
constant CLR_IOB($0000080) // SP_STATUS: Clear Interrupt On Break (Bit 7)
constant SET_IOB($0000100) // SP_STATUS:   Set Interrupt On Break (Bit 8)
constant CLR_SG0($0000200) // SP_STATUS: Clear Signal 0 (Bit 9)
constant SET_SG0($0000400) // SP_STATUS:   Set Signal 0 (Bit 10)
constant CLR_SG1($0000800) // SP_STATUS: Clear Signal 1 (Bit 11)
constant SET_SG1($0001000) // SP_STATUS:   Set Signal 1 (Bit 12)
constant CLR_SG2($0002000) // SP_STATUS: Clear Signal 2 (Bit 13)
constant SET_SG2($0004000) // SP_STATUS:   Set Signal 2 (Bit 14)
constant CLR_SG3($0008000) // SP_STATUS: Clear Signal 3 (Bit 15)
constant SET_SG3($0010000) // SP_STATUS:   Set Signal 3 (Bit 16)
constant CLR_SG4($0020000) // SP_STATUS: Clear Signal 4 (Bit 17)
constant SET_SG4($0040000) // SP_STATUS:   Set Signal 4 (Bit 18)
constant CLR_SG5($0080000) // SP_STATUS: Clear Signal 5 (Bit 19)
constant SET_SG5($0100000) // SP_STATUS:   Set Signal 5 (Bit 20)
constant CLR_SG6($0200000) // SP_STATUS: Clear Signal 6 (Bit 21)
constant SET_SG6($0400000) // SP_STATUS:   Set Signal 6 (Bit 22)
constant CLR_SG7($0800000) // SP_STATUS: Clear Signal 7 (Bit 23)
constant SET_SG7($1000000) // SP_STATUS:   Set Signal 7 (Bit 24)

// RDP Status Read Flags:
constant RDP_XBS($001) // DPC_STATUS: Use XBUS DMEM DMA Or DRAM DMA (Bit 0)
constant RDP_FRZ($002) // DPC_STATUS: RDP Frozen (Bit 1)
constant RDP_FLS($004) // DPC_STATUS: RDP Flushed (Bit 2)
constant RDP_GCL($008) // DPC_STATUS: GCLK Alive (Bit 3)
constant RDP_TMB($010) // DPC_STATUS: TMEM Busy (Bit 4)
constant RDP_PLB($020) // DPC_STATUS: RDP PIPELINE Busy (Bit 5)
constant RDP_CMB($040) // DPC_STATUS: RDP COMMAND Unit Busy (Bit 6)
constant RDP_CMR($080) // DPC_STATUS: RDP COMMAND Buffer Ready (Bit 7)
constant RDP_DMA($100) // DPC_STATUS: RDP DMA Busy (Bit 8)
constant RDP_CME($200) // DPC_STATUS: RDP COMMAND END Register Valid (Bit 9)
constant RDP_CMS($400) // DPC_STATUS: RDP COMMAND START Register Valid (Bit 10)

// RDP Status Write Flags:
constant CLR_XBS($001) // DPC_STATUS: Clear XBUS DMEM DMA (Bit 0)
constant SET_XBS($002) // DPC_STATUS:   Set XBUS DMEM DMA (Bit 1)
constant CLR_FRZ($004) // DPC_STATUS: Clear FREEZE (Bit 2)
constant SET_FRZ($008) // DPC_STATUS:   Set FREEZE (Bit 3)
constant CLR_FLS($010) // DPC_STATUS: Clear FLUSH (Bit 4)
constant SET_FLS($020) // DPC_STATUS:   Set FLUSH (Bit 5)
constant CLR_TMC($040) // DPC_STATUS: Clear TMEM COUNTER (Bit 6)
constant CLR_PLC($080) // DPC_STATUS: Clear PIPELINE COUNTER (Bit 7)
constant CLR_CMC($100) // DPC_STATUS: Clear COMMAND COUNTER (Bit 8)
constant CLR_CLK($200) // DPC_STATUS: Clear CLOCK COUNTER (Bit 9)

macro RSP_Load(start, end, dest) { // RSP DMA Data Read DRAM->RSP MEM: Start Address, End Address, Destination RSP MEM Address
    lui a0,SP_BASE // A0 = SP Base Register ($A4040000)
    lui t0,SP_MEM_BASE // T0 = SP Memory Base Register ($A4000000)
    ori t0,{dest}&$1FFF // T0 = SP Memory Address Offset ($A4000000..$A4001FFF 8KB)
    sw t0,SP_MEM_ADDR(a0) // Store Memory Offset To SP Memory Address Register ($A4040000)
    la t0,{start}&$7FFFFFF // T0 = Aligned DRAM Physical RAM Offset ($00000000..$007FFFFF 8MB)
    sw t0,SP_DRAM_ADDR(a0) // Store RAM Offset To SP DRAM Address Register ($A4040004)
    la t0,({end}-{start})-1 // T0 = Length Of DMA Transfer In Bytes - 1
    sw t0,SP_RD_LEN(a0) // Store DMA Length To SP Read Length Register ($A4040008)
}

macro RSP_DMAWait() { // Wait For RSP DMA To Finish (DMA Busy = 0, DMA Full = 0)
    lui a0,SP_BASE // A0 = SP Base Register ($A4040000)
    -
        lw t0,SP_STATUS(a0) // T0 = RSP Status Register ($A4040010)
        andi t0,RSP_BSY|RSP_FUL // AND RSP Status Status With $C: DMA Busy (Bit 2) DMA Full (Bit 3)
        bnez t0,- // IF TRUE RSP DMA Busy & Full
        nop // Delay Slot
}

macro RSP_SetProgramCounter(start) { // Set RSP Program Counter: Start Address
    lui a0,SP_PC_BASE // A0 = SP PC Base Register ($A4080000)
    ori t0,r0,{start} // T0 = RSP Program Counter Set To Start Of RSP Code
    sw t0,SP_PC(a0) // Store RSP Program Counter To SP PC Register ($A4080000)
}

macro RSP_Start() { // Start RSP Execution: RSP Status = Clear Halt, Broke, Interrupt, Single Step, Interrupt On Break
    lui a0,SP_BASE // A0 = SP Base Register ($A4040000)
    ori t0,r0,CLR_HLT|CLR_BRK|CLR_INT|CLR_STP|CLR_IOB // T0 = RSP Status: Clear Halt, Broke, Interrupt, Single Step, Interrupt On Break
    sw t0,SP_STATUS(a0) // Store RSP Status To SP Status Register ($A4040010)
}

macro RSP_SetXBUS() { // RDP Status: Set XBUS (Switch To RSP DMEM For RDP Commands)
    lui a0,DPC_BASE // A0 = Reality Display Processer Control Interface Base Register ($A4100000)
    ori t0,r0,SET_XBS // T0 = DP Status: Set XBUS DMEM DMA (Bit 1)
    sw t0,DPC_STATUS(a0) // Store DP Status To DP Status Register ($A410000C)
}

macro RSP_RunRDPCommand(start, end) { // Run DPC Command Buffer: Start Address, End Address
    la a0,{start} // A0 = DPC Command Start Address
    mtc0 a0,c8 // Store DPC Command Start Address To DP Start Register ($A4100000)
    addi a0,{end}-{start} // A0 = DPC Command End Address
    mtc0 a0,c9 // Store DPC Command End Address To DP End Register ($A4100004)
}