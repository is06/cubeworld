// Compute lft parameter


// (X0*Y1 - X1*Y0) + (X1*Y2 - X2*Y1) + (X2*Y0 - X0*Y2)

li t2,1
sll t2,t2,23
or t0,t0,t2
    