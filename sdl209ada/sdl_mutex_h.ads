pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with SDL_stdinc_h;

package SDL_mutex_h is

   SDL_MUTEX_TIMEDOUT : constant := 1;  --  ../inc209/SDL_mutex.h:44
   --  unsupported macro: SDL_MUTEX_MAXWAIT (~(Uint32)0)
   --  arg-macro: procedure SDL_mutexP (m)
   --    SDL_LockMutex(m)
   --  arg-macro: procedure SDL_mutexV (m)
   --    SDL_UnlockMutex(m)

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
  -- *  \file SDL_mutex.h
  -- *
  -- *  Functions to provide thread synchronization primitives.
  --  

  -- Set up for C function definitions, even when using C++  
  --*
  -- *  Synchronization functions which can time out return this value
  -- *  if they time out.
  --  

  --*
  -- *  This is the timeout value which corresponds to never time out.
  --  

  --*
  -- *  \name Mutex functions
  --  

  -- @{  
  -- The SDL mutex structure, defined in SDL_sysmutex.c  
   type SDL_mutex is null record;   -- incomplete struct

  --*
  -- *  Create a mutex, initialized unlocked.
  --  

   function SDL_CreateMutex return access SDL_mutex  -- ../inc209/SDL_mutex.h:64
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateMutex";

  --*
  -- *  Lock the mutex.
  -- *
  -- *  \return 0, or -1 on error.
  --  

   function SDL_LockMutex (mutex : access SDL_mutex) return int  -- ../inc209/SDL_mutex.h:72
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LockMutex";

  --*
  -- *  Try to lock the mutex
  -- *
  -- *  \return 0, SDL_MUTEX_TIMEDOUT, or -1 on error
  --  

   function SDL_TryLockMutex (mutex : access SDL_mutex) return int  -- ../inc209/SDL_mutex.h:79
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_TryLockMutex";

  --*
  -- *  Unlock the mutex.
  -- *
  -- *  \return 0, or -1 on error.
  -- *
  -- *  \warning It is an error to unlock a mutex that has not been locked by
  -- *           the current thread, and doing so results in undefined behavior.
  --  

   function SDL_UnlockMutex (mutex : access SDL_mutex) return int  -- ../inc209/SDL_mutex.h:90
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_UnlockMutex";

  --*
  -- *  Destroy a mutex.
  --  

   procedure SDL_DestroyMutex (mutex : access SDL_mutex)  -- ../inc209/SDL_mutex.h:95
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_DestroyMutex";

  -- @}  
  -- Mutex functions  
  --*
  -- *  \name Semaphore functions
  --  

  -- @{  
  -- The SDL semaphore structure, defined in SDL_syssem.c  
   type SDL_semaphore is null record;   -- incomplete struct

   subtype SDL_sem is SDL_semaphore;  -- ../inc209/SDL_mutex.h:107

  --*
  -- *  Create a semaphore, initialized with value, returns NULL on failure.
  --  

   function SDL_CreateSemaphore (initial_value : SDL_stdinc_h.Uint32) return access SDL_sem  -- ../inc209/SDL_mutex.h:112
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateSemaphore";

  --*
  -- *  Destroy a semaphore.
  --  

   procedure SDL_DestroySemaphore (sem : access SDL_sem)  -- ../inc209/SDL_mutex.h:117
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_DestroySemaphore";

  --*
  -- *  This function suspends the calling thread until the semaphore pointed
  -- *  to by \c sem has a positive count. It then atomically decreases the
  -- *  semaphore count.
  --  

   function SDL_SemWait (sem : access SDL_sem) return int  -- ../inc209/SDL_mutex.h:124
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SemWait";

  --*
  -- *  Non-blocking variant of SDL_SemWait().
  -- *
  -- *  \return 0 if the wait succeeds, ::SDL_MUTEX_TIMEDOUT if the wait would
  -- *          block, and -1 on error.
  --  

   function SDL_SemTryWait (sem : access SDL_sem) return int  -- ../inc209/SDL_mutex.h:132
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SemTryWait";

  --*
  -- *  Variant of SDL_SemWait() with a timeout in milliseconds.
  -- *
  -- *  \return 0 if the wait succeeds, ::SDL_MUTEX_TIMEDOUT if the wait does not
  -- *          succeed in the allotted time, and -1 on error.
  -- *
  -- *  \warning On some platforms this function is implemented by looping with a
  -- *           delay of 1 ms, and so should be avoided if possible.
  --  

   function SDL_SemWaitTimeout (sem : access SDL_sem; ms : SDL_stdinc_h.Uint32) return int  -- ../inc209/SDL_mutex.h:143
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SemWaitTimeout";

  --*
  -- *  Atomically increases the semaphore's count (not blocking).
  -- *
  -- *  \return 0, or -1 on error.
  --  

   function SDL_SemPost (sem : access SDL_sem) return int  -- ../inc209/SDL_mutex.h:150
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SemPost";

  --*
  -- *  Returns the current count of the semaphore.
  --  

   function SDL_SemValue (sem : access SDL_sem) return SDL_stdinc_h.Uint32  -- ../inc209/SDL_mutex.h:155
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SemValue";

  -- @}  
  -- Semaphore functions  
  --*
  -- *  \name Condition variable functions
  --  

  -- @{  
  -- The SDL condition variable structure, defined in SDL_syscond.c  
   type SDL_cond is null record;   -- incomplete struct

  --*
  -- *  Create a condition variable.
  -- *
  -- *  Typical use of condition variables:
  -- *
  -- *  Thread A:
  -- *    SDL_LockMutex(lock);
  -- *    while ( ! condition ) {
  -- *        SDL_CondWait(cond, lock);
  -- *    }
  -- *    SDL_UnlockMutex(lock);
  -- *
  -- *  Thread B:
  -- *    SDL_LockMutex(lock);
  -- *    ...
  -- *    condition = true;
  -- *    ...
  -- *    SDL_CondSignal(cond);
  -- *    SDL_UnlockMutex(lock);
  -- *
  -- *  There is some discussion whether to signal the condition variable
  -- *  with the mutex locked or not.  There is some potential performance
  -- *  benefit to unlocking first on some platforms, but there are some
  -- *  potential race conditions depending on how your code is structured.
  -- *
  -- *  In general it's safer to signal the condition variable while the
  -- *  mutex is locked.
  --  

   function SDL_CreateCond return access SDL_cond  -- ../inc209/SDL_mutex.h:197
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateCond";

  --*
  -- *  Destroy a condition variable.
  --  

   procedure SDL_DestroyCond (cond : access SDL_cond)  -- ../inc209/SDL_mutex.h:202
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_DestroyCond";

  --*
  -- *  Restart one of the threads that are waiting on the condition variable.
  -- *
  -- *  \return 0 or -1 on error.
  --  

   function SDL_CondSignal (cond : access SDL_cond) return int  -- ../inc209/SDL_mutex.h:209
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CondSignal";

  --*
  -- *  Restart all threads that are waiting on the condition variable.
  -- *
  -- *  \return 0 or -1 on error.
  --  

   function SDL_CondBroadcast (cond : access SDL_cond) return int  -- ../inc209/SDL_mutex.h:216
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CondBroadcast";

  --*
  -- *  Wait on the condition variable, unlocking the provided mutex.
  -- *
  -- *  \warning The mutex must be locked before entering this function!
  -- *
  -- *  The mutex is re-locked once the condition variable is signaled.
  -- *
  -- *  \return 0 when it is signaled, or -1 on error.
  --  

   function SDL_CondWait (cond : access SDL_cond; mutex : access SDL_mutex) return int  -- ../inc209/SDL_mutex.h:227
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CondWait";

  --*
  -- *  Waits for at most \c ms milliseconds, and returns 0 if the condition
  -- *  variable is signaled, ::SDL_MUTEX_TIMEDOUT if the condition is not
  -- *  signaled in the allotted time, and -1 on error.
  -- *
  -- *  \warning On some platforms this function is implemented by looping with a
  -- *           delay of 1 ms, and so should be avoided if possible.
  --  

   function SDL_CondWaitTimeout
     (cond : access SDL_cond;
      mutex : access SDL_mutex;
      ms : SDL_stdinc_h.Uint32) return int  -- ../inc209/SDL_mutex.h:237
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CondWaitTimeout";

  -- @}  
  -- Condition variable functions  
  -- Ends C function definitions when using C++  
  -- vi: set ts=4 sw=4 expandtab:  
end SDL_mutex_h;
