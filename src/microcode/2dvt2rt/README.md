2Dvt2rt RSP Microcode
=====================

This microcode use 2D vertex triangle data and prepare RDP instructions to draw it on the screen.

It supports only filled triangles, no shading, no textures.

Flow
----

- Sorting Y coords (Highest first)
- Write RDP Fill_Triangle instruction in the RDP Buffer located in RSP DMEM
