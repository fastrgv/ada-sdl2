
package body sdl_mouse_h is


   type Uint32 is mod 2**32;
   for Uint32'Size use 32;
   pragma Convention (C, Uint32);



   function ShiftRight (Value : Uint32; Amount : Natural) return Uint32 is
   begin
      return Uint32
          (Interfaces.Shift_Right (Interfaces.Unsigned_32 (Value), Amount));
   end ShiftRight;

   function ShiftLeft (Value : Uint32; Amount : Natural) return Uint32 is
   begin
      return Uint32
          (Interfaces.Shift_Left (Interfaces.Unsigned_32 (Value), Amount));
   end ShiftLeft;




   function SDL_BUTTON (X : int) return int is
   begin
      return int (ShiftLeft (1, Natural ((X - 1))));
   end SDL_BUTTON;


end sdl_mouse_h;

