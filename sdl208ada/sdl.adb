--
-- Copyright (C) 2018  <fastrgv@gmail.com>
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You may read the full text of the GNU General Public License
-- at <http://www.gnu.org/licenses/>.
--

-- This partial binding to SDL v2.0.7 is a
-- modified and updated version of
-- Dan Vasquez' thin binding to sdl v2.0.3.
-- fastrgv November 2017


with Interfaces;

package body SDL is

   ----------------------------------------------------------------------------
   -- SDL_version.h
   ----------------------------------------------------------------------------

   procedure SDL_SOURCEVERSION (x : access SDL_version) is
   begin
      x.major := SDL_MAJOR_VERSION;
      x.minor := SDL_MINOR_VERSION;
      x.patch := SDL_PATCHLEVEL;
   end SDL_SOURCEVERSION;

   function SDL_VERSIONNUM (X, Y, Z : Uint8) return C.int is
   begin
      return C.int (X) * 1000 + C.int (Y) * 100 + C.int (Z);
   end SDL_VERSIONNUM;

   function SDL_COMPILEDVERSION return C.int is
   begin
      return SDL_VERSIONNUM
          (SDL_MAJOR_VERSION,
           SDL_MINOR_VERSION,
           SDL_PATCHLEVEL);
   end SDL_COMPILEDVERSION;

   function SDL_VERSION_ATLEAST (X, Y, Z : Uint8) return SDL_bool is
   begin
      if SDL_COMPILEDVERSION >= SDL_VERSIONNUM (X, Y, Z) then
         return SDL_TRUE;
      else
         return SDL_FALSE;
      end if;
   end SDL_VERSION_ATLEAST;

   ----------------------------------------------------------------------------
   -- SDL_timer.h
   ----------------------------------------------------------------------------

   function SDL_TICKS_PASSED (A, B : Uint32) return SDL_bool is
   begin
      if (Sint32 (B) - Sint32 (A)) <= 0 then
         return SDL_TRUE;
      else
         return SDL_FALSE;
      end if;
   end SDL_TICKS_PASSED;

   ----------------------------------------------------------------------------
   -- SDL_rwops.h
   ----------------------------------------------------------------------------

   function SDL_RWsize (ctx : access SDL_RWops) return Sint64 is
   begin
      return ctx.size (ctx);
   end SDL_RWsize;

   function SDL_RWseek
     (ctx    : access SDL_RWops;
      offset : Sint64;
      whence : C.int) return Sint64
   is
   begin
      return ctx.seek (ctx, offset, whence);
   end SDL_RWseek;

   function SDL_RWtell (ctx : access SDL_RWops) return Sint64 is
   begin
      return ctx.seek (ctx, 0, RW_SEEK_CUR);
   end SDL_RWtell;

   function SDL_RWread
     (ctx  : access SDL_RWops;
      ptr  : System.Address;
      size : C.size_t;
      n    : C.size_t) return C.size_t
   is
   begin
      return ctx.read (ctx, ptr, size, n);
   end SDL_RWread;

   function SDL_RWwrite
     (ctx  : access SDL_RWops;
      ptr  : System.Address;
      size : C.size_t;
      n    : C.size_t) return C.size_t
   is
   begin
      return ctx.write (ctx, ptr, size, n);
   end SDL_RWwrite;

   function SDL_RWclose (ctx : access SDL_RWops) return C.int is
   begin
      return ctx.close (ctx);
   end SDL_RWclose;

   ----------------------------------------------------------------------------
   -- SDL_surface.h
   ----------------------------------------------------------------------------

   function SDL_MUSTLOCK (S : access SDL_Surface) return SDL_bool is
   begin
      if ((S.flags and SDL_RLEACCEL) /= 0) then
         return SDL_TRUE;
      else
         return SDL_FALSE;
      end if;
   end SDL_MUSTLOCK;

   --function SDL_LoadBMP (file : C.char_array) return access SDL_Surface is
   --begin
     -- return SDL_LoadBMP_RW (SDL_RWFromFile (file, C.To_C ("rb")), 1);
   --end SDL_LoadBMP;

   --function SDL_SaveBMP
     --(surface : access SDL_Surface;
      --file    : C.char_array) return C.int
   --is
   --begin
   --   return SDL_SaveBMP_RW (surface, SDL_RWFromFile (file, C.To_C ("wb")), 1);
   --end SDL_SaveBMP;

   ----------------------------------------------------------------------------
   -- SDL_video.h
   ----------------------------------------------------------------------------

   function SDL_WINDOWPOS_UNDEFINED_DISPLAY (X : C.int) return C.int is
   begin
      return C.int (Uint32 (SDL_WINDOWPOS_UNDEFINED_MASK) or Uint32 (X));
   end SDL_WINDOWPOS_UNDEFINED_DISPLAY;

   function SDL_WINDOWPOS_UNDEFINED return C.int is
   begin
      return SDL_WINDOWPOS_UNDEFINED_DISPLAY (0);
   end SDL_WINDOWPOS_UNDEFINED;

   function SDL_WINDOWPOS_ISUNDEFINED (X : C.int) return SDL_bool is
   begin
      if ((Uint32 (X) and 16#FFFF0000#) = SDL_WINDOWPOS_UNDEFINED_MASK) then
         return SDL_TRUE;
      else
         return SDL_FALSE;
      end if;
   end SDL_WINDOWPOS_ISUNDEFINED;

   function SDL_WINDOWPOS_CENTERED_DISPLAY (X : C.int) return C.int is
   begin
      return C.int (Uint32 (SDL_WINDOWPOS_CENTERED_MASK) or Uint32 (X));
   end SDL_WINDOWPOS_CENTERED_DISPLAY;

   function SDL_WINDOWPOS_CENTERED return C.int is
   begin
      return SDL_WINDOWPOS_CENTERED_DISPLAY (0);
   end SDL_WINDOWPOS_CENTERED;

   function SDL_WINDOWPOS_ISCENTERED (X : C.int) return SDL_bool is
   begin
      if ((Uint32 (X) and 16#FFFF0000#) = SDL_WINDOWPOS_CENTERED_MASK) then
         return SDL_TRUE;
      else
         return SDL_FALSE;
      end if;
   end SDL_WINDOWPOS_ISCENTERED;

   ----------------------------------------------------------------------------
   -- SDL_keycode.h
   ----------------------------------------------------------------------------

   function SDL_SCANCODE_TO_KEYCODE (X : SDL_Scancode) return SDL_Keycode is
   begin
      return SDL_Keycode (Uint32 (X) or SDLK_SCANCODE_MASK);
   end SDL_SCANCODE_TO_KEYCODE;

   ----------------------------------------------------------------------------
   -- SDL_events.h
   ----------------------------------------------------------------------------

   function SDL_GetEventState (typ : Uint32) return Uint8 is
   begin
      return SDL_EventState (typ, SDL_QUERY);
   end SDL_GetEventState;


   ----------------------------------------------------------------------------
   -- SDL_pixels.h
   ----------------------------------------------------------------------------

   function ShiftRight (Value : Uint32; Amount : Natural) return Uint32 is
   begin
      return Uint32
          (Interfaces.Shift_Right (Interfaces.Unsigned_32 (Value), Amount));
   end ShiftRight;

   function ShiftLeft (Value : Uint32; Amount : Natural) return Uint32 is
   begin
      return Uint32
          (Interfaces.Shift_Left (Interfaces.Unsigned_32 (Value), Amount));
   end ShiftLeft;

   ----------------------------------------------------------------------------
   -- SDL_mouse.h
   ----------------------------------------------------------------------------

   function SDL_BUTTON (X : C.int) return C.int is
   begin
      return C.int (ShiftLeft (1, Natural ((X - 1))));
   end SDL_BUTTON;


end SDL;
