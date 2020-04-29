// CPU enabled instructions
arch n64.cpu

// CPU byte read/write mode
endian msb

// ROM file
output "../build/cubeworld.n64", create

// ROM size
fill 1052672

origin $00000000

// ROM base address in RDRAM
base $80000000

// Libs
include "../lib/N64.INC"
include "../lib/N64_GFX.INC"

// Header
include "header.asm"

// Boot code
insert "../lib/N64_BOOTCODE.BIN"

// Source
include "constants.asm"
include "init.asm"
include "update.asm"

// Resources
include "resources.asm"
