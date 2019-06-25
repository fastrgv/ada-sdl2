# ada-sdl2

Thin Ada binding to SDL2 v208/v209

This is a thin Ada binding to the popular C library SDL2 version 2.0.9.

To use the binding you will need a recent Ada compiler.

Note that this binding does NOT include

.) SDL2-image,

.) SDL2-ttf,

.) SDL2-mixer.

but IS, or will be, used in my apps "AdaGate" and "AdaVenture".


#Details:

autogenerated with "acgen.sh" using AdaCore2019 with a few changes made by hand:

.) replaced unsigned with cint (interfaces.c.int)
	in several places to minimize my game code changes;
	e.g. sdl_video_h.ads:  profile/context flags.
	
.) changed type of hint constants for ease of use;
	see sdl_hints_h.ads
	
.) renamed sdl_scancode_h.ads to sdl_scancode_inc.ads
	due to name clash;
	
.) removed several *.ads files that seemed unused.

.) added keycode constants to sdl_keycode_h.ads

*) modified button constants in sdl_mouse_h.ads

June 2019

Copyright (C) 2019 fastrgv@gmail.com

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You may read the full text of the GNU General Public License at http://www.gnu.org/licenses/.
