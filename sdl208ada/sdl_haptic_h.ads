pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with SDL_stdinc_h;
with Interfaces.C.Strings;
with System;

package SDL_haptic_h is

   SDL_HAPTIC_CONSTANT : constant := (2**0);  --  ../inc208/SDL_haptic.h:152

   SDL_HAPTIC_SINE : constant := (2**1);  --  ../inc208/SDL_haptic.h:161

   SDL_HAPTIC_LEFTRIGHT : constant := (2**2);  --  ../inc208/SDL_haptic.h:172

   SDL_HAPTIC_TRIANGLE : constant := (2**3);  --  ../inc208/SDL_haptic.h:184

   SDL_HAPTIC_SAWTOOTHUP : constant := (2**4);  --  ../inc208/SDL_haptic.h:193

   SDL_HAPTIC_SAWTOOTHDOWN : constant := (2**5);  --  ../inc208/SDL_haptic.h:202

   SDL_HAPTIC_RAMP : constant := (2**6);  --  ../inc208/SDL_haptic.h:211

   SDL_HAPTIC_SPRING : constant := (2**7);  --  ../inc208/SDL_haptic.h:221

   SDL_HAPTIC_DAMPER : constant := (2**8);  --  ../inc208/SDL_haptic.h:231

   SDL_HAPTIC_INERTIA : constant := (2**9);  --  ../inc208/SDL_haptic.h:241

   SDL_HAPTIC_FRICTION : constant := (2**10);  --  ../inc208/SDL_haptic.h:251

   SDL_HAPTIC_CUSTOM : constant := (2**11);  --  ../inc208/SDL_haptic.h:258

   SDL_HAPTIC_GAIN : constant := (2**12);  --  ../inc208/SDL_haptic.h:271

   SDL_HAPTIC_AUTOCENTER : constant := (2**13);  --  ../inc208/SDL_haptic.h:280

   SDL_HAPTIC_STATUS : constant := (2**14);  --  ../inc208/SDL_haptic.h:289

   SDL_HAPTIC_PAUSE : constant := (2**15);  --  ../inc208/SDL_haptic.h:299

   SDL_HAPTIC_POLAR : constant := 0;  --  ../inc208/SDL_haptic.h:312

   SDL_HAPTIC_CARTESIAN : constant := 1;  --  ../inc208/SDL_haptic.h:319

   SDL_HAPTIC_SPHERICAL : constant := 2;  --  ../inc208/SDL_haptic.h:326

   SDL_HAPTIC_INFINITY : constant := 4294967295;  --  ../inc208/SDL_haptic.h:341

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
  -- *  \file SDL_haptic.h
  -- *
  -- *  \brief The SDL haptic subsystem allows you to control haptic (force feedback)
  -- *         devices.
  -- *
  -- *  The basic usage is as follows:
  -- *   - Initialize the subsystem (::SDL_INIT_HAPTIC).
  -- *   - Open a haptic device.
  -- *    - SDL_HapticOpen() to open from index.
  -- *    - SDL_HapticOpenFromJoystick() to open from an existing joystick.
  -- *   - Create an effect (::SDL_HapticEffect).
  -- *   - Upload the effect with SDL_HapticNewEffect().
  -- *   - Run the effect with SDL_HapticRunEffect().
  -- *   - (optional) Free the effect with SDL_HapticDestroyEffect().
  -- *   - Close the haptic device with SDL_HapticClose().
  -- *
  -- * \par Simple rumble example:
  -- * \code
  -- *    SDL_Haptic *haptic;
  -- *
  -- *    // Open the device
  -- *    haptic = SDL_HapticOpen( 0 );
  -- *    if (haptic == NULL)
  -- *       return -1;
  -- *
  -- *    // Initialize simple rumble
  -- *    if (SDL_HapticRumbleInit( haptic ) != 0)
  -- *       return -1;
  -- *
  -- *    // Play effect at 50% strength for 2 seconds
  -- *    if (SDL_HapticRumblePlay( haptic, 0.5, 2000 ) != 0)
  -- *       return -1;
  -- *    SDL_Delay( 2000 );
  -- *
  -- *    // Clean up
  -- *    SDL_HapticClose( haptic );
  -- * \endcode
  -- *
  -- * \par Complete example:
  -- * \code
  -- * int test_haptic( SDL_Joystick * joystick ) {
  -- *    SDL_Haptic *haptic;
  -- *    SDL_HapticEffect effect;
  -- *    int effect_id;
  -- *
  -- *    // Open the device
  -- *    haptic = SDL_HapticOpenFromJoystick( joystick );
  -- *    if (haptic == NULL) return -1; // Most likely joystick isn't haptic
  -- *
  -- *    // See if it can do sine waves
  -- *    if ((SDL_HapticQuery(haptic) & SDL_HAPTIC_SINE)==0) {
  -- *       SDL_HapticClose(haptic); // No sine effect
  -- *       return -1;
  -- *    }
  -- *
  -- *    // Create the effect
  -- *    memset( &effect, 0, sizeof(SDL_HapticEffect) ); // 0 is safe default
  -- *    effect.type = SDL_HAPTIC_SINE;
  -- *    effect.periodic.direction.type = SDL_HAPTIC_POLAR; // Polar coordinates
  -- *    effect.periodic.direction.dir[0] = 18000; // Force comes from south
  -- *    effect.periodic.period = 1000; // 1000 ms
  -- *    effect.periodic.magnitude = 20000; // 20000/32767 strength
  -- *    effect.periodic.length = 5000; // 5 seconds long
  -- *    effect.periodic.attack_length = 1000; // Takes 1 second to get max strength
  -- *    effect.periodic.fade_length = 1000; // Takes 1 second to fade away
  -- *
  -- *    // Upload the effect
  -- *    effect_id = SDL_HapticNewEffect( haptic, &effect );
  -- *
  -- *    // Test the effect
  -- *    SDL_HapticRunEffect( haptic, effect_id, 1 );
  -- *    SDL_Delay( 5000); // Wait for the effect to finish
  -- *
  -- *    // We destroy the effect, although closing the device also does this
  -- *    SDL_HapticDestroyEffect( haptic, effect_id );
  -- *
  -- *    // Close the device
  -- *    SDL_HapticClose(haptic);
  -- *
  -- *    return 0; // Success
  -- * }
  -- * \endcode
  --  

  -- Set up for C function definitions, even when using C++  
  --*
  -- *  \typedef SDL_Haptic
  -- *
  -- *  \brief The haptic structure used to identify an SDL haptic.
  -- *
  -- *  \sa SDL_HapticOpen
  -- *  \sa SDL_HapticOpenFromJoystick
  -- *  \sa SDL_HapticClose
  --  

   --  skipped empty struct u_SDL_Haptic

   --  skipped empty struct SDL_Haptic

  --*
  -- *  \name Haptic features
  -- *
  -- *  Different haptic features a device can have.
  --  

  -- @{  
  --*
  -- *  \name Haptic effects
  --  

  -- @{  
  --*
  -- *  \brief Constant effect supported.
  -- *
  -- *  Constant haptic effect.
  -- *
  -- *  \sa SDL_HapticCondition
  --  

  --*
  -- *  \brief Sine wave effect supported.
  -- *
  -- *  Periodic haptic effect that simulates sine waves.
  -- *
  -- *  \sa SDL_HapticPeriodic
  --  

  --*
  -- *  \brief Left/Right effect supported.
  -- *
  -- *  Haptic effect for direct control over high/low frequency motors.
  -- *
  -- *  \sa SDL_HapticLeftRight
  -- * \warning this value was SDL_HAPTIC_SQUARE right before 2.0.0 shipped. Sorry,
  -- *          we ran out of bits, and this is important for XInput devices.
  --  

  -- !!! FIXME: put this back when we have more bits in 2.1  
  -- #define SDL_HAPTIC_SQUARE     (1<<2)  
  --*
  -- *  \brief Triangle wave effect supported.
  -- *
  -- *  Periodic haptic effect that simulates triangular waves.
  -- *
  -- *  \sa SDL_HapticPeriodic
  --  

  --*
  -- *  \brief Sawtoothup wave effect supported.
  -- *
  -- *  Periodic haptic effect that simulates saw tooth up waves.
  -- *
  -- *  \sa SDL_HapticPeriodic
  --  

  --*
  -- *  \brief Sawtoothdown wave effect supported.
  -- *
  -- *  Periodic haptic effect that simulates saw tooth down waves.
  -- *
  -- *  \sa SDL_HapticPeriodic
  --  

  --*
  -- *  \brief Ramp effect supported.
  -- *
  -- *  Ramp haptic effect.
  -- *
  -- *  \sa SDL_HapticRamp
  --  

  --*
  -- *  \brief Spring effect supported - uses axes position.
  -- *
  -- *  Condition haptic effect that simulates a spring.  Effect is based on the
  -- *  axes position.
  -- *
  -- *  \sa SDL_HapticCondition
  --  

  --*
  -- *  \brief Damper effect supported - uses axes velocity.
  -- *
  -- *  Condition haptic effect that simulates dampening.  Effect is based on the
  -- *  axes velocity.
  -- *
  -- *  \sa SDL_HapticCondition
  --  

  --*
  -- *  \brief Inertia effect supported - uses axes acceleration.
  -- *
  -- *  Condition haptic effect that simulates inertia.  Effect is based on the axes
  -- *  acceleration.
  -- *
  -- *  \sa SDL_HapticCondition
  --  

  --*
  -- *  \brief Friction effect supported - uses axes movement.
  -- *
  -- *  Condition haptic effect that simulates friction.  Effect is based on the
  -- *  axes movement.
  -- *
  -- *  \sa SDL_HapticCondition
  --  

  --*
  -- *  \brief Custom effect is supported.
  -- *
  -- *  User defined custom haptic effect.
  --  

  -- @}  
  -- Haptic effects  
  -- These last few are features the device has, not effects  
  --*
  -- *  \brief Device can set global gain.
  -- *
  -- *  Device supports setting the global gain.
  -- *
  -- *  \sa SDL_HapticSetGain
  --  

  --*
  -- *  \brief Device can set autocenter.
  -- *
  -- *  Device supports setting autocenter.
  -- *
  -- *  \sa SDL_HapticSetAutocenter
  --  

  --*
  -- *  \brief Device can be queried for effect status.
  -- *
  -- *  Device supports querying effect status.
  -- *
  -- *  \sa SDL_HapticGetEffectStatus
  --  

  --*
  -- *  \brief Device can be paused.
  -- *
  -- *  Devices supports being paused.
  -- *
  -- *  \sa SDL_HapticPause
  -- *  \sa SDL_HapticUnpause
  --  

  --*
  -- * \name Direction encodings
  --  

  -- @{  
  --*
  -- *  \brief Uses polar coordinates for the direction.
  -- *
  -- *  \sa SDL_HapticDirection
  --  

  --*
  -- *  \brief Uses cartesian coordinates for the direction.
  -- *
  -- *  \sa SDL_HapticDirection
  --  

  --*
  -- *  \brief Uses spherical coordinates for the direction.
  -- *
  -- *  \sa SDL_HapticDirection
  --  

  -- @}  
  -- Direction encodings  
  -- @}  
  -- Haptic features  
  -- * Misc defines.
  --  

  --*
  -- * \brief Used to play a device an infinite number of times.
  -- *
  -- * \sa SDL_HapticRunEffect
  --  

  --*
  -- *  \brief Structure that represents a haptic direction.
  -- *
  -- *  This is the direction where the force comes from,
  -- *  instead of the direction in which the force is exerted.
  -- *
  -- *  Directions can be specified by:
  -- *   - ::SDL_HAPTIC_POLAR : Specified by polar coordinates.
  -- *   - ::SDL_HAPTIC_CARTESIAN : Specified by cartesian coordinates.
  -- *   - ::SDL_HAPTIC_SPHERICAL : Specified by spherical coordinates.
  -- *
  -- *  Cardinal directions of the haptic device are relative to the positioning
  -- *  of the device.  North is considered to be away from the user.
  -- *
  -- *  The following diagram represents the cardinal directions:
  -- *  \verbatim
  --                 .--.
  --                 |__| .-------.
  --                 |=.| |.-----.|
  --                 |--| ||     ||
  --                 |  | |'-----'|
  --                 |__|~')_____('
  --                   [ COMPUTER ]
  --                     North (0,-1)
  --                         ^
  --                         |
  --                         |
  --   (-1,0)  West <----[ HAPTIC ]----> East (1,0)
  --                         |
  --                         |
  --                         v
  --                      South (0,1)
  --                      [ USER ]
  --                        \|||/
  --                        (o o)
  --                  ---ooO-(_)-Ooo---
  --    \endverbatim
  -- *
  -- *  If type is ::SDL_HAPTIC_POLAR, direction is encoded by hundredths of a
  -- *  degree starting north and turning clockwise.  ::SDL_HAPTIC_POLAR only uses
  -- *  the first \c dir parameter.  The cardinal directions would be:
  -- *   - North: 0 (0 degrees)
  -- *   - East: 9000 (90 degrees)
  -- *   - South: 18000 (180 degrees)
  -- *   - West: 27000 (270 degrees)
  -- *
  -- *  If type is ::SDL_HAPTIC_CARTESIAN, direction is encoded by three positions
  -- *  (X axis, Y axis and Z axis (with 3 axes)).  ::SDL_HAPTIC_CARTESIAN uses
  -- *  the first three \c dir parameters.  The cardinal directions would be:
  -- *   - North:  0,-1, 0
  -- *   - East:   1, 0, 0
  -- *   - South:  0, 1, 0
  -- *   - West:  -1, 0, 0
  -- *
  -- *  The Z axis represents the height of the effect if supported, otherwise
  -- *  it's unused.  In cartesian encoding (1, 2) would be the same as (2, 4), you
  -- *  can use any multiple you want, only the direction matters.
  -- *
  -- *  If type is ::SDL_HAPTIC_SPHERICAL, direction is encoded by two rotations.
  -- *  The first two \c dir parameters are used.  The \c dir parameters are as
  -- *  follows (all values are in hundredths of degrees):
  -- *   - Degrees from (1, 0) rotated towards (0, 1).
  -- *   - Degrees towards (0, 0, 1) (device needs at least 3 axes).
  -- *
  -- *
  -- *  Example of force coming from the south with all encodings (force coming
  -- *  from the south means the user will have to pull the stick to counteract):
  -- *  \code
  -- *  SDL_HapticDirection direction;
  -- *
  -- *  // Cartesian directions
  -- *  direction.type = SDL_HAPTIC_CARTESIAN; // Using cartesian direction encoding.
  -- *  direction.dir[0] = 0; // X position
  -- *  direction.dir[1] = 1; // Y position
  -- *  // Assuming the device has 2 axes, we don't need to specify third parameter.
  -- *
  -- *  // Polar directions
  -- *  direction.type = SDL_HAPTIC_POLAR; // We'll be using polar direction encoding.
  -- *  direction.dir[0] = 18000; // Polar only uses first parameter
  -- *
  -- *  // Spherical coordinates
  -- *  direction.type = SDL_HAPTIC_SPHERICAL; // Spherical encoding
  -- *  direction.dir[0] = 9000; // Since we only have two axes we don't need more parameters.
  -- *  \endcode
  -- *
  -- *  \sa SDL_HAPTIC_POLAR
  -- *  \sa SDL_HAPTIC_CARTESIAN
  -- *  \sa SDL_HAPTIC_SPHERICAL
  -- *  \sa SDL_HapticEffect
  -- *  \sa SDL_HapticNumAxes
  --  

  --*< The type of encoding.  
   type SDL_HapticDirection_dir_array is array (0 .. 2) of aliased SDL_stdinc_h.Sint32;
   type SDL_HapticDirection is record
      c_type : aliased SDL_stdinc_h.Uint8;  -- ../inc208/SDL_haptic.h:441
      dir : aliased SDL_HapticDirection_dir_array;  -- ../inc208/SDL_haptic.h:442
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_HapticDirection);  -- ../inc208/SDL_haptic.h:439

  --*< The encoded direction.  
  --*
  -- *  \brief A structure containing a template for a Constant effect.
  -- *
  -- *  This struct is exclusively for the ::SDL_HAPTIC_CONSTANT effect.
  -- *
  -- *  A constant effect applies a constant force in the specified direction
  -- *  to the joystick.
  -- *
  -- *  \sa SDL_HAPTIC_CONSTANT
  -- *  \sa SDL_HapticEffect
  --  

  -- Header  
  --*< ::SDL_HAPTIC_CONSTANT  
   type SDL_HapticConstant is record
      c_type : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:460
      direction : aliased SDL_HapticDirection;  -- ../inc208/SDL_haptic.h:461
      length : aliased SDL_stdinc_h.Uint32;  -- ../inc208/SDL_haptic.h:464
      c_delay : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:465
      button : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:468
      interval : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:469
      level : aliased SDL_stdinc_h.Sint16;  -- ../inc208/SDL_haptic.h:472
      attack_length : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:475
      attack_level : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:476
      fade_length : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:477
      fade_level : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:478
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_HapticConstant);  -- ../inc208/SDL_haptic.h:457

  --*< Direction of the effect.  
  -- Replay  
  --*< Duration of the effect.  
  --*< Delay before starting the effect.  
  -- Trigger  
  --*< Button that triggers the effect.  
  --*< How soon it can be triggered again after button.  
  -- Constant  
  --*< Strength of the constant effect.  
  -- Envelope  
  --*< Duration of the attack.  
  --*< Level at the start of the attack.  
  --*< Duration of the fade.  
  --*< Level at the end of the fade.  
  --*
  -- *  \brief A structure containing a template for a Periodic effect.
  -- *
  -- *  The struct handles the following effects:
  -- *   - ::SDL_HAPTIC_SINE
  -- *   - ::SDL_HAPTIC_LEFTRIGHT
  -- *   - ::SDL_HAPTIC_TRIANGLE
  -- *   - ::SDL_HAPTIC_SAWTOOTHUP
  -- *   - ::SDL_HAPTIC_SAWTOOTHDOWN
  -- *
  -- *  A periodic effect consists in a wave-shaped effect that repeats itself
  -- *  over time.  The type determines the shape of the wave and the parameters
  -- *  determine the dimensions of the wave.
  -- *
  -- *  Phase is given by hundredth of a degree meaning that giving the phase a value
  -- *  of 9000 will displace it 25% of its period.  Here are sample values:
  -- *   -     0: No phase displacement.
  -- *   -  9000: Displaced 25% of its period.
  -- *   - 18000: Displaced 50% of its period.
  -- *   - 27000: Displaced 75% of its period.
  -- *   - 36000: Displaced 100% of its period, same as 0, but 0 is preferred.
  -- *
  -- *  Examples:
  -- *  \verbatim
  --    SDL_HAPTIC_SINE
  --      __      __      __      __
  --     /  \    /  \    /  \    /
  --    /    \__/    \__/    \__/
  --    SDL_HAPTIC_SQUARE
  --     __    __    __    __    __
  --    |  |  |  |  |  |  |  |  |  |
  --    |  |__|  |__|  |__|  |__|  |
  --    SDL_HAPTIC_TRIANGLE
  --      /\    /\    /\    /\    /     /  \  /  \  /  \  /  \  /
  --/
  --    /    \/    \/    \/    \/
  --    SDL_HAPTIC_SAWTOOTHUP
  --      /|  /|  /|  /|  /|  /|  /|
  --     / | / | / | / | / | / | / |
  --    /  |/  |/  |/  |/  |/  |/  |
  --    SDL_HAPTIC_SAWTOOTHDOWN
  --    \  |\  |\  |\  |\  |\  |\  |
  --     \ | \ | \ | \ | \ | \ | \ |
  --      \|  \|  \|  \|  \|  \|  \|
  --    \endverbatim
  -- *
  -- *  \sa SDL_HAPTIC_SINE
  -- *  \sa SDL_HAPTIC_LEFTRIGHT
  -- *  \sa SDL_HAPTIC_TRIANGLE
  -- *  \sa SDL_HAPTIC_SAWTOOTHUP
  -- *  \sa SDL_HAPTIC_SAWTOOTHDOWN
  -- *  \sa SDL_HapticEffect
  --  

  -- Header  
  --*< ::SDL_HAPTIC_SINE, ::SDL_HAPTIC_LEFTRIGHT,
  --                             ::SDL_HAPTIC_TRIANGLE, ::SDL_HAPTIC_SAWTOOTHUP or
  --                             ::SDL_HAPTIC_SAWTOOTHDOWN  

   type SDL_HapticPeriodic is record
      c_type : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:541
      direction : aliased SDL_HapticDirection;  -- ../inc208/SDL_haptic.h:544
      length : aliased SDL_stdinc_h.Uint32;  -- ../inc208/SDL_haptic.h:547
      c_delay : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:548
      button : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:551
      interval : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:552
      period : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:555
      magnitude : aliased SDL_stdinc_h.Sint16;  -- ../inc208/SDL_haptic.h:556
      offset : aliased SDL_stdinc_h.Sint16;  -- ../inc208/SDL_haptic.h:557
      phase : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:558
      attack_length : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:561
      attack_level : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:562
      fade_length : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:563
      fade_level : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:564
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_HapticPeriodic);  -- ../inc208/SDL_haptic.h:538

  --*< Direction of the effect.  
  -- Replay  
  --*< Duration of the effect.  
  --*< Delay before starting the effect.  
  -- Trigger  
  --*< Button that triggers the effect.  
  --*< How soon it can be triggered again after button.  
  -- Periodic  
  --*< Period of the wave.  
  --*< Peak value; if negative, equivalent to 180 degrees extra phase shift.  
  --*< Mean value of the wave.  
  --*< Positive phase shift given by hundredth of a degree.  
  -- Envelope  
  --*< Duration of the attack.  
  --*< Level at the start of the attack.  
  --*< Duration of the fade.  
  --*< Level at the end of the fade.  
  --*
  -- *  \brief A structure containing a template for a Condition effect.
  -- *
  -- *  The struct handles the following effects:
  -- *   - ::SDL_HAPTIC_SPRING: Effect based on axes position.
  -- *   - ::SDL_HAPTIC_DAMPER: Effect based on axes velocity.
  -- *   - ::SDL_HAPTIC_INERTIA: Effect based on axes acceleration.
  -- *   - ::SDL_HAPTIC_FRICTION: Effect based on axes movement.
  -- *
  -- *  Direction is handled by condition internals instead of a direction member.
  -- *  The condition effect specific members have three parameters.  The first
  -- *  refers to the X axis, the second refers to the Y axis and the third
  -- *  refers to the Z axis.  The right terms refer to the positive side of the
  -- *  axis and the left terms refer to the negative side of the axis.  Please
  -- *  refer to the ::SDL_HapticDirection diagram for which side is positive and
  -- *  which is negative.
  -- *
  -- *  \sa SDL_HapticDirection
  -- *  \sa SDL_HAPTIC_SPRING
  -- *  \sa SDL_HAPTIC_DAMPER
  -- *  \sa SDL_HAPTIC_INERTIA
  -- *  \sa SDL_HAPTIC_FRICTION
  -- *  \sa SDL_HapticEffect
  --  

  -- Header  
  --*< ::SDL_HAPTIC_SPRING, ::SDL_HAPTIC_DAMPER,
  --                                 ::SDL_HAPTIC_INERTIA or ::SDL_HAPTIC_FRICTION  

   type SDL_HapticCondition_right_sat_array is array (0 .. 2) of aliased SDL_stdinc_h.Uint16;
   type SDL_HapticCondition_left_sat_array is array (0 .. 2) of aliased SDL_stdinc_h.Uint16;
   type SDL_HapticCondition_right_coeff_array is array (0 .. 2) of aliased SDL_stdinc_h.Sint16;
   type SDL_HapticCondition_left_coeff_array is array (0 .. 2) of aliased SDL_stdinc_h.Sint16;
   type SDL_HapticCondition_deadband_array is array (0 .. 2) of aliased SDL_stdinc_h.Uint16;
   type SDL_HapticCondition_center_array is array (0 .. 2) of aliased SDL_stdinc_h.Sint16;
   type SDL_HapticCondition is record
      c_type : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:594
      direction : aliased SDL_HapticDirection;  -- ../inc208/SDL_haptic.h:596
      length : aliased SDL_stdinc_h.Uint32;  -- ../inc208/SDL_haptic.h:599
      c_delay : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:600
      button : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:603
      interval : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:604
      right_sat : aliased SDL_HapticCondition_right_sat_array;  -- ../inc208/SDL_haptic.h:607
      left_sat : aliased SDL_HapticCondition_left_sat_array;  -- ../inc208/SDL_haptic.h:608
      right_coeff : aliased SDL_HapticCondition_right_coeff_array;  -- ../inc208/SDL_haptic.h:609
      left_coeff : aliased SDL_HapticCondition_left_coeff_array;  -- ../inc208/SDL_haptic.h:610
      deadband : aliased SDL_HapticCondition_deadband_array;  -- ../inc208/SDL_haptic.h:611
      center : aliased SDL_HapticCondition_center_array;  -- ../inc208/SDL_haptic.h:612
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_HapticCondition);  -- ../inc208/SDL_haptic.h:591

  --*< Direction of the effect - Not used ATM.  
  -- Replay  
  --*< Duration of the effect.  
  --*< Delay before starting the effect.  
  -- Trigger  
  --*< Button that triggers the effect.  
  --*< How soon it can be triggered again after button.  
  -- Condition  
  --*< Level when joystick is to the positive side; max 0xFFFF.  
  --*< Level when joystick is to the negative side; max 0xFFFF.  
  --*< How fast to increase the force towards the positive side.  
  --*< How fast to increase the force towards the negative side.  
  --*< Size of the dead zone; max 0xFFFF: whole axis-range when 0-centered.  
  --*< Position of the dead zone.  
  --*
  -- *  \brief A structure containing a template for a Ramp effect.
  -- *
  -- *  This struct is exclusively for the ::SDL_HAPTIC_RAMP effect.
  -- *
  -- *  The ramp effect starts at start strength and ends at end strength.
  -- *  It augments in linear fashion.  If you use attack and fade with a ramp
  -- *  the effects get added to the ramp effect making the effect become
  -- *  quadratic instead of linear.
  -- *
  -- *  \sa SDL_HAPTIC_RAMP
  -- *  \sa SDL_HapticEffect
  --  

  -- Header  
  --*< ::SDL_HAPTIC_RAMP  
   type SDL_HapticRamp is record
      c_type : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:631
      direction : aliased SDL_HapticDirection;  -- ../inc208/SDL_haptic.h:632
      length : aliased SDL_stdinc_h.Uint32;  -- ../inc208/SDL_haptic.h:635
      c_delay : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:636
      button : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:639
      interval : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:640
      start : aliased SDL_stdinc_h.Sint16;  -- ../inc208/SDL_haptic.h:643
      c_end : aliased SDL_stdinc_h.Sint16;  -- ../inc208/SDL_haptic.h:644
      attack_length : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:647
      attack_level : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:648
      fade_length : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:649
      fade_level : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:650
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_HapticRamp);  -- ../inc208/SDL_haptic.h:628

  --*< Direction of the effect.  
  -- Replay  
  --*< Duration of the effect.  
  --*< Delay before starting the effect.  
  -- Trigger  
  --*< Button that triggers the effect.  
  --*< How soon it can be triggered again after button.  
  -- Ramp  
  --*< Beginning strength level.  
  --*< Ending strength level.  
  -- Envelope  
  --*< Duration of the attack.  
  --*< Level at the start of the attack.  
  --*< Duration of the fade.  
  --*< Level at the end of the fade.  
  --*
  -- * \brief A structure containing a template for a Left/Right effect.
  -- *
  -- * This struct is exclusively for the ::SDL_HAPTIC_LEFTRIGHT effect.
  -- *
  -- * The Left/Right effect is used to explicitly control the large and small
  -- * motors, commonly found in modern game controllers. One motor is high
  -- * frequency, the other is low frequency.
  -- *
  -- * \sa SDL_HAPTIC_LEFTRIGHT
  -- * \sa SDL_HapticEffect
  --  

  -- Header  
  --*< ::SDL_HAPTIC_LEFTRIGHT  
   type SDL_HapticLeftRight is record
      c_type : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:668
      length : aliased SDL_stdinc_h.Uint32;  -- ../inc208/SDL_haptic.h:671
      large_magnitude : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:674
      small_magnitude : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:675
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_HapticLeftRight);  -- ../inc208/SDL_haptic.h:665

  -- Replay  
  --*< Duration of the effect.  
  -- Rumble  
  --*< Control of the large controller motor.  
  --*< Control of the small controller motor.  
  --*
  -- *  \brief A structure containing a template for the ::SDL_HAPTIC_CUSTOM effect.
  -- *
  -- *  This struct is exclusively for the ::SDL_HAPTIC_CUSTOM effect.
  -- *
  -- *  A custom force feedback effect is much like a periodic effect, where the
  -- *  application can define its exact shape.  You will have to allocate the
  -- *  data yourself.  Data should consist of channels * samples Uint16 samples.
  -- *
  -- *  If channels is one, the effect is rotated using the defined direction.
  -- *  Otherwise it uses the samples in data for the different axes.
  -- *
  -- *  \sa SDL_HAPTIC_CUSTOM
  -- *  \sa SDL_HapticEffect
  --  

  -- Header  
  --*< ::SDL_HAPTIC_CUSTOM  
   type SDL_HapticCustom is record
      c_type : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:696
      direction : aliased SDL_HapticDirection;  -- ../inc208/SDL_haptic.h:697
      length : aliased SDL_stdinc_h.Uint32;  -- ../inc208/SDL_haptic.h:700
      c_delay : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:701
      button : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:704
      interval : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:705
      channels : aliased SDL_stdinc_h.Uint8;  -- ../inc208/SDL_haptic.h:708
      period : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:709
      samples : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:710
      data : access SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:711
      attack_length : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:714
      attack_level : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:715
      fade_length : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:716
      fade_level : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:717
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_HapticCustom);  -- ../inc208/SDL_haptic.h:693

  --*< Direction of the effect.  
  -- Replay  
  --*< Duration of the effect.  
  --*< Delay before starting the effect.  
  -- Trigger  
  --*< Button that triggers the effect.  
  --*< How soon it can be triggered again after button.  
  -- Custom  
  --*< Axes to use, minimum of one.  
  --*< Sample periods.  
  --*< Amount of samples.  
  --*< Should contain channels*samples items.  
  -- Envelope  
  --*< Duration of the attack.  
  --*< Level at the start of the attack.  
  --*< Duration of the fade.  
  --*< Level at the end of the fade.  
  --*
  -- *  \brief The generic template for any haptic effect.
  -- *
  -- *  All values max at 32767 (0x7FFF).  Signed values also can be negative.
  -- *  Time values unless specified otherwise are in milliseconds.
  -- *
  -- *  You can also pass ::SDL_HAPTIC_INFINITY to length instead of a 0-32767
  -- *  value.  Neither delay, interval, attack_length nor fade_length support
  -- *  ::SDL_HAPTIC_INFINITY.  Fade will also not be used since effect never ends.
  -- *
  -- *  Additionally, the ::SDL_HAPTIC_RAMP effect does not support a duration of
  -- *  ::SDL_HAPTIC_INFINITY.
  -- *
  -- *  Button triggers may not be supported on all devices, it is advised to not
  -- *  use them if possible.  Buttons start at index 1 instead of index 0 like
  -- *  the joystick.
  -- *
  -- *  If both attack_length and fade_level are 0, the envelope is not used,
  -- *  otherwise both values are used.
  -- *
  -- *  Common parts:
  -- *  \code
  -- *  // Replay - All effects have this
  -- *  Uint32 length;        // Duration of effect (ms).
  -- *  Uint16 delay;         // Delay before starting effect.
  -- *
  -- *  // Trigger - All effects have this
  -- *  Uint16 button;        // Button that triggers effect.
  -- *  Uint16 interval;      // How soon before effect can be triggered again.
  -- *
  -- *  // Envelope - All effects except condition effects have this
  -- *  Uint16 attack_length; // Duration of the attack (ms).
  -- *  Uint16 attack_level;  // Level at the start of the attack.
  -- *  Uint16 fade_length;   // Duration of the fade out (ms).
  -- *  Uint16 fade_level;    // Level at the end of the fade.
  -- *  \endcode
  -- *
  -- *
  -- *  Here we have an example of a constant effect evolution in time:
  -- *  \verbatim
  --    Strength
  --    ^
  --    |
  --    |    effect level -->  _________________
  --    |                     /                     |                    /                       |                   /                         |                  /                           | attack_level --> |                            |                  |                        |  <---  fade_level
  --ade_level
  --    |
  --    +--------------------------------------------------> Time
  --                       [--]                 [---]
  --                       attack_length        fade_length
  --    [------------------][-----------------------]
  --    delay               length
  --    \endverbatim
  -- *
  -- *  Note either the attack_level or the fade_level may be above the actual
  -- *  effect level.
  -- *
  -- *  \sa SDL_HapticConstant
  -- *  \sa SDL_HapticPeriodic
  -- *  \sa SDL_HapticCondition
  -- *  \sa SDL_HapticRamp
  -- *  \sa SDL_HapticLeftRight
  -- *  \sa SDL_HapticCustom
  --  

  -- Common for all force feedback effects  
  --*< Effect type.  
   type SDL_HapticEffect (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            c_type : aliased SDL_stdinc_h.Uint16;  -- ../inc208/SDL_haptic.h:792
         when 1 =>
            c_constant : aliased SDL_HapticConstant;  -- ../inc208/SDL_haptic.h:793
         when 2 =>
            periodic : aliased SDL_HapticPeriodic;  -- ../inc208/SDL_haptic.h:794
         when 3 =>
            condition : aliased SDL_HapticCondition;  -- ../inc208/SDL_haptic.h:795
         when 4 =>
            ramp : aliased SDL_HapticRamp;  -- ../inc208/SDL_haptic.h:796
         when 5 =>
            leftright : aliased SDL_HapticLeftRight;  -- ../inc208/SDL_haptic.h:797
         when others =>
            custom : aliased SDL_HapticCustom;  -- ../inc208/SDL_haptic.h:798
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, SDL_HapticEffect);
   pragma Unchecked_Union (SDL_HapticEffect);  -- ../inc208/SDL_haptic.h:789

  --*< Constant effect.  
  --*< Periodic effect.  
  --*< Condition effect.  
  --*< Ramp effect.  
  --*< Left/Right effect.  
  --*< Custom effect.  
  -- Function prototypes  
  --*
  -- *  \brief Count the number of haptic devices attached to the system.
  -- *
  -- *  \return Number of haptic devices detected on the system.
  --  

   function SDL_NumHaptics return int;  -- ../inc208/SDL_haptic.h:808
   pragma Import (C, SDL_NumHaptics, "SDL_NumHaptics");

  --*
  -- *  \brief Get the implementation dependent name of a haptic device.
  -- *
  -- *  This can be called before any joysticks are opened.
  -- *  If no name can be found, this function returns NULL.
  -- *
  -- *  \param device_index Index of the device to get its name.
  -- *  \return Name of the device or NULL on error.
  -- *
  -- *  \sa SDL_NumHaptics
  --  

   function SDL_HapticName (device_index : int) return Interfaces.C.Strings.chars_ptr;  -- ../inc208/SDL_haptic.h:821
   pragma Import (C, SDL_HapticName, "SDL_HapticName");

  --*
  -- *  \brief Opens a haptic device for use.
  -- *
  -- *  The index passed as an argument refers to the N'th haptic device on this
  -- *  system.
  -- *
  -- *  When opening a haptic device, its gain will be set to maximum and
  -- *  autocenter will be disabled.  To modify these values use
  -- *  SDL_HapticSetGain() and SDL_HapticSetAutocenter().
  -- *
  -- *  \param device_index Index of the device to open.
  -- *  \return Device identifier or NULL on error.
  -- *
  -- *  \sa SDL_HapticIndex
  -- *  \sa SDL_HapticOpenFromMouse
  -- *  \sa SDL_HapticOpenFromJoystick
  -- *  \sa SDL_HapticClose
  -- *  \sa SDL_HapticSetGain
  -- *  \sa SDL_HapticSetAutocenter
  -- *  \sa SDL_HapticPause
  -- *  \sa SDL_HapticStopAll
  --  

   function SDL_HapticOpen (device_index : int) return System.Address;  -- ../inc208/SDL_haptic.h:845
   pragma Import (C, SDL_HapticOpen, "SDL_HapticOpen");

  --*
  -- *  \brief Checks if the haptic device at index has been opened.
  -- *
  -- *  \param device_index Index to check to see if it has been opened.
  -- *  \return 1 if it has been opened or 0 if it hasn't.
  -- *
  -- *  \sa SDL_HapticOpen
  -- *  \sa SDL_HapticIndex
  --  

   function SDL_HapticOpened (device_index : int) return int;  -- ../inc208/SDL_haptic.h:856
   pragma Import (C, SDL_HapticOpened, "SDL_HapticOpened");

  --*
  -- *  \brief Gets the index of a haptic device.
  -- *
  -- *  \param haptic Haptic device to get the index of.
  -- *  \return The index of the haptic device or -1 on error.
  -- *
  -- *  \sa SDL_HapticOpen
  -- *  \sa SDL_HapticOpened
  --  

   function SDL_HapticIndex (haptic : System.Address) return int;  -- ../inc208/SDL_haptic.h:867
   pragma Import (C, SDL_HapticIndex, "SDL_HapticIndex");

  --*
  -- *  \brief Gets whether or not the current mouse has haptic capabilities.
  -- *
  -- *  \return SDL_TRUE if the mouse is haptic, SDL_FALSE if it isn't.
  -- *
  -- *  \sa SDL_HapticOpenFromMouse
  --  

   function SDL_MouseIsHaptic return int;  -- ../inc208/SDL_haptic.h:876
   pragma Import (C, SDL_MouseIsHaptic, "SDL_MouseIsHaptic");

  --*
  -- *  \brief Tries to open a haptic device from the current mouse.
  -- *
  -- *  \return The haptic device identifier or NULL on error.
  -- *
  -- *  \sa SDL_MouseIsHaptic
  -- *  \sa SDL_HapticOpen
  --  

   function SDL_HapticOpenFromMouse return System.Address;  -- ../inc208/SDL_haptic.h:886
   pragma Import (C, SDL_HapticOpenFromMouse, "SDL_HapticOpenFromMouse");

  --*
  -- *  \brief Checks to see if a joystick has haptic features.
  -- *
  -- *  \param joystick Joystick to test for haptic capabilities.
  -- *  \return SDL_TRUE if the joystick is haptic, SDL_FALSE if it isn't
  -- *          or -1 if an error occurred.
  -- *
  -- *  \sa SDL_HapticOpenFromJoystick
  --  

   function SDL_JoystickIsHaptic (joystick : System.Address) return int;  -- ../inc208/SDL_haptic.h:897
   pragma Import (C, SDL_JoystickIsHaptic, "SDL_JoystickIsHaptic");

  --*
  -- *  \brief Opens a haptic device for use from a joystick device.
  -- *
  -- *  You must still close the haptic device separately.  It will not be closed
  -- *  with the joystick.
  -- *
  -- *  When opening from a joystick you should first close the haptic device before
  -- *  closing the joystick device.  If not, on some implementations the haptic
  -- *  device will also get unallocated and you'll be unable to use force feedback
  -- *  on that device.
  -- *
  -- *  \param joystick Joystick to create a haptic device from.
  -- *  \return A valid haptic device identifier on success or NULL on error.
  -- *
  -- *  \sa SDL_HapticOpen
  -- *  \sa SDL_HapticClose
  --  

   function SDL_HapticOpenFromJoystick (joystick : System.Address) return System.Address;  -- ../inc208/SDL_haptic.h:916
   pragma Import (C, SDL_HapticOpenFromJoystick, "SDL_HapticOpenFromJoystick");

  --*
  -- *  \brief Closes a haptic device previously opened with SDL_HapticOpen().
  -- *
  -- *  \param haptic Haptic device to close.
  --  

   procedure SDL_HapticClose (haptic : System.Address);  -- ../inc208/SDL_haptic.h:924
   pragma Import (C, SDL_HapticClose, "SDL_HapticClose");

  --*
  -- *  \brief Returns the number of effects a haptic device can store.
  -- *
  -- *  On some platforms this isn't fully supported, and therefore is an
  -- *  approximation.  Always check to see if your created effect was actually
  -- *  created and do not rely solely on SDL_HapticNumEffects().
  -- *
  -- *  \param haptic The haptic device to query effect max.
  -- *  \return The number of effects the haptic device can store or
  -- *          -1 on error.
  -- *
  -- *  \sa SDL_HapticNumEffectsPlaying
  -- *  \sa SDL_HapticQuery
  --  

   function SDL_HapticNumEffects (haptic : System.Address) return int;  -- ../inc208/SDL_haptic.h:940
   pragma Import (C, SDL_HapticNumEffects, "SDL_HapticNumEffects");

  --*
  -- *  \brief Returns the number of effects a haptic device can play at the same
  -- *         time.
  -- *
  -- *  This is not supported on all platforms, but will always return a value.
  -- *  Added here for the sake of completeness.
  -- *
  -- *  \param haptic The haptic device to query maximum playing effects.
  -- *  \return The number of effects the haptic device can play at the same time
  -- *          or -1 on error.
  -- *
  -- *  \sa SDL_HapticNumEffects
  -- *  \sa SDL_HapticQuery
  --  

   function SDL_HapticNumEffectsPlaying (haptic : System.Address) return int;  -- ../inc208/SDL_haptic.h:956
   pragma Import (C, SDL_HapticNumEffectsPlaying, "SDL_HapticNumEffectsPlaying");

  --*
  -- *  \brief Gets the haptic device's supported features in bitwise manner.
  -- *
  -- *  Example:
  -- *  \code
  -- *  if (SDL_HapticQuery(haptic) & SDL_HAPTIC_CONSTANT) {
  -- *      printf("We have constant haptic effect!\n");
  -- *  }
  -- *  \endcode
  -- *
  -- *  \param haptic The haptic device to query.
  -- *  \return Haptic features in bitwise manner (OR'd).
  -- *
  -- *  \sa SDL_HapticNumEffects
  -- *  \sa SDL_HapticEffectSupported
  --  

   function SDL_HapticQuery (haptic : System.Address) return unsigned;  -- ../inc208/SDL_haptic.h:974
   pragma Import (C, SDL_HapticQuery, "SDL_HapticQuery");

  --*
  -- *  \brief Gets the number of haptic axes the device has.
  -- *
  -- *  \sa SDL_HapticDirection
  --  

   function SDL_HapticNumAxes (haptic : System.Address) return int;  -- ../inc208/SDL_haptic.h:982
   pragma Import (C, SDL_HapticNumAxes, "SDL_HapticNumAxes");

  --*
  -- *  \brief Checks to see if effect is supported by haptic.
  -- *
  -- *  \param haptic Haptic device to check on.
  -- *  \param effect Effect to check to see if it is supported.
  -- *  \return SDL_TRUE if effect is supported, SDL_FALSE if it isn't or -1 on error.
  -- *
  -- *  \sa SDL_HapticQuery
  -- *  \sa SDL_HapticNewEffect
  --  

   function SDL_HapticEffectSupported (haptic : System.Address; effect : access SDL_HapticEffect) return int;  -- ../inc208/SDL_haptic.h:994
   pragma Import (C, SDL_HapticEffectSupported, "SDL_HapticEffectSupported");

  --*
  -- *  \brief Creates a new haptic effect on the device.
  -- *
  -- *  \param haptic Haptic device to create the effect on.
  -- *  \param effect Properties of the effect to create.
  -- *  \return The identifier of the effect on success or -1 on error.
  -- *
  -- *  \sa SDL_HapticUpdateEffect
  -- *  \sa SDL_HapticRunEffect
  -- *  \sa SDL_HapticDestroyEffect
  --  

   function SDL_HapticNewEffect (haptic : System.Address; effect : access SDL_HapticEffect) return int;  -- ../inc208/SDL_haptic.h:1009
   pragma Import (C, SDL_HapticNewEffect, "SDL_HapticNewEffect");

  --*
  -- *  \brief Updates the properties of an effect.
  -- *
  -- *  Can be used dynamically, although behavior when dynamically changing
  -- *  direction may be strange.  Specifically the effect may reupload itself
  -- *  and start playing from the start.  You cannot change the type either when
  -- *  running SDL_HapticUpdateEffect().
  -- *
  -- *  \param haptic Haptic device that has the effect.
  -- *  \param effect Identifier of the effect to update.
  -- *  \param data New effect properties to use.
  -- *  \return 0 on success or -1 on error.
  -- *
  -- *  \sa SDL_HapticNewEffect
  -- *  \sa SDL_HapticRunEffect
  -- *  \sa SDL_HapticDestroyEffect
  --  

   function SDL_HapticUpdateEffect
     (haptic : System.Address;
      effect : int;
      data : access SDL_HapticEffect) return int;  -- ../inc208/SDL_haptic.h:1029
   pragma Import (C, SDL_HapticUpdateEffect, "SDL_HapticUpdateEffect");

  --*
  -- *  \brief Runs the haptic effect on its associated haptic device.
  -- *
  -- *  If iterations are ::SDL_HAPTIC_INFINITY, it'll run the effect over and over
  -- *  repeating the envelope (attack and fade) every time.  If you only want the
  -- *  effect to last forever, set ::SDL_HAPTIC_INFINITY in the effect's length
  -- *  parameter.
  -- *
  -- *  \param haptic Haptic device to run the effect on.
  -- *  \param effect Identifier of the haptic effect to run.
  -- *  \param iterations Number of iterations to run the effect. Use
  -- *         ::SDL_HAPTIC_INFINITY for infinity.
  -- *  \return 0 on success or -1 on error.
  -- *
  -- *  \sa SDL_HapticStopEffect
  -- *  \sa SDL_HapticDestroyEffect
  -- *  \sa SDL_HapticGetEffectStatus
  --  

   function SDL_HapticRunEffect
     (haptic : System.Address;
      effect : int;
      iterations : SDL_stdinc_h.Uint32) return int;  -- ../inc208/SDL_haptic.h:1051
   pragma Import (C, SDL_HapticRunEffect, "SDL_HapticRunEffect");

  --*
  -- *  \brief Stops the haptic effect on its associated haptic device.
  -- *
  -- *  \param haptic Haptic device to stop the effect on.
  -- *  \param effect Identifier of the effect to stop.
  -- *  \return 0 on success or -1 on error.
  -- *
  -- *  \sa SDL_HapticRunEffect
  -- *  \sa SDL_HapticDestroyEffect
  --  

   function SDL_HapticStopEffect (haptic : System.Address; effect : int) return int;  -- ../inc208/SDL_haptic.h:1065
   pragma Import (C, SDL_HapticStopEffect, "SDL_HapticStopEffect");

  --*
  -- *  \brief Destroys a haptic effect on the device.
  -- *
  -- *  This will stop the effect if it's running.  Effects are automatically
  -- *  destroyed when the device is closed.
  -- *
  -- *  \param haptic Device to destroy the effect on.
  -- *  \param effect Identifier of the effect to destroy.
  -- *
  -- *  \sa SDL_HapticNewEffect
  --  

   procedure SDL_HapticDestroyEffect (haptic : System.Address; effect : int);  -- ../inc208/SDL_haptic.h:1079
   pragma Import (C, SDL_HapticDestroyEffect, "SDL_HapticDestroyEffect");

  --*
  -- *  \brief Gets the status of the current effect on the haptic device.
  -- *
  -- *  Device must support the ::SDL_HAPTIC_STATUS feature.
  -- *
  -- *  \param haptic Haptic device to query the effect status on.
  -- *  \param effect Identifier of the effect to query its status.
  -- *  \return 0 if it isn't playing, 1 if it is playing or -1 on error.
  -- *
  -- *  \sa SDL_HapticRunEffect
  -- *  \sa SDL_HapticStopEffect
  --  

   function SDL_HapticGetEffectStatus (haptic : System.Address; effect : int) return int;  -- ../inc208/SDL_haptic.h:1094
   pragma Import (C, SDL_HapticGetEffectStatus, "SDL_HapticGetEffectStatus");

  --*
  -- *  \brief Sets the global gain of the device.
  -- *
  -- *  Device must support the ::SDL_HAPTIC_GAIN feature.
  -- *
  -- *  The user may specify the maximum gain by setting the environment variable
  -- *  SDL_HAPTIC_GAIN_MAX which should be between 0 and 100.  All calls to
  -- *  SDL_HapticSetGain() will scale linearly using SDL_HAPTIC_GAIN_MAX as the
  -- *  maximum.
  -- *
  -- *  \param haptic Haptic device to set the gain on.
  -- *  \param gain Value to set the gain to, should be between 0 and 100.
  -- *  \return 0 on success or -1 on error.
  -- *
  -- *  \sa SDL_HapticQuery
  --  

   function SDL_HapticSetGain (haptic : System.Address; gain : int) return int;  -- ../inc208/SDL_haptic.h:1113
   pragma Import (C, SDL_HapticSetGain, "SDL_HapticSetGain");

  --*
  -- *  \brief Sets the global autocenter of the device.
  -- *
  -- *  Autocenter should be between 0 and 100.  Setting it to 0 will disable
  -- *  autocentering.
  -- *
  -- *  Device must support the ::SDL_HAPTIC_AUTOCENTER feature.
  -- *
  -- *  \param haptic Haptic device to set autocentering on.
  -- *  \param autocenter Value to set autocenter to, 0 disables autocentering.
  -- *  \return 0 on success or -1 on error.
  -- *
  -- *  \sa SDL_HapticQuery
  --  

   function SDL_HapticSetAutocenter (haptic : System.Address; autocenter : int) return int;  -- ../inc208/SDL_haptic.h:1129
   pragma Import (C, SDL_HapticSetAutocenter, "SDL_HapticSetAutocenter");

  --*
  -- *  \brief Pauses a haptic device.
  -- *
  -- *  Device must support the ::SDL_HAPTIC_PAUSE feature.  Call
  -- *  SDL_HapticUnpause() to resume playback.
  -- *
  -- *  Do not modify the effects nor add new ones while the device is paused.
  -- *  That can cause all sorts of weird errors.
  -- *
  -- *  \param haptic Haptic device to pause.
  -- *  \return 0 on success or -1 on error.
  -- *
  -- *  \sa SDL_HapticUnpause
  --  

   function SDL_HapticPause (haptic : System.Address) return int;  -- ../inc208/SDL_haptic.h:1146
   pragma Import (C, SDL_HapticPause, "SDL_HapticPause");

  --*
  -- *  \brief Unpauses a haptic device.
  -- *
  -- *  Call to unpause after SDL_HapticPause().
  -- *
  -- *  \param haptic Haptic device to unpause.
  -- *  \return 0 on success or -1 on error.
  -- *
  -- *  \sa SDL_HapticPause
  --  

   function SDL_HapticUnpause (haptic : System.Address) return int;  -- ../inc208/SDL_haptic.h:1158
   pragma Import (C, SDL_HapticUnpause, "SDL_HapticUnpause");

  --*
  -- *  \brief Stops all the currently playing effects on a haptic device.
  -- *
  -- *  \param haptic Haptic device to stop.
  -- *  \return 0 on success or -1 on error.
  --  

   function SDL_HapticStopAll (haptic : System.Address) return int;  -- ../inc208/SDL_haptic.h:1166
   pragma Import (C, SDL_HapticStopAll, "SDL_HapticStopAll");

  --*
  -- *  \brief Checks to see if rumble is supported on a haptic device.
  -- *
  -- *  \param haptic Haptic device to check to see if it supports rumble.
  -- *  \return SDL_TRUE if effect is supported, SDL_FALSE if it isn't or -1 on error.
  -- *
  -- *  \sa SDL_HapticRumbleInit
  -- *  \sa SDL_HapticRumblePlay
  -- *  \sa SDL_HapticRumbleStop
  --  

   function SDL_HapticRumbleSupported (haptic : System.Address) return int;  -- ../inc208/SDL_haptic.h:1178
   pragma Import (C, SDL_HapticRumbleSupported, "SDL_HapticRumbleSupported");

  --*
  -- *  \brief Initializes the haptic device for simple rumble playback.
  -- *
  -- *  \param haptic Haptic device to initialize for simple rumble playback.
  -- *  \return 0 on success or -1 on error.
  -- *
  -- *  \sa SDL_HapticOpen
  -- *  \sa SDL_HapticRumbleSupported
  -- *  \sa SDL_HapticRumblePlay
  -- *  \sa SDL_HapticRumbleStop
  --  

   function SDL_HapticRumbleInit (haptic : System.Address) return int;  -- ../inc208/SDL_haptic.h:1191
   pragma Import (C, SDL_HapticRumbleInit, "SDL_HapticRumbleInit");

  --*
  -- *  \brief Runs simple rumble on a haptic device
  -- *
  -- *  \param haptic Haptic device to play rumble effect on.
  -- *  \param strength Strength of the rumble to play as a 0-1 float value.
  -- *  \param length Length of the rumble to play in milliseconds.
  -- *  \return 0 on success or -1 on error.
  -- *
  -- *  \sa SDL_HapticRumbleSupported
  -- *  \sa SDL_HapticRumbleInit
  -- *  \sa SDL_HapticRumbleStop
  --  

   function SDL_HapticRumblePlay
     (haptic : System.Address;
      strength : float;
      length : SDL_stdinc_h.Uint32) return int;  -- ../inc208/SDL_haptic.h:1205
   pragma Import (C, SDL_HapticRumblePlay, "SDL_HapticRumblePlay");

  --*
  -- *  \brief Stops the simple rumble on a haptic device.
  -- *
  -- *  \param haptic Haptic to stop the rumble on.
  -- *  \return 0 on success or -1 on error.
  -- *
  -- *  \sa SDL_HapticRumbleSupported
  -- *  \sa SDL_HapticRumbleInit
  -- *  \sa SDL_HapticRumblePlay
  --  

   function SDL_HapticRumbleStop (haptic : System.Address) return int;  -- ../inc208/SDL_haptic.h:1217
   pragma Import (C, SDL_HapticRumbleStop, "SDL_HapticRumbleStop");

  -- Ends C function definitions when using C++  
  -- vi: set ts=4 sw=4 expandtab:  
end SDL_haptic_h;
