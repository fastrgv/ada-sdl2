pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with SDL_stdinc_h;

package SDL_keycode_h is

   SDLK_SCANCODE_MASK : constant := (2**30);  --  ../inc209/SDL_keycode.h:47
   --  arg-macro: function SDL_SCANCODE_TO_KEYCODE (X)
   --    return X or SDLK_SCANCODE_MASK;
   --  unsupported macro: KMOD_CTRL (KMOD_LCTRL|KMOD_RCTRL)
   --  unsupported macro: KMOD_SHIFT (KMOD_LSHIFT|KMOD_RSHIFT)
   --  unsupported macro: KMOD_ALT (KMOD_LALT|KMOD_RALT)
   --  unsupported macro: KMOD_GUI (KMOD_LGUI|KMOD_RGUI)

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
  -- *  \file SDL_keycode.h
  -- *
  -- *  Defines constants which identify keyboard keys and modifiers.
  --  

  --*
  -- *  \brief The SDL virtual key representation.
  -- *
  -- *  Values of this type are used to represent keyboard keys using the current
  -- *  layout of the keyboard.  These values include Unicode values representing
  -- *  the unmodified character that would be generated by pressing the key, or
  -- *  an SDLK_* constant for those keys that do not generate characters.
  -- *
  -- *  A special exception is the number keys at the top of the keyboard which
  -- *  always map to SDLK_0...SDLK_9, regardless of layout.
  --  

   subtype SDL_Keycode is SDL_stdinc_h.Sint32;  -- ../inc209/SDL_keycode.h:45


   --function SDL_SCANCODE_TO_KEYCODE (X : SDL_Scancode) return SDL_Keycode;
   --pragma Inline (SDL_SCANCODE_TO_KEYCODE);


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


  --*
  -- * \brief Enumeration of valid key mods (possibly OR'd together).
  --  

   subtype SDL_Keymod is unsigned;
   KMOD_NONE : constant unsigned := 0;
   KMOD_LSHIFT : constant unsigned := 1;
   KMOD_RSHIFT : constant unsigned := 2;
   KMOD_LCTRL : constant unsigned := 64;
   KMOD_RCTRL : constant unsigned := 128;
   KMOD_LALT : constant unsigned := 256;
   KMOD_RALT : constant unsigned := 512;
   KMOD_LGUI : constant unsigned := 1024;
   KMOD_RGUI : constant unsigned := 2048;
   KMOD_NUM : constant unsigned := 4096;
   KMOD_CAPS : constant unsigned := 8192;
   KMOD_MODE : constant unsigned := 16384;
   KMOD_RESERVED : constant unsigned := 32768;  -- ../inc209/SDL_keycode.h:340

  -- vi: set ts=4 sw=4 expandtab:  
end SDL_keycode_h;
