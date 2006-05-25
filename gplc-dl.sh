#! /bin/sh

VERBOSE=
KEEP=
for F in $*; do
    case $F in
    *.pl) PL_FILES="$PL_FILES $F";;
    -v) VERBOSE=yes;;
    -k) KEEP=yes;;
    -*) echo unknown flag: $F;;
    *) echo unknown argument: $F;;
    esac
done

for F in $PL_FILES; do
    [ -n "$VERBOSE" ] && echo $F
    ( echo .globl Object_Initializer
      echo .globl System_Directives
      echo .globl User_Directives
      gplc -S -o /dev/stdout $F ) | \
      as -o ${F%.pl}.o && ld -shared -o ${F%.pl}.so ${F%.pl}.o
    [ -z "$KEEP" ] && rm -f ${F%.pl}.o
done
