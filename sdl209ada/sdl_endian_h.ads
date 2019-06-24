pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with SDL_stdinc_h;

package SDL_endian_h is

   SDL_LIL_ENDIAN : constant := 1234;  --  ../inc209/SDL_endian.h:37
   SDL_BIG_ENDIAN : constant := 4321;  --  ../inc209/SDL_endian.h:38
   --  unsupported macro: SDL_BYTEORDER __BYTE_ORDER
   --  arg-macro: function SDL_SwapLE16 (X)
   --    return X;
   --  arg-macro: function SDL_SwapLE32 (X)
   --    return X;
   --  arg-macro: function SDL_SwapLE64 (X)
   --    return X;
   --  arg-macro: function SDL_SwapFloatLE (X)
   --    return X;
   --  arg-macro: procedure SDL_SwapBE16 (X)
   --    SDL_Swap16(X)
   --  arg-macro: procedure SDL_SwapBE32 (X)
   --    SDL_Swap32(X)
   --  arg-macro: procedure SDL_SwapBE64 (X)
   --    SDL_Swap64(X)
   --  arg-macro: procedure SDL_SwapFloatBE (X)
   --    SDL_SwapFloat(X)

  --  Simple DirectMedia Layer
  --  Copyright (C) 1997-2018 Sam Lantinga <slouken@libsdl.org>
  --  This software is provided 'as-is', without any express or implied
  --  warranty.  In no event will the authors be held liable for any damages
  --  arising from the use of this software.
  --  Permission is granted to anyone to use this software for any purpose,
  --  including commercial applications, and to alter it and redistribute it
  --  freely, subject to the following restrictions:
  --  1. The origin of this software must not be misrepresented; you must not
  --     claim that you wrote the original software. If you use this software
  --     in a product, an acknowledgment in the product documentation would be
  --     appreciated but is not required.
  --  2. Altered source versions must be plainly marked as such, and must not be
  --     misrepresented as being the original software.
  --  3. This notice may not be removed or altered from any source distribution.
  -- 

  --*
  -- *  \file SDL_endian.h
  -- *
  -- *  Functions for reading and writing endian-specific values
  --  

  --*
  -- *  \name The two types of endianness
  --  

  -- @{  
  -- @}  
  -- Set up for C function definitions, even when using C++  
  --*
  -- *  \file SDL_endian.h
  --  

   function SDL_Swap16 (x : SDL_stdinc_h.Uint16) return SDL_stdinc_h.Uint16  -- ../inc209/SDL_endian.h:78
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_Swap16";

   function SDL_Swap32 (x : SDL_stdinc_h.Uint32) return SDL_stdinc_h.Uint32  -- ../inc209/SDL_endian.h:122
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_Swap32";

   function SDL_Swap64 (x : SDL_stdinc_h.Uint64) return SDL_stdinc_h.Uint64  -- ../inc209/SDL_endian.h:189
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_Swap64";

  -- Separate into high and low 32-bit values and swap them  
   function SDL_SwapFloat (x : float) return float  -- ../inc209/SDL_endian.h:213
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SwapFloat";

  --*
  -- *  \name Swap to native
  -- *  Byteswap item from the specified endianness to the native endianness.
  --  

  -- @{  
  -- @}  
  -- Swap to native  
  -- Ends C function definitions when using C++  
  -- vi: set ts=4 sw=4 expandtab:  
end SDL_endian_h;
