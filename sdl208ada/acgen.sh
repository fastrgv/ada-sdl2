
# this script was run after putting the entire
# include files for sdl208 into ../inc208/

# this is newest compiler 2018 from AdaCore:
export PATH=$HOME/opt/GNAT/2018/bin:$PATH


/usr/gnat/bin/g++ -c -fdump-ada-spec -C ../inc208/SDL.h -I../inc208

