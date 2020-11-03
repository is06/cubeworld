Microcode_RSP_2DVT2RT_PolyWinding:
    
    vmudh v6,v0,v4      // v6 = x0 * y1
    vmudh v7,v1,v3      // v7 = x1 * y0
    vsub v8,v6,v7       // v8 = v6 - v7 = (x0 * y1 - x1 * y0)

    vmudh v6,v1,v5      // v6 = x1 * y2
    vmudh v7,v2,v4      // v7 = x2 * y1
    vsub v9,v6,v7       // v9 = v6 - v7 = (x1 * y2 - x2 * y1)

    vmudh v6,v2,v3      // v6 = x2 * y0
    vmudh v7,v0,v5      // v7 = x0 * y2
    vsub v10,v6,v7      // v10 = v6 - v7 = (x2 * y0 - x0 * y2)

    vadd v11,v8,v9      // v11 = v8 + v9 = (x0 * y1 - x1 * y0) + (x1 * y2 - x2 * y1)
    vadd v12,v10,v11    // v12 = v10 + v11 = (x0 * y1 - x1 * y0) + (x1 * y2 - x2 * y1) + (x2 * y0 - x0 * y2)

    mfc2 t0,v12[e0]

    // if (x0 * y1 - x1 * y0) + (x1 * y2 - x2 * y1) + (x2 * y0 - x0 * y2) <= 0 then
    blez t0,Microcode_RSP_2DVT2RT_PolyWinding_End
    ori t1,r0,0         // dir = left (delay slot = executed even if branching)
    ori t1,r0,1         // else dir = right

Microcode_RSP_2DVT2RT_PolyWinding_End: