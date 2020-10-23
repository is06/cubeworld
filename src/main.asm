arch n64.cpu
endian msb
output "../build/cubeworld.n64", create
fill 1052672
origin $00000000
base $80000000

include "../../n64lib/N64.INC"
include "../../n64lib/N64_GFX.INC"
include "../../n64lib/N64_RDP.INC"
include "../../n64lib/N64_RSP.INC"
include "header.asm"
insert "../../n64lib/N64_BOOTCODE.BIN"

Main:
    System_Init()

include "game.asm"
include "microcodes.asm"
