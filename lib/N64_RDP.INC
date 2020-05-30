//==============================================================
// RDP macros
//==============================================================

// Run DPC Command Buffer: Start Address, End Address
macro RDP_RunCommand(start,end) {
    lui a0,DPC_BASE        // A0 = Reality Display Processer Control Interface Base Register ($A4100000)
    la a1,{start}          // A1 = DPC Command Start Address
    sw a1,DPC_START(a0)    // Store DPC Command Start Address To DP Start Register ($A4100000)
    la a1,{end}            // A1 = DPC Command End Address
    sw a1,DPC_END(a0)      // Store DPC Command End Address To DP End Register ($A4100004)
}
