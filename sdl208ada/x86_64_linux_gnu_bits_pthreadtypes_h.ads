pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;
with System;

package x86_64_linux_gnu_bits_pthreadtypes_h is

  -- Copyright (C) 2002-2016 Free Software Foundation, Inc.
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

  -- Thread identifiers.  The structure of the attribute type is not
  --   exposed on purpose.   

   subtype pthread_t is unsigned_long;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:60

   subtype pthread_attr_t_uu_size_array is Interfaces.C.char_array (0 .. 55);
   type pthread_attr_t (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_size : aliased pthread_attr_t_uu_size_array;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:65
         when others =>
            uu_align : aliased long;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:66
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, pthread_attr_t);
   pragma Unchecked_Union (pthread_attr_t);  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:63

   type uu_pthread_internal_list is record
      uu_prev : access uu_pthread_internal_list;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:77
      uu_next : access uu_pthread_internal_list;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:78
   end record;
   pragma Convention (C_Pass_By_Copy, uu_pthread_internal_list);  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:75

   subtype uu_pthread_list_t is uu_pthread_internal_list;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:79

  -- Data structures for mutex handling.  The structure of the attribute
  --   type is not exposed on purpose.   

  -- KIND must stay at this position in the structure to maintain
  --       binary compatibility.   

  -- Mutex __spins initializer used by PTHREAD_MUTEX_INITIALIZER.   
   type pthread_mutex_t;
   type uu_pthread_mutex_s is record
      uu_lock : aliased int;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:94
      uu_count : aliased unsigned;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:95
      uu_owner : aliased int;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:96
      uu_nusers : aliased unsigned;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:98
      uu_kind : aliased int;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:102
      uu_spins : aliased short;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:104
      uu_elision : aliased short;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:105
      uu_list : aliased uu_pthread_list_t;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:106
   end record;
   pragma Convention (C_Pass_By_Copy, uu_pthread_mutex_s);
   subtype pthread_mutex_t_uu_size_array is Interfaces.C.char_array (0 .. 39);
   type pthread_mutex_t (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_data : aliased uu_pthread_mutex_s;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:125
         when 1 =>
            uu_size : aliased pthread_mutex_t_uu_size_array;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:126
         when others =>
            uu_align : aliased long;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:127
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, pthread_mutex_t);
   pragma Unchecked_Union (pthread_mutex_t);  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:128

   --  skipped anonymous struct anon_3

   subtype pthread_mutexattr_t_uu_size_array is Interfaces.C.char_array (0 .. 3);
   type pthread_mutexattr_t (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_size : aliased pthread_mutexattr_t_uu_size_array;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:132
         when others =>
            uu_align : aliased int;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:133
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, pthread_mutexattr_t);
   pragma Unchecked_Union (pthread_mutexattr_t);  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:134

   --  skipped anonymous struct anon_4

  -- Data structure for conditional variable handling.  The structure of
  --   the attribute type is not exposed on purpose.   

   type pthread_cond_t;
   type anon_6 is record
      uu_lock : aliased int;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:143
      uu_futex : aliased unsigned;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:144
      uu_total_seq : aliased Extensions.unsigned_long_long;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:145
      uu_wakeup_seq : aliased Extensions.unsigned_long_long;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:146
      uu_woken_seq : aliased Extensions.unsigned_long_long;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:147
      uu_mutex : System.Address;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:148
      uu_nwaiters : aliased unsigned;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:149
      uu_broadcast_seq : aliased unsigned;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:150
   end record;
   pragma Convention (C_Pass_By_Copy, anon_6);
   subtype pthread_cond_t_uu_size_array is Interfaces.C.char_array (0 .. 47);
   type pthread_cond_t (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_data : aliased anon_6;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:151
         when 1 =>
            uu_size : aliased pthread_cond_t_uu_size_array;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:152
         when others =>
            uu_align : aliased Long_Long_Integer;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:153
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, pthread_cond_t);
   pragma Unchecked_Union (pthread_cond_t);  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:154

   --  skipped anonymous struct anon_5

   subtype pthread_condattr_t_uu_size_array is Interfaces.C.char_array (0 .. 3);
   type pthread_condattr_t (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_size : aliased pthread_condattr_t_uu_size_array;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:158
         when others =>
            uu_align : aliased int;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:159
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, pthread_condattr_t);
   pragma Unchecked_Union (pthread_condattr_t);  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:160

   --  skipped anonymous struct anon_7

  -- Keys for thread-specific data  
   subtype pthread_key_t is unsigned;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:164

  -- Once-only execution  
   subtype pthread_once_t is int;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:168

  -- Data structure for read-write lock variable handling.  The
  --   structure of the attribute type is not exposed on purpose.   

  -- FLAGS must stay at this position in the structure to maintain
  --       binary compatibility.   

   type pthread_rwlock_t;
   type pthread_rwlock_t_uu_pad1_array is array (0 .. 6) of aliased unsigned_char;
   type anon_9 is record
      uu_lock : aliased int;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:179
      uu_nr_readers : aliased unsigned;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:180
      uu_readers_wakeup : aliased unsigned;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:181
      uu_writer_wakeup : aliased unsigned;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:182
      uu_nr_readers_queued : aliased unsigned;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:183
      uu_nr_writers_queued : aliased unsigned;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:184
      uu_writer : aliased int;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:185
      uu_shared : aliased int;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:186
      uu_rwelision : aliased signed_char;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:187
      uu_pad1 : aliased pthread_rwlock_t_uu_pad1_array;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:192
      uu_pad2 : aliased unsigned_long;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:195
      uu_flags : aliased unsigned;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:198
   end record;
   pragma Convention (C_Pass_By_Copy, anon_9);
   subtype pthread_rwlock_t_uu_size_array is Interfaces.C.char_array (0 .. 55);
   type pthread_rwlock_t (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_data : aliased anon_9;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:200
         when 1 =>
            uu_size : aliased pthread_rwlock_t_uu_size_array;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:220
         when others =>
            uu_align : aliased long;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:221
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, pthread_rwlock_t);
   pragma Unchecked_Union (pthread_rwlock_t);  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:222

   --  skipped anonymous struct anon_8

  -- FLAGS must stay at this position in the structure to maintain
  --       binary compatibility.   

   subtype pthread_rwlockattr_t_uu_size_array is Interfaces.C.char_array (0 .. 7);
   type pthread_rwlockattr_t (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_size : aliased pthread_rwlockattr_t_uu_size_array;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:226
         when others =>
            uu_align : aliased long;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:227
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, pthread_rwlockattr_t);
   pragma Unchecked_Union (pthread_rwlockattr_t);  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:228

   --  skipped anonymous struct anon_10

  -- POSIX spinlock data type.   
   subtype pthread_spinlock_t is int;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:234

  -- POSIX barriers data type.  The structure of the type is
  --   deliberately not exposed.   

   subtype pthread_barrier_t_uu_size_array is Interfaces.C.char_array (0 .. 31);
   type pthread_barrier_t (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_size : aliased pthread_barrier_t_uu_size_array;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:241
         when others =>
            uu_align : aliased long;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:242
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, pthread_barrier_t);
   pragma Unchecked_Union (pthread_barrier_t);  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:243

   --  skipped anonymous struct anon_11

   subtype pthread_barrierattr_t_uu_size_array is Interfaces.C.char_array (0 .. 3);
   type pthread_barrierattr_t (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_size : aliased pthread_barrierattr_t_uu_size_array;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:247
         when others =>
            uu_align : aliased int;  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:248
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, pthread_barrierattr_t);
   pragma Unchecked_Union (pthread_barrierattr_t);  -- /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:249

   --  skipped anonymous struct anon_12

  -- Extra attributes for the cleanup functions.   
end x86_64_linux_gnu_bits_pthreadtypes_h;
