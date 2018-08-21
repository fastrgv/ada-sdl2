pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package SDL_scancode_h is

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
  -- *  \file SDL_scancode.h
  -- *
  -- *  Defines keyboard scancodes.
  --  

  --*
  -- *  \brief The SDL keyboard scancode representation.
  -- *
  -- *  Values of this type are used to represent keyboard keys, among other places
  -- *  in the \link SDL_Keysym::scancode key.keysym.scancode \endlink field of the
  -- *  SDL_Event structure.
  -- *
  -- *  The values in this enumeration are based on the USB usage page standard:
  -- *  http://www.usb.org/developers/hidpage/Hut1_12v2.pdf
  --  

  --*
  --     *  \name Usage page 0x07
  --     *
  --     *  These values are from usage page 0x07 (USB keyboard page).
  --      

  -- @{  
  --*< Located at the lower left of the return
  --                                  *   key on ISO keyboards and at the right end
  --                                  *   of the QWERTY row on ANSI keyboards.
  --                                  *   Produces REVERSE SOLIDUS (backslash) and
  --                                  *   VERTICAL LINE in a US layout, REVERSE
  --                                  *   SOLIDUS and VERTICAL LINE in a UK Mac
  --                                  *   layout, NUMBER SIGN and TILDE in a UK
  --                                  *   Windows layout, DOLLAR SIGN and POUND SIGN
  --                                  *   in a Swiss German layout, NUMBER SIGN and
  --                                  *   APOSTROPHE in a German layout, GRAVE
  --                                  *   ACCENT and POUND SIGN in a French Mac
  --                                  *   layout, and ASTERISK and MICRO SIGN in a
  --                                  *   French Windows layout.
  --                                   

  --*< ISO USB keyboards actually use this code
  --                                  *   instead of 49 for the same key, but all
  --                                  *   OSes I've seen treat the two codes
  --                                  *   identically. So, as an implementor, unless
  --                                  *   your keyboard generates both of those
  --                                  *   codes and your OS treats them differently,
  --                                  *   you should generate SDL_SCANCODE_BACKSLASH
  --                                  *   instead of this code. As a user, you
  --                                  *   should not rely on this code because SDL
  --                                  *   will never generate it with most (all?)
  --                                  *   keyboards.
  --                                   

  --*< Located in the top left corner (on both ANSI
  --                              *   and ISO keyboards). Produces GRAVE ACCENT and
  --                              *   TILDE in a US Windows layout and in US and UK
  --                              *   Mac layouts on ANSI keyboards, GRAVE ACCENT
  --                              *   and NOT SIGN in a UK Windows layout, SECTION
  --                              *   SIGN and PLUS-MINUS SIGN in US and UK Mac
  --                              *   layouts on ISO keyboards, SECTION SIGN and
  --                              *   DEGREE SIGN in a Swiss German layout (Mac:
  --                              *   only on ISO keyboards), CIRCUMFLEX ACCENT and
  --                              *   DEGREE SIGN in a German layout (Mac: only on
  --                              *   ISO keyboards), SUPERSCRIPT TWO and TILDE in a
  --                              *   French Windows layout, COMMERCIAL AT and
  --                              *   NUMBER SIGN in a French Mac layout on ISO
  --                              *   keyboards, and LESS-THAN SIGN and GREATER-THAN
  --                              *   SIGN in a Swiss German, German, or French Mac
  --                              *   layout on ANSI keyboards.
  --                               

  --*< insert on PC, help on some Mac keyboards (but
  --                                   does send code 73, not 117)  

  --*< num lock on PC, clear on Mac keyboards
  --                                      

  --*< This is the additional key that ISO
  --                                        *   keyboards have over ANSI ones,
  --                                        *   located between left shift and Y.
  --                                        *   Produces GRAVE ACCENT and TILDE in a
  --                                        *   US or UK Mac layout, REVERSE SOLIDUS
  --                                        *   (backslash) and VERTICAL LINE in a
  --                                        *   US or UK Windows layout, and
  --                                        *   LESS-THAN SIGN and GREATER-THAN SIGN
  --                                        *   in a Swiss German, German, or French
  --                                        *   layout.  

  --*< windows contextual menu, compose  
  --*< The USB document says this is a status flag,
  --                               *   not a physical key - but some Mac keyboards
  --                               *   do have a power key.  

  --*< redo  
  -- not sure whether there's a reason to enable these  
  --     SDL_SCANCODE_LOCKINGCAPSLOCK = 130,   
  --     SDL_SCANCODE_LOCKINGNUMLOCK = 131,  
  --     SDL_SCANCODE_LOCKINGSCROLLLOCK = 132,  
  --*< used on Asian keyboards, see
  --                                            footnotes in USB doc  

  --*< Yen  
  --*< Hangul/English toggle  
  --*< Hanja conversion  
  --*< Katakana  
  --*< Hiragana  
  --*< Zenkaku/Hankaku  
  --*< reserved  
  --*< reserved  
  --*< reserved  
  --*< reserved  
  --*< Erase-Eaze  
  --*< alt, option  
  --*< windows, command (apple), meta  
  --*< alt gr, option  
  --*< windows, command (apple), meta  
  --*< I'm not sure if this is really not covered
  --                                 *   by any of the above, but since there's a
  --                                 *   special KMOD_MODE for it I'm adding it here
  --                                  

  -- @}  
  -- Usage page 0x07  
  --*
  --     *  \name Usage page 0x0C
  --     *
  --     *  These values are mapped from usage page 0x0C (USB consumer page).
  --      

  -- @{  
  -- @}  
  -- Usage page 0x0C  
  --*
  --     *  \name Walther keys
  --     *
  --     *  These are values that Christian Walther added (for mac keyboard?).
  --      

  -- @{  
  --*< display mirroring/dual display
  --                                           switch, video mode switch  

  -- @}  
  -- Walther keys  
  --*
  --     *  \name Usage page 0x0C (additional media keys)
  --     *
  --     *  These values are mapped from usage page 0x0C (USB consumer page).
  --      

  -- @{  
  -- @}  
  -- Usage page 0x0C (additional media keys)  
  -- Add any other keys here.  
  --*< not a key, just marks the number of scancodes
  --                                 for array bounds  

   subtype SDL_Scancode is unsigned;
   SDL_SCANCODE_UNKNOWN : constant SDL_Scancode := 0;
   SDL_SCANCODE_A : constant SDL_Scancode := 4;
   SDL_SCANCODE_B : constant SDL_Scancode := 5;
   SDL_SCANCODE_C : constant SDL_Scancode := 6;
   SDL_SCANCODE_D : constant SDL_Scancode := 7;
   SDL_SCANCODE_E : constant SDL_Scancode := 8;
   SDL_SCANCODE_F : constant SDL_Scancode := 9;
   SDL_SCANCODE_G : constant SDL_Scancode := 10;
   SDL_SCANCODE_H : constant SDL_Scancode := 11;
   SDL_SCANCODE_I : constant SDL_Scancode := 12;
   SDL_SCANCODE_J : constant SDL_Scancode := 13;
   SDL_SCANCODE_K : constant SDL_Scancode := 14;
   SDL_SCANCODE_L : constant SDL_Scancode := 15;
   SDL_SCANCODE_M : constant SDL_Scancode := 16;
   SDL_SCANCODE_N : constant SDL_Scancode := 17;
   SDL_SCANCODE_O : constant SDL_Scancode := 18;
   SDL_SCANCODE_P : constant SDL_Scancode := 19;
   SDL_SCANCODE_Q : constant SDL_Scancode := 20;
   SDL_SCANCODE_R : constant SDL_Scancode := 21;
   SDL_SCANCODE_S : constant SDL_Scancode := 22;
   SDL_SCANCODE_T : constant SDL_Scancode := 23;
   SDL_SCANCODE_U : constant SDL_Scancode := 24;
   SDL_SCANCODE_V : constant SDL_Scancode := 25;
   SDL_SCANCODE_W : constant SDL_Scancode := 26;
   SDL_SCANCODE_X : constant SDL_Scancode := 27;
   SDL_SCANCODE_Y : constant SDL_Scancode := 28;
   SDL_SCANCODE_Z : constant SDL_Scancode := 29;
   SDL_SCANCODE_1 : constant SDL_Scancode := 30;
   SDL_SCANCODE_2 : constant SDL_Scancode := 31;
   SDL_SCANCODE_3 : constant SDL_Scancode := 32;
   SDL_SCANCODE_4 : constant SDL_Scancode := 33;
   SDL_SCANCODE_5 : constant SDL_Scancode := 34;
   SDL_SCANCODE_6 : constant SDL_Scancode := 35;
   SDL_SCANCODE_7 : constant SDL_Scancode := 36;
   SDL_SCANCODE_8 : constant SDL_Scancode := 37;
   SDL_SCANCODE_9 : constant SDL_Scancode := 38;
   SDL_SCANCODE_0 : constant SDL_Scancode := 39;
   SDL_SCANCODE_RETURN : constant SDL_Scancode := 40;
   SDL_SCANCODE_ESCAPE : constant SDL_Scancode := 41;
   SDL_SCANCODE_BACKSPACE : constant SDL_Scancode := 42;
   SDL_SCANCODE_TAB : constant SDL_Scancode := 43;
   SDL_SCANCODE_SPACE : constant SDL_Scancode := 44;
   SDL_SCANCODE_MINUS : constant SDL_Scancode := 45;
   SDL_SCANCODE_EQUALS : constant SDL_Scancode := 46;
   SDL_SCANCODE_LEFTBRACKET : constant SDL_Scancode := 47;
   SDL_SCANCODE_RIGHTBRACKET : constant SDL_Scancode := 48;
   SDL_SCANCODE_BACKSLASH : constant SDL_Scancode := 49;
   SDL_SCANCODE_NONUSHASH : constant SDL_Scancode := 50;
   SDL_SCANCODE_SEMICOLON : constant SDL_Scancode := 51;
   SDL_SCANCODE_APOSTROPHE : constant SDL_Scancode := 52;
   SDL_SCANCODE_GRAVE : constant SDL_Scancode := 53;
   SDL_SCANCODE_COMMA : constant SDL_Scancode := 54;
   SDL_SCANCODE_PERIOD : constant SDL_Scancode := 55;
   SDL_SCANCODE_SLASH : constant SDL_Scancode := 56;
   SDL_SCANCODE_CAPSLOCK : constant SDL_Scancode := 57;
   SDL_SCANCODE_F1 : constant SDL_Scancode := 58;
   SDL_SCANCODE_F2 : constant SDL_Scancode := 59;
   SDL_SCANCODE_F3 : constant SDL_Scancode := 60;
   SDL_SCANCODE_F4 : constant SDL_Scancode := 61;
   SDL_SCANCODE_F5 : constant SDL_Scancode := 62;
   SDL_SCANCODE_F6 : constant SDL_Scancode := 63;
   SDL_SCANCODE_F7 : constant SDL_Scancode := 64;
   SDL_SCANCODE_F8 : constant SDL_Scancode := 65;
   SDL_SCANCODE_F9 : constant SDL_Scancode := 66;
   SDL_SCANCODE_F10 : constant SDL_Scancode := 67;
   SDL_SCANCODE_F11 : constant SDL_Scancode := 68;
   SDL_SCANCODE_F12 : constant SDL_Scancode := 69;
   SDL_SCANCODE_PRINTSCREEN : constant SDL_Scancode := 70;
   SDL_SCANCODE_SCROLLLOCK : constant SDL_Scancode := 71;
   SDL_SCANCODE_PAUSE : constant SDL_Scancode := 72;
   SDL_SCANCODE_INSERT : constant SDL_Scancode := 73;
   SDL_SCANCODE_HOME : constant SDL_Scancode := 74;
   SDL_SCANCODE_PAGEUP : constant SDL_Scancode := 75;
   SDL_SCANCODE_DELETE : constant SDL_Scancode := 76;
   SDL_SCANCODE_END : constant SDL_Scancode := 77;
   SDL_SCANCODE_PAGEDOWN : constant SDL_Scancode := 78;
   SDL_SCANCODE_RIGHT : constant SDL_Scancode := 79;
   SDL_SCANCODE_LEFT : constant SDL_Scancode := 80;
   SDL_SCANCODE_DOWN : constant SDL_Scancode := 81;
   SDL_SCANCODE_UP : constant SDL_Scancode := 82;
   SDL_SCANCODE_NUMLOCKCLEAR : constant SDL_Scancode := 83;
   SDL_SCANCODE_KP_DIVIDE : constant SDL_Scancode := 84;
   SDL_SCANCODE_KP_MULTIPLY : constant SDL_Scancode := 85;
   SDL_SCANCODE_KP_MINUS : constant SDL_Scancode := 86;
   SDL_SCANCODE_KP_PLUS : constant SDL_Scancode := 87;
   SDL_SCANCODE_KP_ENTER : constant SDL_Scancode := 88;
   SDL_SCANCODE_KP_1 : constant SDL_Scancode := 89;
   SDL_SCANCODE_KP_2 : constant SDL_Scancode := 90;
   SDL_SCANCODE_KP_3 : constant SDL_Scancode := 91;
   SDL_SCANCODE_KP_4 : constant SDL_Scancode := 92;
   SDL_SCANCODE_KP_5 : constant SDL_Scancode := 93;
   SDL_SCANCODE_KP_6 : constant SDL_Scancode := 94;
   SDL_SCANCODE_KP_7 : constant SDL_Scancode := 95;
   SDL_SCANCODE_KP_8 : constant SDL_Scancode := 96;
   SDL_SCANCODE_KP_9 : constant SDL_Scancode := 97;
   SDL_SCANCODE_KP_0 : constant SDL_Scancode := 98;
   SDL_SCANCODE_KP_PERIOD : constant SDL_Scancode := 99;
   SDL_SCANCODE_NONUSBACKSLASH : constant SDL_Scancode := 100;
   SDL_SCANCODE_APPLICATION : constant SDL_Scancode := 101;
   SDL_SCANCODE_POWER : constant SDL_Scancode := 102;
   SDL_SCANCODE_KP_EQUALS : constant SDL_Scancode := 103;
   SDL_SCANCODE_F13 : constant SDL_Scancode := 104;
   SDL_SCANCODE_F14 : constant SDL_Scancode := 105;
   SDL_SCANCODE_F15 : constant SDL_Scancode := 106;
   SDL_SCANCODE_F16 : constant SDL_Scancode := 107;
   SDL_SCANCODE_F17 : constant SDL_Scancode := 108;
   SDL_SCANCODE_F18 : constant SDL_Scancode := 109;
   SDL_SCANCODE_F19 : constant SDL_Scancode := 110;
   SDL_SCANCODE_F20 : constant SDL_Scancode := 111;
   SDL_SCANCODE_F21 : constant SDL_Scancode := 112;
   SDL_SCANCODE_F22 : constant SDL_Scancode := 113;
   SDL_SCANCODE_F23 : constant SDL_Scancode := 114;
   SDL_SCANCODE_F24 : constant SDL_Scancode := 115;
   SDL_SCANCODE_EXECUTE : constant SDL_Scancode := 116;
   SDL_SCANCODE_HELP : constant SDL_Scancode := 117;
   SDL_SCANCODE_MENU : constant SDL_Scancode := 118;
   SDL_SCANCODE_SELECT : constant SDL_Scancode := 119;
   SDL_SCANCODE_STOP : constant SDL_Scancode := 120;
   SDL_SCANCODE_AGAIN : constant SDL_Scancode := 121;
   SDL_SCANCODE_UNDO : constant SDL_Scancode := 122;
   SDL_SCANCODE_CUT : constant SDL_Scancode := 123;
   SDL_SCANCODE_COPY : constant SDL_Scancode := 124;
   SDL_SCANCODE_PASTE : constant SDL_Scancode := 125;
   SDL_SCANCODE_FIND : constant SDL_Scancode := 126;
   SDL_SCANCODE_MUTE : constant SDL_Scancode := 127;
   SDL_SCANCODE_VOLUMEUP : constant SDL_Scancode := 128;
   SDL_SCANCODE_VOLUMEDOWN : constant SDL_Scancode := 129;
   SDL_SCANCODE_KP_COMMA : constant SDL_Scancode := 133;
   SDL_SCANCODE_KP_EQUALSAS400 : constant SDL_Scancode := 134;
   SDL_SCANCODE_INTERNATIONAL1 : constant SDL_Scancode := 135;
   SDL_SCANCODE_INTERNATIONAL2 : constant SDL_Scancode := 136;
   SDL_SCANCODE_INTERNATIONAL3 : constant SDL_Scancode := 137;
   SDL_SCANCODE_INTERNATIONAL4 : constant SDL_Scancode := 138;
   SDL_SCANCODE_INTERNATIONAL5 : constant SDL_Scancode := 139;
   SDL_SCANCODE_INTERNATIONAL6 : constant SDL_Scancode := 140;
   SDL_SCANCODE_INTERNATIONAL7 : constant SDL_Scancode := 141;
   SDL_SCANCODE_INTERNATIONAL8 : constant SDL_Scancode := 142;
   SDL_SCANCODE_INTERNATIONAL9 : constant SDL_Scancode := 143;
   SDL_SCANCODE_LANG1 : constant SDL_Scancode := 144;
   SDL_SCANCODE_LANG2 : constant SDL_Scancode := 145;
   SDL_SCANCODE_LANG3 : constant SDL_Scancode := 146;
   SDL_SCANCODE_LANG4 : constant SDL_Scancode := 147;
   SDL_SCANCODE_LANG5 : constant SDL_Scancode := 148;
   SDL_SCANCODE_LANG6 : constant SDL_Scancode := 149;
   SDL_SCANCODE_LANG7 : constant SDL_Scancode := 150;
   SDL_SCANCODE_LANG8 : constant SDL_Scancode := 151;
   SDL_SCANCODE_LANG9 : constant SDL_Scancode := 152;
   SDL_SCANCODE_ALTERASE : constant SDL_Scancode := 153;
   SDL_SCANCODE_SYSREQ : constant SDL_Scancode := 154;
   SDL_SCANCODE_CANCEL : constant SDL_Scancode := 155;
   SDL_SCANCODE_CLEAR : constant SDL_Scancode := 156;
   SDL_SCANCODE_PRIOR : constant SDL_Scancode := 157;
   SDL_SCANCODE_RETURN2 : constant SDL_Scancode := 158;
   SDL_SCANCODE_SEPARATOR : constant SDL_Scancode := 159;
   SDL_SCANCODE_OUT : constant SDL_Scancode := 160;
   SDL_SCANCODE_OPER : constant SDL_Scancode := 161;
   SDL_SCANCODE_CLEARAGAIN : constant SDL_Scancode := 162;
   SDL_SCANCODE_CRSEL : constant SDL_Scancode := 163;
   SDL_SCANCODE_EXSEL : constant SDL_Scancode := 164;
   SDL_SCANCODE_KP_00 : constant SDL_Scancode := 176;
   SDL_SCANCODE_KP_000 : constant SDL_Scancode := 177;
   SDL_SCANCODE_THOUSANDSSEPARATOR : constant SDL_Scancode := 178;
   SDL_SCANCODE_DECIMALSEPARATOR : constant SDL_Scancode := 179;
   SDL_SCANCODE_CURRENCYUNIT : constant SDL_Scancode := 180;
   SDL_SCANCODE_CURRENCYSUBUNIT : constant SDL_Scancode := 181;
   SDL_SCANCODE_KP_LEFTPAREN : constant SDL_Scancode := 182;
   SDL_SCANCODE_KP_RIGHTPAREN : constant SDL_Scancode := 183;
   SDL_SCANCODE_KP_LEFTBRACE : constant SDL_Scancode := 184;
   SDL_SCANCODE_KP_RIGHTBRACE : constant SDL_Scancode := 185;
   SDL_SCANCODE_KP_TAB : constant SDL_Scancode := 186;
   SDL_SCANCODE_KP_BACKSPACE : constant SDL_Scancode := 187;
   SDL_SCANCODE_KP_A : constant SDL_Scancode := 188;
   SDL_SCANCODE_KP_B : constant SDL_Scancode := 189;
   SDL_SCANCODE_KP_C : constant SDL_Scancode := 190;
   SDL_SCANCODE_KP_D : constant SDL_Scancode := 191;
   SDL_SCANCODE_KP_E : constant SDL_Scancode := 192;
   SDL_SCANCODE_KP_F : constant SDL_Scancode := 193;
   SDL_SCANCODE_KP_XOR : constant SDL_Scancode := 194;
   SDL_SCANCODE_KP_POWER : constant SDL_Scancode := 195;
   SDL_SCANCODE_KP_PERCENT : constant SDL_Scancode := 196;
   SDL_SCANCODE_KP_LESS : constant SDL_Scancode := 197;
   SDL_SCANCODE_KP_GREATER : constant SDL_Scancode := 198;
   SDL_SCANCODE_KP_AMPERSAND : constant SDL_Scancode := 199;
   SDL_SCANCODE_KP_DBLAMPERSAND : constant SDL_Scancode := 200;
   SDL_SCANCODE_KP_VERTICALBAR : constant SDL_Scancode := 201;
   SDL_SCANCODE_KP_DBLVERTICALBAR : constant SDL_Scancode := 202;
   SDL_SCANCODE_KP_COLON : constant SDL_Scancode := 203;
   SDL_SCANCODE_KP_HASH : constant SDL_Scancode := 204;
   SDL_SCANCODE_KP_SPACE : constant SDL_Scancode := 205;
   SDL_SCANCODE_KP_AT : constant SDL_Scancode := 206;
   SDL_SCANCODE_KP_EXCLAM : constant SDL_Scancode := 207;
   SDL_SCANCODE_KP_MEMSTORE : constant SDL_Scancode := 208;
   SDL_SCANCODE_KP_MEMRECALL : constant SDL_Scancode := 209;
   SDL_SCANCODE_KP_MEMCLEAR : constant SDL_Scancode := 210;
   SDL_SCANCODE_KP_MEMADD : constant SDL_Scancode := 211;
   SDL_SCANCODE_KP_MEMSUBTRACT : constant SDL_Scancode := 212;
   SDL_SCANCODE_KP_MEMMULTIPLY : constant SDL_Scancode := 213;
   SDL_SCANCODE_KP_MEMDIVIDE : constant SDL_Scancode := 214;
   SDL_SCANCODE_KP_PLUSMINUS : constant SDL_Scancode := 215;
   SDL_SCANCODE_KP_CLEAR : constant SDL_Scancode := 216;
   SDL_SCANCODE_KP_CLEARENTRY : constant SDL_Scancode := 217;
   SDL_SCANCODE_KP_BINARY : constant SDL_Scancode := 218;
   SDL_SCANCODE_KP_OCTAL : constant SDL_Scancode := 219;
   SDL_SCANCODE_KP_DECIMAL : constant SDL_Scancode := 220;
   SDL_SCANCODE_KP_HEXADECIMAL : constant SDL_Scancode := 221;
   SDL_SCANCODE_LCTRL : constant SDL_Scancode := 224;
   SDL_SCANCODE_LSHIFT : constant SDL_Scancode := 225;
   SDL_SCANCODE_LALT : constant SDL_Scancode := 226;
   SDL_SCANCODE_LGUI : constant SDL_Scancode := 227;
   SDL_SCANCODE_RCTRL : constant SDL_Scancode := 228;
   SDL_SCANCODE_RSHIFT : constant SDL_Scancode := 229;
   SDL_SCANCODE_RALT : constant SDL_Scancode := 230;
   SDL_SCANCODE_RGUI : constant SDL_Scancode := 231;
   SDL_SCANCODE_MODE : constant SDL_Scancode := 257;
   SDL_SCANCODE_AUDIONEXT : constant SDL_Scancode := 258;
   SDL_SCANCODE_AUDIOPREV : constant SDL_Scancode := 259;
   SDL_SCANCODE_AUDIOSTOP : constant SDL_Scancode := 260;
   SDL_SCANCODE_AUDIOPLAY : constant SDL_Scancode := 261;
   SDL_SCANCODE_AUDIOMUTE : constant SDL_Scancode := 262;
   SDL_SCANCODE_MEDIASELECT : constant SDL_Scancode := 263;
   SDL_SCANCODE_WWW : constant SDL_Scancode := 264;
   SDL_SCANCODE_MAIL : constant SDL_Scancode := 265;
   SDL_SCANCODE_CALCULATOR : constant SDL_Scancode := 266;
   SDL_SCANCODE_COMPUTER : constant SDL_Scancode := 267;
   SDL_SCANCODE_AC_SEARCH : constant SDL_Scancode := 268;
   SDL_SCANCODE_AC_HOME : constant SDL_Scancode := 269;
   SDL_SCANCODE_AC_BACK : constant SDL_Scancode := 270;
   SDL_SCANCODE_AC_FORWARD : constant SDL_Scancode := 271;
   SDL_SCANCODE_AC_STOP : constant SDL_Scancode := 272;
   SDL_SCANCODE_AC_REFRESH : constant SDL_Scancode := 273;
   SDL_SCANCODE_AC_BOOKMARKS : constant SDL_Scancode := 274;
   SDL_SCANCODE_BRIGHTNESSDOWN : constant SDL_Scancode := 275;
   SDL_SCANCODE_BRIGHTNESSUP : constant SDL_Scancode := 276;
   SDL_SCANCODE_DISPLAYSWITCH : constant SDL_Scancode := 277;
   SDL_SCANCODE_KBDILLUMTOGGLE : constant SDL_Scancode := 278;
   SDL_SCANCODE_KBDILLUMDOWN : constant SDL_Scancode := 279;
   SDL_SCANCODE_KBDILLUMUP : constant SDL_Scancode := 280;
   SDL_SCANCODE_EJECT : constant SDL_Scancode := 281;
   SDL_SCANCODE_SLEEP : constant SDL_Scancode := 282;
   SDL_SCANCODE_APP1 : constant SDL_Scancode := 283;
   SDL_SCANCODE_APP2 : constant SDL_Scancode := 284;
   SDL_SCANCODE_AUDIOREWIND : constant SDL_Scancode := 285;
   SDL_SCANCODE_AUDIOFASTFORWARD : constant SDL_Scancode := 286;
   SDL_NUM_SCANCODES : constant SDL_Scancode := 512;  -- ../inc208/SDL_scancode.h:409

  -- vi: set ts=4 sw=4 expandtab:  
end SDL_scancode_h;
