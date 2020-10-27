Cube World for Nintendo 64
==========================

This is an experimental game to test my skills of Nintendo 64 developer!
This is a MIPS assembly coded game, so it's pretty optimized and hard to read/write/maintain, but it's fun!

Do you want to build it on your PC anyway? Ok, follow this:

Tools
-----

- [Bass](https://github.com/ARM9/bass): assembler program
- [libdragon](https://github.com/DragonMinded/libdragon): contains chksum64 tool required for CRC computation
- [MAME](https://github.com/mamedev/mame): cycle-accurate emulator
- [cen64](https://github.com/n64dev/cen64): another wonderful cycle-accurate emulator but no debugger included yet

Assemble the game
-----------------

```bash
bass src/main -strict -benchmark
chksum64 build/cubeworld.n64
```

Run the game
------------

Actually you can run the game with any emulator (like Project64 for example).
MAME is just the emulator which with I make the game.

```bash
mame64 n64 -window -cart build/cubeworld.n64 -switchres -nofilter
```

Maybe you'll have to adapt the paths in this command...

Debug the game
--------------

With MAME, the same with extra parameters:

```bash
mame64 n64 -debug -log -verbose -window -cart build/cubeworld.n64 -switchres -nofilter
```

You can set a breakpoint to address $80001000 where the game code starts.
