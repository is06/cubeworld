ldv v0[e0],Microcode_RSP_2DVT2RT_Data_2DTriangleCoords(0)
ldv v1[e0],Microcode_RSP_2DVT2RT_Data_2DTriangleCoords+8(0)
ldv v2[e0],Microcode_RSP_2DVT2RT_Data_2DTriangleCoords+16(0)

vlt v3,v0,v1
vge v0,v0,v1
vlt v4,v0,v2
vge v0,v0,v2
vlt v2,v3,v4
vge v1,v3,v4
