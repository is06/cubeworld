// Headers
db $80, $37, $12, $40

// CPU clock rate
dw $0000000F

// Vectors
dw Main
dw $1444

// Checksums
db "CRC1"
db "CRC2"

// Filler
dd 0

// Game title
db "Cube world          "
//  --------------------

// Filler
dw 0

// Dev id
db "is06"

// Cart id
db "CW"

// Country code
db "E"

// Filler
db $0
