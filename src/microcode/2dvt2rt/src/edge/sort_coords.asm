// Sort Of Parallel X Elements Within 3 Vectors (Uses Vector Merge To Sort Y Elements Within 3 Vectors)
// ------------------------------------------------------------

    vge v6,v0,v1[e0] // VGE TMP1,  MIN, MID
    vmrg v8,v3,v4[e0]

    vlt v10,v0,v1[e0] // VLT  MIN,  MIN, MID
    vmrg v3,v3,v4[e0]

    vge v7,v10,v2[e0] // VGE TMP2,  MIN, MAX
    vmrg v9,v3,v5[e0]

    vlt v10,v10,v2[e0] // VLT  MIN,  MIN, MAX
    vmrg v3,v3,v5[e0]

    vge v2,v6,v7[e0] // VGE  MAX, TMP1, TMP2
    vmrg v5,v8,v9[e0]

    vlt v11,v6,v7[e0] // VLT  MID, TMP1, TMP2
    vmrg v4,v8,v9[e0]

// Sort Of Parallel Y Elements Within 3 Vectors (Uses Vector Merge To Sort X Elements Within 3 Vectors)
// ------------------------------------------------------------

    vge v6,v3,v4[e0] // VGE TMP1,  MIN, MID
    vmrg v8,v10,v11[e0]

    vlt v3,v3,v4[e0] // VLT  MIN,  MIN, MID
    vmrg v10,v10,v11[e0]

    vge v7,v3,v5[e0] // VGE TMP2,  MIN, MAX
    vmrg v9,v10,v2[e0]

    vlt v3,v3,v5[e0] // VLT  MIN,  MIN, MAX
    vmrg v10,v10,v2[e0]

    vge v5,v6,v7[e0] // VGE  MAX, TMP1, TMP2
    vmrg v2,v8,v9[e0]

    vlt v4,v6,v7[e0] // VLT  MID, TMP1, TMP2
    vmrg v11,v8,v9[e0]

// IF Coordinate 0 & 1 Share Same Y: Sort By X Coordinates (Lowest To Highest)
// ------------------------------------------------------------

    vlt v6,v3,v4[e0] // VLT TMP1, MIN, MID
    vmrg v0,v10,v11[e0]

    vge v6,v3,v4[e0] // VGE TMP1, MIN, MID
    vmrg v1,v10,v11[e0]