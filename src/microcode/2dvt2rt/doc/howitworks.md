How it works
============

The microcode works in this order:

1. Load triangle 6 vertex coordinates
2. Load triangle 3 vertex colors
3. Load fill color of triangle
4. Sort triangle vertex coordinates
5. Compute poly winding
6. Compute edge coefficients
7. Write the triangle command into RDP Buffer
8. Compute shading coefficients
9. Write shading command into RDP Buffer
10. Run the RDP Command in RDP Buffer

Load triangle 6 vertex coordinates
----------------------------------

The subroutine loads 6 RSP vector registers with the unsigned 16-bit triangle vertex coordinates using `lsv` (load short vector) instructions:

### Assembly code

```asm
// X coordinates
lsv v0[e0],Microcode_RSP_2DVT2RT_Data_2DTriangleCoords_XCoords0(0)
lsv v1[e0],Microcode_RSP_2DVT2RT_Data_2DTriangleCoords_XCoords1(0)
lsv v2[e0],Microcode_RSP_2DVT2RT_Data_2DTriangleCoords_XCoords2(0)

// Y coordinates
lsv v3[e0],Microcode_RSP_2DVT2RT_Data_2DTriangleCoords_YCoords0(0)
lsv v4[e0],Microcode_RSP_2DVT2RT_Data_2DTriangleCoords_YCoords1(0)
lsv v5[e0],Microcode_RSP_2DVT2RT_Data_2DTriangleCoords_YCoords2(0)
```

### DMEM mapping for vertex coordinates

| Data           | Size | Address | Loaded vector |
| -------------- | ---- | ------- | ------------- |
| x0             | 16   | 0x0000  | v0            |
| x1             | 16   | 0x0002  | v1            |
| x2             | 16   | 0x0004  | v2            |
| y0             | 16   | 0x0006  | v3            |
| y1             | 16   | 0x0008  | v4            |
| y2             | 16   | 0x000A  | v5            |

Vector registers are then used for the sorting subroutine

Load triangle 3 vertex colors
-----------------------------

This subroutine loads 3 RSP vector registers with the packed 32-bit colors for each vertex using `lbv` (load byte vector) instructions

### Assembly code

```asm
lbv v13[e1],Microcode_RSP_2DVT2RT_Data_2DTriangleColors_0(0)
lbv v13[e3],Microcode_RSP_2DVT2RT_Data_2DTriangleColors_0+1(0)
lbv v13[e5],Microcode_RSP_2DVT2RT_Data_2DTriangleColors_0+2(0)
lbv v13[e7],Microcode_RSP_2DVT2RT_Data_2DTriangleColors_0+3(0)

lbv v14[e1],Microcode_RSP_2DVT2RT_Data_2DTriangleColors_1(0)
lbv v14[e3],Microcode_RSP_2DVT2RT_Data_2DTriangleColors_1+1(0)
lbv v14[e5],Microcode_RSP_2DVT2RT_Data_2DTriangleColors_1+2(0)
lbv v14[e7],Microcode_RSP_2DVT2RT_Data_2DTriangleColors_1+3(0)

lbv v15[e1],Microcode_RSP_2DVT2RT_Data_2DTriangleColors_2(0)
lbv v15[e3],Microcode_RSP_2DVT2RT_Data_2DTriangleColors_2+1(0)
lbv v15[e5],Microcode_RSP_2DVT2RT_Data_2DTriangleColors_2+2(0)
lbv v15[e7],Microcode_RSP_2DVT2RT_Data_2DTriangleColors_2+3(0)
```

### DMEM mapping for vertex colors

| Data           | Size | Address | Loaded vector |
| -------------- | ---- | ------- | ------------- |
| vertex color 0 | 32   | 0x000E  | v13           |
| vertex color 1 | 32   | 0x0012  | v14           |
| vertex color 2 | 32   | 0x0016  | v15           |

Load fill color of triangle
---------------------------

WIP

Sort triangle vertex coordinates
--------------------------------

WIP

Compute poly winding
--------------------

This subroutine makes various math operations in order to have a value determining the winding of the triangle (or polygon).

The formula is: `winding = (x0 * y1 - x1 * y0) + (x1 * y2 - x2 * y1) + (x2 * y0 - x0 * y2)`

If the result is <= 0, the direction of the triangle is **left**, otherwise, it's **right**. Result is then stored in `t1` RSP scalar register.

Vector registers v6, v7, v8, v9, v10, v11 and v12 are used as temporary registers to make the computation.

### Input data

- `v0`: xL coord
- `v1`: xH coord
- `v2`: xM coord
- `v3`: yL coord
- `v4`: yH coord
- `v5`: yM coord

### Output data

- `t1`: 0 (left) or 1 (right)

### Assembly code

```asm
Microcode_RSP_2DVT2RT_PolyWinding:
    
    // (x0 * y1 - x1 * y0)
    vmudh v6,v0,v4      // v6 = x0 * y1
    vmudh v7,v1,v3      // v7 = x1 * y0
    vsub v8,v6,v7       // v8 = v6 - v7

    // (x1 * y2 - x2 * y1)
    vmudh v6,v1,v5      // v6 = x1 * y2
    vmudh v7,v2,v4      // v7 = x2 * y1
    vsub v9,v6,v7       // v9 = v6 - v7

    // (x2 * y0 - x0 * y2)
    vmudh v6,v2,v3      // v6 = x2 * y0
    vmudh v7,v0,v5      // v7 = x0 * y2
    vsub v10,v6,v7      // v10 = v6 - v7

    // (x0 * y1 - x1 * y0) + (x1 * y2 - x2 * y1)
    vadd v11,v8,v9      // v11 = v8 + v9

    // (x0 * y1 - x1 * y0) + (x1 * y2 - x2 * y1) + (x2 * y0 - x0 * y2)
    vadd v12,v10,v11    // v12 = v10 + v11

    // Move from COP2: v12 to t0
    mfc2 t0,v12[e0]

    // if (x0 * y1 - x1 * y0) + (x1 * y2 - x2 * y1) + (x2 * y0 - x0 * y2) <= 0 then
    blez t0,Microcode_RSP_2DVT2RT_PolyWinding_End
    ori t1,r0,0         // dir = left (delay slot = executed even if branching)
    ori t1,r0,1         // else dir = right

Microcode_RSP_2DVT2RT_PolyWinding_End:
```

Compute edge coefficients
-------------------------

WIP

Write the triangle command into RDP Buffer
------------------------------------------

WIP

Compute shading coefficients
----------------------------

WIP

Write shading command into RDP Buffer
-------------------------------------

WIP

Run the RDP Command in RDP Buffer
---------------------------------

WIP
