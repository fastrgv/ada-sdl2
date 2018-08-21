pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;

package x86_64_linux_gnu_bits_mathcalls_h is

  -- Prototype declarations for math functions; helper file for <math.h>.
  --   Copyright (C) 1996-2016 Free Software Foundation, Inc.
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

  -- NOTE: Because of the special way this file is used by <math.h>, this
  --   file must NOT be protected from multiple inclusion as header files
  --   usually are.
  --   This file provides prototype declarations for the math functions.
  --   Most functions are declared using the macro:
  --   __MATHCALL (NAME,[_r], (ARGS...));
  --   This means there is a function `NAME' returning `double' and a function
  --   `NAMEf' returning `float'.  Each place `_Mdouble_' appears in the
  --   prototype, that is actually `double' in the prototype for `NAME' and
  --   `float' in the prototype for `NAMEf'.  Reentrant variant functions are
  --   called `NAME_r' and `NAMEf_r'.
  --   Functions returning other types like `int' are declared using the macro:
  --   __MATHDECL (TYPE, NAME,[_r], (ARGS...));
  --   This is just like __MATHCALL but for a function returning `TYPE'
  --   instead of `_Mdouble_'.  In all of these cases, there is still
  --   both a `NAME' and a `NAMEf' that takes `float' arguments.
  --   Note that there must be no whitespace before the argument passed for
  --   NAME, to make token pasting work with -traditional.   

  -- Trigonometric functions.   
  -- Arc cosine of X.   
   --  skipped func __acosl

   --  skipped func __acosf

   --  skipped func __acos

   function acosl (uu_x : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:54
   pragma Import (C, acosl, "acosl");

   function acosf (uu_x : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:54
   pragma Import (C, acosf, "acosf");

   function acos (uu_x : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:54
   pragma Import (C, acos, "acos");

  -- Arc sine of X.   
   --  skipped func __asinl

   --  skipped func __asinf

   --  skipped func __asin

   function asinl (uu_x : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:56
   pragma Import (C, asinl, "asinl");

   function asinf (uu_x : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:56
   pragma Import (C, asinf, "asinf");

   function asin (uu_x : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:56
   pragma Import (C, asin, "asin");

  -- Arc tangent of X.   
   --  skipped func __atanl

   --  skipped func __atanf

   --  skipped func __atan

   function atanl (uu_x : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:58
   pragma Import (C, atanl, "atanl");

   function atanf (uu_x : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:58
   pragma Import (C, atanf, "atanf");

   function atan (uu_x : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:58
   pragma Import (C, atan, "atan");

  -- Arc tangent of Y/X.   
   --  skipped func __atan2l

   --  skipped func __atan2f

   --  skipped func __atan2

   function atan2l (uu_y : long_double; uu_x : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:60
   pragma Import (C, atan2l, "atan2l");

   function atan2f (uu_y : float; uu_x : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:60
   pragma Import (C, atan2f, "atan2f");

   function atan2 (uu_y : double; uu_x : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:60
   pragma Import (C, atan2, "atan2");

  -- Cosine of X.   
   --  skipped func __cosl

   --  skipped func __cosf

   --  skipped func __cos

   function cosl (uu_x : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:63
   pragma Import (C, cosl, "cosl");

   function cosf (uu_x : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:63
   pragma Import (C, cosf, "cosf");

   function cos (uu_x : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:63
   pragma Import (C, cos, "cos");

  -- Sine of X.   
   --  skipped func __sinl

   --  skipped func __sinf

   --  skipped func __sin

   function sinl (uu_x : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:65
   pragma Import (C, sinl, "sinl");

   function sinf (uu_x : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:65
   pragma Import (C, sinf, "sinf");

   function sin (uu_x : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:65
   pragma Import (C, sin, "sin");

  -- Tangent of X.   
   --  skipped func __tanl

   --  skipped func __tanf

   --  skipped func __tan

   function tanl (uu_x : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:67
   pragma Import (C, tanl, "tanl");

   function tanf (uu_x : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:67
   pragma Import (C, tanf, "tanf");

   function tan (uu_x : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:67
   pragma Import (C, tan, "tan");

  -- Hyperbolic functions.   
  -- Hyperbolic cosine of X.   
   --  skipped func __coshl

   --  skipped func __coshf

   --  skipped func __cosh

   function coshl (uu_x : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:72
   pragma Import (C, coshl, "coshl");

   function coshf (uu_x : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:72
   pragma Import (C, coshf, "coshf");

   function cosh (uu_x : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:72
   pragma Import (C, cosh, "cosh");

  -- Hyperbolic sine of X.   
   --  skipped func __sinhl

   --  skipped func __sinhf

   --  skipped func __sinh

   function sinhl (uu_x : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:74
   pragma Import (C, sinhl, "sinhl");

   function sinhf (uu_x : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:74
   pragma Import (C, sinhf, "sinhf");

   function sinh (uu_x : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:74
   pragma Import (C, sinh, "sinh");

  -- Hyperbolic tangent of X.   
   --  skipped func __tanhl

   --  skipped func __tanhf

   --  skipped func __tanh

   function tanhl (uu_x : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:76
   pragma Import (C, tanhl, "tanhl");

   function tanhf (uu_x : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:76
   pragma Import (C, tanhf, "tanhf");

   function tanh (uu_x : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:76
   pragma Import (C, tanh, "tanh");

  -- Cosine and sine of X.   
   --  skipped func __sincosl

   --  skipped func __sincosf

   --  skipped func __sincos

   procedure sincosl
     (uu_x : long_double;
      uu_sinx : access long_double;
      uu_cosx : access long_double);  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:81
   pragma Import (C, sincosl, "sincosl");

   procedure sincosf
     (uu_x : float;
      uu_sinx : access float;
      uu_cosx : access float);  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:81
   pragma Import (C, sincosf, "sincosf");

   procedure sincos
     (uu_x : double;
      uu_sinx : access double;
      uu_cosx : access double);  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:81
   pragma Import (C, sincos, "sincos");

  -- Hyperbolic arc cosine of X.   
   --  skipped func __acoshl

   --  skipped func __acoshf

   --  skipped func __acosh

   function acoshl (uu_x : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:88
   pragma Import (C, acoshl, "acoshl");

   function acoshf (uu_x : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:88
   pragma Import (C, acoshf, "acoshf");

   function acosh (uu_x : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:88
   pragma Import (C, acosh, "acosh");

  -- Hyperbolic arc sine of X.   
   --  skipped func __asinhl

   --  skipped func __asinhf

   --  skipped func __asinh

   function asinhl (uu_x : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:90
   pragma Import (C, asinhl, "asinhl");

   function asinhf (uu_x : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:90
   pragma Import (C, asinhf, "asinhf");

   function asinh (uu_x : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:90
   pragma Import (C, asinh, "asinh");

  -- Hyperbolic arc tangent of X.   
   --  skipped func __atanhl

   --  skipped func __atanhf

   --  skipped func __atanh

   function atanhl (uu_x : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:92
   pragma Import (C, atanhl, "atanhl");

   function atanhf (uu_x : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:92
   pragma Import (C, atanhf, "atanhf");

   function atanh (uu_x : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:92
   pragma Import (C, atanh, "atanh");

  -- Exponential and logarithmic functions.   
  -- Exponential function of X.   
   --  skipped func __expl

   --  skipped func __expf

   --  skipped func __exp

   function expl (uu_x : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:100
   pragma Import (C, expl, "expl");

   function expf (uu_x : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:100
   pragma Import (C, expf, "expf");

   function exp (uu_x : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:100
   pragma Import (C, exp, "exp");

  -- Break VALUE into a normalized fraction and an integral power of 2.   
   --  skipped func __frexpl

   --  skipped func __frexpf

   --  skipped func __frexp

   function frexpl (uu_x : long_double; uu_exponent : access int) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:103
   pragma Import (C, frexpl, "frexpl");

   function frexpf (uu_x : float; uu_exponent : access int) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:103
   pragma Import (C, frexpf, "frexpf");

   function frexp (uu_x : double; uu_exponent : access int) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:103
   pragma Import (C, frexp, "frexp");

  -- X times (two to the EXP power).   
   --  skipped func __ldexpl

   --  skipped func __ldexpf

   --  skipped func __ldexp

   function ldexpl (uu_x : long_double; uu_exponent : int) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:106
   pragma Import (C, ldexpl, "ldexpl");

   function ldexpf (uu_x : float; uu_exponent : int) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:106
   pragma Import (C, ldexpf, "ldexpf");

   function ldexp (uu_x : double; uu_exponent : int) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:106
   pragma Import (C, ldexp, "ldexp");

  -- Natural logarithm of X.   
   --  skipped func __logl

   --  skipped func __logf

   --  skipped func __log

   function logl (uu_x : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:109
   pragma Import (C, logl, "logl");

   function logf (uu_x : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:109
   pragma Import (C, logf, "logf");

   function log (uu_x : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:109
   pragma Import (C, log, "log");

  -- Base-ten logarithm of X.   
   --  skipped func __log10l

   --  skipped func __log10f

   --  skipped func __log10

   function log10l (uu_x : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:112
   pragma Import (C, log10l, "log10l");

   function log10f (uu_x : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:112
   pragma Import (C, log10f, "log10f");

   function log10 (uu_x : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:112
   pragma Import (C, log10, "log10");

  -- Break VALUE into integral and fractional parts.   
   --  skipped func __modfl

   --  skipped func __modff

   --  skipped func __modf

   function modfl (uu_x : long_double; uu_iptr : access long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:115
   pragma Import (C, modfl, "modfl");

   function modff (uu_x : float; uu_iptr : access float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:115
   pragma Import (C, modff, "modff");

   function modf (uu_x : double; uu_iptr : access double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:115
   pragma Import (C, modf, "modf");

  -- A function missing in all standards: compute exponent to base ten.   
   --  skipped func __exp10l

   --  skipped func __exp10f

   --  skipped func __exp10

   function exp10l (uu_x : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:120
   pragma Import (C, exp10l, "exp10l");

   function exp10f (uu_x : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:120
   pragma Import (C, exp10f, "exp10f");

   function exp10 (uu_x : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:120
   pragma Import (C, exp10, "exp10");

  -- Another name occasionally used.   
   --  skipped func __pow10l

   --  skipped func __pow10f

   --  skipped func __pow10

   function pow10l (uu_x : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:122
   pragma Import (C, pow10l, "pow10l");

   function pow10f (uu_x : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:122
   pragma Import (C, pow10f, "pow10f");

   function pow10 (uu_x : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:122
   pragma Import (C, pow10, "pow10");

  -- Return exp(X) - 1.   
   --  skipped func __expm1l

   --  skipped func __expm1f

   --  skipped func __expm1

   function expm1l (uu_x : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:128
   pragma Import (C, expm1l, "expm1l");

   function expm1f (uu_x : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:128
   pragma Import (C, expm1f, "expm1f");

   function expm1 (uu_x : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:128
   pragma Import (C, expm1, "expm1");

  -- Return log(1 + X).   
   --  skipped func __log1pl

   --  skipped func __log1pf

   --  skipped func __log1p

   function log1pl (uu_x : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:131
   pragma Import (C, log1pl, "log1pl");

   function log1pf (uu_x : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:131
   pragma Import (C, log1pf, "log1pf");

   function log1p (uu_x : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:131
   pragma Import (C, log1p, "log1p");

  -- Return the base 2 signed integral exponent of X.   
   --  skipped func __logbl

   --  skipped func __logbf

   --  skipped func __logb

   function logbl (uu_x : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:134
   pragma Import (C, logbl, "logbl");

   function logbf (uu_x : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:134
   pragma Import (C, logbf, "logbf");

   function logb (uu_x : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:134
   pragma Import (C, logb, "logb");

  -- Compute base-2 exponential of X.   
   --  skipped func __exp2l

   --  skipped func __exp2f

   --  skipped func __exp2

   function exp2l (uu_x : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:141
   pragma Import (C, exp2l, "exp2l");

   function exp2f (uu_x : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:141
   pragma Import (C, exp2f, "exp2f");

   function exp2 (uu_x : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:141
   pragma Import (C, exp2, "exp2");

  -- Compute base-2 logarithm of X.   
   --  skipped func __log2l

   --  skipped func __log2f

   --  skipped func __log2

   function log2l (uu_x : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:144
   pragma Import (C, log2l, "log2l");

   function log2f (uu_x : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:144
   pragma Import (C, log2f, "log2f");

   function log2 (uu_x : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:144
   pragma Import (C, log2, "log2");

  -- Power functions.   
  -- Return X to the Y power.   
   --  skipped func __powl

   --  skipped func __powf

   --  skipped func __pow

   function powl (uu_x : long_double; uu_y : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:153
   pragma Import (C, powl, "powl");

   function powf (uu_x : float; uu_y : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:153
   pragma Import (C, powf, "powf");

   function pow (uu_x : double; uu_y : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:153
   pragma Import (C, pow, "pow");

  -- Return the square root of X.   
   --  skipped func __sqrtl

   --  skipped func __sqrtf

   --  skipped func __sqrt

   function sqrtl (uu_x : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:156
   pragma Import (C, sqrtl, "sqrtl");

   function sqrtf (uu_x : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:156
   pragma Import (C, sqrtf, "sqrtf");

   function sqrt (uu_x : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:156
   pragma Import (C, sqrt, "sqrt");

  -- Return `sqrt(X*X + Y*Y)'.   
   --  skipped func __hypotl

   --  skipped func __hypotf

   --  skipped func __hypot

   function hypotl (uu_x : long_double; uu_y : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:162
   pragma Import (C, hypotl, "hypotl");

   function hypotf (uu_x : float; uu_y : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:162
   pragma Import (C, hypotf, "hypotf");

   function hypot (uu_x : double; uu_y : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:162
   pragma Import (C, hypot, "hypot");

  -- Return the cube root of X.   
   --  skipped func __cbrtl

   --  skipped func __cbrtf

   --  skipped func __cbrt

   function cbrtl (uu_x : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:169
   pragma Import (C, cbrtl, "cbrtl");

   function cbrtf (uu_x : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:169
   pragma Import (C, cbrtf, "cbrtf");

   function cbrt (uu_x : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:169
   pragma Import (C, cbrt, "cbrt");

  -- Nearest integer, absolute value, and remainder functions.   
  -- Smallest integral value not less than X.   
   --  skipped func __ceill

   --  skipped func __ceilf

   --  skipped func __ceil

   function ceill (uu_x : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:178
   pragma Import (C, ceill, "ceill");

   function ceilf (uu_x : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:178
   pragma Import (C, ceilf, "ceilf");

   function ceil (uu_x : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:178
   pragma Import (C, ceil, "ceil");

  -- Absolute value of X.   
   --  skipped func __fabsl

   --  skipped func __fabsf

   --  skipped func __fabs

   function fabsl (uu_x : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:181
   pragma Import (C, fabsl, "fabsl");

   function fabsf (uu_x : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:181
   pragma Import (C, fabsf, "fabsf");

   function fabs (uu_x : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:181
   pragma Import (C, fabs, "fabs");

  -- Largest integer not greater than X.   
   --  skipped func __floorl

   --  skipped func __floorf

   --  skipped func __floor

   function floorl (uu_x : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:184
   pragma Import (C, floorl, "floorl");

   function floorf (uu_x : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:184
   pragma Import (C, floorf, "floorf");

   function floor (uu_x : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:184
   pragma Import (C, floor, "floor");

  -- Floating-point modulo remainder of X/Y.   
   --  skipped func __fmodl

   --  skipped func __fmodf

   --  skipped func __fmod

   function fmodl (uu_x : long_double; uu_y : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:187
   pragma Import (C, fmodl, "fmodl");

   function fmodf (uu_x : float; uu_y : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:187
   pragma Import (C, fmodf, "fmodf");

   function fmod (uu_x : double; uu_y : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:187
   pragma Import (C, fmod, "fmod");

  -- Return 0 if VALUE is finite or NaN, +1 if it
  --   is +Infinity, -1 if it is -Infinity.   

   --  skipped func __isinfl

   --  skipped func __isinff

   --  skipped func __isinf

  -- Return nonzero if VALUE is finite and not NaN.   
   --  skipped func __finitel

   --  skipped func __finitef

   --  skipped func __finite

  -- Return 0 if VALUE is finite or NaN, +1 if it
  --   is +Infinity, -1 if it is -Infinity.   

   function isinfl (uu_value : long_double) return int;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:204
   pragma Import (C, isinfl, "isinfl");

   function isinff (uu_value : float) return int;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:204
   pragma Import (C, isinff, "isinff");

  -- Return nonzero if VALUE is finite and not NaN.   
   function finitel (uu_value : long_double) return int;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:208
   pragma Import (C, finitel, "finitel");

   function finitef (uu_value : float) return int;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:208
   pragma Import (C, finitef, "finitef");

   function finite (uu_value : double) return int;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:208
   pragma Import (C, finite, "finite");

  -- Return the remainder of X/Y.   
   --  skipped func __dreml

   --  skipped func __dremf

   --  skipped func __drem

   function dreml (uu_x : long_double; uu_y : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:211
   pragma Import (C, dreml, "dreml");

   function dremf (uu_x : float; uu_y : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:211
   pragma Import (C, dremf, "dremf");

   function drem (uu_x : double; uu_y : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:211
   pragma Import (C, drem, "drem");

  -- Return the fractional part of X after dividing out `ilogb (X)'.   
   --  skipped func __significandl

   --  skipped func __significandf

   --  skipped func __significand

   function significandl (uu_x : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:215
   pragma Import (C, significandl, "significandl");

   function significandf (uu_x : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:215
   pragma Import (C, significandf, "significandf");

   function significand (uu_x : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:215
   pragma Import (C, significand, "significand");

  -- Return X with its signed changed to Y's.   
   --  skipped func __copysignl

   --  skipped func __copysignf

   --  skipped func __copysign

   function copysignl (uu_x : long_double; uu_y : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:221
   pragma Import (C, copysignl, "copysignl");

   function copysignf (uu_x : float; uu_y : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:221
   pragma Import (C, copysignf, "copysignf");

   function copysign (uu_x : double; uu_y : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:221
   pragma Import (C, copysign, "copysign");

  -- Return representation of qNaN for double type.   
   --  skipped func __nanl

   --  skipped func __nanf

   --  skipped func __nan

   function nanl (uu_tagb : Interfaces.C.Strings.chars_ptr) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:228
   pragma Import (C, nanl, "nanl");

   function nanf (uu_tagb : Interfaces.C.Strings.chars_ptr) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:228
   pragma Import (C, nanf, "nanf");

   function nan (uu_tagb : Interfaces.C.Strings.chars_ptr) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:228
   pragma Import (C, nan, "nan");

  -- Return nonzero if VALUE is not a number.   
   --  skipped func __isnanl

   --  skipped func __isnanf

   --  skipped func __isnan

  -- Return nonzero if VALUE is not a number.   
   function isnanl (uu_value : long_double) return int;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:241
   pragma Import (C, isnanl, "isnanl");

   function isnanf (uu_value : float) return int;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:241
   pragma Import (C, isnanf, "isnanf");

  -- Bessel functions.   
   --  skipped func __j0l

   --  skipped func __j0f

   --  skipped func __j0

   function j0l (arg1 : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:247
   pragma Import (C, j0l, "j0l");

   function j0f (arg1 : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:247
   pragma Import (C, j0f, "j0f");

   function j0 (arg1 : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:247
   pragma Import (C, j0, "j0");

   --  skipped func __j1l

   --  skipped func __j1f

   --  skipped func __j1

   function j1l (arg1 : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:248
   pragma Import (C, j1l, "j1l");

   function j1f (arg1 : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:248
   pragma Import (C, j1f, "j1f");

   function j1 (arg1 : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:248
   pragma Import (C, j1, "j1");

   --  skipped func __jnl

   --  skipped func __jnf

   --  skipped func __jn

   function jnl (arg1 : int; arg2 : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:249
   pragma Import (C, jnl, "jnl");

   function jnf (arg1 : int; arg2 : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:249
   pragma Import (C, jnf, "jnf");

   function jn (arg1 : int; arg2 : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:249
   pragma Import (C, jn, "jn");

   --  skipped func __y0l

   --  skipped func __y0f

   --  skipped func __y0

   function y0l (arg1 : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:250
   pragma Import (C, y0l, "y0l");

   function y0f (arg1 : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:250
   pragma Import (C, y0f, "y0f");

   function y0 (arg1 : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:250
   pragma Import (C, y0, "y0");

   --  skipped func __y1l

   --  skipped func __y1f

   --  skipped func __y1

   function y1l (arg1 : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:251
   pragma Import (C, y1l, "y1l");

   function y1f (arg1 : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:251
   pragma Import (C, y1f, "y1f");

   function y1 (arg1 : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:251
   pragma Import (C, y1, "y1");

   --  skipped func __ynl

   --  skipped func __ynf

   --  skipped func __yn

   function ynl (arg1 : int; arg2 : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:252
   pragma Import (C, ynl, "ynl");

   function ynf (arg1 : int; arg2 : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:252
   pragma Import (C, ynf, "ynf");

   function yn (arg1 : int; arg2 : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:252
   pragma Import (C, yn, "yn");

  -- Error and gamma functions.   
   --  skipped func __erfl

   --  skipped func __erff

   --  skipped func __erf

   function erfl (arg1 : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:259
   pragma Import (C, erfl, "erfl");

   function erff (arg1 : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:259
   pragma Import (C, erff, "erff");

   function erf (arg1 : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:259
   pragma Import (C, erf, "erf");

   --  skipped func __erfcl

   --  skipped func __erfcf

   --  skipped func __erfc

   function erfcl (arg1 : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:260
   pragma Import (C, erfcl, "erfcl");

   function erfcf (arg1 : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:260
   pragma Import (C, erfcf, "erfcf");

   function erfc (arg1 : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:260
   pragma Import (C, erfc, "erfc");

   --  skipped func __lgammal

   --  skipped func __lgammaf

   --  skipped func __lgamma

   function lgammal (arg1 : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:261
   pragma Import (C, lgammal, "lgammal");

   function lgammaf (arg1 : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:261
   pragma Import (C, lgammaf, "lgammaf");

   function lgamma (arg1 : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:261
   pragma Import (C, lgamma, "lgamma");

  -- True gamma function.   
   --  skipped func __tgammal

   --  skipped func __tgammaf

   --  skipped func __tgamma

   function tgammal (arg1 : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:268
   pragma Import (C, tgammal, "tgammal");

   function tgammaf (arg1 : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:268
   pragma Import (C, tgammaf, "tgammaf");

   function tgamma (arg1 : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:268
   pragma Import (C, tgamma, "tgamma");

  -- Obsolete alias for `lgamma'.   
   --  skipped func __gammal

   --  skipped func __gammaf

   --  skipped func __gamma

   function gammal (arg1 : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:274
   pragma Import (C, gammal, "gammal");

   function gammaf (arg1 : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:274
   pragma Import (C, gammaf, "gammaf");

   function gamma (arg1 : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:274
   pragma Import (C, gamma, "gamma");

  -- Reentrant version of lgamma.  This function uses the global variable
  --   `signgam'.  The reentrant version instead takes a pointer and stores
  --   the value through it.   

   --  skipped func __lgammal_r

   --  skipped func __lgammaf_r

   --  skipped func __lgamma_r

   function lgammal_r (arg1 : long_double; uu_signgamp : access int) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:281
   pragma Import (C, lgammal_r, "lgammal_r");

   function lgammaf_r (arg1 : float; uu_signgamp : access int) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:281
   pragma Import (C, lgammaf_r, "lgammaf_r");

   function lgamma_r (arg1 : double; uu_signgamp : access int) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:281
   pragma Import (C, lgamma_r, "lgamma_r");

  -- Return the integer nearest X in the direction of the
  --   prevailing rounding mode.   

   --  skipped func __rintl

   --  skipped func __rintf

   --  skipped func __rint

   function rintl (uu_x : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:289
   pragma Import (C, rintl, "rintl");

   function rintf (uu_x : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:289
   pragma Import (C, rintf, "rintf");

   function rint (uu_x : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:289
   pragma Import (C, rint, "rint");

  -- Return X + epsilon if X < Y, X - epsilon if X > Y.   
   --  skipped func __nextafterl

   --  skipped func __nextafterf

   --  skipped func __nextafter

   function nextafterl (uu_x : long_double; uu_y : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:292
   pragma Import (C, nextafterl, "nextafterl");

   function nextafterf (uu_x : float; uu_y : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:292
   pragma Import (C, nextafterf, "nextafterf");

   function nextafter (uu_x : double; uu_y : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:292
   pragma Import (C, nextafter, "nextafter");

   --  skipped func __nexttowardl

   --  skipped func __nexttowardf

   --  skipped func __nexttoward

   function nexttowardl (uu_x : long_double; uu_y : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:294
   pragma Import (C, nexttowardl, "nexttowardl");

   function nexttowardf (uu_x : float; uu_y : long_double) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:294
   pragma Import (C, nexttowardf, "nexttowardf");

   function nexttoward (uu_x : double; uu_y : long_double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:294
   pragma Import (C, nexttoward, "nexttoward");

  -- Return the remainder of integer divison X / Y with infinite precision.   
   --  skipped func __remainderl

   --  skipped func __remainderf

   --  skipped func __remainder

   function remainderl (uu_x : long_double; uu_y : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:298
   pragma Import (C, remainderl, "remainderl");

   function remainderf (uu_x : float; uu_y : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:298
   pragma Import (C, remainderf, "remainderf");

   function remainder (uu_x : double; uu_y : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:298
   pragma Import (C, remainder, "remainder");

  -- Return X times (2 to the Nth power).   
   --  skipped func __scalbnl

   --  skipped func __scalbnf

   --  skipped func __scalbn

   function scalbnl (uu_x : long_double; uu_n : int) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:302
   pragma Import (C, scalbnl, "scalbnl");

   function scalbnf (uu_x : float; uu_n : int) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:302
   pragma Import (C, scalbnf, "scalbnf");

   function scalbn (uu_x : double; uu_n : int) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:302
   pragma Import (C, scalbn, "scalbn");

  -- Return the binary exponent of X, which must be nonzero.   
   --  skipped func __ilogbl

   --  skipped func __ilogbf

   --  skipped func __ilogb

   function ilogbl (uu_x : long_double) return int;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:306
   pragma Import (C, ilogbl, "ilogbl");

   function ilogbf (uu_x : float) return int;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:306
   pragma Import (C, ilogbf, "ilogbf");

   function ilogb (uu_x : double) return int;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:306
   pragma Import (C, ilogb, "ilogb");

  -- Return X times (2 to the Nth power).   
   --  skipped func __scalblnl

   --  skipped func __scalblnf

   --  skipped func __scalbln

   function scalblnl (uu_x : long_double; uu_n : long) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:311
   pragma Import (C, scalblnl, "scalblnl");

   function scalblnf (uu_x : float; uu_n : long) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:311
   pragma Import (C, scalblnf, "scalblnf");

   function scalbln (uu_x : double; uu_n : long) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:311
   pragma Import (C, scalbln, "scalbln");

  -- Round X to integral value in floating-point format using current
  --   rounding direction, but do not raise inexact exception.   

   --  skipped func __nearbyintl

   --  skipped func __nearbyintf

   --  skipped func __nearbyint

   function nearbyintl (uu_x : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:315
   pragma Import (C, nearbyintl, "nearbyintl");

   function nearbyintf (uu_x : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:315
   pragma Import (C, nearbyintf, "nearbyintf");

   function nearbyint (uu_x : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:315
   pragma Import (C, nearbyint, "nearbyint");

  -- Round X to nearest integral value, rounding halfway cases away from
  --   zero.   

   --  skipped func __roundl

   --  skipped func __roundf

   --  skipped func __round

   function roundl (uu_x : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:319
   pragma Import (C, roundl, "roundl");

   function roundf (uu_x : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:319
   pragma Import (C, roundf, "roundf");

   function round (uu_x : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:319
   pragma Import (C, round, "round");

  -- Round X to the integral value in floating-point format nearest but
  --   not larger in magnitude.   

   --  skipped func __truncl

   --  skipped func __truncf

   --  skipped func __trunc

   function truncl (uu_x : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:323
   pragma Import (C, truncl, "truncl");

   function truncf (uu_x : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:323
   pragma Import (C, truncf, "truncf");

   function trunc (uu_x : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:323
   pragma Import (C, trunc, "trunc");

  -- Compute remainder of X and Y and put in *QUO a value with sign of x/y
  --   and magnitude congruent `mod 2^n' to the magnitude of the integral
  --   quotient x/y, with n >= 3.   

   --  skipped func __remquol

   --  skipped func __remquof

   --  skipped func __remquo

   function remquol
     (uu_x : long_double;
      uu_y : long_double;
      uu_quo : access int) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:328
   pragma Import (C, remquol, "remquol");

   function remquof
     (uu_x : float;
      uu_y : float;
      uu_quo : access int) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:328
   pragma Import (C, remquof, "remquof");

   function remquo
     (uu_x : double;
      uu_y : double;
      uu_quo : access int) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:328
   pragma Import (C, remquo, "remquo");

  -- Conversion functions.   
  -- Round X to nearest integral value according to current rounding
  --   direction.   

   --  skipped func __lrintl

   --  skipped func __lrintf

   --  skipped func __lrint

   function lrintl (uu_x : long_double) return long;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:335
   pragma Import (C, lrintl, "lrintl");

   function lrintf (uu_x : float) return long;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:335
   pragma Import (C, lrintf, "lrintf");

   function lrint (uu_x : double) return long;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:335
   pragma Import (C, lrint, "lrint");

   --  skipped func __llrintl

   --  skipped func __llrintf

   --  skipped func __llrint

   function llrintl (uu_x : long_double) return Long_Long_Integer;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:337
   pragma Import (C, llrintl, "llrintl");

   function llrintf (uu_x : float) return Long_Long_Integer;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:337
   pragma Import (C, llrintf, "llrintf");

   function llrint (uu_x : double) return Long_Long_Integer;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:337
   pragma Import (C, llrint, "llrint");

  -- Round X to nearest integral value, rounding halfway cases away from
  --   zero.   

   --  skipped func __lroundl

   --  skipped func __lroundf

   --  skipped func __lround

   function lroundl (uu_x : long_double) return long;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:341
   pragma Import (C, lroundl, "lroundl");

   function lroundf (uu_x : float) return long;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:341
   pragma Import (C, lroundf, "lroundf");

   function lround (uu_x : double) return long;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:341
   pragma Import (C, lround, "lround");

   --  skipped func __llroundl

   --  skipped func __llroundf

   --  skipped func __llround

   function llroundl (uu_x : long_double) return Long_Long_Integer;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:343
   pragma Import (C, llroundl, "llroundl");

   function llroundf (uu_x : float) return Long_Long_Integer;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:343
   pragma Import (C, llroundf, "llroundf");

   function llround (uu_x : double) return Long_Long_Integer;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:343
   pragma Import (C, llround, "llround");

  -- Return positive difference between X and Y.   
   --  skipped func __fdiml

   --  skipped func __fdimf

   --  skipped func __fdim

   function fdiml (uu_x : long_double; uu_y : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:347
   pragma Import (C, fdiml, "fdiml");

   function fdimf (uu_x : float; uu_y : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:347
   pragma Import (C, fdimf, "fdimf");

   function fdim (uu_x : double; uu_y : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:347
   pragma Import (C, fdim, "fdim");

  -- Return maximum numeric value from X and Y.   
   --  skipped func __fmaxl

   --  skipped func __fmaxf

   --  skipped func __fmax

   function fmaxl (uu_x : long_double; uu_y : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:350
   pragma Import (C, fmaxl, "fmaxl");

   function fmaxf (uu_x : float; uu_y : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:350
   pragma Import (C, fmaxf, "fmaxf");

   function fmax (uu_x : double; uu_y : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:350
   pragma Import (C, fmax, "fmax");

  -- Return minimum numeric value from X and Y.   
   --  skipped func __fminl

   --  skipped func __fminf

   --  skipped func __fmin

   function fminl (uu_x : long_double; uu_y : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:353
   pragma Import (C, fminl, "fminl");

   function fminf (uu_x : float; uu_y : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:353
   pragma Import (C, fminf, "fminf");

   function fmin (uu_x : double; uu_y : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:353
   pragma Import (C, fmin, "fmin");

  -- Classify given number.   
   --  skipped func __fpclassifyl

   --  skipped func __fpclassifyf

   --  skipped func __fpclassify

  -- Test for negative number.   
   --  skipped func __signbitl

   --  skipped func __signbitf

   --  skipped func __signbit

  -- Multiply-add function computed as a ternary operation.   
   --  skipped func __fmal

   --  skipped func __fmaf

   --  skipped func __fma

   function fmal
     (uu_x : long_double;
      uu_y : long_double;
      uu_z : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:366
   pragma Import (C, fmal, "fmal");

   function fmaf
     (uu_x : float;
      uu_y : float;
      uu_z : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:366
   pragma Import (C, fmaf, "fmaf");

   function fma
     (uu_x : double;
      uu_y : double;
      uu_z : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:366
   pragma Import (C, fma, "fma");

  -- Test for signaling NaN.   
   --  skipped func __issignalingl

   --  skipped func __issignalingf

   --  skipped func __issignaling

  -- Return X times (2 to the Nth power).   
   --  skipped func __scalbl

   --  skipped func __scalbf

   --  skipped func __scalb

   function scalbl (uu_x : long_double; uu_n : long_double) return long_double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:383
   pragma Import (C, scalbl, "scalbl");

   function scalbf (uu_x : float; uu_n : float) return float;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:383
   pragma Import (C, scalbf, "scalbf");

   function scalb (uu_x : double; uu_n : double) return double;  -- /usr/include/x86_64-linux-gnu/bits/mathcalls.h:383
   pragma Import (C, scalb, "scalb");

end x86_64_linux_gnu_bits_mathcalls_h;
