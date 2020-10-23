// Y coords base address
ori a1,r0,Microcode_RSP_2DVT2RT_Data_SortedYCoords

// YL
lh t2,0(a1)
sll t2,t2,2
or t0,t0,t2

// YM
lh t2,2(a1)
sll t2,t2,18
or t1,t1,t2

// YH
lh t2,4(a1)
sll t2,t2,2
or t1,t1,t2