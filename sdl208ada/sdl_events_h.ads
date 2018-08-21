pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with SDL_stdinc_h;
with SDL_keyboard_h;
with SDL_joystick_h;
with SDL_touch_h;
with SDL_gesture_h;
with Interfaces.C.Strings;
with System;

package SDL_events_h is

   SDL_RELEASED : constant := 0;  --  SDL_events.h:49
   SDL_PRESSED : constant := 1;  --  SDL_events.h:50

   SDL_TEXTEDITINGEVENT_TEXT_SIZE : constant := (32);  --  SDL_events.h:202

   SDL_TEXTINPUTEVENT_TEXT_SIZE : constant := (32);  --  SDL_events.h:217

   SDL_QUERY : constant := -1;  --  SDL_events.h:719
   SDL_IGNORE : constant := 0;  --  SDL_events.h:720
   SDL_DISABLE : constant := 0;  --  SDL_events.h:721
   SDL_ENABLE : constant := 1;  --  SDL_events.h:722
   --  arg-macro: procedure SDL_GetEventState (type)
   --    SDL_EventState(type, SDL_QUERY)

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
  -- *  \file SDL_events.h
  -- *
  -- *  Include file for SDL event handling.
  --  

  -- Set up for C function definitions, even when using C++  
  -- General keyboard/mouse state definitions  
  --*
  -- * \brief The types of events that can be delivered.
  --  

  --*< Unused (do not remove)  
  -- Application events  
  --*< User-requested quit  
  -- These application events have special meaning on iOS, see README-ios.md for details  
  --*< The application is being terminated by the OS
  --                                     Called on iOS in applicationWillTerminate()
  --                                     Called on Android in onDestroy()
  --                                 

  --*< The application is low on memory, free memory if possible.
  --                                     Called on iOS in applicationDidReceiveMemoryWarning()
  --                                     Called on Android in onLowMemory()
  --                                 

  --*< The application is about to enter the background
  --                                     Called on iOS in applicationWillResignActive()
  --                                     Called on Android in onPause()
  --                                 

  --*< The application did enter the background and may not get CPU for some time
  --                                     Called on iOS in applicationDidEnterBackground()
  --                                     Called on Android in onPause()
  --                                 

  --*< The application is about to enter the foreground
  --                                     Called on iOS in applicationWillEnterForeground()
  --                                     Called on Android in onResume()
  --                                 

  --*< The application is now interactive
  --                                     Called on iOS in applicationDidBecomeActive()
  --                                     Called on Android in onResume()
  --                                 

  -- Window events  
  --*< Window state change  
  --*< System specific event  
  -- Keyboard events  
  --*< Key pressed  
  --*< Key released  
  --*< Keyboard text editing (composition)  
  --*< Keyboard text input  
  --*< Keymap changed due to a system event such as an
  --                                     input language or keyboard layout change.
  --                                 

  -- Mouse events  
  --*< Mouse moved  
  --*< Mouse button pressed  
  --*< Mouse button released  
  --*< Mouse wheel motion  
  -- Joystick events  
  --*< Joystick axis motion  
  --*< Joystick trackball motion  
  --*< Joystick hat position change  
  --*< Joystick button pressed  
  --*< Joystick button released  
  --*< A new joystick has been inserted into the system  
  --*< An opened joystick has been removed  
  -- Game controller events  
  --*< Game controller axis motion  
  --*< Game controller button pressed  
  --*< Game controller button released  
  --*< A new Game controller has been inserted into the system  
  --*< An opened Game controller has been removed  
  --*< The controller mapping was updated  
  -- Touch events  
  -- Gesture events  
  -- Clipboard events  
  --*< The clipboard changed  
  -- Drag and drop events  
  --*< The system requests a file open  
  --*< text/plain drag-and-drop event  
  --*< A new set of drops is beginning (NULL filename)  
  --*< Current set of drops is now complete (NULL filename)  
  -- Audio hotplug events  
  --*< A new audio device is available  
  --*< An audio device has been removed.  
  -- Render events  
  --*< The render targets have been reset and their contents need to be updated  
  --*< The device has been reset and all textures need to be recreated  
  --* Events ::SDL_USEREVENT through ::SDL_LASTEVENT are for your use,
  --     *  and should be allocated with SDL_RegisterEvents()
  --      

  --*
  --     *  This last event is only for bounding internal arrays
  --      
  --*
  -- *  \brief Fields shared by every event
  --  

   type SDL_CommonEvent is record
      c_type : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:167
      timestamp : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:168
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_CommonEvent);  -- SDL_events.h:165

  --*< In milliseconds, populated using SDL_GetTicks()  
  --*
  -- *  \brief Window state change event data (event.window.*)
  --  

  --*< ::SDL_WINDOWEVENT  
   type SDL_WindowEvent is record
      c_type : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:176
      timestamp : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:177
      windowID : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:178
      event : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:179
      padding1 : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:180
      padding2 : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:181
      padding3 : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:182
      data1 : aliased SDL_stdinc_h.Sint32;  -- SDL_events.h:183
      data2 : aliased SDL_stdinc_h.Sint32;  -- SDL_events.h:184
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_WindowEvent);  -- SDL_events.h:174

  --*< In milliseconds, populated using SDL_GetTicks()  
  --*< The associated window  
  --*< ::SDL_WindowEventID  
  --*< event dependent data  
  --*< event dependent data  
  --*
  -- *  \brief Keyboard button event structure (event.key.*)
  --  

  --*< ::SDL_KEYDOWN or ::SDL_KEYUP  
   type SDL_KeyboardEvent is record
      c_type : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:192
      timestamp : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:193
      windowID : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:194
      state : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:195
      repeat : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:196
      padding2 : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:197
      padding3 : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:198
      keysym : aliased SDL_keyboard_h.SDL_Keysym;  -- SDL_events.h:199
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_KeyboardEvent);  -- SDL_events.h:190

  --*< In milliseconds, populated using SDL_GetTicks()  
  --*< The window with keyboard focus, if any  
  --*< ::SDL_PRESSED or ::SDL_RELEASED  
  --*< Non-zero if this is a key repeat  
  --*< The key that was pressed or released  
  --*
  -- *  \brief Keyboard text editing event structure (event.edit.*)
  --  

  --*< ::SDL_TEXTEDITING  
   subtype SDL_TextEditingEvent_text_array is Interfaces.C.char_array (0 .. 31);
   type SDL_TextEditingEvent is record
      c_type : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:208
      timestamp : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:209
      windowID : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:210
      text : aliased SDL_TextEditingEvent_text_array;  -- SDL_events.h:211
      start : aliased SDL_stdinc_h.Sint32;  -- SDL_events.h:212
      length : aliased SDL_stdinc_h.Sint32;  -- SDL_events.h:213
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_TextEditingEvent);  -- SDL_events.h:206

  --*< In milliseconds, populated using SDL_GetTicks()  
  --*< The window with keyboard focus, if any  
  --*< The editing text  
  --*< The start cursor of selected editing text  
  --*< The length of selected editing text  
  --*
  -- *  \brief Keyboard text input event structure (event.text.*)
  --  

  --*< ::SDL_TEXTINPUT  
   subtype SDL_TextInputEvent_text_array is Interfaces.C.char_array (0 .. 31);
   type SDL_TextInputEvent is record
      c_type : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:223
      timestamp : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:224
      windowID : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:225
      text : aliased SDL_TextInputEvent_text_array;  -- SDL_events.h:226
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_TextInputEvent);  -- SDL_events.h:221

  --*< In milliseconds, populated using SDL_GetTicks()  
  --*< The window with keyboard focus, if any  
  --*< The input text  
  --*
  -- *  \brief Mouse motion event structure (event.motion.*)
  --  

  --*< ::SDL_MOUSEMOTION  
   type SDL_MouseMotionEvent is record
      c_type : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:234
      timestamp : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:235
      windowID : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:236
      which : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:237
      state : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:238
      x : aliased SDL_stdinc_h.Sint32;  -- SDL_events.h:239
      y : aliased SDL_stdinc_h.Sint32;  -- SDL_events.h:240
      xrel : aliased SDL_stdinc_h.Sint32;  -- SDL_events.h:241
      yrel : aliased SDL_stdinc_h.Sint32;  -- SDL_events.h:242
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_MouseMotionEvent);  -- SDL_events.h:232

  --*< In milliseconds, populated using SDL_GetTicks()  
  --*< The window with mouse focus, if any  
  --*< The mouse instance id, or SDL_TOUCH_MOUSEID  
  --*< The current button state  
  --*< X coordinate, relative to window  
  --*< Y coordinate, relative to window  
  --*< The relative motion in the X direction  
  --*< The relative motion in the Y direction  
  --*
  -- *  \brief Mouse button event structure (event.button.*)
  --  

  --*< ::SDL_MOUSEBUTTONDOWN or ::SDL_MOUSEBUTTONUP  
   type SDL_MouseButtonEvent is record
      c_type : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:250
      timestamp : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:251
      windowID : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:252
      which : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:253
      button : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:254
      state : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:255
      clicks : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:256
      padding1 : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:257
      x : aliased SDL_stdinc_h.Sint32;  -- SDL_events.h:258
      y : aliased SDL_stdinc_h.Sint32;  -- SDL_events.h:259
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_MouseButtonEvent);  -- SDL_events.h:248

  --*< In milliseconds, populated using SDL_GetTicks()  
  --*< The window with mouse focus, if any  
  --*< The mouse instance id, or SDL_TOUCH_MOUSEID  
  --*< The mouse button index  
  --*< ::SDL_PRESSED or ::SDL_RELEASED  
  --*< 1 for single-click, 2 for double-click, etc.  
  --*< X coordinate, relative to window  
  --*< Y coordinate, relative to window  
  --*
  -- *  \brief Mouse wheel event structure (event.wheel.*)
  --  

  --*< ::SDL_MOUSEWHEEL  
   type SDL_MouseWheelEvent is record
      c_type : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:267
      timestamp : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:268
      windowID : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:269
      which : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:270
      x : aliased SDL_stdinc_h.Sint32;  -- SDL_events.h:271
      y : aliased SDL_stdinc_h.Sint32;  -- SDL_events.h:272
      direction : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:273
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_MouseWheelEvent);  -- SDL_events.h:265

  --*< In milliseconds, populated using SDL_GetTicks()  
  --*< The window with mouse focus, if any  
  --*< The mouse instance id, or SDL_TOUCH_MOUSEID  
  --*< The amount scrolled horizontally, positive to the right and negative to the left  
  --*< The amount scrolled vertically, positive away from the user and negative toward the user  
  --*< Set to one of the SDL_MOUSEWHEEL_* defines. When FLIPPED the values in X and Y will be opposite. Multiply by -1 to change them back  
  --*
  -- *  \brief Joystick axis motion event structure (event.jaxis.*)
  --  

  --*< ::SDL_JOYAXISMOTION  
   type SDL_JoyAxisEvent is record
      c_type : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:281
      timestamp : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:282
      which : aliased SDL_joystick_h.SDL_JoystickID;  -- SDL_events.h:283
      axis : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:284
      padding1 : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:285
      padding2 : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:286
      padding3 : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:287
      value : aliased SDL_stdinc_h.Sint16;  -- SDL_events.h:288
      padding4 : aliased SDL_stdinc_h.Uint16;  -- SDL_events.h:289
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_JoyAxisEvent);  -- SDL_events.h:279

  --*< In milliseconds, populated using SDL_GetTicks()  
  --*< The joystick instance id  
  --*< The joystick axis index  
  --*< The axis value (range: -32768 to 32767)  
  --*
  -- *  \brief Joystick trackball motion event structure (event.jball.*)
  --  

  --*< ::SDL_JOYBALLMOTION  
   type SDL_JoyBallEvent is record
      c_type : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:297
      timestamp : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:298
      which : aliased SDL_joystick_h.SDL_JoystickID;  -- SDL_events.h:299
      ball : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:300
      padding1 : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:301
      padding2 : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:302
      padding3 : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:303
      xrel : aliased SDL_stdinc_h.Sint16;  -- SDL_events.h:304
      yrel : aliased SDL_stdinc_h.Sint16;  -- SDL_events.h:305
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_JoyBallEvent);  -- SDL_events.h:295

  --*< In milliseconds, populated using SDL_GetTicks()  
  --*< The joystick instance id  
  --*< The joystick trackball index  
  --*< The relative motion in the X direction  
  --*< The relative motion in the Y direction  
  --*
  -- *  \brief Joystick hat position change event structure (event.jhat.*)
  --  

  --*< ::SDL_JOYHATMOTION  
   type SDL_JoyHatEvent is record
      c_type : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:313
      timestamp : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:314
      which : aliased SDL_joystick_h.SDL_JoystickID;  -- SDL_events.h:315
      hat : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:316
      value : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:317
      padding1 : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:324
      padding2 : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:325
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_JoyHatEvent);  -- SDL_events.h:311

  --*< In milliseconds, populated using SDL_GetTicks()  
  --*< The joystick instance id  
  --*< The joystick hat index  
  --*< The hat position value.
  --                         *   \sa ::SDL_HAT_LEFTUP ::SDL_HAT_UP ::SDL_HAT_RIGHTUP
  --                         *   \sa ::SDL_HAT_LEFT ::SDL_HAT_CENTERED ::SDL_HAT_RIGHT
  --                         *   \sa ::SDL_HAT_LEFTDOWN ::SDL_HAT_DOWN ::SDL_HAT_RIGHTDOWN
  --                         *
  --                         *   Note that zero means the POV is centered.
  --                          

  --*
  -- *  \brief Joystick button event structure (event.jbutton.*)
  --  

  --*< ::SDL_JOYBUTTONDOWN or ::SDL_JOYBUTTONUP  
   type SDL_JoyButtonEvent is record
      c_type : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:333
      timestamp : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:334
      which : aliased SDL_joystick_h.SDL_JoystickID;  -- SDL_events.h:335
      button : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:336
      state : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:337
      padding1 : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:338
      padding2 : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:339
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_JoyButtonEvent);  -- SDL_events.h:331

  --*< In milliseconds, populated using SDL_GetTicks()  
  --*< The joystick instance id  
  --*< The joystick button index  
  --*< ::SDL_PRESSED or ::SDL_RELEASED  
  --*
  -- *  \brief Joystick device event structure (event.jdevice.*)
  --  

  --*< ::SDL_JOYDEVICEADDED or ::SDL_JOYDEVICEREMOVED  
   type SDL_JoyDeviceEvent is record
      c_type : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:347
      timestamp : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:348
      which : aliased SDL_stdinc_h.Sint32;  -- SDL_events.h:349
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_JoyDeviceEvent);  -- SDL_events.h:345

  --*< In milliseconds, populated using SDL_GetTicks()  
  --*< The joystick device index for the ADDED event, instance id for the REMOVED event  
  --*
  -- *  \brief Game controller axis motion event structure (event.caxis.*)
  --  

  --*< ::SDL_CONTROLLERAXISMOTION  
   type SDL_ControllerAxisEvent is record
      c_type : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:358
      timestamp : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:359
      which : aliased SDL_joystick_h.SDL_JoystickID;  -- SDL_events.h:360
      axis : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:361
      padding1 : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:362
      padding2 : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:363
      padding3 : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:364
      value : aliased SDL_stdinc_h.Sint16;  -- SDL_events.h:365
      padding4 : aliased SDL_stdinc_h.Uint16;  -- SDL_events.h:366
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_ControllerAxisEvent);  -- SDL_events.h:356

  --*< In milliseconds, populated using SDL_GetTicks()  
  --*< The joystick instance id  
  --*< The controller axis (SDL_GameControllerAxis)  
  --*< The axis value (range: -32768 to 32767)  
  --*
  -- *  \brief Game controller button event structure (event.cbutton.*)
  --  

  --*< ::SDL_CONTROLLERBUTTONDOWN or ::SDL_CONTROLLERBUTTONUP  
   type SDL_ControllerButtonEvent is record
      c_type : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:375
      timestamp : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:376
      which : aliased SDL_joystick_h.SDL_JoystickID;  -- SDL_events.h:377
      button : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:378
      state : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:379
      padding1 : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:380
      padding2 : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:381
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_ControllerButtonEvent);  -- SDL_events.h:373

  --*< In milliseconds, populated using SDL_GetTicks()  
  --*< The joystick instance id  
  --*< The controller button (SDL_GameControllerButton)  
  --*< ::SDL_PRESSED or ::SDL_RELEASED  
  --*
  -- *  \brief Controller device event structure (event.cdevice.*)
  --  

  --*< ::SDL_CONTROLLERDEVICEADDED, ::SDL_CONTROLLERDEVICEREMOVED, or ::SDL_CONTROLLERDEVICEREMAPPED  
   type SDL_ControllerDeviceEvent is record
      c_type : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:390
      timestamp : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:391
      which : aliased SDL_stdinc_h.Sint32;  -- SDL_events.h:392
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_ControllerDeviceEvent);  -- SDL_events.h:388

  --*< In milliseconds, populated using SDL_GetTicks()  
  --*< The joystick device index for the ADDED event, instance id for the REMOVED or REMAPPED event  
  --*
  -- *  \brief Audio device event structure (event.adevice.*)
  --  

  --*< ::SDL_AUDIODEVICEADDED, or ::SDL_AUDIODEVICEREMOVED  
   type SDL_AudioDeviceEvent is record
      c_type : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:400
      timestamp : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:401
      which : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:402
      iscapture : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:403
      padding1 : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:404
      padding2 : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:405
      padding3 : aliased SDL_stdinc_h.Uint8;  -- SDL_events.h:406
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_AudioDeviceEvent);  -- SDL_events.h:398

  --*< In milliseconds, populated using SDL_GetTicks()  
  --*< The audio device index for the ADDED event (valid until next SDL_GetNumAudioDevices() call), SDL_AudioDeviceID for the REMOVED event  
  --*< zero if an output device, non-zero if a capture device.  
  --*
  -- *  \brief Touch finger event structure (event.tfinger.*)
  --  

  --*< ::SDL_FINGERMOTION or ::SDL_FINGERDOWN or ::SDL_FINGERUP  
   type SDL_TouchFingerEvent is record
      c_type : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:415
      timestamp : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:416
      touchId : aliased SDL_touch_h.SDL_TouchID;  -- SDL_events.h:417
      fingerId : aliased SDL_touch_h.SDL_FingerID;  -- SDL_events.h:418
      x : aliased float;  -- SDL_events.h:419
      y : aliased float;  -- SDL_events.h:420
      dx : aliased float;  -- SDL_events.h:421
      dy : aliased float;  -- SDL_events.h:422
      pressure : aliased float;  -- SDL_events.h:423
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_TouchFingerEvent);  -- SDL_events.h:413

  --*< In milliseconds, populated using SDL_GetTicks()  
  --*< The touch device id  
  --*< Normalized in the range 0...1  
  --*< Normalized in the range 0...1  
  --*< Normalized in the range -1...1  
  --*< Normalized in the range -1...1  
  --*< Normalized in the range 0...1  
  --*
  -- *  \brief Multiple Finger Gesture Event (event.mgesture.*)
  --  

  --*< ::SDL_MULTIGESTURE  
   type SDL_MultiGestureEvent is record
      c_type : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:432
      timestamp : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:433
      touchId : aliased SDL_touch_h.SDL_TouchID;  -- SDL_events.h:434
      dTheta : aliased float;  -- SDL_events.h:435
      dDist : aliased float;  -- SDL_events.h:436
      x : aliased float;  -- SDL_events.h:437
      y : aliased float;  -- SDL_events.h:438
      numFingers : aliased SDL_stdinc_h.Uint16;  -- SDL_events.h:439
      padding : aliased SDL_stdinc_h.Uint16;  -- SDL_events.h:440
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_MultiGestureEvent);  -- SDL_events.h:430

  --*< In milliseconds, populated using SDL_GetTicks()  
  --*< The touch device id  
  --*
  -- * \brief Dollar Gesture Event (event.dgesture.*)
  --  

  --*< ::SDL_DOLLARGESTURE or ::SDL_DOLLARRECORD  
   type SDL_DollarGestureEvent is record
      c_type : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:449
      timestamp : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:450
      touchId : aliased SDL_touch_h.SDL_TouchID;  -- SDL_events.h:451
      gestureId : aliased SDL_gesture_h.SDL_GestureID;  -- SDL_events.h:452
      numFingers : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:453
      error : aliased float;  -- SDL_events.h:454
      x : aliased float;  -- SDL_events.h:455
      y : aliased float;  -- SDL_events.h:456
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_DollarGestureEvent);  -- SDL_events.h:447

  --*< In milliseconds, populated using SDL_GetTicks()  
  --*< The touch device id  
  --*< Normalized center of gesture  
  --*< Normalized center of gesture  
  --*
  -- *  \brief An event used to request a file open by the system (event.drop.*)
  -- *         This event is enabled by default, you can disable it with SDL_EventState().
  -- *  \note If this event is enabled, you must free the filename in the event.
  --  

  --*< ::SDL_DROPBEGIN or ::SDL_DROPFILE or ::SDL_DROPTEXT or ::SDL_DROPCOMPLETE  
   type SDL_DropEvent is record
      c_type : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:467
      timestamp : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:468
      file : Interfaces.C.Strings.chars_ptr;  -- SDL_events.h:469
      windowID : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:470
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_DropEvent);  -- SDL_events.h:465

  --*< In milliseconds, populated using SDL_GetTicks()  
  --*< The file name, which should be freed with SDL_free(), is NULL on begin/complete  
  --*< The window that was dropped on, if any  
  --*
  -- *  \brief The "quit requested" event
  --  

  --*< ::SDL_QUIT  
   type SDL_QuitEvent is record
      c_type : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:479
      timestamp : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:480
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_QuitEvent);  -- SDL_events.h:477

  --*< In milliseconds, populated using SDL_GetTicks()  
  --*
  -- *  \brief OS Specific event
  --  

  --*< ::SDL_QUIT  
   type SDL_OSEvent is record
      c_type : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:488
      timestamp : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:489
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_OSEvent);  -- SDL_events.h:486

  --*< In milliseconds, populated using SDL_GetTicks()  
  --*
  -- *  \brief A user-defined event type (event.user.*)
  --  

  --*< ::SDL_USEREVENT through ::SDL_LASTEVENT-1  
   type SDL_UserEvent is record
      c_type : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:497
      timestamp : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:498
      windowID : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:499
      code : aliased SDL_stdinc_h.Sint32;  -- SDL_events.h:500
      data1 : System.Address;  -- SDL_events.h:501
      data2 : System.Address;  -- SDL_events.h:502
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_UserEvent);  -- SDL_events.h:495

  --*< In milliseconds, populated using SDL_GetTicks()  
  --*< The associated window if any  
  --*< User defined event code  
  --*< User defined data pointer  
  --*< User defined data pointer  
   --  skipped empty struct SDL_SysWMmsg

  --*
  -- *  \brief A video driver dependent system event (event.syswm.*)
  -- *         This event is disabled by default, you can enable it with SDL_EventState()
  -- *
  -- *  \note If you want to use this event, you should include SDL_syswm.h.
  --  

  --*< ::SDL_SYSWMEVENT  
   type SDL_SysWMEvent is record
      c_type : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:517
      timestamp : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:518
      msg : System.Address;  -- SDL_events.h:519
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_SysWMEvent);  -- SDL_events.h:515

  --*< In milliseconds, populated using SDL_GetTicks()  
  --*< driver dependent data, defined in SDL_syswm.h  
  --*
  -- *  \brief General event structure
  --  

  --*< Event type, shared with all events  
   type SDL_Event_padding_array is array (0 .. 55) of aliased SDL_stdinc_h.Uint8;
   type SDL_Event (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            c_type : aliased SDL_stdinc_h.Uint32;  -- SDL_events.h:527
         when 1 =>
            common : aliased SDL_CommonEvent;  -- SDL_events.h:528
         when 2 =>
            window : aliased SDL_WindowEvent;  -- SDL_events.h:529
         when 3 =>
            key : aliased SDL_KeyboardEvent;  -- SDL_events.h:530
         when 4 =>
            edit : aliased SDL_TextEditingEvent;  -- SDL_events.h:531
         when 5 =>
            text : aliased SDL_TextInputEvent;  -- SDL_events.h:532
         when 6 =>
            motion : aliased SDL_MouseMotionEvent;  -- SDL_events.h:533
         when 7 =>
            button : aliased SDL_MouseButtonEvent;  -- SDL_events.h:534
         when 8 =>
            wheel : aliased SDL_MouseWheelEvent;  -- SDL_events.h:535
         when 9 =>
            jaxis : aliased SDL_JoyAxisEvent;  -- SDL_events.h:536
         when 10 =>
            jball : aliased SDL_JoyBallEvent;  -- SDL_events.h:537
         when 11 =>
            jhat : aliased SDL_JoyHatEvent;  -- SDL_events.h:538
         when 12 =>
            jbutton : aliased SDL_JoyButtonEvent;  -- SDL_events.h:539
         when 13 =>
            jdevice : aliased SDL_JoyDeviceEvent;  -- SDL_events.h:540
         when 14 =>
            caxis : aliased SDL_ControllerAxisEvent;  -- SDL_events.h:541
         when 15 =>
            cbutton : aliased SDL_ControllerButtonEvent;  -- SDL_events.h:542
         when 16 =>
            cdevice : aliased SDL_ControllerDeviceEvent;  -- SDL_events.h:543
         when 17 =>
            adevice : aliased SDL_AudioDeviceEvent;  -- SDL_events.h:544
         when 18 =>
            quit : aliased SDL_QuitEvent;  -- SDL_events.h:545
         when 19 =>
            user : aliased SDL_UserEvent;  -- SDL_events.h:546
         when 20 =>
            syswm : aliased SDL_SysWMEvent;  -- SDL_events.h:547
         when 21 =>
            tfinger : aliased SDL_TouchFingerEvent;  -- SDL_events.h:548
         when 22 =>
            mgesture : aliased SDL_MultiGestureEvent;  -- SDL_events.h:549
         when 23 =>
            dgesture : aliased SDL_DollarGestureEvent;  -- SDL_events.h:550
         when 24 =>
            drop : aliased SDL_DropEvent;  -- SDL_events.h:551
         when others =>
            padding : aliased SDL_Event_padding_array;  -- SDL_events.h:560
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_Event);
   pragma Unchecked_Union (SDL_Event);  -- SDL_events.h:525

  --*< Common event data  
  --*< Window event data  
  --*< Keyboard event data  
  --*< Text editing event data  
  --*< Text input event data  
  --*< Mouse motion event data  
  --*< Mouse button event data  
  --*< Mouse wheel event data  
  --*< Joystick axis event data  
  --*< Joystick ball event data  
  --*< Joystick hat event data  
  --*< Joystick button event data  
  --*< Joystick device change event data  
  --*< Game Controller axis event data  
  --*< Game Controller button event data  
  --*< Game Controller device event data  
  --*< Audio device event data  
  --*< Quit request event data  
  --*< Custom event data  
  --*< System dependent window event data  
  --*< Touch finger event data  
  --*< Gesture event data  
  --*< Gesture event data  
  --*< Drag and drop event data  
  -- This is necessary for ABI compatibility between Visual C++ and GCC
  --       Visual C++ will respect the push pack pragma and use 52 bytes for
  --       this structure, and GCC will use the alignment of the largest datatype
  --       within the union, which is 8 bytes.
  --       So... we'll add padding to force the size to be 56 bytes for both.
  --     

  -- Function prototypes  
  --*
  -- *  Pumps the event loop, gathering events from the input devices.
  -- *
  -- *  This function updates the event queue and internal input device state.
  -- *
  -- *  This should only be run in the thread that sets the video mode.
  --  

   procedure SDL_PumpEvents;  -- SDL_events.h:573
   pragma Import (C, SDL_PumpEvents, "SDL_PumpEvents");

  -- @{  
   type SDL_eventaction is 
     (SDL_ADDEVENT,
      SDL_PEEKEVENT,
      SDL_GETEVENT);
   pragma Convention (C, SDL_eventaction);  -- SDL_events.h:581

  --*
  -- *  Checks the event queue for messages and optionally returns them.
  -- *
  -- *  If \c action is ::SDL_ADDEVENT, up to \c numevents events will be added to
  -- *  the back of the event queue.
  -- *
  -- *  If \c action is ::SDL_PEEKEVENT, up to \c numevents events at the front
  -- *  of the event queue, within the specified minimum and maximum type,
  -- *  will be returned and will not be removed from the queue.
  -- *
  -- *  If \c action is ::SDL_GETEVENT, up to \c numevents events at the front
  -- *  of the event queue, within the specified minimum and maximum type,
  -- *  will be returned and will be removed from the queue.
  -- *
  -- *  \return The number of events actually stored, or -1 if there was an error.
  -- *
  -- *  This function is thread-safe.
  --  

   function SDL_PeepEvents
     (events : access SDL_Event;
      numevents : int;
      action : SDL_eventaction;
      minType : SDL_stdinc_h.Uint32;
      maxType : SDL_stdinc_h.Uint32) return int;  -- SDL_events.h:601
   pragma Import (C, SDL_PeepEvents, "SDL_PeepEvents");

  -- @}  
  --*
  -- *  Checks to see if certain event types are in the event queue.
  --  

   function SDL_HasEvent (c_type : SDL_stdinc_h.Uint32) return SDL_stdinc_h.SDL_bool;  -- SDL_events.h:609
   pragma Import (C, SDL_HasEvent, "SDL_HasEvent");

   function SDL_HasEvents (minType : SDL_stdinc_h.Uint32; maxType : SDL_stdinc_h.Uint32) return SDL_stdinc_h.SDL_bool;  -- SDL_events.h:610
   pragma Import (C, SDL_HasEvents, "SDL_HasEvents");

  --*
  -- *  This function clears events from the event queue
  -- *  This function only affects currently queued events. If you want to make
  -- *  sure that all pending OS events are flushed, you can call SDL_PumpEvents()
  -- *  on the main thread immediately before the flush call.
  --  

   procedure SDL_FlushEvent (c_type : SDL_stdinc_h.Uint32);  -- SDL_events.h:618
   pragma Import (C, SDL_FlushEvent, "SDL_FlushEvent");

   procedure SDL_FlushEvents (minType : SDL_stdinc_h.Uint32; maxType : SDL_stdinc_h.Uint32);  -- SDL_events.h:619
   pragma Import (C, SDL_FlushEvents, "SDL_FlushEvents");

  --*
  -- *  \brief Polls for currently pending events.
  -- *
  -- *  \return 1 if there are any pending events, or 0 if there are none available.
  -- *
  -- *  \param event If not NULL, the next event is removed from the queue and
  -- *               stored in that area.
  --  

   function SDL_PollEvent (event : access SDL_Event) return int;  -- SDL_events.h:629
   pragma Import (C, SDL_PollEvent, "SDL_PollEvent");

  --*
  -- *  \brief Waits indefinitely for the next available event.
  -- *
  -- *  \return 1, or 0 if there was an error while waiting for events.
  -- *
  -- *  \param event If not NULL, the next event is removed from the queue and
  -- *               stored in that area.
  --  

   function SDL_WaitEvent (event : access SDL_Event) return int;  -- SDL_events.h:639
   pragma Import (C, SDL_WaitEvent, "SDL_WaitEvent");

  --*
  -- *  \brief Waits until the specified timeout (in milliseconds) for the next
  -- *         available event.
  -- *
  -- *  \return 1, or 0 if there was an error while waiting for events.
  -- *
  -- *  \param event If not NULL, the next event is removed from the queue and
  -- *               stored in that area.
  -- *  \param timeout The timeout (in milliseconds) to wait for next event.
  --  

   function SDL_WaitEventTimeout (event : access SDL_Event; timeout : int) return int;  -- SDL_events.h:651
   pragma Import (C, SDL_WaitEventTimeout, "SDL_WaitEventTimeout");

  --*
  -- *  \brief Add an event to the event queue.
  -- *
  -- *  \return 1 on success, 0 if the event was filtered, or -1 if the event queue
  -- *          was full or there was some other error.
  --  

   function SDL_PushEvent (event : access SDL_Event) return int;  -- SDL_events.h:660
   pragma Import (C, SDL_PushEvent, "SDL_PushEvent");

   type SDL_EventFilter is access function (arg1 : System.Address; arg2 : access SDL_Event) return int;
   pragma Convention (C, SDL_EventFilter);  -- SDL_events.h:662

  --*
  -- *  Sets up a filter to process all events before they change internal state and
  -- *  are posted to the internal event queue.
  -- *
  -- *  The filter is prototyped as:
  -- *  \code
  -- *      int SDL_EventFilter(void *userdata, SDL_Event * event);
  -- *  \endcode
  -- *
  -- *  If the filter returns 1, then the event will be added to the internal queue.
  -- *  If it returns 0, then the event will be dropped from the queue, but the
  -- *  internal state will still be updated.  This allows selective filtering of
  -- *  dynamically arriving events.
  -- *
  -- *  \warning  Be very careful of what you do in the event filter function, as
  -- *            it may run in a different thread!
  -- *
  -- *  There is one caveat when dealing with the ::SDL_QuitEvent event type.  The
  -- *  event filter is only called when the window manager desires to close the
  -- *  application window.  If the event filter returns 1, then the window will
  -- *  be closed, otherwise the window will remain open if possible.
  -- *
  -- *  If the quit event is generated by an interrupt signal, it will bypass the
  -- *  internal queue and be delivered to the application at the next event poll.
  --  

   procedure SDL_SetEventFilter (filter : SDL_EventFilter; userdata : System.Address);  -- SDL_events.h:689
   pragma Import (C, SDL_SetEventFilter, "SDL_SetEventFilter");

  --*
  -- *  Return the current event filter - can be used to "chain" filters.
  -- *  If there is no event filter set, this function returns SDL_FALSE.
  --  

   function SDL_GetEventFilter (filter : System.Address; userdata : System.Address) return SDL_stdinc_h.SDL_bool;  -- SDL_events.h:696
   pragma Import (C, SDL_GetEventFilter, "SDL_GetEventFilter");

  --*
  -- *  Add a function which is called when an event is added to the queue.
  --  

   procedure SDL_AddEventWatch (filter : SDL_EventFilter; userdata : System.Address);  -- SDL_events.h:702
   pragma Import (C, SDL_AddEventWatch, "SDL_AddEventWatch");

  --*
  -- *  Remove an event watch function added with SDL_AddEventWatch()
  --  

   procedure SDL_DelEventWatch (filter : SDL_EventFilter; userdata : System.Address);  -- SDL_events.h:708
   pragma Import (C, SDL_DelEventWatch, "SDL_DelEventWatch");

  --*
  -- *  Run the filter function on the current event queue, removing any
  -- *  events for which the filter returns 0.
  --  

   procedure SDL_FilterEvents (filter : SDL_EventFilter; userdata : System.Address);  -- SDL_events.h:715
   pragma Import (C, SDL_FilterEvents, "SDL_FilterEvents");

  -- @{  
  --*
  -- *  This function allows you to set the state of processing certain events.
  -- *   - If \c state is set to ::SDL_IGNORE, that event will be automatically
  -- *     dropped from the event queue and will not be filtered.
  -- *   - If \c state is set to ::SDL_ENABLE, that event will be processed
  -- *     normally.
  -- *   - If \c state is set to ::SDL_QUERY, SDL_EventState() will return the
  -- *     current processing state of the specified event.
  --  

   function SDL_EventState (c_type : SDL_stdinc_h.Uint32; state : int) return SDL_stdinc_h.Uint8;  -- SDL_events.h:733
   pragma Import (C, SDL_EventState, "SDL_EventState");

  -- @}  
  --*
  -- *  This function allocates a set of user-defined events, and returns
  -- *  the beginning event number for that set of events.
  -- *
  -- *  If there aren't enough user-defined events left, this function
  -- *  returns (Uint32)-1
  --  

   function SDL_RegisterEvents (numevents : int) return SDL_stdinc_h.Uint32;  -- SDL_events.h:744
   pragma Import (C, SDL_RegisterEvents, "SDL_RegisterEvents");

  -- Ends C function definitions when using C++  
  -- vi: set ts=4 sw=4 expandtab:  
end SDL_events_h;
