pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with SDL_stdinc_h;
with Interfaces.C.Strings;

package SDL_joystick_h is

   SDL_JOYSTICK_AXIS_MAX : constant := 32767;  --  ../inc209/SDL_joystick.h:301
   SDL_JOYSTICK_AXIS_MIN : constant := -32768;  --  ../inc209/SDL_joystick.h:302

   SDL_HAT_CENTERED : constant := 16#00#;  --  ../inc209/SDL_joystick.h:329
   SDL_HAT_UP : constant := 16#01#;  --  ../inc209/SDL_joystick.h:330
   SDL_HAT_RIGHT : constant := 16#02#;  --  ../inc209/SDL_joystick.h:331
   SDL_HAT_DOWN : constant := 16#04#;  --  ../inc209/SDL_joystick.h:332
   SDL_HAT_LEFT : constant := 16#08#;  --  ../inc209/SDL_joystick.h:333
   --  unsupported macro: SDL_HAT_RIGHTUP (SDL_HAT_RIGHT|SDL_HAT_UP)
   --  unsupported macro: SDL_HAT_RIGHTDOWN (SDL_HAT_RIGHT|SDL_HAT_DOWN)
   --  unsupported macro: SDL_HAT_LEFTUP (SDL_HAT_LEFT|SDL_HAT_UP)
   --  unsupported macro: SDL_HAT_LEFTDOWN (SDL_HAT_LEFT|SDL_HAT_DOWN)

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
  -- *  \file SDL_joystick.h
  -- *
  -- *  Include file for SDL joystick event handling
  -- *
  -- * The term "device_index" identifies currently plugged in joystick devices between 0 and SDL_NumJoysticks(), with the exact joystick
  -- *   behind a device_index changing as joysticks are plugged and unplugged.
  -- *
  -- * The term "instance_id" is the current instantiation of a joystick device in the system, if the joystick is removed and then re-inserted
  -- *   then it will get a new instance_id, instance_id's are monotonically increasing identifiers of a joystick plugged in.
  -- *
  -- * The term JoystickGUID is a stable 128-bit identifier for a joystick device that does not change over time, it identifies class of
  -- *   the device (a X360 wired controller for example). This identifier is platform dependent.
  -- *
  -- *
  --  

  -- Set up for C function definitions, even when using C++  
  --*
  -- *  \file SDL_joystick.h
  -- *
  -- *  In order to use these functions, SDL_Init() must have been called
  -- *  with the ::SDL_INIT_JOYSTICK flag.  This causes SDL to scan the system
  -- *  for joysticks, and load appropriate drivers.
  -- *
  -- *  If you would like to receive joystick updates while the application
  -- *  is in the background, you should set the following hint before calling
  -- *  SDL_Init(): SDL_HINT_JOYSTICK_ALLOW_BACKGROUND_EVENTS
  --  

  --*
  -- * The joystick structure used to identify an SDL joystick
  --  

   type u_SDL_Joystick is null record;   -- incomplete struct

   subtype SDL_Joystick is u_SDL_Joystick;  -- ../inc209/SDL_joystick.h:67

  -- A structure that encodes the stable unique id for a joystick device  
   type SDL_JoystickGUID_data_array is array (0 .. 15) of aliased SDL_stdinc_h.Uint8;
   type SDL_JoystickGUID is record
      data : aliased SDL_JoystickGUID_data_array;  -- ../inc209/SDL_joystick.h:71
   end record
   with Convention => C_Pass_By_Copy;  -- ../inc209/SDL_joystick.h:72

   --  skipped anonymous struct anon_57

  --*
  -- * This is a unique ID for a joystick for the time it is connected to the system,
  -- * and is never reused for the lifetime of the application. If the joystick is
  -- * disconnected and reconnected, it will get a new ID.
  -- *
  -- * The ID value starts at 0 and increments from there. The value -1 is an invalid ID.
  --  

   subtype SDL_JoystickID is SDL_stdinc_h.Sint32;  -- ../inc209/SDL_joystick.h:81

   type SDL_JoystickType is 
     (SDL_JOYSTICK_TYPE_UNKNOWN,
      SDL_JOYSTICK_TYPE_GAMECONTROLLER,
      SDL_JOYSTICK_TYPE_WHEEL,
      SDL_JOYSTICK_TYPE_ARCADE_STICK,
      SDL_JOYSTICK_TYPE_FLIGHT_STICK,
      SDL_JOYSTICK_TYPE_DANCE_PAD,
      SDL_JOYSTICK_TYPE_GUITAR,
      SDL_JOYSTICK_TYPE_DRUM_KIT,
      SDL_JOYSTICK_TYPE_ARCADE_PAD,
      SDL_JOYSTICK_TYPE_THROTTLE)
   with Convention => C;  -- ../inc209/SDL_joystick.h:95

  -- <= 5%  
  -- <= 20%  
  -- <= 70%  
  -- <= 100%  
   subtype SDL_JoystickPowerLevel is int;
   SDL_JOYSTICK_POWER_UNKNOWN : constant int := -1;
   SDL_JOYSTICK_POWER_EMPTY : constant int := 0;
   SDL_JOYSTICK_POWER_LOW : constant int := 1;
   SDL_JOYSTICK_POWER_MEDIUM : constant int := 2;
   SDL_JOYSTICK_POWER_FULL : constant int := 3;
   SDL_JOYSTICK_POWER_WIRED : constant int := 4;
   SDL_JOYSTICK_POWER_MAX : constant int := 5;  -- ../inc209/SDL_joystick.h:106

  -- Function prototypes  
  --*
  -- * Locking for multi-threaded access to the joystick API
  -- *
  -- * If you are using the joystick API or handling events from multiple threads
  -- * you should use these locking functions to protect access to the joysticks.
  -- *
  -- * In particular, you are guaranteed that the joystick list won't change, so
  -- * the API functions that take a joystick index will be valid, and joystick
  -- * and game controller events will not be delivered.
  --  

   procedure SDL_LockJoysticks  -- ../inc209/SDL_joystick.h:120
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LockJoysticks";

   procedure SDL_UnlockJoysticks  -- ../inc209/SDL_joystick.h:121
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_UnlockJoysticks";

  --*
  -- *  Count the number of joysticks attached to the system right now
  --  

   function SDL_NumJoysticks return int  -- ../inc209/SDL_joystick.h:126
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_NumJoysticks";

  --*
  -- *  Get the implementation dependent name of a joystick.
  -- *  This can be called before any joysticks are opened.
  -- *  If no name can be found, this function returns NULL.
  --  

   function SDL_JoystickNameForIndex (device_index : int) return Interfaces.C.Strings.chars_ptr  -- ../inc209/SDL_joystick.h:133
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickNameForIndex";

  --*
  -- *  Get the player index of a joystick, or -1 if it's not available
  -- *  This can be called before any joysticks are opened.
  --  

   function SDL_JoystickGetDevicePlayerIndex (device_index : int) return int  -- ../inc209/SDL_joystick.h:139
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickGetDevicePlayerIndex";

  --*
  -- *  Return the GUID for the joystick at this index
  -- *  This can be called before any joysticks are opened.
  --  

   function SDL_JoystickGetDeviceGUID (device_index : int) return SDL_JoystickGUID  -- ../inc209/SDL_joystick.h:145
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickGetDeviceGUID";

  --*
  -- *  Get the USB vendor ID of a joystick, if available.
  -- *  This can be called before any joysticks are opened.
  -- *  If the vendor ID isn't available this function returns 0.
  --  

   function SDL_JoystickGetDeviceVendor (device_index : int) return SDL_stdinc_h.Uint16  -- ../inc209/SDL_joystick.h:152
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickGetDeviceVendor";

  --*
  -- *  Get the USB product ID of a joystick, if available.
  -- *  This can be called before any joysticks are opened.
  -- *  If the product ID isn't available this function returns 0.
  --  

   function SDL_JoystickGetDeviceProduct (device_index : int) return SDL_stdinc_h.Uint16  -- ../inc209/SDL_joystick.h:159
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickGetDeviceProduct";

  --*
  -- *  Get the product version of a joystick, if available.
  -- *  This can be called before any joysticks are opened.
  -- *  If the product version isn't available this function returns 0.
  --  

   function SDL_JoystickGetDeviceProductVersion (device_index : int) return SDL_stdinc_h.Uint16  -- ../inc209/SDL_joystick.h:166
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickGetDeviceProductVersion";

  --*
  -- *  Get the type of a joystick, if available.
  -- *  This can be called before any joysticks are opened.
  --  

   function SDL_JoystickGetDeviceType (device_index : int) return SDL_JoystickType  -- ../inc209/SDL_joystick.h:172
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickGetDeviceType";

  --*
  -- *  Get the instance ID of a joystick.
  -- *  This can be called before any joysticks are opened.
  -- *  If the index is out of range, this function will return -1.
  --  

   function SDL_JoystickGetDeviceInstanceID (device_index : int) return SDL_JoystickID  -- ../inc209/SDL_joystick.h:179
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickGetDeviceInstanceID";

  --*
  -- *  Open a joystick for use.
  -- *  The index passed as an argument refers to the N'th joystick on the system.
  -- *  This index is not the value which will identify this joystick in future
  -- *  joystick events.  The joystick's instance id (::SDL_JoystickID) will be used
  -- *  there instead.
  -- *
  -- *  \return A joystick identifier, or NULL if an error occurred.
  --  

   function SDL_JoystickOpen (device_index : int) return access SDL_Joystick  -- ../inc209/SDL_joystick.h:190
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickOpen";

  --*
  -- * Return the SDL_Joystick associated with an instance id.
  --  

   function SDL_JoystickFromInstanceID (joyid : SDL_JoystickID) return access SDL_Joystick  -- ../inc209/SDL_joystick.h:195
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickFromInstanceID";

  --*
  -- *  Return the name for this currently opened joystick.
  -- *  If no name can be found, this function returns NULL.
  --  

   function SDL_JoystickName (joystick : access SDL_Joystick) return Interfaces.C.Strings.chars_ptr  -- ../inc209/SDL_joystick.h:201
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickName";

  --*
  -- *  Get the player index of an opened joystick, or -1 if it's not available
  -- *
  -- *  For XInput controllers this returns the XInput user index.
  --  

   function SDL_JoystickGetPlayerIndex (joystick : access SDL_Joystick) return int  -- ../inc209/SDL_joystick.h:208
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickGetPlayerIndex";

  --*
  -- *  Return the GUID for this opened joystick
  --  

   function SDL_JoystickGetGUID (joystick : access SDL_Joystick) return SDL_JoystickGUID  -- ../inc209/SDL_joystick.h:213
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickGetGUID";

  --*
  -- *  Get the USB vendor ID of an opened joystick, if available.
  -- *  If the vendor ID isn't available this function returns 0.
  --  

   function SDL_JoystickGetVendor (joystick : access SDL_Joystick) return SDL_stdinc_h.Uint16  -- ../inc209/SDL_joystick.h:219
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickGetVendor";

  --*
  -- *  Get the USB product ID of an opened joystick, if available.
  -- *  If the product ID isn't available this function returns 0.
  --  

   function SDL_JoystickGetProduct (joystick : access SDL_Joystick) return SDL_stdinc_h.Uint16  -- ../inc209/SDL_joystick.h:225
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickGetProduct";

  --*
  -- *  Get the product version of an opened joystick, if available.
  -- *  If the product version isn't available this function returns 0.
  --  

   function SDL_JoystickGetProductVersion (joystick : access SDL_Joystick) return SDL_stdinc_h.Uint16  -- ../inc209/SDL_joystick.h:231
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickGetProductVersion";

  --*
  -- *  Get the type of an opened joystick.
  --  

   function SDL_JoystickGetType (joystick : access SDL_Joystick) return SDL_JoystickType  -- ../inc209/SDL_joystick.h:236
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickGetType";

  --*
  -- *  Return a string representation for this guid. pszGUID must point to at least 33 bytes
  -- *  (32 for the string plus a NULL terminator).
  --  

   procedure SDL_JoystickGetGUIDString
     (guid : SDL_JoystickGUID;
      pszGUID : Interfaces.C.Strings.chars_ptr;
      cbGUID : int)  -- ../inc209/SDL_joystick.h:242
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickGetGUIDString";

  --*
  -- *  Convert a string into a joystick guid
  --  

   function SDL_JoystickGetGUIDFromString (pchGUID : Interfaces.C.Strings.chars_ptr) return SDL_JoystickGUID  -- ../inc209/SDL_joystick.h:247
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickGetGUIDFromString";

  --*
  -- *  Returns SDL_TRUE if the joystick has been opened and currently connected, or SDL_FALSE if it has not.
  --  

   function SDL_JoystickGetAttached (joystick : access SDL_Joystick) return SDL_stdinc_h.SDL_bool  -- ../inc209/SDL_joystick.h:252
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickGetAttached";

  --*
  -- *  Get the instance ID of an opened joystick or -1 if the joystick is invalid.
  --  

   function SDL_JoystickInstanceID (joystick : access SDL_Joystick) return SDL_JoystickID  -- ../inc209/SDL_joystick.h:257
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickInstanceID";

  --*
  -- *  Get the number of general axis controls on a joystick.
  --  

   function SDL_JoystickNumAxes (joystick : access SDL_Joystick) return int  -- ../inc209/SDL_joystick.h:262
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickNumAxes";

  --*
  -- *  Get the number of trackballs on a joystick.
  -- *
  -- *  Joystick trackballs have only relative motion events associated
  -- *  with them and their state cannot be polled.
  --  

   function SDL_JoystickNumBalls (joystick : access SDL_Joystick) return int  -- ../inc209/SDL_joystick.h:270
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickNumBalls";

  --*
  -- *  Get the number of POV hats on a joystick.
  --  

   function SDL_JoystickNumHats (joystick : access SDL_Joystick) return int  -- ../inc209/SDL_joystick.h:275
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickNumHats";

  --*
  -- *  Get the number of buttons on a joystick.
  --  

   function SDL_JoystickNumButtons (joystick : access SDL_Joystick) return int  -- ../inc209/SDL_joystick.h:280
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickNumButtons";

  --*
  -- *  Update the current state of the open joysticks.
  -- *
  -- *  This is called automatically by the event loop if any joystick
  -- *  events are enabled.
  --  

   procedure SDL_JoystickUpdate  -- ../inc209/SDL_joystick.h:288
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickUpdate";

  --*
  -- *  Enable/disable joystick event polling.
  -- *
  -- *  If joystick events are disabled, you must call SDL_JoystickUpdate()
  -- *  yourself and check the state of the joystick when you want joystick
  -- *  information.
  -- *
  -- *  The state can be one of ::SDL_QUERY, ::SDL_ENABLE or ::SDL_IGNORE.
  --  

   function SDL_JoystickEventState (state : int) return int  -- ../inc209/SDL_joystick.h:299
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickEventState";

  --*
  -- *  Get the current state of an axis control on a joystick.
  -- *
  -- *  The state is a value ranging from -32768 to 32767.
  -- *
  -- *  The axis indices start at index 0.
  --  

   function SDL_JoystickGetAxis (joystick : access SDL_Joystick; axis : int) return SDL_stdinc_h.Sint16  -- ../inc209/SDL_joystick.h:310
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickGetAxis";

  --*
  -- *  Get the initial state of an axis control on a joystick.
  -- *
  -- *  The state is a value ranging from -32768 to 32767.
  -- *
  -- *  The axis indices start at index 0.
  -- *
  -- *  \return SDL_TRUE if this axis has any initial value, or SDL_FALSE if not.
  --  

   function SDL_JoystickGetAxisInitialState
     (joystick : access SDL_Joystick;
      axis : int;
      state : access SDL_stdinc_h.Sint16) return SDL_stdinc_h.SDL_bool  -- ../inc209/SDL_joystick.h:322
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickGetAxisInitialState";

  --*
  -- *  \name Hat positions
  --  

  -- @{  
  -- @}  
  --*
  -- *  Get the current state of a POV hat on a joystick.
  -- *
  -- *  The hat indices start at index 0.
  -- *
  -- *  \return The return value is one of the following positions:
  -- *           - ::SDL_HAT_CENTERED
  -- *           - ::SDL_HAT_UP
  -- *           - ::SDL_HAT_RIGHT
  -- *           - ::SDL_HAT_DOWN
  -- *           - ::SDL_HAT_LEFT
  -- *           - ::SDL_HAT_RIGHTUP
  -- *           - ::SDL_HAT_RIGHTDOWN
  -- *           - ::SDL_HAT_LEFTUP
  -- *           - ::SDL_HAT_LEFTDOWN
  --  

   function SDL_JoystickGetHat (joystick : access SDL_Joystick; hat : int) return SDL_stdinc_h.Uint8  -- ../inc209/SDL_joystick.h:356
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickGetHat";

  --*
  -- *  Get the ball axis change since the last poll.
  -- *
  -- *  \return 0, or -1 if you passed it invalid parameters.
  -- *
  -- *  The ball indices start at index 0.
  --  

   function SDL_JoystickGetBall
     (joystick : access SDL_Joystick;
      ball : int;
      dx : access int;
      dy : access int) return int  -- ../inc209/SDL_joystick.h:366
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickGetBall";

  --*
  -- *  Get the current state of a button on a joystick.
  -- *
  -- *  The button indices start at index 0.
  --  

   function SDL_JoystickGetButton (joystick : access SDL_Joystick; button : int) return SDL_stdinc_h.Uint8  -- ../inc209/SDL_joystick.h:374
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickGetButton";

  --*
  -- *  Trigger a rumble effect
  -- *  Each call to this function cancels any previous rumble effect, and calling it with 0 intensity stops any rumbling.
  -- *
  -- *  \param joystick The joystick to vibrate
  -- *  \param low_frequency_rumble The intensity of the low frequency (left) rumble motor, from 0 to 0xFFFF
  -- *  \param high_frequency_rumble The intensity of the high frequency (right) rumble motor, from 0 to 0xFFFF
  -- *  \param duration_ms The duration of the rumble effect, in milliseconds
  -- *
  -- *  \return 0, or -1 if rumble isn't supported on this joystick
  --  

   function SDL_JoystickRumble
     (joystick : access SDL_Joystick;
      low_frequency_rumble : SDL_stdinc_h.Uint16;
      high_frequency_rumble : SDL_stdinc_h.Uint16;
      duration_ms : SDL_stdinc_h.Uint32) return int  -- ../inc209/SDL_joystick.h:388
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickRumble";

  --*
  -- *  Close a joystick previously opened with SDL_JoystickOpen().
  --  

   procedure SDL_JoystickClose (joystick : access SDL_Joystick)  -- ../inc209/SDL_joystick.h:393
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickClose";

  --*
  -- *  Return the battery level of this joystick
  --  

   function SDL_JoystickCurrentPowerLevel (joystick : access SDL_Joystick) return SDL_JoystickPowerLevel  -- ../inc209/SDL_joystick.h:398
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickCurrentPowerLevel";

  -- Ends C function definitions when using C++  
  -- vi: set ts=4 sw=4 expandtab:  
end SDL_joystick_h;
