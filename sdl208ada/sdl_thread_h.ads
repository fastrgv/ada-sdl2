pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Strings;

package SDL_thread_h is

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
  -- *  \file SDL_thread.h
  -- *
  -- *  Header for the SDL thread management routines.
  --  

  -- Thread synchronization primitives  
  -- Set up for C function definitions, even when using C++  
  -- The SDL thread structure, defined in SDL_thread.c  
   --  skipped empty struct SDL_Thread

  -- The SDL thread ID  
   subtype tSDL_threadID is unsigned_long;  -- SDL_thread.h:49

  -- Thread local storage ID, 0 is the invalid ID  
   subtype SDL_TLSID is unsigned;  -- SDL_thread.h:52

  --*
  -- *  The SDL thread priority.
  -- *
  -- *  \note On many systems you require special privileges to set high priority.
  --  

   type SDL_ThreadPriority is 
     (SDL_THREAD_PRIORITY_LOW,
      SDL_THREAD_PRIORITY_NORMAL,
      SDL_THREAD_PRIORITY_HIGH);
   pragma Convention (C, SDL_ThreadPriority);  -- SDL_thread.h:63

  --*
  -- *  The function passed to SDL_CreateThread().
  -- *  It is passed a void* user context parameter and returns an int.
  --  

   type SDL_ThreadFunction is access function (arg1 : System.Address) return int;
   pragma Convention (C, SDL_ThreadFunction);  -- SDL_thread.h:69

  --*
  -- *  \file SDL_thread.h
  -- *
  -- *  We compile SDL into a DLL. This means, that it's the DLL which
  -- *  creates a new thread for the calling process with the SDL_CreateThread()
  -- *  API. There is a problem with this, that only the RTL of the SDL2.DLL will
  -- *  be initialized for those threads, and not the RTL of the calling
  -- *  application!
  -- *
  -- *  To solve this, we make a little hack here.
  -- *
  -- *  We'll always use the caller's _beginthread() and _endthread() APIs to
  -- *  start a new thread. This way, if it's the SDL2.DLL which uses this API,
  -- *  then the RTL of SDL2.DLL will be used to create the new thread, and if it's
  -- *  the application, then the RTL of the application will be used.
  -- *
  -- *  So, in short:
  -- *  Always use the _beginthread() and _endthread() of the calling runtime
  -- *  library!
  --  

  --arg 
  -- threadID  
  --*
  -- *  Create a thread.
  --  

  --*
  -- *  Create a thread.
  --  

  -- * just like the windows case above:  We compile SDL2
  -- * into a dll with Watcom's runtime statically linked.
  --  

  --arg 
  --*
  -- *  Create a thread.
  -- *
  -- *   Thread naming is a little complicated: Most systems have very small
  -- *    limits for the string length (Haiku has 32 bytes, Linux currently has 16,
  -- *    Visual C++ 6.0 has nine!), and possibly other arbitrary rules. You'll
  -- *    have to see what happens with your system's debugger. The name should be
  -- *    UTF-8 (but using the naming limits of C identifiers is a better bet).
  -- *   There are no requirements for thread naming conventions, so long as the
  -- *    string is null-terminated UTF-8, but these guidelines are helpful in
  -- *    choosing a name:
  -- *
  -- *    http://stackoverflow.com/questions/149932/naming-conventions-for-threads
  -- *
  -- *   If a system imposes requirements, SDL will try to munge the string for
  -- *    it (truncate, etc), but the original string contents will be available
  -- *    from SDL_GetThreadName().
  --  

   function SDL_CreateThread
     (fn : SDL_ThreadFunction;
      name : Interfaces.C.Strings.chars_ptr;
      data : System.Address) return System.Address;  -- SDL_thread.h:163
   pragma Import (C, SDL_CreateThread, "SDL_CreateThread");

  --*
  -- * Get the thread name, as it was specified in SDL_CreateThread().
  -- *  This function returns a pointer to a UTF-8 string that names the
  -- *  specified thread, or NULL if it doesn't have a name. This is internal
  -- *  memory, not to be free()'d by the caller, and remains valid until the
  -- *  specified thread is cleaned up by SDL_WaitThread().
  --  

   function SDL_GetThreadName (thread : System.Address) return Interfaces.C.Strings.chars_ptr;  -- SDL_thread.h:174
   pragma Import (C, SDL_GetThreadName, "SDL_GetThreadName");

  --*
  -- *  Get the thread identifier for the current thread.
  --  

   function SDL_ThreadID return tSDL_threadID;  -- SDL_thread.h:179
   pragma Import (C, SDL_ThreadID, "SDL_ThreadID");

  --*
  -- *  Get the thread identifier for the specified thread.
  -- *
  -- *  Equivalent to SDL_ThreadID() if the specified thread is NULL.
  --  

   function SDL_GetThreadID (thread : System.Address) return tSDL_threadID;  -- SDL_thread.h:186
   pragma Import (C, SDL_GetThreadID, "SDL_GetThreadID");

  --*
  -- *  Set the priority for the current thread
  --  

   function SDL_SetThreadPriority (priority : SDL_ThreadPriority) return int;  -- SDL_thread.h:191
   pragma Import (C, SDL_SetThreadPriority, "SDL_SetThreadPriority");

  --*
  -- *  Wait for a thread to finish. Threads that haven't been detached will
  -- *  remain (as a "zombie") until this function cleans them up. Not doing so
  -- *  is a resource leak.
  -- *
  -- *  Once a thread has been cleaned up through this function, the SDL_Thread
  -- *  that references it becomes invalid and should not be referenced again.
  -- *  As such, only one thread may call SDL_WaitThread() on another.
  -- *
  -- *  The return code for the thread function is placed in the area
  -- *  pointed to by \c status, if \c status is not NULL.
  -- *
  -- *  You may not wait on a thread that has been used in a call to
  -- *  SDL_DetachThread(). Use either that function or this one, but not
  -- *  both, or behavior is undefined.
  -- *
  -- *  It is safe to pass NULL to this function; it is a no-op.
  --  

   procedure SDL_WaitThread (thread : System.Address; status : access int);  -- SDL_thread.h:211
   pragma Import (C, SDL_WaitThread, "SDL_WaitThread");

  --*
  -- *  A thread may be "detached" to signify that it should not remain until
  -- *  another thread has called SDL_WaitThread() on it. Detaching a thread
  -- *  is useful for long-running threads that nothing needs to synchronize
  -- *  with or further manage. When a detached thread is done, it simply
  -- *  goes away.
  -- *
  -- *  There is no way to recover the return code of a detached thread. If you
  -- *  need this, don't detach the thread and instead use SDL_WaitThread().
  -- *
  -- *  Once a thread is detached, you should usually assume the SDL_Thread isn't
  -- *  safe to reference again, as it will become invalid immediately upon
  -- *  the detached thread's exit, instead of remaining until someone has called
  -- *  SDL_WaitThread() to finally clean it up. As such, don't detach the same
  -- *  thread more than once.
  -- *
  -- *  If a thread has already exited when passed to SDL_DetachThread(), it will
  -- *  stop waiting for a call to SDL_WaitThread() and clean up immediately.
  -- *  It is not safe to detach a thread that might be used with SDL_WaitThread().
  -- *
  -- *  You may not call SDL_WaitThread() on a thread that has been detached.
  -- *  Use either that function or this one, but not both, or behavior is
  -- *  undefined.
  -- *
  -- *  It is safe to pass NULL to this function; it is a no-op.
  --  

   procedure SDL_DetachThread (thread : System.Address);  -- SDL_thread.h:239
   pragma Import (C, SDL_DetachThread, "SDL_DetachThread");

  --*
  -- *  \brief Create an identifier that is globally visible to all threads but refers to data that is thread-specific.
  -- *
  -- *  \return The newly created thread local storage identifier, or 0 on error
  -- *
  -- *  \code
  -- *  static SDL_SpinLock tls_lock;
  -- *  static SDL_TLSID thread_local_storage;
  -- * 
  -- *  void SetMyThreadData(void *value)
  -- *  {
  -- *      if (!thread_local_storage) {
  -- *          SDL_AtomicLock(&tls_lock);
  -- *          if (!thread_local_storage) {
  -- *              thread_local_storage = SDL_TLSCreate();
  -- *          }
  -- *          SDL_AtomicUnlock(&tls_lock);
  -- *      }
  -- *      SDL_TLSSet(thread_local_storage, value, 0);
  -- *  }
  -- *  
  -- *  void *GetMyThreadData(void)
  -- *  {
  -- *      return SDL_TLSGet(thread_local_storage);
  -- *  }
  -- *  \endcode
  -- *
  -- *  \sa SDL_TLSGet()
  -- *  \sa SDL_TLSSet()
  --  

   function SDL_TLSCreate return SDL_TLSID;  -- SDL_thread.h:271
   pragma Import (C, SDL_TLSCreate, "SDL_TLSCreate");

  --*
  -- *  \brief Get the value associated with a thread local storage ID for the current thread.
  -- *
  -- *  \param id The thread local storage ID
  -- *
  -- *  \return The value associated with the ID for the current thread, or NULL if no value has been set.
  -- *
  -- *  \sa SDL_TLSCreate()
  -- *  \sa SDL_TLSSet()
  --  

   function SDL_TLSGet (id : SDL_TLSID) return System.Address;  -- SDL_thread.h:283
   pragma Import (C, SDL_TLSGet, "SDL_TLSGet");

  --*
  -- *  \brief Set the value associated with a thread local storage ID for the current thread.
  -- *
  -- *  \param id The thread local storage ID
  -- *  \param value The value to associate with the ID for the current thread
  -- *  \param destructor A function called when the thread exits, to free the value.
  -- *
  -- *  \return 0 on success, -1 on error
  -- *
  -- *  \sa SDL_TLSCreate()
  -- *  \sa SDL_TLSGet()
  --  

   function SDL_TLSSet
     (id : SDL_TLSID;
      value : System.Address;
      destructor : access procedure (arg1 : System.Address)) return int;  -- SDL_thread.h:297
   pragma Import (C, SDL_TLSSet, "SDL_TLSSet");

  -- Ends C function definitions when using C++  
  -- vi: set ts=4 sw=4 expandtab:  
end SDL_thread_h;
