pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with SDL_stdinc_h;
with System;
with stddef_h;
with Interfaces.C.Strings;

package SDL_rwops_h is

   SDL_RWOPS_UNKNOWN : constant := 0;  --  ../inc209/SDL_rwops.h:42
   SDL_RWOPS_WINFILE : constant := 1;  --  ../inc209/SDL_rwops.h:43
   SDL_RWOPS_STDFILE : constant := 2;  --  ../inc209/SDL_rwops.h:44
   SDL_RWOPS_JNIFILE : constant := 3;  --  ../inc209/SDL_rwops.h:45
   SDL_RWOPS_MEMORY : constant := 4;  --  ../inc209/SDL_rwops.h:46
   SDL_RWOPS_MEMORY_RO : constant := 5;  --  ../inc209/SDL_rwops.h:47

   RW_SEEK_SET : constant := 0;  --  ../inc209/SDL_rwops.h:174
   RW_SEEK_CUR : constant := 1;  --  ../inc209/SDL_rwops.h:175
   RW_SEEK_END : constant := 2;  --  ../inc209/SDL_rwops.h:176
   --  arg-macro: function SDL_RWsize (ctx)
   --    return ctx).size(ctx;
   --  arg-macro: function SDL_RWseek (ctx, offset, whence)
   --    return ctx).seek(ctx, offset, whence;
   --  arg-macro: function SDL_RWtell (ctx)
   --    return ctx).seek(ctx, 0, RW_SEEK_CUR;
   --  arg-macro: function SDL_RWread (ctx, ptr, size, n)
   --    return ctx).read(ctx, ptr, size, n;
   --  arg-macro: function SDL_RWwrite (ctx, ptr, size, n)
   --    return ctx).write(ctx, ptr, size, n;
   --  arg-macro: function SDL_RWclose (ctx)
   --    return ctx).close(ctx;
   --  arg-macro: procedure SDL_LoadFile (file, datasize)
   --    SDL_LoadFile_RW(SDL_RWFromFile(file, "rb"), datasize, 1)

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
  -- *  \file SDL_rwops.h
  -- *
  -- *  This file provides a general interface for SDL to read and write
  -- *  data streams.  It can easily be extended to files, memory, etc.
  --  

  -- Set up for C function definitions, even when using C++  
  -- RWops Types  
  --*
  -- * This is the read/write operation structure -- very basic.
  --  

  --*
  --     *  Return the size of the file in this rwops, or -1 if unknown
  --      

   type anon_10 is record
      base : access SDL_stdinc_h.Uint8;  -- ../inc209/SDL_rwops.h:132
      here : access SDL_stdinc_h.Uint8;  -- ../inc209/SDL_rwops.h:133
      stop : access SDL_stdinc_h.Uint8;  -- ../inc209/SDL_rwops.h:134
   end record
   with Convention => C_Pass_By_Copy;
   type anon_11 is record
      data1 : System.Address;  -- ../inc209/SDL_rwops.h:138
      data2 : System.Address;  -- ../inc209/SDL_rwops.h:139
   end record
   with Convention => C_Pass_By_Copy;
   type anon_9 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            mem : aliased anon_10;  -- ../inc209/SDL_rwops.h:135
         when others =>
            unknown : aliased anon_11;  -- ../inc209/SDL_rwops.h:140
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;
   type SDL_RWops;
   type SDL_RWops is record
      size : access function (arg1 : access SDL_RWops) return SDL_stdinc_h.Sint64;  -- ../inc209/SDL_rwops.h:57
      seek : access function
           (arg1 : access SDL_RWops;
            arg2 : SDL_stdinc_h.Sint64;
            arg3 : int) return SDL_stdinc_h.Sint64;  -- ../inc209/SDL_rwops.h:66
      read : access function
           (arg1 : access SDL_RWops;
            arg2 : System.Address;
            arg3 : stddef_h.size_t;
            arg4 : stddef_h.size_t) return stddef_h.size_t;  -- ../inc209/SDL_rwops.h:75
      write : access function
           (arg1 : access SDL_RWops;
            arg2 : System.Address;
            arg3 : stddef_h.size_t;
            arg4 : stddef_h.size_t) return stddef_h.size_t;  -- ../inc209/SDL_rwops.h:84
      close : access function (arg1 : access SDL_RWops) return int;  -- ../inc209/SDL_rwops.h:91
      c_type : aliased SDL_stdinc_h.Uint32;  -- ../inc209/SDL_rwops.h:93
      hidden : aliased anon_9;  -- ../inc209/SDL_rwops.h:141
   end record
   with Convention => C_Pass_By_Copy;  -- ../inc209/SDL_rwops.h:52

  --*
  --     *  Seek to \c offset relative to \c whence, one of stdio's whence values:
  --     *  RW_SEEK_SET, RW_SEEK_CUR, RW_SEEK_END
  --     *
  --     *  \return the final offset in the data stream, or -1 on error.
  --      

  --*
  --     *  Read up to \c maxnum objects each of size \c size from the data
  --     *  stream to the area pointed at by \c ptr.
  --     *
  --     *  \return the number of objects read, or 0 at error or end of file.
  --      

  --*
  --     *  Write exactly \c num objects each of size \c size from the area
  --     *  pointed at by \c ptr to data stream.
  --     *
  --     *  \return the number of objects written, or 0 at error or end of file.
  --      

  --*
  --     *  Close and free an allocated SDL_RWops structure.
  --     *
  --     *  \return 0 if successful or -1 on write error when flushing data.
  --      

  --*
  -- *  \name RWFrom functions
  -- *
  -- *  Functions to create SDL_RWops structures from various data streams.
  --  

  -- @{  
   function SDL_RWFromFile (file : Interfaces.C.Strings.chars_ptr; mode : Interfaces.C.Strings.chars_ptr) return access SDL_RWops  -- ../inc209/SDL_rwops.h:153
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RWFromFile";

   function SDL_RWFromFP (fp : System.Address; autoclose : SDL_stdinc_h.SDL_bool) return access SDL_RWops  -- ../inc209/SDL_rwops.h:160
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RWFromFP";

   function SDL_RWFromMem (mem : System.Address; size : int) return access SDL_RWops  -- ../inc209/SDL_rwops.h:164
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RWFromMem";

   function SDL_RWFromConstMem (mem : System.Address; size : int) return access SDL_RWops  -- ../inc209/SDL_rwops.h:165
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RWFromConstMem";

  -- @}  
  -- RWFrom functions  
   function SDL_AllocRW return access SDL_RWops  -- ../inc209/SDL_rwops.h:171
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_AllocRW";

   procedure SDL_FreeRW (area : access SDL_RWops)  -- ../inc209/SDL_rwops.h:172
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_FreeRW";

  --*
  -- *  \name Read/write macros
  -- *
  -- *  Macros to easily read and write from an SDL_RWops structure.
  --  

  -- @{  
  -- @}  
  -- Read/write macros  
  --*
  -- *  Load all the data from an SDL data stream.
  -- *
  -- *  The data is allocated with a zero byte at the end (null terminated)
  -- *
  -- *  If \c datasize is not NULL, it is filled with the size of the data read.
  -- *
  -- *  If \c freesrc is non-zero, the stream will be closed after being read.
  -- *
  -- *  The data should be freed with SDL_free().
  -- *
  -- *  \return the data, or NULL if there was an error.
  --  

   function SDL_LoadFile_RW
     (src : access SDL_RWops;
      datasize : access stddef_h.size_t;
      freesrc : int) return System.Address  -- ../inc209/SDL_rwops.h:206
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LoadFile_RW";

  --*
  -- *  Load an entire file.
  -- *
  -- *  Convenience macro.
  --  

  --*
  -- *  \name Read endian functions
  -- *
  -- *  Read an item of the specified endianness and return in native format.
  --  

  -- @{  
   function SDL_ReadU8 (src : access SDL_RWops) return SDL_stdinc_h.Uint8  -- ../inc209/SDL_rwops.h:222
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ReadU8";

   function SDL_ReadLE16 (src : access SDL_RWops) return SDL_stdinc_h.Uint16  -- ../inc209/SDL_rwops.h:223
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ReadLE16";

   function SDL_ReadBE16 (src : access SDL_RWops) return SDL_stdinc_h.Uint16  -- ../inc209/SDL_rwops.h:224
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ReadBE16";

   function SDL_ReadLE32 (src : access SDL_RWops) return SDL_stdinc_h.Uint32  -- ../inc209/SDL_rwops.h:225
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ReadLE32";

   function SDL_ReadBE32 (src : access SDL_RWops) return SDL_stdinc_h.Uint32  -- ../inc209/SDL_rwops.h:226
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ReadBE32";

   function SDL_ReadLE64 (src : access SDL_RWops) return SDL_stdinc_h.Uint64  -- ../inc209/SDL_rwops.h:227
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ReadLE64";

   function SDL_ReadBE64 (src : access SDL_RWops) return SDL_stdinc_h.Uint64  -- ../inc209/SDL_rwops.h:228
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ReadBE64";

  -- @}  
  -- Read endian functions  
  --*
  -- *  \name Write endian functions
  -- *
  -- *  Write an item of native format to the specified endianness.
  --  

  -- @{  
   function SDL_WriteU8 (dst : access SDL_RWops; value : SDL_stdinc_h.Uint8) return stddef_h.size_t  -- ../inc209/SDL_rwops.h:237
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_WriteU8";

   function SDL_WriteLE16 (dst : access SDL_RWops; value : SDL_stdinc_h.Uint16) return stddef_h.size_t  -- ../inc209/SDL_rwops.h:238
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_WriteLE16";

   function SDL_WriteBE16 (dst : access SDL_RWops; value : SDL_stdinc_h.Uint16) return stddef_h.size_t  -- ../inc209/SDL_rwops.h:239
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_WriteBE16";

   function SDL_WriteLE32 (dst : access SDL_RWops; value : SDL_stdinc_h.Uint32) return stddef_h.size_t  -- ../inc209/SDL_rwops.h:240
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_WriteLE32";

   function SDL_WriteBE32 (dst : access SDL_RWops; value : SDL_stdinc_h.Uint32) return stddef_h.size_t  -- ../inc209/SDL_rwops.h:241
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_WriteBE32";

   function SDL_WriteLE64 (dst : access SDL_RWops; value : SDL_stdinc_h.Uint64) return stddef_h.size_t  -- ../inc209/SDL_rwops.h:242
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_WriteLE64";

   function SDL_WriteBE64 (dst : access SDL_RWops; value : SDL_stdinc_h.Uint64) return stddef_h.size_t  -- ../inc209/SDL_rwops.h:243
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_WriteBE64";

  -- @}  
  -- Write endian functions  
  -- Ends C function definitions when using C++  
  -- vi: set ts=4 sw=4 expandtab:  
end SDL_rwops_h;
