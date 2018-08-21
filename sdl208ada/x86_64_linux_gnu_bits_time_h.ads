pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with x86_64_linux_gnu_bits_types_h;

package x86_64_linux_gnu_bits_time_h is

  -- System-dependent timing definitions.  Linux version.
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

  -- * Never include this file directly; use <time.h> instead.
  --  

  -- A time value that is accurate to the nearest
  --   microsecond but also has a range of years.   

  -- Seconds.   
   type timeval is record
      tv_sec : aliased x86_64_linux_gnu_bits_types_h.uu_time_t;  -- /usr/include/x86_64-linux-gnu/bits/time.h:32
      tv_usec : aliased x86_64_linux_gnu_bits_types_h.uu_suseconds_t;  -- /usr/include/x86_64-linux-gnu/bits/time.h:33
   end record;
   pragma Convention (C_Pass_By_Copy, timeval);  -- /usr/include/x86_64-linux-gnu/bits/time.h:30

  -- Microseconds.   
  -- ISO/IEC 9899:1999 7.23.1: Components of time
  --   The macro `CLOCKS_PER_SEC' is an expression with type `clock_t' that is
  --   the number per second of the value returned by the `clock' function.   

  -- CAE XSH, Issue 4, Version 2: <time.h>
  --   The value of CLOCKS_PER_SEC is required to be 1 million on all
  --   XSI-conformant systems.  

  -- Even though CLOCKS_PER_SEC has such a strange value CLK_TCK
  --   presents the real value for clock ticks per second for the system.   

  -- Identifier for system-wide realtime clock.   
  -- Monotonic system-wide clock.   
  -- High-resolution timer from the CPU.   
  -- Thread-specific CPU-time clock.   
  -- Monotonic system-wide clock, not adjusted for frequency scaling.   
  -- Identifier for system-wide realtime clock, updated only on ticks.   
  -- Monotonic system-wide clock, updated only on ticks.   
  -- Monotonic system-wide clock that includes time spent in suspension.   
  -- Like CLOCK_REALTIME but also wakes suspended system.   
  -- Like CLOCK_BOOTTIME but also wakes suspended system.   
  -- Like CLOCK_REALTIME but in International Atomic Time.   
  -- Flag to indicate time is absolute.   
  -- Tune a POSIX clock.   
end x86_64_linux_gnu_bits_time_h;
