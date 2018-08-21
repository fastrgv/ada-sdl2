pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with stddef_h;
with xlocale_h;
with System;
with Interfaces.C.Strings;
with Interfaces.C.Extensions;
limited with stdio_h;

package wchar_h is

   --  unsupported macro: WCHAR_MIN __WCHAR_MIN
   --  unsupported macro: WCHAR_MAX __WCHAR_MAX
   WEOF : constant := (16#ffffffff#);  --  /usr/include/wchar.h:122

  -- Copyright (C) 1995-2016 Free Software Foundation, Inc.
  --   This file is part of the GNU C Library.
  --   The GNU C Library is free software; you can redistribute it and/or
  --   modify it under the terms of the GNU Lesser General Public
  --   License as published by the Free Software Foundation; either
  --   version 2.1 of the License, or (at your option) any later version.
  --   The GNU C Library is distributed in the hope that it will be useful,
  --   but WITHOUT ANY WARRANTY; without even the implied warranty of
  --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  --   Lesser General Public License for more details.
  --   You should have received a copy of the GNU Lesser General Public
  --   License along with the GNU C Library; if not, see
  --   <http://www.gnu.org/licenses/>.   

  -- *      ISO C99 Standard: 7.24
  -- *	Extended multibyte and wide character utilities	<wchar.h>
  --  

  -- Get FILE definition.   
  -- Get va_list definition.   
  -- Get size_t, wchar_t, wint_t and NULL from <stddef.h>.   
  -- We try to get wint_t from <stddef.h>, but not all GCC versions define it
  --   there.  So define it ourselves if it remains undefined.   

  -- Integral type unchanged by default argument promotions that can
  --   hold any value corresponding to members of the extended character
  --   set, as well as at least one value that does not correspond to any
  --   member of the extended character set.   

  -- Work around problems with the <stddef.h> file which doesn't put
  --   wint_t in the std namespace.   

  -- Tell the caller that we provide correct C++ prototypes.   
  -- Conversion state information.   
   type uu_mbstate_t;
   subtype uu_mbstate_t_uu_wchb_array is Interfaces.C.char_array (0 .. 3);
   type anon_14 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_wch : aliased unsigned;  -- /usr/include/wchar.h:88
         when others =>
            uu_wchb : aliased uu_mbstate_t_uu_wchb_array;  -- /usr/include/wchar.h:92
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_14);
   pragma Unchecked_Union (anon_14);type uu_mbstate_t is record
      uu_count : aliased int;  -- /usr/include/wchar.h:84
      uu_value : aliased anon_14;  -- /usr/include/wchar.h:93
   end record;
   pragma Convention (C_Pass_By_Copy, uu_mbstate_t);  -- /usr/include/wchar.h:94

   --  skipped anonymous struct anon_13

  -- Value so far.   
  -- The rest of the file is only used if used if __need_mbstate_t is not
  --   defined.   

  -- Public type.   
   subtype mbstate_t is uu_mbstate_t;  -- /usr/include/wchar.h:106

  -- These constants might also be defined in <inttypes.h>.   
  -- For XPG4 compliance we have to define the stuff from <wctype.h> here
  --   as well.   

  -- This incomplete type is defined in <time.h> but needed here because
  --   of `wcsftime'.   

   --  skipped empty struct tm

  -- XXX We have to clean this up at some point.  Since tm is in the std
  --   namespace but wcsftime is in __c99 the type wouldn't be found
  --   without inserting it in the global namespace.   

  -- Copy SRC to DEST.   
   function wcscpy (uu_dest : access wchar_t; uu_src : access wchar_t) return access wchar_t;  -- /usr/include/wchar.h:147
   pragma Import (C, wcscpy, "wcscpy");

  -- Copy no more than N wide-characters of SRC to DEST.   
   function wcsncpy
     (uu_dest : access wchar_t;
      uu_src : access wchar_t;
      uu_n : stddef_h.size_t) return access wchar_t;  -- /usr/include/wchar.h:152
   pragma Import (C, wcsncpy, "wcsncpy");

  -- Append SRC onto DEST.   
   function wcscat (uu_dest : access wchar_t; uu_src : access wchar_t) return access wchar_t;  -- /usr/include/wchar.h:157
   pragma Import (C, wcscat, "wcscat");

  -- Append no more than N wide-characters of SRC onto DEST.   
   function wcsncat
     (uu_dest : access wchar_t;
      uu_src : access wchar_t;
      uu_n : stddef_h.size_t) return access wchar_t;  -- /usr/include/wchar.h:161
   pragma Import (C, wcsncat, "wcsncat");

  -- Compare S1 and S2.   
   function wcscmp (uu_s1 : access wchar_t; uu_s2 : access wchar_t) return int;  -- /usr/include/wchar.h:166
   pragma Import (C, wcscmp, "wcscmp");

  -- Compare N wide-characters of S1 and S2.   
   function wcsncmp
     (uu_s1 : access wchar_t;
      uu_s2 : access wchar_t;
      uu_n : stddef_h.size_t) return int;  -- /usr/include/wchar.h:169
   pragma Import (C, wcsncmp, "wcsncmp");

  -- Compare S1 and S2, ignoring case.   
   function wcscasecmp (uu_s1 : access wchar_t; uu_s2 : access wchar_t) return int;  -- /usr/include/wchar.h:175
   pragma Import (C, wcscasecmp, "wcscasecmp");

  -- Compare no more than N chars of S1 and S2, ignoring case.   
   function wcsncasecmp
     (uu_s1 : access wchar_t;
      uu_s2 : access wchar_t;
      uu_n : stddef_h.size_t) return int;  -- /usr/include/wchar.h:178
   pragma Import (C, wcsncasecmp, "wcsncasecmp");

  -- Similar to the two functions above but take the information from
  --   the provided locale and not the global locale.   

   function wcscasecmp_l
     (uu_s1 : access wchar_t;
      uu_s2 : access wchar_t;
      uu_loc : xlocale_h.uu_locale_t) return int;  -- /usr/include/wchar.h:185
   pragma Import (C, wcscasecmp_l, "wcscasecmp_l");

   function wcsncasecmp_l
     (uu_s1 : access wchar_t;
      uu_s2 : access wchar_t;
      uu_n : stddef_h.size_t;
      uu_loc : xlocale_h.uu_locale_t) return int;  -- /usr/include/wchar.h:188
   pragma Import (C, wcsncasecmp_l, "wcsncasecmp_l");

  -- Compare S1 and S2, both interpreted as appropriate to the
  --   LC_COLLATE category of the current locale.   

   function wcscoll (uu_s1 : access wchar_t; uu_s2 : access wchar_t) return int;  -- /usr/include/wchar.h:195
   pragma Import (C, wcscoll, "wcscoll");

  -- Transform S2 into array pointed to by S1 such that if wcscmp is
  --   applied to two transformed strings the result is the as applying
  --   `wcscoll' to the original strings.   

   function wcsxfrm
     (uu_s1 : access wchar_t;
      uu_s2 : access wchar_t;
      uu_n : stddef_h.size_t) return stddef_h.size_t;  -- /usr/include/wchar.h:199
   pragma Import (C, wcsxfrm, "wcsxfrm");

  -- Similar to the two functions above but take the information from
  --   the provided locale and not the global locale.   

  -- Compare S1 and S2, both interpreted as appropriate to the
  --   LC_COLLATE category of the given locale.   

   function wcscoll_l
     (uu_s1 : access wchar_t;
      uu_s2 : access wchar_t;
      uu_loc : xlocale_h.uu_locale_t) return int;  -- /usr/include/wchar.h:209
   pragma Import (C, wcscoll_l, "wcscoll_l");

  -- Transform S2 into array pointed to by S1 such that if wcscmp is
  --   applied to two transformed strings the result is the as applying
  --   `wcscoll' to the original strings.   

   function wcsxfrm_l
     (uu_s1 : access wchar_t;
      uu_s2 : access wchar_t;
      uu_n : stddef_h.size_t;
      uu_loc : xlocale_h.uu_locale_t) return stddef_h.size_t;  -- /usr/include/wchar.h:215
   pragma Import (C, wcsxfrm_l, "wcsxfrm_l");

  -- Duplicate S, returning an identical malloc'd string.   
   function wcsdup (uu_s : access wchar_t) return access wchar_t;  -- /usr/include/wchar.h:219
   pragma Import (C, wcsdup, "wcsdup");

  -- Find the first occurrence of WC in WCS.   
   function wcschr (uu_wcs : access wchar_t; uu_wc : wchar_t) return access wchar_t;  -- /usr/include/wchar.h:225
   pragma Import (C, wcschr, "wcschr");

   function wcschr (uu_wcs : access wchar_t; uu_wc : wchar_t) return access wchar_t;  -- /usr/include/wchar.h:227
   pragma Import (C, wcschr, "wcschr");

  -- Find the last occurrence of WC in WCS.   
   function wcsrchr (uu_wcs : access wchar_t; uu_wc : wchar_t) return access wchar_t;  -- /usr/include/wchar.h:235
   pragma Import (C, wcsrchr, "wcsrchr");

   function wcsrchr (uu_wcs : access wchar_t; uu_wc : wchar_t) return access wchar_t;  -- /usr/include/wchar.h:237
   pragma Import (C, wcsrchr, "wcsrchr");

  -- This function is similar to `wcschr'.  But it returns a pointer to
  --   the closing NUL wide character in case C is not found in S.   

   function wcschrnul (uu_s : access wchar_t; uu_wc : wchar_t) return access wchar_t;  -- /usr/include/wchar.h:248
   pragma Import (C, wcschrnul, "wcschrnul");

  -- Return the length of the initial segmet of WCS which
  --   consists entirely of wide characters not in REJECT.   

   function wcscspn (uu_wcs : access wchar_t; uu_reject : access wchar_t) return stddef_h.size_t;  -- /usr/include/wchar.h:255
   pragma Import (C, wcscspn, "wcscspn");

  -- Return the length of the initial segmet of WCS which
  --   consists entirely of wide characters in  ACCEPT.   

   function wcsspn (uu_wcs : access wchar_t; uu_accept : access wchar_t) return stddef_h.size_t;  -- /usr/include/wchar.h:259
   pragma Import (C, wcsspn, "wcsspn");

  -- Find the first occurrence in WCS of any character in ACCEPT.   
   function wcspbrk (uu_wcs : access wchar_t; uu_accept : access wchar_t) return access wchar_t;  -- /usr/include/wchar.h:263
   pragma Import (C, wcspbrk, "wcspbrk");

   function wcspbrk (uu_wcs : access wchar_t; uu_accept : access wchar_t) return access wchar_t;  -- /usr/include/wchar.h:265
   pragma Import (C, wcspbrk, "wcspbrk");

  -- Find the first occurrence of NEEDLE in HAYSTACK.   
   function wcsstr (uu_haystack : access wchar_t; uu_needle : access wchar_t) return access wchar_t;  -- /usr/include/wchar.h:274
   pragma Import (C, wcsstr, "wcsstr");

   function wcsstr (uu_haystack : access wchar_t; uu_needle : access wchar_t) return access wchar_t;  -- /usr/include/wchar.h:276
   pragma Import (C, wcsstr, "wcsstr");

  -- Divide WCS into tokens separated by characters in DELIM.   
   function wcstok
     (uu_s : access wchar_t;
      uu_delim : access wchar_t;
      uu_ptr : System.Address) return access wchar_t;  -- /usr/include/wchar.h:285
   pragma Import (C, wcstok, "wcstok");

  -- Return the number of wide characters in S.   
   function wcslen (uu_s : access wchar_t) return stddef_h.size_t;  -- /usr/include/wchar.h:290
   pragma Import (C, wcslen, "wcslen");

  -- Another name for `wcsstr' from XPG4.   
   function wcswcs (uu_haystack : access wchar_t; uu_needle : access wchar_t) return access wchar_t;  -- /usr/include/wchar.h:296
   pragma Import (C, wcswcs, "wcswcs");

   function wcswcs (uu_haystack : access wchar_t; uu_needle : access wchar_t) return access wchar_t;  -- /usr/include/wchar.h:298
   pragma Import (C, wcswcs, "wcswcs");

  -- Return the number of wide characters in S, but at most MAXLEN.   
   function wcsnlen (uu_s : access wchar_t; uu_maxlen : stddef_h.size_t) return stddef_h.size_t;  -- /usr/include/wchar.h:309
   pragma Import (C, wcsnlen, "wcsnlen");

  -- Search N wide characters of S for C.   
   function wmemchr
     (uu_s : access wchar_t;
      uu_c : wchar_t;
      uu_n : stddef_h.size_t) return access wchar_t;  -- /usr/include/wchar.h:317
   pragma Import (C, wmemchr, "wmemchr");

   function wmemchr
     (uu_s : access wchar_t;
      uu_c : wchar_t;
      uu_n : stddef_h.size_t) return access wchar_t;  -- /usr/include/wchar.h:319
   pragma Import (C, wmemchr, "wmemchr");

  -- Compare N wide characters of S1 and S2.   
   function wmemcmp
     (uu_s1 : access wchar_t;
      uu_s2 : access wchar_t;
      uu_n : stddef_h.size_t) return int;  -- /usr/include/wchar.h:328
   pragma Import (C, wmemcmp, "wmemcmp");

  -- Copy N wide characters of SRC to DEST.   
   function wmemcpy
     (uu_s1 : access wchar_t;
      uu_s2 : access wchar_t;
      uu_n : stddef_h.size_t) return access wchar_t;  -- /usr/include/wchar.h:332
   pragma Import (C, wmemcpy, "wmemcpy");

  -- Copy N wide characters of SRC to DEST, guaranteeing
  --   correct behavior for overlapping strings.   

   function wmemmove
     (uu_s1 : access wchar_t;
      uu_s2 : access wchar_t;
      uu_n : stddef_h.size_t) return access wchar_t;  -- /usr/include/wchar.h:337
   pragma Import (C, wmemmove, "wmemmove");

  -- Set N wide characters of S to C.   
   function wmemset
     (uu_s : access wchar_t;
      uu_c : wchar_t;
      uu_n : stddef_h.size_t) return access wchar_t;  -- /usr/include/wchar.h:341
   pragma Import (C, wmemset, "wmemset");

  -- Copy N wide characters of SRC to DEST and return pointer to following
  --   wide character.   

   function wmempcpy
     (uu_s1 : access wchar_t;
      uu_s2 : access wchar_t;
      uu_n : stddef_h.size_t) return access wchar_t;  -- /usr/include/wchar.h:347
   pragma Import (C, wmempcpy, "wmempcpy");

  -- Determine whether C constitutes a valid (one-byte) multibyte
  --   character.   

   function btowc (uu_c : int) return stddef_h.wint_t;  -- /usr/include/wchar.h:356
   pragma Import (C, btowc, "btowc");

  -- Determine whether C corresponds to a member of the extended
  --   character set whose multibyte representation is a single byte.   

   function wctob (uu_c : stddef_h.wint_t) return int;  -- /usr/include/wchar.h:360
   pragma Import (C, wctob, "wctob");

  -- Determine whether PS points to an object representing the initial
  --   state.   

   function mbsinit (uu_ps : access constant mbstate_t) return int;  -- /usr/include/wchar.h:364
   pragma Import (C, mbsinit, "mbsinit");

  -- Write wide character representation of multibyte character pointed
  --   to by S to PWC.   

   function mbrtowc
     (uu_pwc : access wchar_t;
      uu_s : Interfaces.C.Strings.chars_ptr;
      uu_n : stddef_h.size_t;
      uu_p : access mbstate_t) return stddef_h.size_t;  -- /usr/include/wchar.h:368
   pragma Import (C, mbrtowc, "mbrtowc");

  -- Write multibyte representation of wide character WC to S.   
   function wcrtomb
     (uu_s : Interfaces.C.Strings.chars_ptr;
      uu_wc : wchar_t;
      uu_ps : access mbstate_t) return stddef_h.size_t;  -- /usr/include/wchar.h:373
   pragma Import (C, wcrtomb, "wcrtomb");

  -- Return number of bytes in multibyte character pointed to by S.   
   --  skipped func __mbrlen

   function mbrlen
     (uu_s : Interfaces.C.Strings.chars_ptr;
      uu_n : stddef_h.size_t;
      uu_ps : access mbstate_t) return stddef_h.size_t;  -- /usr/include/wchar.h:379
   pragma Import (C, mbrlen, "mbrlen");

  -- Define inline function as optimization.   
  -- We can use the BTOWC and WCTOB optimizations since we know that all
  --   locales must use ASCII encoding for the values in the ASCII range
  --   and because the wchar_t encoding is always ISO 10646.   

  -- Write wide character representation of multibyte character string
  --   SRC to DST.   

   function mbsrtowcs
     (uu_dst : access wchar_t;
      uu_src : System.Address;
      uu_len : stddef_h.size_t;
      uu_ps : access mbstate_t) return stddef_h.size_t;  -- /usr/include/wchar.h:411
   pragma Import (C, mbsrtowcs, "mbsrtowcs");

  -- Write multibyte character representation of wide character string
  --   SRC to DST.   

   function wcsrtombs
     (uu_dst : Interfaces.C.Strings.chars_ptr;
      uu_src : System.Address;
      uu_len : stddef_h.size_t;
      uu_ps : access mbstate_t) return stddef_h.size_t;  -- /usr/include/wchar.h:417
   pragma Import (C, wcsrtombs, "wcsrtombs");

  -- Write wide character representation of at most NMC bytes of the
  --   multibyte character string SRC to DST.   

   function mbsnrtowcs
     (uu_dst : access wchar_t;
      uu_src : System.Address;
      uu_nmc : stddef_h.size_t;
      uu_len : stddef_h.size_t;
      uu_ps : access mbstate_t) return stddef_h.size_t;  -- /usr/include/wchar.h:426
   pragma Import (C, mbsnrtowcs, "mbsnrtowcs");

  -- Write multibyte character representation of at most NWC characters
  --   from the wide character string SRC to DST.   

   function wcsnrtombs
     (uu_dst : Interfaces.C.Strings.chars_ptr;
      uu_src : System.Address;
      uu_nwc : stddef_h.size_t;
      uu_len : stddef_h.size_t;
      uu_ps : access mbstate_t) return stddef_h.size_t;  -- /usr/include/wchar.h:432
   pragma Import (C, wcsnrtombs, "wcsnrtombs");

  -- The following functions are extensions found in X/Open CAE.   
  -- Determine number of column positions required for C.   
   function wcwidth (uu_c : wchar_t) return int;  -- /usr/include/wchar.h:442
   pragma Import (C, wcwidth, "wcwidth");

  -- Determine number of column positions required for first N wide
  --   characters (or fewer if S ends before this) in S.   

   function wcswidth (uu_s : access wchar_t; uu_n : stddef_h.size_t) return int;  -- /usr/include/wchar.h:446
   pragma Import (C, wcswidth, "wcswidth");

  -- Convert initial portion of the wide string NPTR to `double'
  --   representation.   

   function wcstod (uu_nptr : access wchar_t; uu_endptr : System.Address) return double;  -- /usr/include/wchar.h:453
   pragma Import (C, wcstod, "wcstod");

  -- Likewise for `float' and `long double' sizes of floating-point numbers.   
   function wcstof (uu_nptr : access wchar_t; uu_endptr : System.Address) return float;  -- /usr/include/wchar.h:460
   pragma Import (C, wcstof, "wcstof");

   function wcstold (uu_nptr : access wchar_t; uu_endptr : System.Address) return long_double;  -- /usr/include/wchar.h:462
   pragma Import (C, wcstold, "wcstold");

  -- Convert initial portion of wide string NPTR to `long int'
  --   representation.   

   function wcstol
     (uu_nptr : access wchar_t;
      uu_endptr : System.Address;
      uu_base : int) return long;  -- /usr/include/wchar.h:471
   pragma Import (C, wcstol, "wcstol");

  -- Convert initial portion of wide string NPTR to `unsigned long int'
  --   representation.   

   function wcstoul
     (uu_nptr : access wchar_t;
      uu_endptr : System.Address;
      uu_base : int) return unsigned_long;  -- /usr/include/wchar.h:476
   pragma Import (C, wcstoul, "wcstoul");

  -- Convert initial portion of wide string NPTR to `long long int'
  --   representation.   

   function wcstoll
     (uu_nptr : access wchar_t;
      uu_endptr : System.Address;
      uu_base : int) return Long_Long_Integer;  -- /usr/include/wchar.h:486
   pragma Import (C, wcstoll, "wcstoll");

  -- Convert initial portion of wide string NPTR to `unsigned long long int'
  --   representation.   

   function wcstoull
     (uu_nptr : access wchar_t;
      uu_endptr : System.Address;
      uu_base : int) return Extensions.unsigned_long_long;  -- /usr/include/wchar.h:493
   pragma Import (C, wcstoull, "wcstoull");

  -- Convert initial portion of wide string NPTR to `long long int'
  --   representation.   

   function wcstoq
     (uu_nptr : access wchar_t;
      uu_endptr : System.Address;
      uu_base : int) return Long_Long_Integer;  -- /usr/include/wchar.h:503
   pragma Import (C, wcstoq, "wcstoq");

  -- Convert initial portion of wide string NPTR to `unsigned long long int'
  --   representation.   

   function wcstouq
     (uu_nptr : access wchar_t;
      uu_endptr : System.Address;
      uu_base : int) return Extensions.unsigned_long_long;  -- /usr/include/wchar.h:510
   pragma Import (C, wcstouq, "wcstouq");

  -- The concept of one static locale per category is not very well
  --   thought out.  Many applications will need to process its data using
  --   information from several different locales.  Another application is
  --   the implementation of the internationalization handling in the
  --   upcoming ISO C++ standard library.  To support this another set of
  --   the functions using locale data exist which have an additional
  --   argument.
  --   Attention: all these functions are *not* standardized in any form.
  --   This is a proof-of-concept implementation.   

  -- Structure for reentrant locale using functions.  This is an
  --   (almost) opaque type for the user level programs.   

  -- Special versions of the functions above which take the locale to
  --   use as an additional parameter.   

   function wcstol_l
     (uu_nptr : access wchar_t;
      uu_endptr : System.Address;
      uu_base : int;
      uu_loc : xlocale_h.uu_locale_t) return long;  -- /usr/include/wchar.h:533
   pragma Import (C, wcstol_l, "wcstol_l");

   function wcstoul_l
     (uu_nptr : access wchar_t;
      uu_endptr : System.Address;
      uu_base : int;
      uu_loc : xlocale_h.uu_locale_t) return unsigned_long;  -- /usr/include/wchar.h:537
   pragma Import (C, wcstoul_l, "wcstoul_l");

   function wcstoll_l
     (uu_nptr : access wchar_t;
      uu_endptr : System.Address;
      uu_base : int;
      uu_loc : xlocale_h.uu_locale_t) return Long_Long_Integer;  -- /usr/include/wchar.h:542
   pragma Import (C, wcstoll_l, "wcstoll_l");

   function wcstoull_l
     (uu_nptr : access wchar_t;
      uu_endptr : System.Address;
      uu_base : int;
      uu_loc : xlocale_h.uu_locale_t) return Extensions.unsigned_long_long;  -- /usr/include/wchar.h:547
   pragma Import (C, wcstoull_l, "wcstoull_l");

   function wcstod_l
     (uu_nptr : access wchar_t;
      uu_endptr : System.Address;
      uu_loc : xlocale_h.uu_locale_t) return double;  -- /usr/include/wchar.h:552
   pragma Import (C, wcstod_l, "wcstod_l");

   function wcstof_l
     (uu_nptr : access wchar_t;
      uu_endptr : System.Address;
      uu_loc : xlocale_h.uu_locale_t) return float;  -- /usr/include/wchar.h:556
   pragma Import (C, wcstof_l, "wcstof_l");

   function wcstold_l
     (uu_nptr : access wchar_t;
      uu_endptr : System.Address;
      uu_loc : xlocale_h.uu_locale_t) return long_double;  -- /usr/include/wchar.h:560
   pragma Import (C, wcstold_l, "wcstold_l");

  -- Copy SRC to DEST, returning the address of the terminating L'\0' in
  --   DEST.   

   function wcpcpy (uu_dest : access wchar_t; uu_src : access wchar_t) return access wchar_t;  -- /usr/include/wchar.h:569
   pragma Import (C, wcpcpy, "wcpcpy");

  -- Copy no more than N characters of SRC to DEST, returning the address of
  --   the last character written into DEST.   

   function wcpncpy
     (uu_dest : access wchar_t;
      uu_src : access wchar_t;
      uu_n : stddef_h.size_t) return access wchar_t;  -- /usr/include/wchar.h:574
   pragma Import (C, wcpncpy, "wcpncpy");

  -- Wide character I/O functions.   
  -- Like OPEN_MEMSTREAM, but the stream is wide oriented and produces
  --   a wide character string.   

   function open_wmemstream (uu_bufloc : System.Address; uu_sizeloc : access stddef_h.size_t) return access stdio_h.uu_FILE;  -- /usr/include/wchar.h:583
   pragma Import (C, open_wmemstream, "open_wmemstream");

  -- Select orientation for stream.   
   function fwide (uu_fp : access stdio_h.uu_FILE; uu_mode : int) return int;  -- /usr/include/wchar.h:590
   pragma Import (C, fwide, "fwide");

  -- Write formatted output to STREAM.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function fwprintf (uu_stream : access stdio_h.uu_FILE; uu_format : access wchar_t  -- , ...
      ) return int;  -- /usr/include/wchar.h:597
   pragma Import (C, fwprintf, "fwprintf");

  -- __attribute__ ((__format__ (__wprintf__, 2, 3)))  
  -- Write formatted output to stdout.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function wprintf (uu_format : access wchar_t  -- , ...
      ) return int;  -- /usr/include/wchar.h:604
   pragma Import (C, wprintf, "wprintf");

  -- __attribute__ ((__format__ (__wprintf__, 1, 2)))  
  -- Write formatted output of at most N characters to S.   
   function swprintf
     (uu_s : access wchar_t;
      uu_n : stddef_h.size_t;
      uu_format : access wchar_t  -- , ...
      ) return int;  -- /usr/include/wchar.h:607
   pragma Import (C, swprintf, "swprintf");

  -- __attribute__ ((__format__ (__wprintf__, 3, 4)))  
  -- Write formatted output to S from argument list ARG.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function vfwprintf
     (uu_s : access stdio_h.uu_FILE;
      uu_format : access wchar_t;
      uu_arg : access System.Address) return int;  -- /usr/include/wchar.h:615
   pragma Import (C, vfwprintf, "vfwprintf");

  -- __attribute__ ((__format__ (__wprintf__, 2, 0)))  
  -- Write formatted output to stdout from argument list ARG.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function vwprintf (uu_format : access wchar_t; uu_arg : access System.Address) return int;  -- /usr/include/wchar.h:623
   pragma Import (C, vwprintf, "vwprintf");

  -- __attribute__ ((__format__ (__wprintf__, 1, 0)))  
  -- Write formatted output of at most N character to S from argument
  --   list ARG.   

   function vswprintf
     (uu_s : access wchar_t;
      uu_n : stddef_h.size_t;
      uu_format : access wchar_t;
      uu_arg : access System.Address) return int;  -- /usr/include/wchar.h:628
   pragma Import (C, vswprintf, "vswprintf");

  -- __attribute__ ((__format__ (__wprintf__, 3, 0)))  
  -- Read formatted input from STREAM.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function fwscanf (uu_stream : access stdio_h.uu_FILE; uu_format : access wchar_t  -- , ...
      ) return int;  -- /usr/include/wchar.h:638
   pragma Import (C, fwscanf, "fwscanf");

  -- __attribute__ ((__format__ (__wscanf__, 2, 3)))  
  -- Read formatted input from stdin.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function wscanf (uu_format : access wchar_t  -- , ...
      ) return int;  -- /usr/include/wchar.h:645
   pragma Import (C, wscanf, "wscanf");

  -- __attribute__ ((__format__ (__wscanf__, 1, 2)))  
  -- Read formatted input from S.   
   function swscanf (uu_s : access wchar_t; uu_format : access wchar_t  -- , ...
      ) return int;  -- /usr/include/wchar.h:648
   pragma Import (C, swscanf, "swscanf");

  -- __attribute__ ((__format__ (__wscanf__, 2, 3)))  
  -- For strict ISO C99 or POSIX compliance disallow %as, %aS and %a[
  --   GNU extension which conflicts with valid %a followed by letter
  --   s, S or [.   

  -- __attribute__ ((__format__ (__wscanf__, 2, 3)))  
  -- __attribute__ ((__format__ (__wscanf__, 1, 2)))  
  -- __attribute__ ((__format__ (__wscanf__, 2, 3)))  
  -- Read formatted input from S into argument list ARG.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function vfwscanf
     (uu_s : access stdio_h.uu_FILE;
      uu_format : access wchar_t;
      uu_arg : access System.Address) return int;  -- /usr/include/wchar.h:692
   pragma Import (C, vfwscanf, "vfwscanf");

  -- __attribute__ ((__format__ (__wscanf__, 2, 0)))  
  -- Read formatted input from stdin into argument list ARG.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function vwscanf (uu_format : access wchar_t; uu_arg : access System.Address) return int;  -- /usr/include/wchar.h:700
   pragma Import (C, vwscanf, "vwscanf");

  -- __attribute__ ((__format__ (__wscanf__, 1, 0)))  
  -- Read formatted input from S into argument list ARG.   
   function vswscanf
     (uu_s : access wchar_t;
      uu_format : access wchar_t;
      uu_arg : access System.Address) return int;  -- /usr/include/wchar.h:704
   pragma Import (C, vswscanf, "vswscanf");

  -- __attribute__ ((__format__ (__wscanf__, 2, 0)))  
  -- __attribute__ ((__format__ (__wscanf__, 2, 0)))  
  -- __attribute__ ((__format__ (__wscanf__, 1, 0)))  
  -- __attribute__ ((__format__ (__wscanf__, 2, 0)))  
  -- Read a character from STREAM.
  --   These functions are possible cancellation points and therefore not
  --   marked with __THROW.   

   function fgetwc (uu_stream : access stdio_h.uu_FILE) return stddef_h.wint_t;  -- /usr/include/wchar.h:748
   pragma Import (C, fgetwc, "fgetwc");

   function getwc (uu_stream : access stdio_h.uu_FILE) return stddef_h.wint_t;  -- /usr/include/wchar.h:749
   pragma Import (C, getwc, "getwc");

  -- Read a character from stdin.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function getwchar return stddef_h.wint_t;  -- /usr/include/wchar.h:755
   pragma Import (C, getwchar, "getwchar");

  -- Write a character to STREAM.
  --   These functions are possible cancellation points and therefore not
  --   marked with __THROW.   

   function fputwc (uu_wc : wchar_t; uu_stream : access stdio_h.uu_FILE) return stddef_h.wint_t;  -- /usr/include/wchar.h:762
   pragma Import (C, fputwc, "fputwc");

   function putwc (uu_wc : wchar_t; uu_stream : access stdio_h.uu_FILE) return stddef_h.wint_t;  -- /usr/include/wchar.h:763
   pragma Import (C, putwc, "putwc");

  -- Write a character to stdout.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function putwchar (uu_wc : wchar_t) return stddef_h.wint_t;  -- /usr/include/wchar.h:769
   pragma Import (C, putwchar, "putwchar");

  -- Get a newline-terminated wide character string of finite length
  --   from STREAM.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function fgetws
     (uu_ws : access wchar_t;
      uu_n : int;
      uu_stream : access stdio_h.uu_FILE) return access wchar_t;  -- /usr/include/wchar.h:777
   pragma Import (C, fgetws, "fgetws");

  -- Write a string to STREAM.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function fputws (uu_ws : access wchar_t; uu_stream : access stdio_h.uu_FILE) return int;  -- /usr/include/wchar.h:784
   pragma Import (C, fputws, "fputws");

  -- Push a character back onto the input buffer of STREAM.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function ungetwc (uu_wc : stddef_h.wint_t; uu_stream : access stdio_h.uu_FILE) return stddef_h.wint_t;  -- /usr/include/wchar.h:792
   pragma Import (C, ungetwc, "ungetwc");

  -- These are defined to be equivalent to the `char' functions defined
  --   in POSIX.1:1996.
  --   These functions are not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation they are cancellation points and
  --   therefore not marked with __THROW.   

   function getwc_unlocked (uu_stream : access stdio_h.uu_FILE) return stddef_h.wint_t;  -- /usr/include/wchar.h:804
   pragma Import (C, getwc_unlocked, "getwc_unlocked");

   function getwchar_unlocked return stddef_h.wint_t;  -- /usr/include/wchar.h:805
   pragma Import (C, getwchar_unlocked, "getwchar_unlocked");

  -- This is the wide character version of a GNU extension.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function fgetwc_unlocked (uu_stream : access stdio_h.uu_FILE) return stddef_h.wint_t;  -- /usr/include/wchar.h:813
   pragma Import (C, fgetwc_unlocked, "fgetwc_unlocked");

  -- Faster version when locking is not necessary.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function fputwc_unlocked (uu_wc : wchar_t; uu_stream : access stdio_h.uu_FILE) return stddef_h.wint_t;  -- /usr/include/wchar.h:821
   pragma Import (C, fputwc_unlocked, "fputwc_unlocked");

  -- These are defined to be equivalent to the `char' functions defined
  --   in POSIX.1:1996.
  --   These functions are not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation they are cancellation points and
  --   therefore not marked with __THROW.   

   function putwc_unlocked (uu_wc : wchar_t; uu_stream : access stdio_h.uu_FILE) return stddef_h.wint_t;  -- /usr/include/wchar.h:830
   pragma Import (C, putwc_unlocked, "putwc_unlocked");

   function putwchar_unlocked (uu_wc : wchar_t) return stddef_h.wint_t;  -- /usr/include/wchar.h:831
   pragma Import (C, putwchar_unlocked, "putwchar_unlocked");

  -- This function does the same as `fgetws' but does not lock the stream.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function fgetws_unlocked
     (uu_ws : access wchar_t;
      uu_n : int;
      uu_stream : access stdio_h.uu_FILE) return access wchar_t;  -- /usr/include/wchar.h:840
   pragma Import (C, fgetws_unlocked, "fgetws_unlocked");

  -- This function does the same as `fputws' but does not lock the stream.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function fputws_unlocked (uu_ws : access wchar_t; uu_stream : access stdio_h.uu_FILE) return int;  -- /usr/include/wchar.h:849
   pragma Import (C, fputws_unlocked, "fputws_unlocked");

  -- Format TP into S according to FORMAT.
  --   Write no more than MAXSIZE wide characters and return the number
  --   of wide characters written, or 0 if it would exceed MAXSIZE.   

   function wcsftime
     (uu_s : access wchar_t;
      uu_maxsize : stddef_h.size_t;
      uu_format : access wchar_t;
      uu_tp : System.Address) return stddef_h.size_t;  -- /usr/include/wchar.h:858
   pragma Import (C, wcsftime, "wcsftime");

  -- Similar to `wcsftime' but takes the information from
  --   the provided locale and not the global locale.   

   function wcsftime_l
     (uu_s : access wchar_t;
      uu_maxsize : stddef_h.size_t;
      uu_format : access wchar_t;
      uu_tp : System.Address;
      uu_loc : xlocale_h.uu_locale_t) return stddef_h.size_t;  -- /usr/include/wchar.h:868
   pragma Import (C, wcsftime_l, "wcsftime_l");

  -- The X/Open standard demands that most of the functions defined in
  --   the <wctype.h> header must also appear here.  This is probably
  --   because some X/Open members wrote their implementation before the
  --   ISO C standard was published and introduced the better solution.
  --   We have to provide these definitions for compliance reasons but we
  --   do this nonsense only if really necessary.   

  -- Define some macros helping to catch buffer overflows.   
  -- Undefine all __need_* constants in case we are included to get those
  --   constants but the whole file was already read.   

end wchar_h;
