
pragma Style_Checks (Off);

with sdl_assert_h;
with sdl_atomic_h;
with sdl_audio_h;
with sdl_blendmode_h;
with sdl_clipboard_h;
with sdl_cpuinfo_h;
with sdl_endian_h;
with sdl_error_h;
with sdl_events_h;
with sdl_filesystem_h;
with sdl_gamecontroller_h;
with sdl_gesture_h;
  --with sdl_h;
with sdl_haptic_h;
with sdl_hints_h;
with sdl_joystick_h;
with sdl_keyboard_h;
with sdl_keycode_h;
with sdl_loadso_h;
with sdl_log_h;
with sdl_main_h;
with sdl_messagebox_h;
with sdl_mouse_h;
with sdl_mutex_h;
with sdl_pixels_h;
with sdl_platform_h;
with sdl_power_h;
with sdl_rect_h;
with sdl_render_h;
with sdl_rwops_h;
with sdl_scancode_h;
with sdl_shape_h;
with sdl_stdinc_h;
with sdl_surface_h;
with sdl_thread_h;
with sdl_timer_h;
with sdl_touch_h;
with sdl_version_h;
with sdl_video_h;

  --with stdio_h;
with libio_h;


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


-- This thin binding to SDL v2.0.8 was created
-- using AdaCore 2018 compiler and minimally
-- editted, mostly to resolve name clashes caused
-- by names assumed to be different because of CASE.
-- Another caused by using an Ada reserved word (FILE).
-- fastrgv August 2018




with System;
with Interfaces.C;
with Interfaces.C.Strings;


with Interfaces.C; use Interfaces.C;
with SDL_stdinc_h;





package SDL is

   package C renames Interfaces.C;
   use type C.int;
   use type C.size_t;














   ----------------------------------------------------------------------------
   -- SDL_stdinc.h
   ----------------------------------------------------------------------------

   type SDL_bool is (SDL_FALSE, SDL_TRUE);
   for SDL_bool use (SDL_FALSE => 0, SDL_TRUE => 1);
   pragma Convention (C, SDL_bool);

   type Uint8 is mod 2**8;
   for Uint8'Size use 8;
   pragma Convention (C, Uint8);

   type Uint16 is mod 2**16;
   for Uint16'Size use 16;
   pragma Convention (C, Uint16);

   type Uint32 is mod 2**32;
   for Uint32'Size use 32;
   pragma Convention (C, Uint32);

   type Uint64 is mod 2**64;
   for Uint64'Size use 64;
   pragma Convention (C, Uint64);

   type Sint8 is range -2**7 .. 2**7 - 1;
   for Sint8'Size use 8;
   pragma Convention (C, Sint8);

   type Sint16 is range -2**15 .. 2**15 - 1;
   for Sint16'Size use 16;
   pragma Convention (C, Sint16);

   type Sint32 is range -2**31 .. 2**31 - 1;
   for Sint32'Size use 32;
   pragma Convention (C, Sint32);

   type Sint64 is range -2**63 .. 2**63 - 1;
   for Sint64'Size use 64;
   pragma Convention (C, Sint64);

   ----------------------------------------------------------------------------
   -- SDL_version.h
   ----------------------------------------------------------------------------

   SDL_MAJOR_VERSION : constant Uint8 := 2;
   SDL_MINOR_VERSION : constant Uint8 := 0;
   SDL_PATCHLEVEL    : constant Uint8 := 8;

   type SDL_version is record
      major : aliased Uint8;
      minor : aliased Uint8;
      patch : aliased Uint8;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_version);

   -- Renamed macro SDL_VERSION to SDL_SOURCEVERSION
   -- because of name clash.
   procedure SDL_SOURCEVERSION (x : access SDL_version);
   pragma Inline (SDL_SOURCEVERSION);

   --function SDL_VERSIONNUM (X, Y, Z : Uint8) return C.int;
   --pragma Inline (SDL_VERSIONNUM);

   function SDL_COMPILEDVERSION return C.int;
   pragma Inline (SDL_COMPILEDVERSION);

   procedure SDL_GetVersion (ver : access SDL_version);
   pragma Import (C, SDL_GetVersion, "SDL_GetVersion");


   --function SDL_VERSION_ATLEAST (X, Y, Z : Uint8) return SDL_bool;
   --pragma Inline (SDL_VERSION_ATLEAST);
   ----------------------------------------------------------------------------
   -- SDL.h
   ----------------------------------------------------------------------------

   SDL_INIT_TIMER          : constant Uint32 := 1;
   SDL_INIT_AUDIO          : constant Uint32 := 16;
   SDL_INIT_VIDEO          : constant Uint32 := 32;
   SDL_INIT_JOYSTICK       : constant Uint32 := 512;
   SDL_INIT_HAPTIC         : constant Uint32 := 4096;
   SDL_INIT_GAMECONTROLLER : constant Uint32 := 8192;
   SDL_INIT_EVENTS         : constant Uint32 := 16384;
   --SDL_INIT_EVERYTHING     : constant Uint32 := 29233;
   SDL_INIT_NOPARACHUTE : constant := 16#00100000#;  --  SDL.h:83

   function SDL_Init (flags : Uint32) return C.int;
   pragma Import (C, SDL_Init, "SDL_Init");

   procedure SDL_Quit;
   pragma Import (C, SDL_Quit, "SDL_Quit");



   ----------------------------------------------------------------------------
   -- SDL_error.h
   ----------------------------------------------------------------------------

   procedure SDL_SetError (error : C.char_array);
   pragma Import (C, SDL_SetError, "SDL_SetError");

   function SDL_GetError return C.Strings.chars_ptr;
   pragma Import (C, SDL_GetError, "SDL_GetError");

   procedure SDL_ClearError;
   pragma Import (C, SDL_ClearError, "SDL_ClearError");



   ----------------------------------------------------------------------------
   -- SDL_timer.h
   ----------------------------------------------------------------------------

   subtype SDL_TimerID is C.int;

   type SDL_TimerCallback is access function
     (interval : Uint32;
      param    : System.Address) return Uint32;
   pragma Convention (C, SDL_TimerCallback);

   function SDL_GetTicks return Uint32;
   pragma Import (C, SDL_GetTicks, "SDL_GetTicks");




   ----------------------------------------------------------------------------
   -- SDL_hints.h
   ----------------------------------------------------------------------------

   SDL_HINT_FRAMEBUFFER_ACCELERATION : aliased constant C.char_array :=
     C.To_C ("SDL_FRAMEBUFFER_ACCELERATION");

   SDL_HINT_RENDER_DRIVER : aliased constant C.char_array :=
     C.To_C ("SDL_RENDER_DRIVER");

   SDL_HINT_RENDER_OPENGL_SHADERS : aliased constant C.char_array :=
     C.To_C ("SDL_RENDER_OPENGL_SHADERS");

   SDL_HINT_RENDER_DIRECT3D_THREADSAFE : aliased constant C.char_array :=
     C.To_C ("SDL_RENDER_DIRECT3D_THREADSAFE");

   SDL_HINT_RENDER_SCALE_QUALITY : aliased constant C.char_array :=
     C.To_C ("SDL_RENDER_SCALE_QUALITY");

   SDL_HINT_RENDER_VSYNC : aliased constant C.char_array :=
     C.To_C ("SDL_RENDER_VSYNC");

   SDL_HINT_VIDEO_ALLOW_SCREENSAVER : aliased constant C.char_array :=
     C.To_C ("SDL_VIDEO_ALLOW_SCREENSAVER");

   SDL_HINT_VIDEO_X11_XVIDMODE : aliased constant C.char_array :=
     C.To_C ("SDL_VIDEO_X11_XVIDMODE");

   SDL_HINT_VIDEO_X11_XINERAMA : aliased constant C.char_array :=
     C.To_C ("SDL_VIDEO_X11_XINERAMA");

   SDL_HINT_VIDEO_X11_XRANDR : aliased constant C.char_array :=
     C.To_C ("SDL_VIDEO_X11_XRANDR");

   SDL_HINT_GRAB_KEYBOARD : aliased constant Interfaces.C.char_array :=
     Interfaces.C.To_C ("SDL_GRAB_KEYBOARD");

   SDL_HINT_MOUSE_RELATIVE_MODE_WARP : aliased constant C.char_array :=
     C.To_C ("SDL_MOUSE_RELATIVE_MODE_WARP");

   SDL_HINT_VIDEO_MINIMIZE_ON_FOCUS_LOSS : aliased constant C.char_array :=
     C.To_C ("SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS");

   SDL_HINT_IDLE_TIMER_DISABLED : aliased constant C.char_array :=
     C.To_C ("SDL_IOS_IDLE_TIMER_DISABLED");

   SDL_HINT_ORIENTATIONS : aliased constant C.char_array :=
     C.To_C ("SDL_IOS_ORIENTATIONS");

   SDL_HINT_ACCELEROMETER_AS_JOYSTICK : aliased constant C.char_array :=
     C.To_C ("SDL_ACCELEROMETER_AS_JOYSTICK");

   SDL_HINT_XINPUT_ENABLED : aliased constant C.char_array :=
     C.To_C ("SDL_XINPUT_ENABLED");

   SDL_HINT_GAMECONTROLLERCONFIG : aliased constant C.char_array :=
     C.To_C ("SDL_GAMECONTROLLERCONFIG");

   SDL_HINT_JOYSTICK_ALLOW_BACKGROUND_EVENTS : aliased constant C.char_array :=
     C.To_C ("SDL_JOYSTICK_ALLOW_BACKGROUND_EVENTS");

   SDL_HINT_ALLOW_TOPMOST : aliased constant C.char_array :=
     C.To_C ("SDL_ALLOW_TOPMOST");

   SDL_HINT_TIMER_RESOLUTION : aliased constant C.char_array :=
     C.To_C ("SDL_TIMER_RESOLUTION");

   SDL_HINT_VIDEO_HIGHDPI_DISABLED : aliased constant C.char_array :=
     C.To_C ("SDL_VIDEO_HIGHDPI_DISABLED");

   SDL_HINT_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK : aliased constant C
     .char_array :=
     C.To_C ("SDL_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK");

   SDL_HINT_VIDEO_WIN_D3DCOMPILER : aliased constant C.char_array :=
     C.To_C ("SDL_VIDEO_WIN_D3DCOMPILER");

   SDL_HINT_VIDEO_WINDOW_SHARE_PIXEL_FORMAT : aliased constant C.char_array :=
     C.To_C ("SDL_VIDEO_WINDOW_SHARE_PIXEL_FORMAT");

   SDL_HINT_VIDEO_MAC_FULLSCREEN_SPACES : aliased constant C.char_array :=
     C.To_C ("SDL_VIDEO_MAC_FULLSCREEN_SPACES");

   type SDL_HintPriority is
     (SDL_HINT_DEFAULT, SDL_HINT_NORMAL, SDL_HINT_OVERRIDE);
   pragma Convention (C, SDL_HintPriority);


-- rgv
--
-- note that AdaCore g++ suggested using
-- String.chars_ptr rather than char_array
-- which is used below,
-- but I verified that "char * variableName"
-- indeed maps to Interfaces.C.char_array.
--
-- EG for next ftn... "value" is declared in c++ as:
-- const char * value
-- which probably maps to char_array just fine.



   function SDL_SetHintWithPriority
     (name     : Interfaces.C.char_array;
      value    : Interfaces.C.char_array;
      priority : SDL_HintPriority) return SDL_bool;
   pragma Import (C, SDL_SetHintWithPriority, "SDL_SetHintWithPriority");

   function SDL_SetHint
     (name  : Interfaces.C.char_array;
      value : Interfaces.C.char_array) return SDL_bool;
   pragma Import (C, SDL_SetHint, "SDL_SetHint");

   function SDL_GetHint
     (name : Interfaces.C.char_array) return C.Strings.chars_ptr;
   pragma Import (C, SDL_GetHint, "SDL_GetHint");


   ----------------------------------------------------------------------------
   -- SDL_rwops.h
   ----------------------------------------------------------------------------

   SDL_RWOPS_UNKNOWN   : constant Uint32 := 0;
   SDL_RWOPS_WINFILE   : constant Uint32 := 1;
   SDL_RWOPS_STDFILE   : constant Uint32 := 2;
   SDL_RWOPS_JNIFILE   : constant Uint32 := 3;
   SDL_RWOPS_MEMORY    : constant Uint32 := 4;
   SDL_RWOPS_MEMORY_RO : constant Uint32 := 5;

   RW_SEEK_SET : constant := 0;
   RW_SEEK_CUR : constant := 1;
   RW_SEEK_END : constant := 2;

   type SDL_RWops is record
      size : access function (context : access SDL_RWops) return Sint64;
      seek : access function
        (context : access SDL_RWops;
         offset  : Sint64;
         whence  : C.int) return Sint64;
      read : access function
        (context : access SDL_RWops;
         ptr     : System.Address;
         size    : C.size_t;
         maxnum  : C.size_t) return C.size_t;
      write : access function
        (context : access SDL_RWops;
         ptr     : System.Address;
         size    : C.size_t;
         num     : C.size_t) return C.size_t;
      close : access function (context : access SDL_RWops) return C.int;
      typ   : aliased Uint32;
      --  The rest of the struct is not included
      --  they are system specific
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_RWops);





   ----------------------------------------------------------------------------
   -- SDL_rect.h
   ----------------------------------------------------------------------------

   type SDL_Point is record
      x : aliased C.int;
      y : aliased C.int;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_Point);

   type SDL_PointArray is array (C.size_t range <>) of aliased SDL_Point;
   pragma Convention (C, SDL_PointArray);

   type SDL_Rect is record
      x : aliased C.int;
      y : aliased C.int;
      w : aliased C.int;
      h : aliased C.int;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_Rect);

   type SDL_RectArray is array (C.size_t range <>) of aliased SDL_Rect;
   pragma Convention (C, SDL_RectArray);

   ----------------------------------------------------------------------------
   -- SDL_pixels.h
   ----------------------------------------------------------------------------

   SDL_PIXELTYPE_UNKNOWN  : constant := 0;
   SDL_PIXELTYPE_INDEX1   : constant := 1;
   SDL_PIXELTYPE_INDEX4   : constant := 2;
   SDL_PIXELTYPE_INDEX8   : constant := 3;
   SDL_PIXELTYPE_PACKED8  : constant := 4;
   SDL_PIXELTYPE_PACKED16 : constant := 5;
   SDL_PIXELTYPE_PACKED32 : constant := 6;
   SDL_PIXELTYPE_ARRAYU8  : constant := 7;
   SDL_PIXELTYPE_ARRAYU16 : constant := 8;
   SDL_PIXELTYPE_ARRAYU32 : constant := 9;
   SDL_PIXELTYPE_ARRAYF16 : constant := 10;
   SDL_PIXELTYPE_ARRAYF32 : constant := 11;

   SDL_BITMAPORDER_NONE : constant := 0;
   SDL_BITMAPORDER_4321 : constant := 1;
   SDL_BITMAPORDER_1234 : constant := 2;

   SDL_PACKEDORDER_NONE : constant := 0;
   SDL_PACKEDORDER_XRGB : constant := 1;
   SDL_PACKEDORDER_RGBX : constant := 2;
   SDL_PACKEDORDER_ARGB : constant := 3;
   SDL_PACKEDORDER_RGBA : constant := 4;
   SDL_PACKEDORDER_XBGR : constant := 5;
   SDL_PACKEDORDER_BGRX : constant := 6;
   SDL_PACKEDORDER_ABGR : constant := 7;
   SDL_PACKEDORDER_BGRA : constant := 8;

   SDL_ARRAYORDER_NONE : constant := 0;
   SDL_ARRAYORDER_RGB  : constant := 1;
   SDL_ARRAYORDER_RGBA : constant := 2;
   SDL_ARRAYORDER_ARGB : constant := 3;
   SDL_ARRAYORDER_BGR  : constant := 4;
   SDL_ARRAYORDER_BGRA : constant := 5;
   SDL_ARRAYORDER_ABGR : constant := 6;

   SDL_PACKEDLAYOUT_NONE    : constant := 0;
   SDL_PACKEDLAYOUT_332     : constant := 1;
   SDL_PACKEDLAYOUT_4444    : constant := 2;
   SDL_PACKEDLAYOUT_1555    : constant := 3;
   SDL_PACKEDLAYOUT_5551    : constant := 4;
   SDL_PACKEDLAYOUT_565     : constant := 5;
   SDL_PACKEDLAYOUT_8888    : constant := 6;
   SDL_PACKEDLAYOUT_2101010 : constant := 7;
   SDL_PACKEDLAYOUT_1010102 : constant := 8;

   -- function SDL_DEFINE_PIXELFOURCC
   --   (A : C.int;
   --    B : C.int;
   --    C : C.int;
   --    D : C.int) return Uint32;


   SDL_PIXELFORMAT_UNKNOWN     : constant Uint32 := 0;
   SDL_PIXELFORMAT_INDEX1LSB   : constant Uint32 := 286261504;
   SDL_PIXELFORMAT_INDEX1MSB   : constant Uint32 := 287310080;
   SDL_PIXELFORMAT_INDEX4LSB   : constant Uint32 := 303039488;
   SDL_PIXELFORMAT_INDEX4MSB   : constant Uint32 := 304088064;
   SDL_PIXELFORMAT_INDEX8      : constant Uint32 := 318769153;
   SDL_PIXELFORMAT_RGB332      : constant Uint32 := 336660481;
   SDL_PIXELFORMAT_RGB444      : constant Uint32 := 353504258;
   SDL_PIXELFORMAT_RGB555      : constant Uint32 := 353570562;
   SDL_PIXELFORMAT_BGR555      : constant Uint32 := 357764866;
   SDL_PIXELFORMAT_ARGB4444    : constant Uint32 := 355602434;
   SDL_PIXELFORMAT_RGBA4444    : constant Uint32 := 356651010;
   SDL_PIXELFORMAT_ABGR4444    : constant Uint32 := 359796738;
   SDL_PIXELFORMAT_BGRA4444    : constant Uint32 := 360845314;
   SDL_PIXELFORMAT_ARGB1555    : constant Uint32 := 355667970;
   SDL_PIXELFORMAT_RGBA5551    : constant Uint32 := 356782082;
   SDL_PIXELFORMAT_ABGR1555    : constant Uint32 := 359862274;
   SDL_PIXELFORMAT_BGRA5551    : constant Uint32 := 360976386;
   SDL_PIXELFORMAT_RGB565      : constant Uint32 := 353701890;
   SDL_PIXELFORMAT_BGR565      : constant Uint32 := 357896194;
   SDL_PIXELFORMAT_RGB24       : constant Uint32 := 386930691;
   SDL_PIXELFORMAT_BGR24       : constant Uint32 := 390076419;
   SDL_PIXELFORMAT_RGB888      : constant Uint32 := 370546692;
   SDL_PIXELFORMAT_RGBX8888    : constant Uint32 := 371595268;
   SDL_PIXELFORMAT_BGR888      : constant Uint32 := 374740996;
   SDL_PIXELFORMAT_BGRX8888    : constant Uint32 := 375789572;
   SDL_PIXELFORMAT_ARGB8888    : constant Uint32 := 372645892;
   SDL_PIXELFORMAT_RGBA8888    : constant Uint32 := 373694468;
   SDL_PIXELFORMAT_ABGR8888    : constant Uint32 := 376840196;
   SDL_PIXELFORMAT_BGRA8888    : constant Uint32 := 377888772;
   SDL_PIXELFORMAT_ARGB2101010 : constant Uint32 := 372711428;
   SDL_PIXELFORMAT_YV12        : constant Uint32 := 842094169;
   SDL_PIXELFORMAT_IYUV        : constant Uint32 := 1448433993;
   SDL_PIXELFORMAT_YUY2        : constant Uint32 := 844715353;
   SDL_PIXELFORMAT_UYVY        : constant Uint32 := 1498831189;
   SDL_PIXELFORMAT_YVYU        : constant Uint32 := 1431918169;

   type SDL_Color is record
      r : aliased Uint8;
      g : aliased Uint8;
      b : aliased Uint8;
      a : aliased Uint8;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_Color);

   type SDL_Palette is record
      ncolors  : aliased C.int;
      colors   : access SDL_Color;
      version  : aliased Uint32;
      refcount : aliased C.int;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_Palette);

   type SDL_PixelFormat_padding_array is array (0 .. 1) of aliased Uint8;
   type SDL_PixelFormat is record
      format        : aliased Uint32;
      palette       : access SDL_Palette;
      BitsPerPixel  : aliased Uint8;
      BytesPerPixel : aliased Uint8;
      padding       : aliased SDL_PixelFormat_padding_array;
      Rmask         : aliased Uint32;
      Gmask         : aliased Uint32;
      Bmask         : aliased Uint32;
      Amask         : aliased Uint32;
      Rloss         : aliased Uint8;
      Gloss         : aliased Uint8;
      Bloss         : aliased Uint8;
      Aloss         : aliased Uint8;
      Rshift        : aliased Uint8;
      Gshift        : aliased Uint8;
      Bshift        : aliased Uint8;
      Ashift        : aliased Uint8;
      refcount      : aliased C.int;
      next          : access SDL_PixelFormat;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_PixelFormat);



   ----------------------------------------------------------------------------
   -- SDL_blendmode.h
   ----------------------------------------------------------------------------

   subtype SDL_BlendMode is C.int;
   SDL_BLENDMODE_NONE  : constant SDL_BlendMode := 0;
   SDL_BLENDMODE_BLEND : constant SDL_BlendMode := 1;
   SDL_BLENDMODE_ADD   : constant SDL_BlendMode := 2;
   SDL_BLENDMODE_MOD   : constant SDL_BlendMode := 4;



	----------------------------------------------------------------------------
   ----------------------------------------------------------------------------
   -- SDL_surface.h
   ----------------------------------------------------------------------------
   ----------------------------------------------------------------------------

   SDL_SWSURFACE : constant := 0;
   SDL_PREALLOC  : constant := 16#00000001#;
   SDL_RLEACCEL  : constant := 16#00000002#;
   SDL_DONTFREE  : constant := 16#00000004#;

   type SDL_Surface is record
      flags     : aliased Uint32;
      format    : access SDL_PixelFormat;
      w         : aliased C.int;
      h         : aliased C.int;
      pitch     : aliased C.int;
      pixels    : aliased System.Address;
      userdata  : aliased System.Address;
      locked    : aliased C.int;
      lock_data : aliased System.Address;
      clip_rect : aliased SDL_Rect;
      map       : aliased System.Address;
      refcount  : aliased C.int;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_Surface);




   ----------------------------------------------------------------------------
   -- SDL_video.h
   ----------------------------------------------------------------------------

   subtype SDL_Window is System.Address;
   subtype SDL_GLContext is System.Address;

   type SDL_DisplayMode is record
      format       : aliased Uint32;
      w            : aliased C.int;
      h            : aliased C.int;
      refresh_rate : aliased C.int;
      driverdata   : aliased System.Address;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_DisplayMode);

   subtype SDL_WindowFlags is Uint32;
   SDL_WINDOW_FULLSCREEN         : constant SDL_WindowFlags := 1;
   SDL_WINDOW_OPENGL             : constant SDL_WindowFlags := 2;
   SDL_WINDOW_SHOWN              : constant SDL_WindowFlags := 4;
   SDL_WINDOW_HIDDEN             : constant SDL_WindowFlags := 8;
   SDL_WINDOW_BORDERLESS         : constant SDL_WindowFlags := 16;
   SDL_WINDOW_RESIZABLE          : constant SDL_WindowFlags := 32;
   SDL_WINDOW_MINIMIZED          : constant SDL_WindowFlags := 64;
   SDL_WINDOW_MAXIMIZED          : constant SDL_WindowFlags := 128;
   SDL_WINDOW_INPUT_GRABBED      : constant SDL_WindowFlags := 256;
   SDL_WINDOW_INPUT_FOCUS        : constant SDL_WindowFlags := 512;
   SDL_WINDOW_MOUSE_FOCUS        : constant SDL_WindowFlags := 1024;
   SDL_WINDOW_FULLSCREEN_DESKTOP : constant SDL_WindowFlags := 4097;
   SDL_WINDOW_FOREIGN            : constant SDL_WindowFlags := 2048;
   SDL_WINDOW_ALLOW_HIGHDPI      : constant SDL_WindowFlags := 8192;

   subtype SDL_WindowEventID is Uint8;
   SDL_WINDOWEVENT_NONE         : constant SDL_WindowEventID := 0;
   SDL_WINDOWEVENT_SHOWN        : constant SDL_WindowEventID := 1;
   SDL_WINDOWEVENT_HIDDEN       : constant SDL_WindowEventID := 2;
   SDL_WINDOWEVENT_EXPOSED      : constant SDL_WindowEventID := 3;
   SDL_WINDOWEVENT_MOVED        : constant SDL_WindowEventID := 4;
   SDL_WINDOWEVENT_RESIZED      : constant SDL_WindowEventID := 5;
   SDL_WINDOWEVENT_SIZE_CHANGED : constant SDL_WindowEventID := 6;
   SDL_WINDOWEVENT_MINIMIZED    : constant SDL_WindowEventID := 7;
   SDL_WINDOWEVENT_MAXIMIZED    : constant SDL_WindowEventID := 8;
   SDL_WINDOWEVENT_RESTORED     : constant SDL_WindowEventID := 9;
   SDL_WINDOWEVENT_ENTER        : constant SDL_WindowEventID := 10;
   SDL_WINDOWEVENT_LEAVE        : constant SDL_WindowEventID := 11;
   SDL_WINDOWEVENT_FOCUS_GAINED : constant SDL_WindowEventID := 12;
   SDL_WINDOWEVENT_FOCUS_LOST   : constant SDL_WindowEventID := 13;
   SDL_WINDOWEVENT_CLOSE        : constant SDL_WindowEventID := 14;

   type SDL_GLattr is
     (SDL_GL_RED_SIZE,
      SDL_GL_GREEN_SIZE,
      SDL_GL_BLUE_SIZE,
      SDL_GL_ALPHA_SIZE,
      SDL_GL_BUFFER_SIZE,
      SDL_GL_DOUBLEBUFFER,
      SDL_GL_DEPTH_SIZE,
      SDL_GL_STENCIL_SIZE,
      SDL_GL_ACCUM_RED_SIZE,
      SDL_GL_ACCUM_GREEN_SIZE,
      SDL_GL_ACCUM_BLUE_SIZE,
      SDL_GL_ACCUM_ALPHA_SIZE,
      SDL_GL_STEREO,
      SDL_GL_MULTISAMPLEBUFFERS,
      SDL_GL_MULTISAMPLESAMPLES,
      SDL_GL_ACCELERATED_VISUAL,
      SDL_GL_RETAINED_BACKING,
      SDL_GL_CONTEXT_MAJOR_VERSION,
      SDL_GL_CONTEXT_MINOR_VERSION,
      SDL_GL_CONTEXT_EGL,
      SDL_GL_CONTEXT_FLAGS,
      SDL_GL_CONTEXT_PROFILE_MASK,
      SDL_GL_SHARE_WITH_CURRENT_CONTEXT,
      SDL_GL_FRAMEBUFFER_SRGB_CAPABLE);
   pragma Convention (C, SDL_GLattr);

   subtype SDL_GLprofile is Uint32; --C.int; rgv
   SDL_GL_CONTEXT_PROFILE_CORE          : constant SDL_GLprofile := 1;
   SDL_GL_CONTEXT_PROFILE_COMPATIBILITY : constant SDL_GLprofile := 2;
   SDL_GL_CONTEXT_PROFILE_ES            : constant SDL_GLprofile := 4;

   subtype SDL_GLcontextFlag is Uint32; --C.int; rgv
   SDL_GL_CONTEXT_DEBUG_FLAG              : constant SDL_GLcontextFlag := 1;
   SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG : constant SDL_GLcontextFlag := 2;
   SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG      : constant SDL_GLcontextFlag := 4;
   SDL_GL_CONTEXT_RESET_ISOLATION_FLAG    : constant SDL_GLcontextFlag := 8;

   SDL_WINDOWPOS_UNDEFINED_MASK : constant := 16#1FFF0000#;
   SDL_WINDOWPOS_CENTERED_MASK  : constant := 16#2FFF0000#;

   function SDL_WINDOWPOS_UNDEFINED_DISPLAY (X : C.int) return C.int;
   pragma Inline (SDL_WINDOWPOS_UNDEFINED_DISPLAY);

   function SDL_WINDOWPOS_UNDEFINED return C.int;
   pragma Inline (SDL_WINDOWPOS_UNDEFINED);

   function SDL_WINDOWPOS_ISUNDEFINED (X : C.int) return SDL_bool;
   pragma Inline (SDL_WINDOWPOS_ISUNDEFINED);

   function SDL_WINDOWPOS_CENTERED_DISPLAY (X : C.int) return C.int;
   pragma Inline (SDL_WINDOWPOS_CENTERED_DISPLAY);

   function SDL_WINDOWPOS_CENTERED return C.int;
   pragma Inline (SDL_WINDOWPOS_CENTERED);

   function SDL_WINDOWPOS_ISCENTERED (X : C.int) return SDL_bool;
   pragma Inline (SDL_WINDOWPOS_ISCENTERED);

   function SDL_GetNumVideoDrivers return C.int;
   pragma Import (C, SDL_GetNumVideoDrivers, "SDL_GetNumVideoDrivers");

   function SDL_GetVideoDriver (index : C.int) return C.Strings.chars_ptr;
   pragma Import (C, SDL_GetVideoDriver, "SDL_GetVideoDriver");

   function SDL_VideoInit (driver_name : C.char_array) return C.int;
   pragma Import (C, SDL_VideoInit, "SDL_VideoInit");

   procedure SDL_VideoQuit;
   pragma Import (C, SDL_VideoQuit, "SDL_VideoQuit");

   function SDL_GetCurrentVideoDriver return C.Strings.chars_ptr;
   pragma Import (C, SDL_GetCurrentVideoDriver, "SDL_GetCurrentVideoDriver");

   function SDL_GetNumVideoDisplays return C.int;
   pragma Import (C, SDL_GetNumVideoDisplays, "SDL_GetNumVideoDisplays");

   function SDL_GetDisplayName
     (displayIndex : C.int) return C.Strings.chars_ptr;
   pragma Import (C, SDL_GetDisplayName, "SDL_GetDisplayName");

   function SDL_GetDisplayBounds
     (displayIndex : C.int;
      rect         : access SDL_Rect) return C.int;
   pragma Import (C, SDL_GetDisplayBounds, "SDL_GetDisplayBounds");

   function SDL_GetNumDisplayModes (displayIndex : C.int) return C.int;
   pragma Import (C, SDL_GetNumDisplayModes, "SDL_GetNumDisplayModes");

   function SDL_GetDisplayMode
     (displayIndex : C.int;
      modeIndex    : C.int;
      mode         : access SDL_DisplayMode) return C.int;
   pragma Import (C, SDL_GetDisplayMode, "SDL_GetDisplayMode");

   function SDL_GetDesktopDisplayMode
     (displayIndex : C.int;
      mode         : access SDL_DisplayMode) return C.int;
   pragma Import (C, SDL_GetDesktopDisplayMode, "SDL_GetDesktopDisplayMode");

   function SDL_GetCurrentDisplayMode
     (displayIndex : C.int;
      mode         : access SDL_DisplayMode) return C.int;
   pragma Import (C, SDL_GetCurrentDisplayMode, "SDL_GetCurrentDisplayMode");

   function SDL_GetClosestDisplayMode
     (displayIndex : C.int;
      mode         : access SDL_DisplayMode;
      closest      : access SDL_DisplayMode) return access SDL_DisplayMode;
   pragma Import (C, SDL_GetClosestDisplayMode, "SDL_GetClosestDisplayMode");

   function SDL_GetWindowDisplayIndex
     (window : access SDL_Window) return C.int;
   pragma Import (C, SDL_GetWindowDisplayIndex, "SDL_GetWindowDisplayIndex");

   function SDL_SetWindowDisplayMode
     (window : access SDL_Window;
      mode   : access SDL_DisplayMode) return C.int;
   pragma Import (C, SDL_SetWindowDisplayMode, "SDL_SetWindowDisplayMode");

   function SDL_GetWindowDisplayMode
     (window : access SDL_Window;
      mode   : access SDL_DisplayMode) return C.int;
   pragma Import (C, SDL_GetWindowDisplayMode, "SDL_GetWindowDisplayMode");

	-- note that:
   -- subtype SDL_Window is System.Address;
	--
	--if fails try this:
   --function SDL_GetWindowPixelFormat(window : system.address) return Uint32;
   function SDL_GetWindowPixelFormat(window : access SDL_Window) return Uint32;
   pragma Import (C, SDL_GetWindowPixelFormat, "SDL_GetWindowPixelFormat");



   function SDL_CreateWindow
     (title : C.char_array;
      x     : C.int;
      y     : C.int;
      w     : C.int;
      h     : C.int;
      flags : Uint32) return access SDL_Window;
   pragma Import (C, SDL_CreateWindow, "SDL_CreateWindow");

   function SDL_CreateWindowFrom
     (data : System.Address) return access SDL_Window;
   pragma Import (C, SDL_CreateWindowFrom, "SDL_CreateWindowFrom");

   function SDL_GetWindowID (window : access SDL_Window) return Uint32;
   pragma Import (C, SDL_GetWindowID, "SDL_GetWindowID");

   function SDL_GetWindowFromID (id : Uint32) return access SDL_Window;
   pragma Import (C, SDL_GetWindowFromID, "SDL_GetWindowFromID");

   function SDL_GetWindowFlags (window : access SDL_Window) return Uint32;
   pragma Import (C, SDL_GetWindowFlags, "SDL_GetWindowFlags");

	--if fail, try this:
   --procedure SDL_SetWindowTitle
     --(window : system.address;
      --title  : C.char_array);
   procedure SDL_SetWindowTitle
     (window : access SDL_Window;
      title  : C.char_array);
   pragma Import (C, SDL_SetWindowTitle, "SDL_SetWindowTitle");

   function SDL_GetWindowTitle
     (window : access SDL_Window) return C.Strings.chars_ptr;
   pragma Import (C, SDL_GetWindowTitle, "SDL_GetWindowTitle");

   procedure SDL_SetWindowIcon
     (window : access SDL_Window;
      icon   : access SDL_Surface);
   pragma Import (C, SDL_SetWindowIcon, "SDL_SetWindowIcon");

   function SDL_SetWindowData
     (window   : access SDL_Window;
      name     : C.char_array;
      userdata : System.Address) return System.Address;
   pragma Import (C, SDL_SetWindowData, "SDL_SetWindowData");

   function SDL_GetWindowData
     (window : access SDL_Window;
      name   : C.char_array) return System.Address;
   pragma Import (C, SDL_GetWindowData, "SDL_GetWindowData");

   procedure SDL_SetWindowPosition
     (window : access SDL_Window;
      x      : C.int;
      y      : C.int);
   pragma Import (C, SDL_SetWindowPosition, "SDL_SetWindowPosition");

   procedure SDL_GetWindowPosition
     (window : access SDL_Window;
      x      : access C.int;
      y      : access C.int);
   pragma Import (C, SDL_GetWindowPosition, "SDL_GetWindowPosition");

   procedure SDL_SetWindowSize
     (window : access SDL_Window;
      w      : C.int;
      h      : C.int);
   pragma Import (C, SDL_SetWindowSize, "SDL_SetWindowSize");

   procedure SDL_GetWindowSize
     (window : access SDL_Window;
      w      : access C.int;
      h      : access C.int);
   pragma Import (C, SDL_GetWindowSize, "SDL_GetWindowSize");

   procedure SDL_SetWindowMinimumSize
     (window : access SDL_Window;
      min_w  : C.int;
      min_h  : C.int);
   pragma Import (C, SDL_SetWindowMinimumSize, "SDL_SetWindowMinimumSize");

   procedure SDL_GetWindowMinimumSize
     (window : access SDL_Window;
      w      : access C.int;
      h      : access C.int);
   pragma Import (C, SDL_GetWindowMinimumSize, "SDL_GetWindowMinimumSize");

   procedure SDL_SetWindowMaximumSize
     (window : access SDL_Window;
      max_w  : C.int;
      max_h  : C.int);
   pragma Import (C, SDL_SetWindowMaximumSize, "SDL_SetWindowMaximumSize");

   procedure SDL_GetWindowMaximumSize
     (window : access SDL_Window;
      w      : access C.int;
      h      : access C.int);
   pragma Import (C, SDL_GetWindowMaximumSize, "SDL_GetWindowMaximumSize");

   procedure SDL_SetWindowBordered
     (window   : access SDL_Window;
      bordered : SDL_bool);
   pragma Import (C, SDL_SetWindowBordered, "SDL_SetWindowBordered");

   procedure SDL_ShowWindow (window : access SDL_Window);
   pragma Import (C, SDL_ShowWindow, "SDL_ShowWindow");

   procedure SDL_HideWindow (window : access SDL_Window);
   pragma Import (C, SDL_HideWindow, "SDL_HideWindow");

   procedure SDL_RaiseWindow (window : access SDL_Window);
   pragma Import (C, SDL_RaiseWindow, "SDL_RaiseWindow");

   procedure SDL_MaximizeWindow (window : access SDL_Window);
   pragma Import (C, SDL_MaximizeWindow, "SDL_MaximizeWindow");

   procedure SDL_MinimizeWindow (window : access SDL_Window);
   pragma Import (C, SDL_MinimizeWindow, "SDL_MinimizeWindow");

   procedure SDL_RestoreWindow (window : access SDL_Window);
   pragma Import (C, SDL_RestoreWindow, "SDL_RestoreWindow");

   function SDL_SetWindowFullscreen
     (window : access SDL_Window;
      flags  : Uint32) return C.int;
   pragma Import (C, SDL_SetWindowFullscreen, "SDL_SetWindowFullscreen");

   function SDL_GetWindowSurface
     (window : access SDL_Window) return access SDL_Surface;
   pragma Import (C, SDL_GetWindowSurface, "SDL_GetWindowSurface");

   function SDL_UpdateWindowSurface (window : access SDL_Window) return C.int;
   pragma Import (C, SDL_UpdateWindowSurface, "SDL_UpdateWindowSurface");

   function SDL_UpdateWindowSurfaceRects
     (window   : access SDL_Window;
      rects    : access SDL_Rect;
      numrects : C.int) return C.int;
   pragma Import
     (C,
      SDL_UpdateWindowSurfaceRects,
      "SDL_UpdateWindowSurfaceRects");

   procedure SDL_SetWindowGrab
     (window  : access SDL_Window;
      grabbed : SDL_bool);
   pragma Import (C, SDL_SetWindowGrab, "SDL_SetWindowGrab");

   function SDL_GetWindowGrab (window : access SDL_Window) return SDL_bool;
   pragma Import (C, SDL_GetWindowGrab, "SDL_GetWindowGrab");

   function SDL_SetWindowBrightness
     (window     : access SDL_Window;
      brightness : C.C_float) return C.int;
   pragma Import (C, SDL_SetWindowBrightness, "SDL_SetWindowBrightness");

   function SDL_GetWindowBrightness
     (window : access SDL_Window) return C.C_float;
   pragma Import (C, SDL_GetWindowBrightness, "SDL_GetWindowBrightness");

   function SDL_SetWindowGammaRamp
     (window : access SDL_Window;
      red    : access Uint16;
      green  : access Uint16;
      blue   : access Uint16) return C.int;
   pragma Import (C, SDL_SetWindowGammaRamp, "SDL_SetWindowGammaRamp");

   function SDL_GetWindowGammaRamp
     (window : access SDL_Window;
      red    : access Uint16;
      green  : access Uint16;
      blue   : access Uint16) return C.int;
   pragma Import (C, SDL_GetWindowGammaRamp, "SDL_GetWindowGammaRamp");


-- the exact c++ declarations are:
-- typedef struct SDL_Window SDL_Window; //SDL_video.h ?WTF?
-- extern DECLSPEC void SDLCALL SDL_DestroyWindow(SDL_Window * window); //SDL_video.h

   -- subtype SDL_Window is System.Address;
	--if fail, try this:
   --procedure SDL_DestroyWindow (window : system.address);
   procedure SDL_DestroyWindow (window : access SDL_Window);
   pragma Import (C, SDL_DestroyWindow, "SDL_DestroyWindow");

   function SDL_IsScreenSaverEnabled return SDL_bool;
   pragma Import (C, SDL_IsScreenSaverEnabled, "SDL_IsScreenSaverEnabled");

   procedure SDL_EnableScreenSaver;
   pragma Import (C, SDL_EnableScreenSaver, "SDL_EnableScreenSaver");

   procedure SDL_DisableScreenSaver;
   pragma Import (C, SDL_DisableScreenSaver, "SDL_DisableScreenSaver");

   function SDL_GL_LoadLibrary (path : C.char_array) return C.int;
   pragma Import (C, SDL_GL_LoadLibrary, "SDL_GL_LoadLibrary");

   function SDL_GL_GetProcAddress (proc : C.char_array) return System.Address;
   pragma Import (C, SDL_GL_GetProcAddress, "SDL_GL_GetProcAddress");

   procedure SDL_GL_UnloadLibrary;
   pragma Import (C, SDL_GL_UnloadLibrary, "SDL_GL_UnloadLibrary");

   function SDL_GL_ExtensionSupported(extension : C.char_array) return SDL_bool;
   pragma Import (C, SDL_GL_ExtensionSupported, "SDL_GL_ExtensionSupported");

   procedure SDL_GL_ResetAttributes;
   pragma Import (C, SDL_GL_ResetAttributes, "SDL_GL_ResetAttributes");

   function SDL_GL_SetAttribute
     (attr  : SDL_GLattr;
      value : Uint32) return C.int; -- rgv
      --value : C.int) return C.int;
   pragma Import (C, SDL_GL_SetAttribute, "SDL_GL_SetAttribute");

   function SDL_GL_GetAttribute
     (attr  : SDL_GLattr;
      value : access C.int) return C.int;
   pragma Import (C, SDL_GL_GetAttribute, "SDL_GL_GetAttribute");

	--if fail, try this:
   --function SDL_GL_CreateContext(window : system.address) return SDL_GLContext;
   function SDL_GL_CreateContext(window : access SDL_Window) return SDL_GLContext;
   pragma Import (C, SDL_GL_CreateContext, "SDL_GL_CreateContext");

	--if fail, try this
   --function SDL_GL_MakeCurrent
     --(window  : system.address;
      --context : SDL_GLContext) return C.int;
   function SDL_GL_MakeCurrent
     (window  : access SDL_Window;
      context : SDL_GLContext) return C.int;
   pragma Import (C, SDL_GL_MakeCurrent, "SDL_GL_MakeCurrent");

   function SDL_GL_GetCurrentWindow return access SDL_Window;
   pragma Import (C, SDL_GL_GetCurrentWindow, "SDL_GL_GetCurrentWindow");

   function SDL_GL_GetCurrentContext return SDL_GLContext;
   pragma Import (C, SDL_GL_GetCurrentContext, "SDL_GL_GetCurrentContext");

   procedure SDL_GL_GetDrawableSize
     (window : access SDL_Window;
      w      : access C.int;
      h      : access C.int);
   pragma Import (C, SDL_GL_GetDrawableSize, "SDL_GL_GetDrawableSize");

   function SDL_GL_SetSwapInterval (interval : C.int) return C.int;
   pragma Import (C, SDL_GL_SetSwapInterval, "SDL_GL_SetSwapInterval");

   function SDL_GL_GetSwapInterval return C.int;
   pragma Import (C, SDL_GL_GetSwapInterval, "SDL_GL_GetSwapInterval");

   procedure SDL_GL_SwapWindow (window : access SDL_Window);
   pragma Import (C, SDL_GL_SwapWindow, "SDL_GL_SwapWindow");

   procedure SDL_GL_DeleteContext (context : SDL_GLContext);
   pragma Import (C, SDL_GL_DeleteContext, "SDL_GL_DeleteContext");





   ----------------------------------------------------------------------------
   -- SDL_render.h
   ----------------------------------------------------------------------------

   subtype SDL_RendererFlags is Uint32;
   SDL_RENDERER_SOFTWARE      : constant SDL_RendererFlags := 1;
   SDL_RENDERER_ACCELERATED   : constant SDL_RendererFlags := 2;
   SDL_RENDERER_PRESENTVSYNC  : constant SDL_RendererFlags := 4;
   SDL_RENDERER_TARGETTEXTURE : constant SDL_RendererFlags := 8;

   type SDL_RendererInfo_texture_formats_array is
     array (0 .. 15) of aliased Uint32;
   type SDL_RendererInfo is record
      name                : aliased C.Strings.chars_ptr;
      flags               : aliased Uint32;
      num_texture_formats : aliased Uint32;
      texture_formats     : aliased SDL_RendererInfo_texture_formats_array;
      max_texture_width   : aliased C.int;
      max_texture_height  : aliased C.int;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_RendererInfo);

   type SDL_TextureAccess is
     (SDL_TEXTUREACCESS_STATIC,
      SDL_TEXTUREACCESS_STREAMING,
      SDL_TEXTUREACCESS_TARGET);
   pragma Convention (C, SDL_TextureAccess);

   type SDL_TextureModulate is
     (SDL_TEXTUREMODULATE_NONE,
      SDL_TEXTUREMODULATE_COLOR,
      SDL_TEXTUREMODULATE_ALPHA);
   pragma Convention (C, SDL_TextureModulate);

   type SDL_RendererFlip is
     (SDL_FLIP_NONE, SDL_FLIP_HORIZONTAL, SDL_FLIP_VERTICAL);
   pragma Convention (C, SDL_RendererFlip);

   subtype SDL_Renderer is System.Address;
   subtype SDL_Texture is System.Address;



















   ----------------------------------------------------------------------------
   -- SDL_scancode.h
   ----------------------------------------------------------------------------

   subtype SDL_Scancode is Uint32; --C.int;  rgv
   SDL_SCANCODE_UNKNOWN            : constant SDL_Scancode := 0;
   SDL_SCANCODE_A                  : constant SDL_Scancode := 4;
   SDL_SCANCODE_B                  : constant SDL_Scancode := 5;
   SDL_SCANCODE_C                  : constant SDL_Scancode := 6;
   SDL_SCANCODE_D                  : constant SDL_Scancode := 7;
   SDL_SCANCODE_E                  : constant SDL_Scancode := 8;
   SDL_SCANCODE_F                  : constant SDL_Scancode := 9;
   SDL_SCANCODE_G                  : constant SDL_Scancode := 10;
   SDL_SCANCODE_H                  : constant SDL_Scancode := 11;
   SDL_SCANCODE_I                  : constant SDL_Scancode := 12;
   SDL_SCANCODE_J                  : constant SDL_Scancode := 13;
   SDL_SCANCODE_K                  : constant SDL_Scancode := 14;
   SDL_SCANCODE_L                  : constant SDL_Scancode := 15;
   SDL_SCANCODE_M                  : constant SDL_Scancode := 16;
   SDL_SCANCODE_N                  : constant SDL_Scancode := 17;
   SDL_SCANCODE_O                  : constant SDL_Scancode := 18;
   SDL_SCANCODE_P                  : constant SDL_Scancode := 19;
   SDL_SCANCODE_Q                  : constant SDL_Scancode := 20;
   SDL_SCANCODE_R                  : constant SDL_Scancode := 21;
   SDL_SCANCODE_S                  : constant SDL_Scancode := 22;
   SDL_SCANCODE_T                  : constant SDL_Scancode := 23;
   SDL_SCANCODE_U                  : constant SDL_Scancode := 24;
   SDL_SCANCODE_V                  : constant SDL_Scancode := 25;
   SDL_SCANCODE_W                  : constant SDL_Scancode := 26;
   SDL_SCANCODE_X                  : constant SDL_Scancode := 27;
   SDL_SCANCODE_Y                  : constant SDL_Scancode := 28;
   SDL_SCANCODE_Z                  : constant SDL_Scancode := 29;
   SDL_SCANCODE_1                  : constant SDL_Scancode := 30;
   SDL_SCANCODE_2                  : constant SDL_Scancode := 31;
   SDL_SCANCODE_3                  : constant SDL_Scancode := 32;
   SDL_SCANCODE_4                  : constant SDL_Scancode := 33;
   SDL_SCANCODE_5                  : constant SDL_Scancode := 34;
   SDL_SCANCODE_6                  : constant SDL_Scancode := 35;
   SDL_SCANCODE_7                  : constant SDL_Scancode := 36;
   SDL_SCANCODE_8                  : constant SDL_Scancode := 37;
   SDL_SCANCODE_9                  : constant SDL_Scancode := 38;
   SDL_SCANCODE_0                  : constant SDL_Scancode := 39;
   SDL_SCANCODE_RETURN             : constant SDL_Scancode := 40;
   SDL_SCANCODE_ESCAPE             : constant SDL_Scancode := 41;
   SDL_SCANCODE_BACKSPACE          : constant SDL_Scancode := 42;
   SDL_SCANCODE_TAB                : constant SDL_Scancode := 43;
   SDL_SCANCODE_SPACE              : constant SDL_Scancode := 44;
   SDL_SCANCODE_MINUS              : constant SDL_Scancode := 45;
   SDL_SCANCODE_EQUALS             : constant SDL_Scancode := 46;
   SDL_SCANCODE_LEFTBRACKET        : constant SDL_Scancode := 47;
   SDL_SCANCODE_RIGHTBRACKET       : constant SDL_Scancode := 48;
   SDL_SCANCODE_BACKSLASH          : constant SDL_Scancode := 49;
   SDL_SCANCODE_NONUSHASH          : constant SDL_Scancode := 50;
   SDL_SCANCODE_SEMICOLON          : constant SDL_Scancode := 51;
   SDL_SCANCODE_APOSTROPHE         : constant SDL_Scancode := 52;
   SDL_SCANCODE_GRAVE              : constant SDL_Scancode := 53;
   SDL_SCANCODE_COMMA              : constant SDL_Scancode := 54;
   SDL_SCANCODE_PERIOD             : constant SDL_Scancode := 55;
   SDL_SCANCODE_SLASH              : constant SDL_Scancode := 56;
   SDL_SCANCODE_CAPSLOCK           : constant SDL_Scancode := 57;
   SDL_SCANCODE_F1                 : constant SDL_Scancode := 58;
   SDL_SCANCODE_F2                 : constant SDL_Scancode := 59;
   SDL_SCANCODE_F3                 : constant SDL_Scancode := 60;
   SDL_SCANCODE_F4                 : constant SDL_Scancode := 61;
   SDL_SCANCODE_F5                 : constant SDL_Scancode := 62;
   SDL_SCANCODE_F6                 : constant SDL_Scancode := 63;
   SDL_SCANCODE_F7                 : constant SDL_Scancode := 64;
   SDL_SCANCODE_F8                 : constant SDL_Scancode := 65;
   SDL_SCANCODE_F9                 : constant SDL_Scancode := 66;
   SDL_SCANCODE_F10                : constant SDL_Scancode := 67;
   SDL_SCANCODE_F11                : constant SDL_Scancode := 68;
   SDL_SCANCODE_F12                : constant SDL_Scancode := 69;
   SDL_SCANCODE_PRINTSCREEN        : constant SDL_Scancode := 70;
   SDL_SCANCODE_SCROLLLOCK         : constant SDL_Scancode := 71;
   SDL_SCANCODE_PAUSE              : constant SDL_Scancode := 72;
   SDL_SCANCODE_INSERT             : constant SDL_Scancode := 73;
   SDL_SCANCODE_HOME               : constant SDL_Scancode := 74;
   SDL_SCANCODE_PAGEUP             : constant SDL_Scancode := 75;
   SDL_SCANCODE_DELETE             : constant SDL_Scancode := 76;
   SDL_SCANCODE_END                : constant SDL_Scancode := 77;
   SDL_SCANCODE_PAGEDOWN           : constant SDL_Scancode := 78;
   SDL_SCANCODE_RIGHT              : constant SDL_Scancode := 79;
   SDL_SCANCODE_LEFT               : constant SDL_Scancode := 80;
   SDL_SCANCODE_DOWN               : constant SDL_Scancode := 81;
   SDL_SCANCODE_UP                 : constant SDL_Scancode := 82;
   SDL_SCANCODE_NUMLOCKCLEAR       : constant SDL_Scancode := 83;
   SDL_SCANCODE_KP_DIVIDE          : constant SDL_Scancode := 84;
   SDL_SCANCODE_KP_MULTIPLY        : constant SDL_Scancode := 85;
   SDL_SCANCODE_KP_MINUS           : constant SDL_Scancode := 86;
   SDL_SCANCODE_KP_PLUS            : constant SDL_Scancode := 87;
   SDL_SCANCODE_KP_ENTER           : constant SDL_Scancode := 88;
   SDL_SCANCODE_KP_1               : constant SDL_Scancode := 89;
   SDL_SCANCODE_KP_2               : constant SDL_Scancode := 90;
   SDL_SCANCODE_KP_3               : constant SDL_Scancode := 91;
   SDL_SCANCODE_KP_4               : constant SDL_Scancode := 92;
   SDL_SCANCODE_KP_5               : constant SDL_Scancode := 93;
   SDL_SCANCODE_KP_6               : constant SDL_Scancode := 94;
   SDL_SCANCODE_KP_7               : constant SDL_Scancode := 95;
   SDL_SCANCODE_KP_8               : constant SDL_Scancode := 96;
   SDL_SCANCODE_KP_9               : constant SDL_Scancode := 97;
   SDL_SCANCODE_KP_0               : constant SDL_Scancode := 98;
   SDL_SCANCODE_KP_PERIOD          : constant SDL_Scancode := 99;
   SDL_SCANCODE_NONUSBACKSLASH     : constant SDL_Scancode := 100;
   SDL_SCANCODE_APPLICATION        : constant SDL_Scancode := 101;
   SDL_SCANCODE_POWER              : constant SDL_Scancode := 102;
   SDL_SCANCODE_KP_EQUALS          : constant SDL_Scancode := 103;
   SDL_SCANCODE_F13                : constant SDL_Scancode := 104;
   SDL_SCANCODE_F14                : constant SDL_Scancode := 105;
   SDL_SCANCODE_F15                : constant SDL_Scancode := 106;
   SDL_SCANCODE_F16                : constant SDL_Scancode := 107;
   SDL_SCANCODE_F17                : constant SDL_Scancode := 108;
   SDL_SCANCODE_F18                : constant SDL_Scancode := 109;
   SDL_SCANCODE_F19                : constant SDL_Scancode := 110;
   SDL_SCANCODE_F20                : constant SDL_Scancode := 111;
   SDL_SCANCODE_F21                : constant SDL_Scancode := 112;
   SDL_SCANCODE_F22                : constant SDL_Scancode := 113;
   SDL_SCANCODE_F23                : constant SDL_Scancode := 114;
   SDL_SCANCODE_F24                : constant SDL_Scancode := 115;
   SDL_SCANCODE_EXECUTE            : constant SDL_Scancode := 116;
   SDL_SCANCODE_HELP               : constant SDL_Scancode := 117;
   SDL_SCANCODE_MENU               : constant SDL_Scancode := 118;
   SDL_SCANCODE_SELECT             : constant SDL_Scancode := 119;
   SDL_SCANCODE_STOP               : constant SDL_Scancode := 120;
   SDL_SCANCODE_AGAIN              : constant SDL_Scancode := 121;
   SDL_SCANCODE_UNDO               : constant SDL_Scancode := 122;
   SDL_SCANCODE_CUT                : constant SDL_Scancode := 123;
   SDL_SCANCODE_COPY               : constant SDL_Scancode := 124;
   SDL_SCANCODE_PASTE              : constant SDL_Scancode := 125;
   SDL_SCANCODE_FIND               : constant SDL_Scancode := 126;
   SDL_SCANCODE_MUTE               : constant SDL_Scancode := 127;
   SDL_SCANCODE_VOLUMEUP           : constant SDL_Scancode := 128;
   SDL_SCANCODE_VOLUMEDOWN         : constant SDL_Scancode := 129;
   SDL_SCANCODE_KP_COMMA           : constant SDL_Scancode := 133;
   SDL_SCANCODE_KP_EQUALSAS400     : constant SDL_Scancode := 134;
   SDL_SCANCODE_INTERNATIONAL1     : constant SDL_Scancode := 135;
   SDL_SCANCODE_INTERNATIONAL2     : constant SDL_Scancode := 136;
   SDL_SCANCODE_INTERNATIONAL3     : constant SDL_Scancode := 137;
   SDL_SCANCODE_INTERNATIONAL4     : constant SDL_Scancode := 138;
   SDL_SCANCODE_INTERNATIONAL5     : constant SDL_Scancode := 139;
   SDL_SCANCODE_INTERNATIONAL6     : constant SDL_Scancode := 140;
   SDL_SCANCODE_INTERNATIONAL7     : constant SDL_Scancode := 141;
   SDL_SCANCODE_INTERNATIONAL8     : constant SDL_Scancode := 142;
   SDL_SCANCODE_INTERNATIONAL9     : constant SDL_Scancode := 143;
   SDL_SCANCODE_LANG1              : constant SDL_Scancode := 144;
   SDL_SCANCODE_LANG2              : constant SDL_Scancode := 145;
   SDL_SCANCODE_LANG3              : constant SDL_Scancode := 146;
   SDL_SCANCODE_LANG4              : constant SDL_Scancode := 147;
   SDL_SCANCODE_LANG5              : constant SDL_Scancode := 148;
   SDL_SCANCODE_LANG6              : constant SDL_Scancode := 149;
   SDL_SCANCODE_LANG7              : constant SDL_Scancode := 150;
   SDL_SCANCODE_LANG8              : constant SDL_Scancode := 151;
   SDL_SCANCODE_LANG9              : constant SDL_Scancode := 152;
   SDL_SCANCODE_ALTERASE           : constant SDL_Scancode := 153;
   SDL_SCANCODE_SYSREQ             : constant SDL_Scancode := 154;
   SDL_SCANCODE_CANCEL             : constant SDL_Scancode := 155;
   SDL_SCANCODE_CLEAR              : constant SDL_Scancode := 156;
   SDL_SCANCODE_PRIOR              : constant SDL_Scancode := 157;
   SDL_SCANCODE_RETURN2            : constant SDL_Scancode := 158;
   SDL_SCANCODE_SEPARATOR          : constant SDL_Scancode := 159;
   SDL_SCANCODE_OUT                : constant SDL_Scancode := 160;
   SDL_SCANCODE_OPER               : constant SDL_Scancode := 161;
   SDL_SCANCODE_CLEARAGAIN         : constant SDL_Scancode := 162;
   SDL_SCANCODE_CRSEL              : constant SDL_Scancode := 163;
   SDL_SCANCODE_EXSEL              : constant SDL_Scancode := 164;
   SDL_SCANCODE_KP_00              : constant SDL_Scancode := 176;
   SDL_SCANCODE_KP_000             : constant SDL_Scancode := 177;
   SDL_SCANCODE_THOUSANDSSEPARATOR : constant SDL_Scancode := 178;
   SDL_SCANCODE_DECIMALSEPARATOR   : constant SDL_Scancode := 179;
   SDL_SCANCODE_CURRENCYUNIT       : constant SDL_Scancode := 180;
   SDL_SCANCODE_CURRENCYSUBUNIT    : constant SDL_Scancode := 181;
   SDL_SCANCODE_KP_LEFTPAREN       : constant SDL_Scancode := 182;
   SDL_SCANCODE_KP_RIGHTPAREN      : constant SDL_Scancode := 183;
   SDL_SCANCODE_KP_LEFTBRACE       : constant SDL_Scancode := 184;
   SDL_SCANCODE_KP_RIGHTBRACE      : constant SDL_Scancode := 185;
   SDL_SCANCODE_KP_TAB             : constant SDL_Scancode := 186;
   SDL_SCANCODE_KP_BACKSPACE       : constant SDL_Scancode := 187;
   SDL_SCANCODE_KP_A               : constant SDL_Scancode := 188;
   SDL_SCANCODE_KP_B               : constant SDL_Scancode := 189;
   SDL_SCANCODE_KP_C               : constant SDL_Scancode := 190;
   SDL_SCANCODE_KP_D               : constant SDL_Scancode := 191;
   SDL_SCANCODE_KP_E               : constant SDL_Scancode := 192;
   SDL_SCANCODE_KP_F               : constant SDL_Scancode := 193;
   SDL_SCANCODE_KP_XOR             : constant SDL_Scancode := 194;
   SDL_SCANCODE_KP_POWER           : constant SDL_Scancode := 195;
   SDL_SCANCODE_KP_PERCENT         : constant SDL_Scancode := 196;
   SDL_SCANCODE_KP_LESS            : constant SDL_Scancode := 197;
   SDL_SCANCODE_KP_GREATER         : constant SDL_Scancode := 198;
   SDL_SCANCODE_KP_AMPERSAND       : constant SDL_Scancode := 199;
   SDL_SCANCODE_KP_DBLAMPERSAND    : constant SDL_Scancode := 200;
   SDL_SCANCODE_KP_VERTICALBAR     : constant SDL_Scancode := 201;
   SDL_SCANCODE_KP_DBLVERTICALBAR  : constant SDL_Scancode := 202;
   SDL_SCANCODE_KP_COLON           : constant SDL_Scancode := 203;
   SDL_SCANCODE_KP_HASH            : constant SDL_Scancode := 204;
   SDL_SCANCODE_KP_SPACE           : constant SDL_Scancode := 205;
   SDL_SCANCODE_KP_AT              : constant SDL_Scancode := 206;
   SDL_SCANCODE_KP_EXCLAM          : constant SDL_Scancode := 207;
   SDL_SCANCODE_KP_MEMSTORE        : constant SDL_Scancode := 208;
   SDL_SCANCODE_KP_MEMRECALL       : constant SDL_Scancode := 209;
   SDL_SCANCODE_KP_MEMCLEAR        : constant SDL_Scancode := 210;
   SDL_SCANCODE_KP_MEMADD          : constant SDL_Scancode := 211;
   SDL_SCANCODE_KP_MEMSUBTRACT     : constant SDL_Scancode := 212;
   SDL_SCANCODE_KP_MEMMULTIPLY     : constant SDL_Scancode := 213;
   SDL_SCANCODE_KP_MEMDIVIDE       : constant SDL_Scancode := 214;
   SDL_SCANCODE_KP_PLUSMINUS       : constant SDL_Scancode := 215;
   SDL_SCANCODE_KP_CLEAR           : constant SDL_Scancode := 216;
   SDL_SCANCODE_KP_CLEARENTRY      : constant SDL_Scancode := 217;
   SDL_SCANCODE_KP_BINARY          : constant SDL_Scancode := 218;
   SDL_SCANCODE_KP_OCTAL           : constant SDL_Scancode := 219;
   SDL_SCANCODE_KP_DECIMAL         : constant SDL_Scancode := 220;
   SDL_SCANCODE_KP_HEXADECIMAL     : constant SDL_Scancode := 221;
   SDL_SCANCODE_LCTRL              : constant SDL_Scancode := 224;
   SDL_SCANCODE_LSHIFT             : constant SDL_Scancode := 225;
   SDL_SCANCODE_LALT               : constant SDL_Scancode := 226;
   SDL_SCANCODE_LGUI               : constant SDL_Scancode := 227;
   SDL_SCANCODE_RCTRL              : constant SDL_Scancode := 228;
   SDL_SCANCODE_RSHIFT             : constant SDL_Scancode := 229;
   SDL_SCANCODE_RALT               : constant SDL_Scancode := 230;
   SDL_SCANCODE_RGUI               : constant SDL_Scancode := 231;
   SDL_SCANCODE_MODE               : constant SDL_Scancode := 257;
   SDL_SCANCODE_AUDIONEXT          : constant SDL_Scancode := 258;
   SDL_SCANCODE_AUDIOPREV          : constant SDL_Scancode := 259;
   SDL_SCANCODE_AUDIOSTOP          : constant SDL_Scancode := 260;
   SDL_SCANCODE_AUDIOPLAY          : constant SDL_Scancode := 261;
   SDL_SCANCODE_AUDIOMUTE          : constant SDL_Scancode := 262;
   SDL_SCANCODE_MEDIASELECT        : constant SDL_Scancode := 263;
   SDL_SCANCODE_WWW                : constant SDL_Scancode := 264;
   SDL_SCANCODE_MAIL               : constant SDL_Scancode := 265;
   SDL_SCANCODE_CALCULATOR         : constant SDL_Scancode := 266;
   SDL_SCANCODE_COMPUTER           : constant SDL_Scancode := 267;
   SDL_SCANCODE_AC_SEARCH          : constant SDL_Scancode := 268;
   SDL_SCANCODE_AC_HOME            : constant SDL_Scancode := 269;
   SDL_SCANCODE_AC_BACK            : constant SDL_Scancode := 270;
   SDL_SCANCODE_AC_FORWARD         : constant SDL_Scancode := 271;
   SDL_SCANCODE_AC_STOP            : constant SDL_Scancode := 272;
   SDL_SCANCODE_AC_REFRESH         : constant SDL_Scancode := 273;
   SDL_SCANCODE_AC_BOOKMARKS       : constant SDL_Scancode := 274;
   SDL_SCANCODE_BRIGHTNESSDOWN     : constant SDL_Scancode := 275;
   SDL_SCANCODE_BRIGHTNESSUP       : constant SDL_Scancode := 276;
   SDL_SCANCODE_DISPLAYSWITCH      : constant SDL_Scancode := 277;
   SDL_SCANCODE_KBDILLUMTOGGLE     : constant SDL_Scancode := 278;
   SDL_SCANCODE_KBDILLUMDOWN       : constant SDL_Scancode := 279;
   SDL_SCANCODE_KBDILLUMUP         : constant SDL_Scancode := 280;
   SDL_SCANCODE_EJECT              : constant SDL_Scancode := 281;
   SDL_SCANCODE_SLEEP              : constant SDL_Scancode := 282;
   SDL_SCANCODE_APP1               : constant SDL_Scancode := 283;
   SDL_SCANCODE_APP2               : constant SDL_Scancode := 284;
   SDL_NUM_SCANCODES               : constant SDL_Scancode := 512;

   ----------------------------------------------------------------------------
   -- SDL_keycode.h
   ----------------------------------------------------------------------------

   subtype SDL_Keycode is Sint32;

   SDLK_SCANCODE_MASK : constant := (2**30);

   function SDL_SCANCODE_TO_KEYCODE (X : SDL_Scancode) return SDL_Keycode;
   pragma Inline (SDL_SCANCODE_TO_KEYCODE);

   SDLK_UNKNOWN            : constant := 0;
   SDLK_RETURN             : constant := 13;
   SDLK_ESCAPE             : constant := 27;
   SDLK_BACKSPACE          : constant := 8;
   SDLK_TAB                : constant := 9;
   SDLK_SPACE              : constant := 32;
   SDLK_EXCLAIM            : constant := 33;
   SDLK_QUOTEDBL           : constant := 34;
   SDLK_HASH               : constant := 35;
   SDLK_PERCENT            : constant := 37;
   SDLK_DOLLAR             : constant := 36;
   SDLK_AMPERSAND          : constant := 38;
   SDLK_QUOTE              : constant := 39;
   SDLK_LEFTPAREN          : constant := 40;
   SDLK_RIGHTPAREN         : constant := 41;
   SDLK_ASTERISK           : constant := 42;
   SDLK_PLUS               : constant := 43;
   SDLK_COMMA              : constant := 44;
   SDLK_MINUS              : constant := 45;
   SDLK_PERIOD             : constant := 46;
   SDLK_SLASH              : constant := 47;
   SDLK_0                  : constant := 48;
   SDLK_1                  : constant := 49;
   SDLK_2                  : constant := 50;
   SDLK_3                  : constant := 51;
   SDLK_4                  : constant := 52;
   SDLK_5                  : constant := 53;
   SDLK_6                  : constant := 54;
   SDLK_7                  : constant := 55;
   SDLK_8                  : constant := 56;
   SDLK_9                  : constant := 57;
   SDLK_COLON              : constant := 58;
   SDLK_SEMICOLON          : constant := 59;
   SDLK_LESS               : constant := 60;
   SDLK_EQUALS             : constant := 61;
   SDLK_GREATER            : constant := 62;
   SDLK_QUESTION           : constant := 63;
   SDLK_AT                 : constant := 64;
   SDLK_LEFTBRACKET        : constant := 91;
   SDLK_BACKSLASH          : constant := 92;
   SDLK_RIGHTBRACKET       : constant := 93;
   SDLK_CARET              : constant := 94;
   SDLK_UNDERSCORE         : constant := 95;
   SDLK_BACKQUOTE          : constant := 96;
   SDLK_a                  : constant := 97;
   SDLK_b                  : constant := 98;
   SDLK_c                  : constant := 99;
   SDLK_d                  : constant := 100;
   SDLK_e                  : constant := 101;
   SDLK_f                  : constant := 102;
   SDLK_g                  : constant := 103;
   SDLK_h                  : constant := 104;
   SDLK_i                  : constant := 105;
   SDLK_j                  : constant := 106;
   SDLK_k                  : constant := 107;
   SDLK_l                  : constant := 108;
   SDLK_m                  : constant := 109;
   SDLK_n                  : constant := 110;
   SDLK_o                  : constant := 111;
   SDLK_p                  : constant := 112;
   SDLK_q                  : constant := 113;
   SDLK_r                  : constant := 114;
   SDLK_s                  : constant := 115;
   SDLK_t                  : constant := 116;
   SDLK_u                  : constant := 117;
   SDLK_v                  : constant := 118;
   SDLK_w                  : constant := 119;
   SDLK_x                  : constant := 120;
   SDLK_y                  : constant := 121;
   SDLK_z                  : constant := 122;
   SDLK_CAPSLOCK           : constant := 1073741881;
   SDLK_F1                 : constant := 1073741882;
   SDLK_F2                 : constant := 1073741883;
   SDLK_F3                 : constant := 1073741884;
   SDLK_F4                 : constant := 1073741885;
   SDLK_F5                 : constant := 1073741886;
   SDLK_F6                 : constant := 1073741887;
   SDLK_F7                 : constant := 1073741888;
   SDLK_F8                 : constant := 1073741889;
   SDLK_F9                 : constant := 1073741890;
   SDLK_F10                : constant := 1073741891;
   SDLK_F11                : constant := 1073741892;
   SDLK_F12                : constant := 1073741893;
   SDLK_PRINTSCREEN        : constant := 1073741894;
   SDLK_SCROLLLOCK         : constant := 1073741895;
   SDLK_PAUSE              : constant := 1073741896;
   SDLK_INSERT             : constant := 1073741897;
   SDLK_HOME               : constant := 1073741898;
   SDLK_PAGEUP             : constant := 1073741899;
   SDLK_DELETE             : constant := 127;
   SDLK_END                : constant := 1073741901;
   SDLK_PAGEDOWN           : constant := 1073741902;
   SDLK_RIGHT              : constant := 1073741903;
   SDLK_LEFT               : constant := 1073741904;
   SDLK_DOWN               : constant := 1073741905;
   SDLK_UP                 : constant := 1073741906;
   SDLK_NUMLOCKCLEAR       : constant := 1073741907;
   SDLK_KP_DIVIDE          : constant := 1073741908;
   SDLK_KP_MULTIPLY        : constant := 1073741909;
   SDLK_KP_MINUS           : constant := 1073741910;
   SDLK_KP_PLUS            : constant := 1073741911;
   SDLK_KP_ENTER           : constant := 1073741912;
   SDLK_KP_1               : constant := 1073741913;
   SDLK_KP_2               : constant := 1073741914;
   SDLK_KP_3               : constant := 1073741915;
   SDLK_KP_4               : constant := 1073741916;
   SDLK_KP_5               : constant := 1073741917;
   SDLK_KP_6               : constant := 1073741918;
   SDLK_KP_7               : constant := 1073741919;
   SDLK_KP_8               : constant := 1073741920;
   SDLK_KP_9               : constant := 1073741921;
   SDLK_KP_0               : constant := 1073741922;
   SDLK_KP_PERIOD          : constant := 1073741923;
   SDLK_APPLICATION        : constant := 1073741925;
   SDLK_POWER              : constant := 1073741926;
   SDLK_KP_EQUALS          : constant := 1073741927;
   SDLK_F13                : constant := 1073741928;
   SDLK_F14                : constant := 1073741929;
   SDLK_F15                : constant := 1073741930;
   SDLK_F16                : constant := 1073741931;
   SDLK_F17                : constant := 1073741932;
   SDLK_F18                : constant := 1073741933;
   SDLK_F19                : constant := 1073741934;
   SDLK_F20                : constant := 1073741935;
   SDLK_F21                : constant := 1073741936;
   SDLK_F22                : constant := 1073741937;
   SDLK_F23                : constant := 1073741938;
   SDLK_F24                : constant := 1073741939;
   SDLK_EXECUTE            : constant := 1073741940;
   SDLK_HELP               : constant := 1073741941;
   SDLK_MENU               : constant := 1073741942;
   SDLK_SELECT             : constant := 1073741943;
   SDLK_STOP               : constant := 1073741944;
   SDLK_AGAIN              : constant := 1073741945;
   SDLK_UNDO               : constant := 1073741946;
   SDLK_CUT                : constant := 1073741947;
   SDLK_COPY               : constant := 1073741948;
   SDLK_PASTE              : constant := 1073741949;
   SDLK_FIND               : constant := 1073741950;
   SDLK_MUTE               : constant := 1073741951;
   SDLK_VOLUMEUP           : constant := 1073741952;
   SDLK_VOLUMEDOWN         : constant := 1073741953;
   SDLK_KP_COMMA           : constant := 1073741957;
   SDLK_KP_EQUALSAS400     : constant := 1073741958;
   SDLK_ALTERASE           : constant := 1073741977;
   SDLK_SYSREQ             : constant := 1073741978;
   SDLK_CANCEL             : constant := 1073741979;
   SDLK_CLEAR              : constant := 1073741980;
   SDLK_PRIOR              : constant := 1073741981;
   SDLK_RETURN2            : constant := 1073741982;
   SDLK_SEPARATOR          : constant := 1073741983;
   SDLK_OUT                : constant := 1073741984;
   SDLK_OPER               : constant := 1073741985;
   SDLK_CLEARAGAIN         : constant := 1073741986;
   SDLK_CRSEL              : constant := 1073741987;
   SDLK_EXSEL              : constant := 1073741988;
   SDLK_KP_00              : constant := 1073742000;
   SDLK_KP_000             : constant := 1073742001;
   SDLK_THOUSANDSSEPARATOR : constant := 1073742002;
   SDLK_DECIMALSEPARATOR   : constant := 1073742003;
   SDLK_CURRENCYUNIT       : constant := 1073742004;
   SDLK_CURRENCYSUBUNIT    : constant := 1073742005;
   SDLK_KP_LEFTPAREN       : constant := 1073742006;
   SDLK_KP_RIGHTPAREN      : constant := 1073742007;
   SDLK_KP_LEFTBRACE       : constant := 1073742008;
   SDLK_KP_RIGHTBRACE      : constant := 1073742009;
   SDLK_KP_TAB             : constant := 1073742010;
   SDLK_KP_BACKSPACE       : constant := 1073742011;
   SDLK_KP_A               : constant := 1073742012;
   SDLK_KP_B               : constant := 1073742013;
   SDLK_KP_C               : constant := 1073742014;
   SDLK_KP_D               : constant := 1073742015;
   SDLK_KP_E               : constant := 1073742016;
   SDLK_KP_F               : constant := 1073742017;
   SDLK_KP_XOR             : constant := 1073742018;
   SDLK_KP_POWER           : constant := 1073742019;
   SDLK_KP_PERCENT         : constant := 1073742020;
   SDLK_KP_LESS            : constant := 1073742021;
   SDLK_KP_GREATER         : constant := 1073742022;
   SDLK_KP_AMPERSAND       : constant := 1073742023;
   SDLK_KP_DBLAMPERSAND    : constant := 1073742024;
   SDLK_KP_VERTICALBAR     : constant := 1073742025;
   SDLK_KP_DBLVERTICALBAR  : constant := 1073742026;
   SDLK_KP_COLON           : constant := 1073742027;
   SDLK_KP_HASH            : constant := 1073742028;
   SDLK_KP_SPACE           : constant := 1073742029;
   SDLK_KP_AT              : constant := 1073742030;
   SDLK_KP_EXCLAM          : constant := 1073742031;
   SDLK_KP_MEMSTORE        : constant := 1073742032;
   SDLK_KP_MEMRECALL       : constant := 1073742033;
   SDLK_KP_MEMCLEAR        : constant := 1073742034;
   SDLK_KP_MEMADD          : constant := 1073742035;
   SDLK_KP_MEMSUBTRACT     : constant := 1073742036;
   SDLK_KP_MEMMULTIPLY     : constant := 1073742037;
   SDLK_KP_MEMDIVIDE       : constant := 1073742038;
   SDLK_KP_PLUSMINUS       : constant := 1073742039;
   SDLK_KP_CLEAR           : constant := 1073742040;
   SDLK_KP_CLEARENTRY      : constant := 1073742041;
   SDLK_KP_BINARY          : constant := 1073742042;
   SDLK_KP_OCTAL           : constant := 1073742043;
   SDLK_KP_DECIMAL         : constant := 1073742044;
   SDLK_KP_HEXADECIMAL     : constant := 1073742045;
   SDLK_LCTRL              : constant := 1073742048;
   SDLK_LSHIFT             : constant := 1073742049;
   SDLK_LALT               : constant := 1073742050;
   SDLK_LGUI               : constant := 1073742051;
   SDLK_RCTRL              : constant := 1073742052;
   SDLK_RSHIFT             : constant := 1073742053;
   SDLK_RALT               : constant := 1073742054;
   SDLK_RGUI               : constant := 1073742055;
   SDLK_MODE               : constant := 1073742081;
   SDLK_AUDIONEXT          : constant := 1073742082;
   SDLK_AUDIOPREV          : constant := 1073742083;
   SDLK_AUDIOSTOP          : constant := 1073742084;
   SDLK_AUDIOPLAY          : constant := 1073742085;
   SDLK_AUDIOMUTE          : constant := 1073742086;
   SDLK_MEDIASELECT        : constant := 1073742087;
   SDLK_WWW                : constant := 1073742088;
   SDLK_MAIL               : constant := 1073742089;
   SDLK_CALCULATOR         : constant := 1073742090;
   SDLK_COMPUTER           : constant := 1073742091;
   SDLK_AC_SEARCH          : constant := 1073742092;
   SDLK_AC_HOME            : constant := 1073742093;
   SDLK_AC_BACK            : constant := 1073742094;
   SDLK_AC_FORWARD         : constant := 1073742095;
   SDLK_AC_STOP            : constant := 1073742096;
   SDLK_AC_REFRESH         : constant := 1073742097;
   SDLK_AC_BOOKMARKS       : constant := 1073742098;
   SDLK_BRIGHTNESSDOWN     : constant := 1073742099;
   SDLK_BRIGHTNESSUP       : constant := 1073742100;
   SDLK_DISPLAYSWITCH      : constant := 1073742101;
   SDLK_KBDILLUMTOGGLE     : constant := 1073742102;
   SDLK_KBDILLUMDOWN       : constant := 1073742103;
   SDLK_KBDILLUMUP         : constant := 1073742104;
   SDLK_EJECT              : constant := 1073742105;
   SDLK_SLEEP              : constant := 1073742106;

   subtype SDL_Keymod is Uint32; --Uint16; rgv
   KMOD_NONE     : constant SDL_Keymod := 0;
   KMOD_LSHIFT   : constant SDL_Keymod := 1;
   KMOD_RSHIFT   : constant SDL_Keymod := 2;
   KMOD_LCTRL    : constant SDL_Keymod := 64;
   KMOD_RCTRL    : constant SDL_Keymod := 128;
   KMOD_LALT     : constant SDL_Keymod := 256;
   KMOD_RALT     : constant SDL_Keymod := 512;
   KMOD_LGUI     : constant SDL_Keymod := 1024;
   KMOD_RGUI     : constant SDL_Keymod := 2048;
   KMOD_NUM      : constant SDL_Keymod := 4096;
   KMOD_CAPS     : constant SDL_Keymod := 8192;
   KMOD_MODE     : constant SDL_Keymod := 16384;
   KMOD_RESERVED : constant SDL_Keymod := 32768;

   KMOD_CTRL  : constant SDL_Keymod := 192;
   KMOD_SHIFT : constant SDL_Keymod := 3;
   KMOD_ALT   : constant SDL_Keymod := 768;
   KMOD_GUI   : constant SDL_Keymod := 3072;

   ----------------------------------------------------------------------------
   -- SDL_keyboard.h
   ----------------------------------------------------------------------------

   type SDL_Keysym is record
      scancode : aliased SDL_Scancode;
      sym      : aliased SDL_Keycode;
      mods     : aliased Uint16;
      unused   : aliased Uint32;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_Keysym);

   function SDL_GetKeyboardFocus return access SDL_Window;
   pragma Import (C, SDL_GetKeyboardFocus, "SDL_GetKeyboardFocus");

--fastrgv:
	--subtype keyrange is interfaces.c.int range 0..511; 
	-- SDL_NUM_SCANCODES=512, numkeys=512
	subtype keyrange is Uint32 range 0..511; -- rgv
	type keyarraytype is array(keyrange) of Uint8;
   function SDL_GetKeyboardState (numkeys : access C.int) return access keyarraytype;
   --function SDL_GetKeyboardState (numkeys : access C.int) return access Uint8;
   pragma Import (C, SDL_GetKeyboardState, "SDL_GetKeyboardState");

   function SDL_GetModState return SDL_Keymod;
   pragma Import (C, SDL_GetModState, "SDL_GetModState");

   procedure SDL_SetModState (modstate : SDL_Keymod);
   pragma Import (C, SDL_SetModState, "SDL_SetModState");

   function SDL_GetKeyFromScancode
     (scancode : SDL_Scancode) return SDL_Keycode;
   pragma Import (C, SDL_GetKeyFromScancode, "SDL_GetKeyFromScancode");

   function SDL_GetScancodeFromKey (key : SDL_Keycode) return SDL_Scancode;
   pragma Import (C, SDL_GetScancodeFromKey, "SDL_GetScancodeFromKey");

   function SDL_GetScancodeName
     (scancode : SDL_Scancode) return C.Strings.chars_ptr;
   pragma Import (C, SDL_GetScancodeName, "SDL_GetScancodeName");

   function SDL_GetScancodeFromName (name : C.char_array) return SDL_Scancode;
   pragma Import (C, SDL_GetScancodeFromName, "SDL_GetScancodeFromName");

   function SDL_GetKeyName (key : SDL_Keycode) return C.Strings.chars_ptr;
   pragma Import (C, SDL_GetKeyName, "SDL_GetKeyName");

   function SDL_GetKeyFromName (name : C.char_array) return SDL_Keycode;
   pragma Import (C, SDL_GetKeyFromName, "SDL_GetKeyFromName");

   procedure SDL_StartTextInput;
   pragma Import (C, SDL_StartTextInput, "SDL_StartTextInput");

   function SDL_IsTextInputActive return SDL_bool;
   pragma Import (C, SDL_IsTextInputActive, "SDL_IsTextInputActive");

   procedure SDL_StopTextInput;
   pragma Import (C, SDL_StopTextInput, "SDL_StopTextInput");

   procedure SDL_SetTextInputRect (rect : access SDL_Rect);
   pragma Import (C, SDL_SetTextInputRect, "SDL_SetTextInputRect");

   function SDL_HasScreenKeyboardSupport return SDL_bool;
   pragma Import
     (C,
      SDL_HasScreenKeyboardSupport,
      "SDL_HasScreenKeyboardSupport");

   function SDL_IsScreenKeyboardShown
     (window : access SDL_Window) return SDL_bool;
   pragma Import (C, SDL_IsScreenKeyboardShown, "SDL_IsScreenKeyboardShown");




   ----------------------------------------------------------------------------
   -- SDL_mouse.h
   ----------------------------------------------------------------------------

   subtype SDL_Cursor is System.Address;

   function SDL_BUTTON (X : C.int) return C.int;
   pragma Inline (SDL_BUTTON);

   SDL_BUTTON_LEFT   : constant := 1;
   SDL_BUTTON_MIDDLE : constant := 2;
   SDL_BUTTON_RIGHT  : constant := 3;
   SDL_BUTTON_X1     : constant := 4;
   SDL_BUTTON_X2     : constant := 5;

   SDL_BUTTON_LMASK  : constant := 1;
   SDL_BUTTON_MMASK  : constant := 2;
   SDL_BUTTON_RMASK  : constant := 4;
   SDL_BUTTON_X1MASK : constant := 8;
   SDL_BUTTON_X2MASK : constant := 16;

   type SDL_SystemCursor is
     (SDL_SYSTEM_CURSOR_ARROW,
      SDL_SYSTEM_CURSOR_IBEAM,
      SDL_SYSTEM_CURSOR_WAIT,
      SDL_SYSTEM_CURSOR_CROSSHAIR,
      SDL_SYSTEM_CURSOR_WAITARROW,
      SDL_SYSTEM_CURSOR_SIZENWSE,
      SDL_SYSTEM_CURSOR_SIZENESW,
      SDL_SYSTEM_CURSOR_SIZEWE,
      SDL_SYSTEM_CURSOR_SIZENS,
      SDL_SYSTEM_CURSOR_SIZEALL,
      SDL_SYSTEM_CURSOR_NO,
      SDL_SYSTEM_CURSOR_HAND,
      SDL_NUM_SYSTEM_CURSORS);
   pragma Convention (C, SDL_SystemCursor);

--###################################################################
	--if fails, replace access SDL_Window with system.address below:

   function SDL_GetMouseFocus return access SDL_Window;
   pragma Import (C, SDL_GetMouseFocus, "SDL_GetMouseFocus");

   function SDL_GetMouseState
     (x : access C.int;
      y : access C.int) return Uint32;
   pragma Import (C, SDL_GetMouseState, "SDL_GetMouseState");

   function SDL_GetRelativeMouseState
     (x : access C.int;
      y : access C.int) return Uint32;
   pragma Import (C, SDL_GetRelativeMouseState, "SDL_GetRelativeMouseState");

   procedure SDL_WarpMouseInWindow
     (window : access SDL_Window;
      x      : C.int;
      y      : C.int);
   pragma Import (C, SDL_WarpMouseInWindow, "SDL_WarpMouseInWindow");

   function SDL_SetRelativeMouseMode (enabled : SDL_bool) return C.int;
   pragma Import (C, SDL_SetRelativeMouseMode, "SDL_SetRelativeMouseMode");

   function SDL_GetRelativeMouseMode return SDL_bool;
   pragma Import (C, SDL_GetRelativeMouseMode, "SDL_GetRelativeMouseMode");

   function SDL_CreateCursor
     (data  : access Uint8;
      mask  : access Uint8;
      w     : C.int;
      h     : C.int;
      hot_x : C.int;
      hot_y : C.int) return access SDL_Cursor;
   pragma Import (C, SDL_CreateCursor, "SDL_CreateCursor");

   function SDL_CreateColorCursor
     (surface : access SDL_Surface;
      hot_x   : C.int;
      hot_y   : C.int) return access SDL_Cursor;
   pragma Import (C, SDL_CreateColorCursor, "SDL_CreateColorCursor");

   function SDL_CreateSystemCursor
     (id : SDL_SystemCursor) return access SDL_Cursor;
   pragma Import (C, SDL_CreateSystemCursor, "SDL_CreateSystemCursor");

   procedure SDL_SetCursor (cursor : access SDL_Cursor);
   pragma Import (C, SDL_SetCursor, "SDL_SetCursor");

   function SDL_GetCursor return access SDL_Cursor;
   pragma Import (C, SDL_GetCursor, "SDL_GetCursor");

   function SDL_GetDefaultCursor return access SDL_Cursor;
   pragma Import (C, SDL_GetDefaultCursor, "SDL_GetDefaultCursor");

   procedure SDL_FreeCursor (cursor : access SDL_Cursor);
   pragma Import (C, SDL_FreeCursor, "SDL_FreeCursor");

   function SDL_ShowCursor (toggle : C.int) return C.int;
   pragma Import (C, SDL_ShowCursor, "SDL_ShowCursor");




   ----------------------------------------------------------------------------
   -- SDL_joystick.h
   ----------------------------------------------------------------------------

   subtype SDL_Joystick is System.Address;
   subtype SDL_JoystickID is Sint32;

   SDL_HAT_CENTERED  : constant := 0;
   SDL_HAT_UP        : constant := 1;
   SDL_HAT_RIGHT     : constant := 2;
   SDL_HAT_DOWN      : constant := 4;
   SDL_HAT_LEFT      : constant := 8;
   SDL_HAT_RIGHTUP   : constant := 3;
   SDL_HAT_RIGHTDOWN : constant := 6;
   SDL_HAT_LEFTUP    : constant := 9;
   SDL_HAT_LEFTDOWN  : constant := 12;

   type SDL_JoystickGUID_data_array is array (0 .. 15) of aliased Uint8;
   type SDL_JoystickGUID is record
      data : aliased SDL_JoystickGUID_data_array;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_JoystickGUID);

   function SDL_NumJoysticks return C.int;
   pragma Import (C, SDL_NumJoysticks, "SDL_NumJoysticks");

   function SDL_JoystickNameForIndex
     (device_index : C.int) return C.Strings.chars_ptr;
   pragma Import (C, SDL_JoystickNameForIndex, "SDL_JoystickNameForIndex");

   function SDL_JoystickOpen (device_index : C.int) return access SDL_Joystick;
   pragma Import (C, SDL_JoystickOpen, "SDL_JoystickOpen");

   function SDL_JoystickName
     (joystick : access SDL_Joystick) return C.Strings.chars_ptr;
   pragma Import (C, SDL_JoystickName, "SDL_JoystickName");

   function SDL_JoystickGetDeviceGUID
     (device_index : C.int) return SDL_JoystickGUID;
   pragma Import (C, SDL_JoystickGetDeviceGUID, "SDL_JoystickGetDeviceGUID");

   function SDL_JoystickGetGUID
     (joystick : access SDL_Joystick) return SDL_JoystickGUID;
   pragma Import (C, SDL_JoystickGetGUID, "SDL_JoystickGetGUID");

   procedure SDL_JoystickGetGUIDString
     (guid    : SDL_JoystickGUID;
      pszGUID : C.char_array;
      cbGUID  : C.int);
   pragma Import (C, SDL_JoystickGetGUIDString, "SDL_JoystickGetGUIDString");

   function SDL_JoystickGetGUIDFromString
     (pchGUID : C.char_array) return SDL_JoystickGUID;
   pragma Import
     (C,
      SDL_JoystickGetGUIDFromString,
      "SDL_JoystickGetGUIDFromString");

   function SDL_JoystickGetAttached
     (joystick : access SDL_Joystick) return SDL_bool;
   pragma Import (C, SDL_JoystickGetAttached, "SDL_JoystickGetAttached");

   function SDL_JoystickInstanceID
     (joystick : access SDL_Joystick) return SDL_JoystickID;
   pragma Import (C, SDL_JoystickInstanceID, "SDL_JoystickInstanceID");

   function SDL_JoystickNumAxes (joystick : access SDL_Joystick) return C.int;
   pragma Import (C, SDL_JoystickNumAxes, "SDL_JoystickNumAxes");

   function SDL_JoystickNumBalls (joystick : access SDL_Joystick) return C.int;
   pragma Import (C, SDL_JoystickNumBalls, "SDL_JoystickNumBalls");

   function SDL_JoystickNumHats (joystick : access SDL_Joystick) return C.int;
   pragma Import (C, SDL_JoystickNumHats, "SDL_JoystickNumHats");

   function SDL_JoystickNumButtons
     (joystick : access SDL_Joystick) return C.int;
   pragma Import (C, SDL_JoystickNumButtons, "SDL_JoystickNumButtons");

   procedure SDL_JoystickUpdate;
   pragma Import (C, SDL_JoystickUpdate, "SDL_JoystickUpdate");

   function SDL_JoystickEventState (state : C.int) return C.int;
   pragma Import (C, SDL_JoystickEventState, "SDL_JoystickEventState");

   function SDL_JoystickGetAxis
     (joystick : access SDL_Joystick;
      axis     : C.int) return Sint16;
   pragma Import (C, SDL_JoystickGetAxis, "SDL_JoystickGetAxis");

   function SDL_JoystickGetHat
     (joystick : access SDL_Joystick;
      hat      : C.int) return Uint8;
   pragma Import (C, SDL_JoystickGetHat, "SDL_JoystickGetHat");

   function SDL_JoystickGetBall
     (joystick : access SDL_Joystick;
      ball     : C.int;
      dx       : access C.int;
      dy       : access C.int) return C.int;
   pragma Import (C, SDL_JoystickGetBall, "SDL_JoystickGetBall");

   function SDL_JoystickGetButton
     (joystick : access SDL_Joystick;
      button   : C.int) return Uint8;
   pragma Import (C, SDL_JoystickGetButton, "SDL_JoystickGetButton");

   procedure SDL_JoystickClose (joystick : access SDL_Joystick);
   pragma Import (C, SDL_JoystickClose, "SDL_JoystickClose");




   ----------------------------------------------------------------------------
   -- SDL_gamecontroller.h
   ----------------------------------------------------------------------------

   subtype SDL_GameController is System.Address;

   subtype SDL_GameControllerButton is C.int;
   SDL_CONTROLLER_BUTTON_INVALID : constant SDL_GameControllerButton := -1;
   SDL_CONTROLLER_BUTTON_A : constant SDL_GameControllerButton := 0;
   SDL_CONTROLLER_BUTTON_B : constant SDL_GameControllerButton := 1;
   SDL_CONTROLLER_BUTTON_X : constant SDL_GameControllerButton := 2;
   SDL_CONTROLLER_BUTTON_Y : constant SDL_GameControllerButton := 3;
   SDL_CONTROLLER_BUTTON_BACK : constant SDL_GameControllerButton := 4;
   SDL_CONTROLLER_BUTTON_GUIDE : constant SDL_GameControllerButton := 5;
   SDL_CONTROLLER_BUTTON_START : constant SDL_GameControllerButton := 6;
   SDL_CONTROLLER_BUTTON_LEFTSTICK : constant SDL_GameControllerButton := 7;
   SDL_CONTROLLER_BUTTON_RIGHTSTICK : constant SDL_GameControllerButton := 8;
   SDL_CONTROLLER_BUTTON_LEFTSHOULDER : constant SDL_GameControllerButton := 9;
   SDL_CONTROLLER_BUTTON_RIGHTSHOULDER : constant SDL_GameControllerButton :=
     10;
   SDL_CONTROLLER_BUTTON_DPAD_UP    : constant SDL_GameControllerButton := 11;
   SDL_CONTROLLER_BUTTON_DPAD_DOWN  : constant SDL_GameControllerButton := 12;
   SDL_CONTROLLER_BUTTON_DPAD_LEFT  : constant SDL_GameControllerButton := 13;
   SDL_CONTROLLER_BUTTON_DPAD_RIGHT : constant SDL_GameControllerButton := 14;
   SDL_CONTROLLER_BUTTON_MAX        : constant SDL_GameControllerButton := 15;

   subtype SDL_GameControllerAxis is C.int;
   SDL_CONTROLLER_AXIS_INVALID      : constant SDL_GameControllerAxis := -1;
   SDL_CONTROLLER_AXIS_LEFTX        : constant SDL_GameControllerAxis := 0;
   SDL_CONTROLLER_AXIS_LEFTY        : constant SDL_GameControllerAxis := 1;
   SDL_CONTROLLER_AXIS_RIGHTX       : constant SDL_GameControllerAxis := 2;
   SDL_CONTROLLER_AXIS_RIGHTY       : constant SDL_GameControllerAxis := 3;
   SDL_CONTROLLER_AXIS_TRIGGERLEFT  : constant SDL_GameControllerAxis := 4;
   SDL_CONTROLLER_AXIS_TRIGGERRIGHT : constant SDL_GameControllerAxis := 5;
   SDL_CONTROLLER_AXIS_MAX          : constant SDL_GameControllerAxis := 6;

   type SDL_GameControllerBindType is
     (SDL_CONTROLLER_BINDTYPE_NONE,
      SDL_CONTROLLER_BINDTYPE_BUTTON,
      SDL_CONTROLLER_BINDTYPE_AXIS,
      SDL_CONTROLLER_BINDTYPE_HAT);
   pragma Convention (C, SDL_GameControllerBindType);

   type SDL_GameControllerHatRecord is record
      hat      : aliased C.int;
      hat_mask : aliased C.int;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_GameControllerHatRecord);

   type SDL_GameControllerValueUnion (discr : C.unsigned := 0) is record
      case discr is
         when 0 =>
            button : aliased C.int;
         when 1 =>
            axis : aliased C.int;
         when others =>
            hat : aliased SDL_GameControllerHatRecord;
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_GameControllerValueUnion);
   pragma Unchecked_Union (SDL_GameControllerValueUnion);

   type SDL_GameControllerButtonBind is record
      bindType : aliased SDL_GameControllerBindType;
      value    : aliased SDL_GameControllerValueUnion;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_GameControllerButtonBind);

   function SDL_GameControllerAddMappingsFromRW
     (rw     : access SDL_RWops;
      freerw : C.int) return C.int;
   pragma Import
     (C,
      SDL_GameControllerAddMappingsFromRW,
      "SDL_GameControllerAddMappingsFromRW");

   function SDL_GameControllerAddMapping
     (mappingString : C.char_array) return C.int;
   pragma Import
     (C,
      SDL_GameControllerAddMapping,
      "SDL_GameControllerAddMapping");

   function SDL_GameControllerMappingForGUID
     (guid : SDL_JoystickGUID) return C.Strings.chars_ptr;
   pragma Import
     (C,
      SDL_GameControllerMappingForGUID,
      "SDL_GameControllerMappingForGUID");

   function SDL_GameControllerMapping
     (gamecontroller : access SDL_GameController) return C.Strings.chars_ptr;
   pragma Import (C, SDL_GameControllerMapping, "SDL_GameControllerMapping");

   function SDL_IsGameController (joystick_index : C.int) return SDL_bool;
   pragma Import (C, SDL_IsGameController, "SDL_IsGameController");

   function SDL_GameControllerNameForIndex
     (joystick_index : C.int) return C.Strings.chars_ptr;
   pragma Import
     (C,
      SDL_GameControllerNameForIndex,
      "SDL_GameControllerNameForIndex");

   function SDL_GameControllerOpen
     (joystick_index : C.int) return access SDL_GameController;
   pragma Import (C, SDL_GameControllerOpen, "SDL_GameControllerOpen");

   function SDL_GameControllerName
     (gamecontroller : access SDL_GameController) return C.Strings.chars_ptr;
   pragma Import (C, SDL_GameControllerName, "SDL_GameControllerName");

   function SDL_GameControllerGetAttached
     (gamecontroller : access SDL_GameController) return SDL_bool;
   pragma Import
     (C,
      SDL_GameControllerGetAttached,
      "SDL_GameControllerGetAttached");

   function SDL_GameControllerGetJoystick
     (gamecontroller : access SDL_GameController) return access SDL_Joystick;
   pragma Import
     (C,
      SDL_GameControllerGetJoystick,
      "SDL_GameControllerGetJoystick");

   function SDL_GameControllerEventState (state : C.int) return C.int;
   pragma Import
     (C,
      SDL_GameControllerEventState,
      "SDL_GameControllerEventState");

   procedure SDL_GameControllerUpdate;
   pragma Import (C, SDL_GameControllerUpdate, "SDL_GameControllerUpdate");

   function SDL_GameControllerGetAxisFromString
     (pchString : C.char_array) return SDL_GameControllerAxis;
   pragma Import
     (C,
      SDL_GameControllerGetAxisFromString,
      "SDL_GameControllerGetAxisFromString");

   function SDL_GameControllerGetStringForAxis
     (axis : SDL_GameControllerAxis) return C.Strings.chars_ptr;
   pragma Import
     (C,
      SDL_GameControllerGetStringForAxis,
      "SDL_GameControllerGetStringForAxis");

   function SDL_GameControllerGetBindForAxis
     (gamecontroller : access SDL_GameController;
      axis : SDL_GameControllerAxis) return SDL_GameControllerButtonBind;
   pragma Import
     (C,
      SDL_GameControllerGetBindForAxis,
      "SDL_GameControllerGetBindForAxis");

   function SDL_GameControllerGetAxis
     (gamecontroller : access SDL_GameController;
      axis           : SDL_GameControllerAxis) return Sint16;
   pragma Import (C, SDL_GameControllerGetAxis, "SDL_GameControllerGetAxis");

   function SDL_GameControllerGetButtonFromString
     (pchString : C.char_array) return SDL_GameControllerButton;
   pragma Import
     (C,
      SDL_GameControllerGetButtonFromString,
      "SDL_GameControllerGetButtonFromString");

   function SDL_GameControllerGetStringForButton
     (button : SDL_GameControllerButton) return C.Strings.chars_ptr;
   pragma Import
     (C,
      SDL_GameControllerGetStringForButton,
      "SDL_GameControllerGetStringForButton");

   function SDL_GameControllerGetBindForButton
     (gamecontroller : access SDL_GameController;
      button : SDL_GameControllerButton) return SDL_GameControllerButtonBind;
   pragma Import
     (C,
      SDL_GameControllerGetBindForButton,
      "SDL_GameControllerGetBindForButton");

   function SDL_GameControllerGetButton
     (gamecontroller : access SDL_GameController;
      button         : SDL_GameControllerButton) return Uint8;
   pragma Import
     (C,
      SDL_GameControllerGetButton,
      "SDL_GameControllerGetButton");

   procedure SDL_GameControllerClose
     (gamecontroller : access SDL_GameController);
   pragma Import (C, SDL_GameControllerClose, "SDL_GameControllerClose");





   ----------------------------------------------------------------------------
   -- SDL_touch.h
   ----------------------------------------------------------------------------

   subtype SDL_TouchID is Sint64;
   subtype SDL_FingerID is Sint64;


   ----------------------------------------------------------------------------
   -- SDL_gesture.h
   ----------------------------------------------------------------------------

   subtype SDL_GestureID is Sint64;



   ----------------------------------------------------------------------------
   -- SDL_events.h
   ----------------------------------------------------------------------------

   -- Renamed all instances of type to typ. Because type is an Ada
   -- keyword.

   SDL_RELEASED : constant := 0;
   SDL_PRESSED  : constant := 1;






   subtype SDL_EventType is Uint32; --- rgv unsigned;
   SDL_FIRSTEVENT : constant SDL_EventType := 0;
   --SDL_QUIT : constant SDL_EventType := 256;
   SDL_SHUTDOWN : constant SDL_EventType := 256;
   SDL_APP_TERMINATING : constant SDL_EventType := 257;
   SDL_APP_LOWMEMORY : constant SDL_EventType := 258;
   SDL_APP_WILLENTERBACKGROUND : constant SDL_EventType := 259;
   SDL_APP_DIDENTERBACKGROUND : constant SDL_EventType := 260;
   SDL_APP_WILLENTERFOREGROUND : constant SDL_EventType := 261;
   SDL_APP_DIDENTERFOREGROUND : constant SDL_EventType := 262;
   SDL_WINDOWEVENT : constant SDL_EventType := 512;
   SDL_SYSWMEVENT : constant SDL_EventType := 513;
   SDL_KEYDOWN : constant SDL_EventType := 768;
   SDL_KEYUP : constant SDL_EventType := 769;
   SDL_TEXTEDITING : constant SDL_EventType := 770;
   SDL_TEXTINPUT : constant SDL_EventType := 771;
   SDL_KEYMAPCHANGED : constant SDL_EventType := 772;
   SDL_MOUSEMOTION : constant SDL_EventType := 1024;
   SDL_MOUSEBUTTONDOWN : constant SDL_EventType := 1025;
   SDL_MOUSEBUTTONUP : constant SDL_EventType := 1026;
   SDL_MOUSEWHEEL : constant SDL_EventType := 1027;
   SDL_JOYAXISMOTION : constant SDL_EventType := 1536;
   SDL_JOYBALLMOTION : constant SDL_EventType := 1537;
   SDL_JOYHATMOTION : constant SDL_EventType := 1538;
   SDL_JOYBUTTONDOWN : constant SDL_EventType := 1539;
   SDL_JOYBUTTONUP : constant SDL_EventType := 1540;
   SDL_JOYDEVICEADDED : constant SDL_EventType := 1541;
   SDL_JOYDEVICEREMOVED : constant SDL_EventType := 1542;
   SDL_CONTROLLERAXISMOTION : constant SDL_EventType := 1616;
   SDL_CONTROLLERBUTTONDOWN : constant SDL_EventType := 1617;
   SDL_CONTROLLERBUTTONUP : constant SDL_EventType := 1618;
   SDL_CONTROLLERDEVICEADDED : constant SDL_EventType := 1619;
   SDL_CONTROLLERDEVICEREMOVED : constant SDL_EventType := 1620;
   SDL_CONTROLLERDEVICEREMAPPED : constant SDL_EventType := 1621;
   SDL_FINGERDOWN : constant SDL_EventType := 1792;
   SDL_FINGERUP : constant SDL_EventType := 1793;
   SDL_FINGERMOTION : constant SDL_EventType := 1794;
   SDL_DOLLARGESTURE : constant SDL_EventType := 2048;
   SDL_DOLLARRECORD : constant SDL_EventType := 2049;
   SDL_MULTIGESTURE : constant SDL_EventType := 2050;
   SDL_CLIPBOARDUPDATE : constant SDL_EventType := 2304;
   SDL_DROPFILE : constant SDL_EventType := 4096;
   SDL_DROPTEXT : constant SDL_EventType := 4097;
   SDL_DROPBEGIN : constant SDL_EventType := 4098;
   SDL_DROPCOMPLETE : constant SDL_EventType := 4099;
   SDL_AUDIODEVICEADDED : constant SDL_EventType := 4352;
   SDL_AUDIODEVICEREMOVED : constant SDL_EventType := 4353;
   SDL_RENDER_TARGETS_RESET : constant SDL_EventType := 8192;
   SDL_RENDER_DEVICE_RESET : constant SDL_EventType := 8193;
   SDL_USEREVENT : constant SDL_EventType := 32768;
   SDL_LASTEVENT : constant SDL_EventType := 65535;  -- SDL_events.h:160







   type SDL_CommonEventRecord is record
      typ       : aliased Uint32;
      timestamp : aliased Uint32;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_CommonEventRecord);

   type SDL_WindowEventRecord is record
      typ       : aliased Uint32;
      timestamp : aliased Uint32;
      windowID  : aliased Uint32;
      event     : aliased Uint8;
      padding1  : aliased Uint8;
      padding2  : aliased Uint8;
      padding3  : aliased Uint8;
      data1     : aliased Sint32;
      data2     : aliased Sint32;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_WindowEventRecord);

   type SDL_KeyboardEventRecord is record
      typ       : aliased Uint32;
      timestamp : aliased Uint32;
      windowID  : aliased Uint32;
      state     : aliased Uint8;
      repeat    : aliased Uint8;
      padding2  : aliased Uint8;
      padding3  : aliased Uint8;
      keysym    : aliased SDL_Keysym;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_KeyboardEventRecord);

   SDL_TEXTEDITINGEVENT_TEXT_SIZE : constant := 32;
   subtype SDL_TextEditingEvent_text_array is
     C.char_array (0 .. SDL_TEXTEDITINGEVENT_TEXT_SIZE - 1);

   type SDL_TextEditingEventRecord is record
      typ       : aliased Uint32;
      timestamp : aliased Uint32;
      windowID  : aliased Uint32;
      text      : aliased SDL_TextEditingEvent_text_array;
      start     : aliased Sint32;
      length    : aliased Sint32;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_TextEditingEventRecord);

   SDL_TEXTINPUTEVENT_TEXT_SIZE : constant := 32;
   subtype SDL_TextInputEvent_text_array is
     C.char_array (0 .. SDL_TEXTINPUTEVENT_TEXT_SIZE - 1);

   type SDL_TextInputEventRecord is record
      typ       : aliased Uint32;
      timestamp : aliased Uint32;
      windowID  : aliased Uint32;
      text      : aliased SDL_TextInputEvent_text_array;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_TextInputEventRecord);

   type SDL_MouseMotionEventRecord is record
      typ       : aliased Uint32;
      timestamp : aliased Uint32;
      windowID  : aliased Uint32;
      which     : aliased Uint32;
      state     : aliased Uint32;
      x         : aliased Sint32;
      y         : aliased Sint32;
      xrel      : aliased Sint32;
      yrel      : aliased Sint32;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_MouseMotionEventRecord);

   type SDL_MouseButtonEventRecord is record
      typ       : aliased Uint32;
      timestamp : aliased Uint32;
      windowID  : aliased Uint32;
      which     : aliased Uint32;
      button    : aliased Uint8;
      state     : aliased Uint8;
      clicks    : aliased Uint8;
      padding1  : aliased Uint8;
      x         : aliased Sint32;
      y         : aliased Sint32;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_MouseButtonEventRecord);

   type SDL_MouseWheelEventRecord is record
      typ       : aliased Uint32;
      timestamp : aliased Uint32;
      windowID  : aliased Uint32;
      which     : aliased Uint32;
      x         : aliased Sint32;
      y         : aliased Sint32;
		direction : aliased Uint32; -- rgv : to match v207
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_MouseWheelEventRecord);

   type SDL_JoyAxisEventRecord is record
      typ       : aliased Uint32;
      timestamp : aliased Uint32;
      which     : aliased SDL_JoystickID;
      axis      : aliased Uint8;
      padding1  : aliased Uint8;
      padding2  : aliased Uint8;
      padding3  : aliased Uint8;
      value     : aliased Sint16;
      padding4  : aliased Uint16;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_JoyAxisEventRecord);

   type SDL_JoyBallEventRecord is record
      typ       : aliased Uint32;
      timestamp : aliased Uint32;
      which     : aliased SDL_JoystickID;
      ball      : aliased Uint8;
      padding1  : aliased Uint8;
      padding2  : aliased Uint8;
      padding3  : aliased Uint8;
      xrel      : aliased Sint16;
      yrel      : aliased Sint16;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_JoyBallEventRecord);

   type SDL_JoyHatEventRecord is record
      typ       : aliased Uint32;
      timestamp : aliased Uint32;
      which     : aliased SDL_JoystickID;
      hat       : aliased Uint8;
      value     : aliased Uint8;
      padding1  : aliased Uint8;
      padding2  : aliased Uint8;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_JoyHatEventRecord);

   type SDL_JoyButtonEventRecord is record
      typ       : aliased Uint32;
      timestamp : aliased Uint32;
      which     : aliased SDL_JoystickID;
      button    : aliased Uint8;
      state     : aliased Uint8;
      padding1  : aliased Uint8;
      padding2  : aliased Uint8;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_JoyButtonEventRecord);

   type SDL_JoyDeviceEventRecord is record
      typ       : aliased Uint32;
      timestamp : aliased Uint32;
      which     : aliased Sint32;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_JoyDeviceEventRecord);

   type SDL_ControllerAxisEventRecord is record
      typ       : aliased Uint32;
      timestamp : aliased Uint32;
      which     : aliased SDL_JoystickID;
      axis      : aliased Uint8;
      padding1  : aliased Uint8;
      padding2  : aliased Uint8;
      padding3  : aliased Uint8;
      value     : aliased Sint16;
      padding4  : aliased Uint16;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_ControllerAxisEventRecord);

   type SDL_ControllerButtonEventRecord is record
      typ       : aliased Uint32;
      timestamp : aliased Uint32;
      which     : aliased SDL_JoystickID;
      button    : aliased Uint8;
      state     : aliased Uint8;
      padding1  : aliased Uint8;
      padding2  : aliased Uint8;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_ControllerButtonEventRecord);

   type SDL_ControllerDeviceEventRecord is record
      typ       : aliased Uint32;
      timestamp : aliased Uint32;
      which     : aliased Sint32;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_ControllerDeviceEventRecord);


   type SDL_TouchFingerEventRecord is record
      typ       : aliased Uint32;
      timestamp : aliased Uint32;
      touchId   : aliased SDL_TouchID;
      fingerId  : aliased SDL_FingerID;
      x         : aliased C.C_float;
      y         : aliased C.C_float;
      dx        : aliased C.C_float;
      dy        : aliased C.C_float;
      pressure  : aliased C.C_float;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_TouchFingerEventRecord);

   type SDL_MultiGestureEventRecord is record
      typ        : aliased Uint32;
      timestamp  : aliased Uint32;
      touchId    : aliased SDL_TouchID;
      dTheta     : aliased C.C_float;
      dDist      : aliased C.C_float;
      x          : aliased C.C_float;
      y          : aliased C.C_float;
      numFingers : aliased Uint16;
      padding    : aliased Uint16;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_MultiGestureEventRecord);

   type SDL_DollarGestureEventRecord is record
      typ        : aliased Uint32;
      timestamp  : aliased Uint32;
      touchId    : aliased SDL_TouchID;
      gestureId  : aliased SDL_GestureID;
      numFingers : aliased Uint32;
      error      : aliased C.C_float;
      x          : aliased C.C_float;
      y          : aliased C.C_float;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_DollarGestureEventRecord);

   type SDL_DropEventRecord is record
      typ       : aliased Uint32;
      timestamp : aliased Uint32;
      file      : aliased C.Strings.chars_ptr;
		windowID  : aliased Uint32; -- rgv:  to match v207
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_DropEventRecord);

   type SDL_QuitEventRecord is record
      typ       : aliased Uint32;
      timestamp : aliased Uint32;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_QuitEventRecord);

   type SDL_OSEventRecord is record
      typ       : aliased Uint32;
      timestamp : aliased Uint32;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_OSEventRecord);

   type SDL_UserEventRecord is record
      typ       : aliased Uint32;
      timestamp : aliased Uint32;
      windowID  : aliased Uint32;
      code      : aliased Sint32;
      data1     : aliased System.Address;
      data2     : aliased System.Address;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_UserEventRecord);

   subtype SDL_SysWMmsg is System.Address;
   type SDL_SysWMEventRecord is record
      typ       : aliased Uint32;
      timestamp : aliased Uint32;
      --msg       : aliased SDL_SysWMmsg;
      msg       : system.address; -- rgv to match v207
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_SysWMEventRecord);

   type SDL_Event_padding_array is array (0 .. 55) of aliased Uint8;
   type SDL_Event (discr : C.unsigned := 0) is record
      case discr is
         when 0 =>
            typ : aliased Uint32;
         when 1 =>
            common : aliased SDL_CommonEventRecord;
         when 2 =>
            window : aliased SDL_WindowEventRecord;
         when 3 =>
            key : aliased SDL_KeyboardEventRecord;
         when 4 =>
            edit : aliased SDL_TextEditingEventRecord;
         when 5 =>
            text : aliased SDL_TextInputEventRecord;
         when 6 =>
            motion : aliased SDL_MouseMotionEventRecord;
         when 7 =>
            button : aliased SDL_MouseButtonEventRecord;
         when 8 =>
            wheel : aliased SDL_MouseWheelEventRecord;
         when 9 =>
            jaxis : aliased SDL_JoyAxisEventRecord;
         when 10 =>
            jball : aliased SDL_JoyBallEventRecord;
         when 11 =>
            jhat : aliased SDL_JoyHatEventRecord;
         when 12 =>
            jbutton : aliased SDL_JoyButtonEventRecord;
         when 13 =>
            jdevice : aliased SDL_JoyDeviceEventRecord;
         when 14 =>
            caxis : aliased SDL_ControllerAxisEventRecord;
         when 15 =>
            cbutton : aliased SDL_ControllerButtonEventRecord;
         when 16 =>
            cdevice : aliased SDL_ControllerDeviceEventRecord;
         when 17 =>
            quit : aliased SDL_QuitEventRecord;
         when 18 =>
            user : aliased SDL_UserEventRecord;
         when 19 =>
            syswm : aliased SDL_SysWMEventRecord;
         when 20 =>
            tfinger : aliased SDL_TouchFingerEventRecord;
         when 21 =>
            mgesture : aliased SDL_MultiGestureEventRecord;
         when 22 =>
            dgesture : aliased SDL_DollarGestureEventRecord;
         when 23 =>
            drop : aliased SDL_DropEventRecord;
         when others =>
            padding : aliased SDL_Event_padding_array;
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_Event);
   pragma Unchecked_Union (SDL_Event);




--murufas
   --type SDL_EventArray is array (C.size_t range <>) of aliased SDL_Event;
   --pragma Convention (C, SDL_EventArray);



   subtype zCFILE is libio_h.u_IO_FILE;  -- /usr/include/stdio.h:48











   procedure SDL_PumpEvents;
   pragma Import (C, SDL_PumpEvents, "SDL_PumpEvents");

   type SDL_eventaction is (SDL_ADDEVENT, SDL_PEEKEVENT, SDL_GETEVENT);
   pragma Convention (C, SDL_eventaction);

   function SDL_PeepEvents
     (events    : access SDL_Event;
      numevents : C.int;
      action    : SDL_eventaction;
      minType   : Uint32;
      maxType   : Uint32) return C.int;
   pragma Import (C, SDL_PeepEvents, "SDL_PeepEvents");

   function SDL_HasEvent (typ : Uint32) return SDL_bool;
   pragma Import (C, SDL_HasEvent, "SDL_HasEvent");

   function SDL_HasEvents (minType : Uint32; maxType : Uint32) return SDL_bool;
   pragma Import (C, SDL_HasEvents, "SDL_HasEvents");

   procedure SDL_FlushEvent (typ : Uint32);
   pragma Import (C, SDL_FlushEvent, "SDL_FlushEvent");

   procedure SDL_FlushEvents (minType : Uint32; maxType : Uint32);
   pragma Import (C, SDL_FlushEvents, "SDL_FlushEvents");

--fastrgv 8dec14
   --function SDL_PollEvent (event : system.address) return C.int;
   function SDL_PollEvent (event : access SDL_Event) return C.int;
   pragma Import (C, SDL_PollEvent, "SDL_PollEvent");

   function SDL_WaitEvent (event : access SDL_Event) return C.int;
   pragma Import (C, SDL_WaitEvent, "SDL_WaitEvent");

   function SDL_WaitEventTimeout
     (event   : access SDL_Event;
      timeout : C.int) return C.int;
   pragma Import (C, SDL_WaitEventTimeout, "SDL_WaitEventTimeout");

   function SDL_PushEvent (event : access SDL_Event) return C.int;
   pragma Import (C, SDL_PushEvent, "SDL_PushEvent");

   type SDL_EventFilter is access function
     (userdata : System.Address;
      event    : access SDL_Event) return C.int;
   pragma Convention (C, SDL_EventFilter);

   procedure SDL_SetEventFilter
     (filter   : SDL_EventFilter;
      userdata : System.Address);
   pragma Import (C, SDL_SetEventFilter, "SDL_SetEventFilter");

   function SDL_GetEventFilter
     (filter   : access SDL_EventFilter;
      userdata : System.Address) return SDL_bool;
   pragma Import (C, SDL_GetEventFilter, "SDL_GetEventFilter");

   procedure SDL_AddEventWatch
     (filter   : SDL_EventFilter;
      userdata : System.Address);
   pragma Import (C, SDL_AddEventWatch, "SDL_AddEventWatch");

   procedure SDL_DelEventWatch
     (filter   : SDL_EventFilter;
      userdata : System.Address);
   pragma Import (C, SDL_DelEventWatch, "SDL_DelEventWatch");

   procedure SDL_FilterEvents
     (filter   : SDL_EventFilter;
      userdata : System.Address);
   pragma Import (C, SDL_FilterEvents, "SDL_FilterEvents");

   SDL_QUERY   : constant := -1;
   SDL_IGNORE  : constant := 0;
   SDL_DISABLE : constant := 0;
   SDL_ENABLE  : constant := 1;

   function SDL_EventState (typ : Uint32; state : C.int) return Uint8;
   pragma Import (C, SDL_EventState, "SDL_EventState");

   --function SDL_GetEventState (typ : Uint32) return Uint8;
   --pragma Inline (SDL_GetEventState);
	-- rgv : this corresponds to a macro (see sdl_events_h.ads line 26)

   function SDL_RegisterEvents (numevents : C.int) return Uint32;
   pragma Import (C, SDL_RegisterEvents, "SDL_RegisterEvents");





end SDL;

