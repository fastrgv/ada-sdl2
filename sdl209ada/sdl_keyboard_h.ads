pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with sdl_scancode_inc;
with SDL_keycode_h;
with SDL_stdinc_h;
limited with SDL_video_h;
with Interfaces.C.Strings;
limited with SDL_rect_h;

package SDL_keyboard_h is

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
  -- *  \file SDL_keyboard.h
  -- *
  -- *  Include file for SDL keyboard event handling
  --  

  -- Set up for C function definitions, even when using C++  
  --*
  -- *  \brief The SDL keysym structure, used in key events.
  -- *
  -- *  \note  If you are looking for translated character input, see the ::SDL_TEXTINPUT event.
  --  

  --*< SDL physical key code - see ::SDL_Scancode for details  
   type SDL_Keysym is record
      scancode : aliased sdl_scancode_inc.SDL_Scancode;  -- ../inc209/SDL_keyboard.h:49
      sym : aliased SDL_keycode_h.SDL_Keycode;  -- ../inc209/SDL_keyboard.h:50
      c_mod : aliased SDL_stdinc_h.Uint16;  -- ../inc209/SDL_keyboard.h:51
      unused : aliased SDL_stdinc_h.Uint32;  -- ../inc209/SDL_keyboard.h:52
   end record
   with Convention => C_Pass_By_Copy;  -- ../inc209/SDL_keyboard.h:47

  --*< SDL virtual key code - see ::SDL_Keycode for details  
  --*< current key modifiers  
  -- Function prototypes  
  --*
  -- *  \brief Get the window which currently has keyboard focus.
  --  

   function SDL_GetKeyboardFocus return access SDL_video_h.SDL_Window  -- ../inc209/SDL_keyboard.h:60
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetKeyboardFocus";

  --*
  -- *  \brief Get a snapshot of the current state of the keyboard.
  -- *
  -- *  \param numkeys if non-NULL, receives the length of the returned array.
  -- *
  -- *  \return An array of key states. Indexes into this array are obtained by using ::SDL_Scancode values.
  -- *
  -- *  \b Example:
  -- *  \code
  -- *  const Uint8 *state = SDL_GetKeyboardState(NULL);
  -- *  if ( state[SDL_SCANCODE_RETURN] )   {
  -- *      printf("<RETURN> is pressed.\n");
  -- *  }
  -- *  \endcode
  --  

--fastrgv:
	--subtype keyrange is interfaces.c.int range 0..511; 
	-- SDL_NUM_SCANCODES=512, numkeys=512
	subtype keyrange is sdl_stdinc_h.Uint32 range 0..511; -- rgv
	type keyarraytype is array(keyrange) of sdl_stdinc_h.Uint8;
   function SDL_GetKeyboardState (numkeys : access interfaces.C.int) return access keyarraytype
   --pragma Import (C, SDL_GetKeyboardState, "SDL_GetKeyboardState");
   --function SDL_GetKeyboardState (numkeys : access int) return access SDL_stdinc_h.Uint8  -- ../inc209/SDL_keyboard.h:77
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetKeyboardState";

  --*
  -- *  \brief Get the current key modifier state for the keyboard.
  --  

   function SDL_GetModState return SDL_keycode_h.SDL_Keymod  -- ../inc209/SDL_keyboard.h:82
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetModState";

  --*
  -- *  \brief Set the current key modifier state for the keyboard.
  -- *
  -- *  \note This does not change the keyboard state, only the key modifier flags.
  --  

   procedure SDL_SetModState (modstate : SDL_keycode_h.SDL_Keymod)  -- ../inc209/SDL_keyboard.h:89
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetModState";

  --*
  -- *  \brief Get the key code corresponding to the given scancode according
  -- *         to the current keyboard layout.
  -- *
  -- *  See ::SDL_Keycode for details.
  -- *
  -- *  \sa SDL_GetKeyName()
  --  

   function SDL_GetKeyFromScancode (scancode : sdl_scancode_inc.SDL_Scancode) return SDL_keycode_h.SDL_Keycode  -- ../inc209/SDL_keyboard.h:99
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetKeyFromScancode";

  --*
  -- *  \brief Get the scancode corresponding to the given key code according to the
  -- *         current keyboard layout.
  -- *
  -- *  See ::SDL_Scancode for details.
  -- *
  -- *  \sa SDL_GetScancodeName()
  --  

   function SDL_GetScancodeFromKey (key : SDL_keycode_h.SDL_Keycode) return sdl_scancode_inc.SDL_Scancode  -- ../inc209/SDL_keyboard.h:109
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetScancodeFromKey";

  --*
  -- *  \brief Get a human-readable name for a scancode.
  -- *
  -- *  \return A pointer to the name for the scancode.
  -- *          If the scancode doesn't have a name, this function returns
  -- *          an empty string ("").
  -- *
  -- *  \sa SDL_Scancode
  --  

   function SDL_GetScancodeName (scancode : sdl_scancode_inc.SDL_Scancode) return Interfaces.C.Strings.chars_ptr  -- ../inc209/SDL_keyboard.h:120
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetScancodeName";

  --*
  -- *  \brief Get a scancode from a human-readable name
  -- *
  -- *  \return scancode, or SDL_SCANCODE_UNKNOWN if the name wasn't recognized
  -- *
  -- *  \sa SDL_Scancode
  --  

   function SDL_GetScancodeFromName (name : Interfaces.C.Strings.chars_ptr) return sdl_scancode_inc.SDL_Scancode  -- ../inc209/SDL_keyboard.h:129
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetScancodeFromName";

  --*
  -- *  \brief Get a human-readable name for a key.
  -- *
  -- *  \return A pointer to a UTF-8 string that stays valid at least until the next
  -- *          call to this function. If you need it around any longer, you must
  -- *          copy it.  If the key doesn't have a name, this function returns an
  -- *          empty string ("").
  -- *
  -- *  \sa SDL_Keycode
  --  

   function SDL_GetKeyName (key : SDL_keycode_h.SDL_Keycode) return Interfaces.C.Strings.chars_ptr  -- ../inc209/SDL_keyboard.h:141
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetKeyName";

  --*
  -- *  \brief Get a key code from a human-readable name
  -- *
  -- *  \return key code, or SDLK_UNKNOWN if the name wasn't recognized
  -- *
  -- *  \sa SDL_Keycode
  --  

   function SDL_GetKeyFromName (name : Interfaces.C.Strings.chars_ptr) return SDL_keycode_h.SDL_Keycode  -- ../inc209/SDL_keyboard.h:150
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetKeyFromName";

  --*
  -- *  \brief Start accepting Unicode text input events.
  -- *         This function will show the on-screen keyboard if supported.
  -- *
  -- *  \sa SDL_StopTextInput()
  -- *  \sa SDL_SetTextInputRect()
  -- *  \sa SDL_HasScreenKeyboardSupport()
  --  

   procedure SDL_StartTextInput  -- ../inc209/SDL_keyboard.h:160
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_StartTextInput";

  --*
  -- *  \brief Return whether or not Unicode text input events are enabled.
  -- *
  -- *  \sa SDL_StartTextInput()
  -- *  \sa SDL_StopTextInput()
  --  

   function SDL_IsTextInputActive return SDL_stdinc_h.SDL_bool  -- ../inc209/SDL_keyboard.h:168
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_IsTextInputActive";

  --*
  -- *  \brief Stop receiving any text input events.
  -- *         This function will hide the on-screen keyboard if supported.
  -- *
  -- *  \sa SDL_StartTextInput()
  -- *  \sa SDL_HasScreenKeyboardSupport()
  --  

   procedure SDL_StopTextInput  -- ../inc209/SDL_keyboard.h:177
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_StopTextInput";

  --*
  -- *  \brief Set the rectangle used to type Unicode text inputs.
  -- *         This is used as a hint for IME and on-screen keyboard placement.
  -- *
  -- *  \sa SDL_StartTextInput()
  --  

   procedure SDL_SetTextInputRect (rect : access SDL_rect_h.SDL_Rect)  -- ../inc209/SDL_keyboard.h:185
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetTextInputRect";

  --*
  -- *  \brief Returns whether the platform has some screen keyboard support.
  -- *
  -- *  \return SDL_TRUE if some keyboard support is available else SDL_FALSE.
  -- *
  -- *  \note Not all screen keyboard functions are supported on all platforms.
  -- *
  -- *  \sa SDL_IsScreenKeyboardShown()
  --  

   function SDL_HasScreenKeyboardSupport return SDL_stdinc_h.SDL_bool  -- ../inc209/SDL_keyboard.h:196
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_HasScreenKeyboardSupport";

  --*
  -- *  \brief Returns whether the screen keyboard is shown for given window.
  -- *
  -- *  \param window The window for which screen keyboard should be queried.
  -- *
  -- *  \return SDL_TRUE if screen keyboard is shown else SDL_FALSE.
  -- *
  -- *  \sa SDL_HasScreenKeyboardSupport()
  --  

   function SDL_IsScreenKeyboardShown (window : access SDL_video_h.SDL_Window) return SDL_stdinc_h.SDL_bool  -- ../inc209/SDL_keyboard.h:207
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_IsScreenKeyboardShown";

  -- Ends C function definitions when using C++  
  -- vi: set ts=4 sw=4 expandtab:  
end SDL_keyboard_h;
