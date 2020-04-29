// ROM format
db $80
db $37
db $12
db $40

// Init clock rate
dw $0000000f

// Code address
dw Main_Init

// Release address
dw $1444

// Integrity control
db "CRC1"
db "CRC2"

// Filler
dd 0

// Game title
db "Cube World                 "
//  ---------------------------

// Other header data
db $00 // Dev id
db $00 // Cart id
db $00
db $00
db $00
