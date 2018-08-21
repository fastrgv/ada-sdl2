pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with x86_64_linux_gnu_bits_types_h;
with wchar_h;

package uG_config_h is

  -- This file is needed by libio to define various configuration parameters.
  --   These are always the same in the GNU C library.   

  -- Define types for libio in terms of the standard internal type names.   
   type u_G_fpos_t is record
      uu_pos : aliased x86_64_linux_gnu_bits_types_h.uu_off_t;  -- /usr/include/_G_config.h:23
      uu_state : aliased wchar_h.uu_mbstate_t;  -- /usr/include/_G_config.h:24
   end record;
   pragma Convention (C_Pass_By_Copy, u_G_fpos_t);  -- /usr/include/_G_config.h:25

   --  skipped anonymous struct anon_15

   type u_G_fpos64_t is record
      uu_pos : aliased x86_64_linux_gnu_bits_types_h.uu_off64_t;  -- /usr/include/_G_config.h:28
      uu_state : aliased wchar_h.uu_mbstate_t;  -- /usr/include/_G_config.h:29
   end record;
   pragma Convention (C_Pass_By_Copy, u_G_fpos64_t);  -- /usr/include/_G_config.h:30

   --  skipped anonymous struct anon_16

  -- These library features are always available in the GNU C library.   
  -- This is defined by <bits/stat.h> if `st_blksize' exists.   
end uG_config_h;
