#! /bin/sh

for F in $*; do
    case $F in
    *.pl) PL_FILES="$PL_FILES '$F'";;
    -*) FLAGS="$FLAGS $F";;
    *) echo unknown: $F;;
    esac
done

for F in $PL_FILES; do
    ( echo .globl Object_Initializer
      echo .globl System_Directives
      echo .globl User_Directives
      gplc -S -o /dev/stdout $F )
    gplc-cx -S $F
    ( for S in Object_Initializer System_Directives User_Directives; do
            echo .globl $S; done;
          cat foo.s ) | as -o foo.o && ld -shared -o foo.so foo.o
done
