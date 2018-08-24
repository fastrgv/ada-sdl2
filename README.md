# ada-sdl2
Thin Ada binding to SDL2 v208

This is a thin Ada binding to the popular C library 
SDL2 version 2.0.8.

To use the binding you will need a recent Ada compiler.

I have tested some parts of the binding with 
AdaCore2017, AdaCore2018, and GnuAda730
on OSX, Windows (32+64), Linux(mint).

Note that this binding does NOT include

.) SDL2-image,

.) SDL2-ttf,

.) SDL2-mixer.


#Details:
=============================================================
autogenerated using "acgen.sh" with a few
changes made by hand:

1) deconflicted C++ variables or type names that were 
	distinguished only by CASE;
2) deconflicted name "FILE" [ reserved word in Ada ]
3) moved some popular declarations into sdl.ads
4) minimally editted specs:
	a) sdl_rwops_h.ads
	b) libio_h.ads
	c) sdl_events_h.ads
5) the contents of sdl_h.ads was moved into sdl.ads
6) stdio_h.ads was omitted, as well as several other generated specs that seemed unused.  And, I believe that new versions of SDL2 are backward compatible, so this binding may be adequate indefinitely.
7) types defined in files x86_64_linux* were replaced by types from interfaces.c.

Note that this binding is used in my apps "AdaGate" and "AdaVenture".

--------------------------------
August 2018





 Copyright (C) 2018  <fastrgv@gmail.com>

 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You may read the full text of the GNU General Public License
 at <http://www.gnu.org/licenses/>.



