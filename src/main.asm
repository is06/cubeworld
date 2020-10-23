arch n64.cpu
endian msb
output "../build/cubeworld.n64", create
fill 1052672
origin $00000000
base $80000000

include "../lib/N64.INC"
include "../lib/N64_GFX.INC"
include "../lib/N64_RDP.INC"
include "../lib/N64_RSP.INC"
include "header.asm"
insert "../lib/N64_BOOTCODE.BIN"

Main:
    System_Init()

include "game.asm"
include "microcodes.asm"
