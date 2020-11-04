// -----------------------------------------------------
// RSP microcode
// Initialization of RSP
// -----------------------------------------------------

System_ByteAlign(8)
Microcode_RSP_Init:
arch n64.rsp
base $0000

// -----------------------------------------------------
Microcode_RSP_Init_Start:

    // Zero vector
    vsub v31,v31[e0]

    break

// -----------------------------------------------------
System_ByteAlign(8)
base Microcode_RSP_Init+pc()
Microcode_RSP_Init_End: