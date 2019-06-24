pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;

package SDL_log_h is

   SDL_MAX_LOG_MESSAGE : constant := 4096;  --  ../inc209/SDL_log.h:54

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
  -- *  \file SDL_log.h
  -- *
  -- *  Simple log messages with categories and priorities.
  -- *
  -- *  By default logs are quiet, but if you're debugging SDL you might want:
  -- *
  -- *      SDL_LogSetAllPriority(SDL_LOG_PRIORITY_WARN);
  -- *
  -- *  Here's where the messages go on different platforms:
  -- *      Windows: debug output stream
  -- *      Android: log output
  -- *      Others: standard error output (stderr)
  --  

  -- Set up for C function definitions, even when using C++  
  --*
  -- *  \brief The maximum size of a log message
  -- *
  -- *  Messages longer than the maximum size will be truncated
  --  

  --*
  -- *  \brief The predefined log categories
  -- *
  -- *  By default the application category is enabled at the INFO level,
  -- *  the assert category is enabled at the WARN level, test is enabled
  -- *  at the VERBOSE level and all other categories are enabled at the
  -- *  CRITICAL level.
  --  

  -- Reserved for future SDL library use  
  -- Beyond this point is reserved for application use, e.g.
  --       enum {
  --           MYAPP_CATEGORY_AWESOME1 = SDL_LOG_CATEGORY_CUSTOM,
  --           MYAPP_CATEGORY_AWESOME2,
  --           MYAPP_CATEGORY_AWESOME3,
  --           ...
  --       };
  --      

  --*
  -- *  \brief The predefined log priorities
  --  

   subtype SDL_LogPriority is unsigned;
   SDL_LOG_PRIORITY_VERBOSE : constant unsigned := 1;
   SDL_LOG_PRIORITY_DEBUG : constant unsigned := 2;
   SDL_LOG_PRIORITY_INFO : constant unsigned := 3;
   SDL_LOG_PRIORITY_WARN : constant unsigned := 4;
   SDL_LOG_PRIORITY_ERROR : constant unsigned := 5;
   SDL_LOG_PRIORITY_CRITICAL : constant unsigned := 6;
   SDL_NUM_LOG_PRIORITIES : constant unsigned := 7;  -- ../inc209/SDL_log.h:111

  --*
  -- *  \brief Set the priority of all log categories
  --  

   procedure SDL_LogSetAllPriority (priority : SDL_LogPriority)  -- ../inc209/SDL_log.h:117
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LogSetAllPriority";

  --*
  -- *  \brief Set the priority of a particular log category
  --  

   procedure SDL_LogSetPriority (category : int; priority : SDL_LogPriority)  -- ../inc209/SDL_log.h:122
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LogSetPriority";

  --*
  -- *  \brief Get the priority of a particular log category
  --  

   function SDL_LogGetPriority (category : int) return SDL_LogPriority  -- ../inc209/SDL_log.h:128
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LogGetPriority";

  --*
  -- *  \brief Reset all priorities to default.
  -- *
  -- *  \note This is called in SDL_Quit().
  --  

   procedure SDL_LogResetPriorities  -- ../inc209/SDL_log.h:135
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LogResetPriorities";

  --*
  -- *  \brief Log a message with SDL_LOG_CATEGORY_APPLICATION and SDL_LOG_PRIORITY_INFO
  --  

   procedure SDL_Log (fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      )  -- ../inc209/SDL_log.h:140
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_Log";

  --*
  -- *  \brief Log a message with SDL_LOG_PRIORITY_VERBOSE
  --  

   procedure SDL_LogVerbose (category : int; fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      )  -- ../inc209/SDL_log.h:145
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LogVerbose";

  --*
  -- *  \brief Log a message with SDL_LOG_PRIORITY_DEBUG
  --  

   procedure SDL_LogDebug (category : int; fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      )  -- ../inc209/SDL_log.h:150
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LogDebug";

  --*
  -- *  \brief Log a message with SDL_LOG_PRIORITY_INFO
  --  

   procedure SDL_LogInfo (category : int; fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      )  -- ../inc209/SDL_log.h:155
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LogInfo";

  --*
  -- *  \brief Log a message with SDL_LOG_PRIORITY_WARN
  --  

   procedure SDL_LogWarn (category : int; fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      )  -- ../inc209/SDL_log.h:160
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LogWarn";

  --*
  -- *  \brief Log a message with SDL_LOG_PRIORITY_ERROR
  --  

   procedure SDL_LogError (category : int; fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      )  -- ../inc209/SDL_log.h:165
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LogError";

  --*
  -- *  \brief Log a message with SDL_LOG_PRIORITY_CRITICAL
  --  

   procedure SDL_LogCritical (category : int; fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      )  -- ../inc209/SDL_log.h:170
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LogCritical";

  --*
  -- *  \brief Log a message with the specified category and priority.
  --  

   procedure SDL_LogMessage
     (category : int;
      priority : SDL_LogPriority;
      fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      )  -- ../inc209/SDL_log.h:175
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LogMessage";

  --*
  -- *  \brief Log a message with the specified category and priority.
  --  

   procedure SDL_LogMessageV
     (category : int;
      priority : SDL_LogPriority;
      fmt : Interfaces.C.Strings.chars_ptr;
      ap : access System.Address)  -- ../inc209/SDL_log.h:182
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LogMessageV";

  --*
  -- *  \brief The prototype for the log output function
  --  

   type SDL_LogOutputFunction is access procedure
        (arg1 : System.Address;
         arg2 : int;
         arg3 : SDL_LogPriority;
         arg4 : Interfaces.C.Strings.chars_ptr)
   with Convention => C;  -- ../inc209/SDL_log.h:189

  --*
  -- *  \brief Get the current log output function.
  --  

   procedure SDL_LogGetOutputFunction (callback : System.Address; userdata : System.Address)  -- ../inc209/SDL_log.h:194
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LogGetOutputFunction";

  --*
  -- *  \brief This function allows you to replace the default log output
  -- *         function with one of your own.
  --  

   procedure SDL_LogSetOutputFunction (callback : SDL_LogOutputFunction; userdata : System.Address)  -- ../inc209/SDL_log.h:200
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LogSetOutputFunction";

  -- Ends C function definitions when using C++  
  -- vi: set ts=4 sw=4 expandtab:  
end SDL_log_h;
