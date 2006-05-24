GPLC = gplc
STDOUT = /dev/stdout

ifeq ($(shell uname),Darwin)
 FPFX = _
 SHARED = -dylib
else
 FPFX = ""
 SHARED = -shared
endif


%.so: %.pl
	( echo .globl $(FPFX)Object_Initializer;	\
	  echo .globl $(FPFX)System_Directives;		\
	  echo .globl $(FPFX)User_Directives;		\
	  $(GPLC) -S -o $(STDOUT) $< ) |		\
	as -o $@.o;					\
	ld $(SHARED) -o $@ $@.o;				\
	rm $@.o

%.o: %.pl
	$(GPLC) -c $<

all:

dl: dl-interface.pl dl-pl.pl dl.c
	gplc -o $@ $^ -L -rdynamic -L -ldl

clean:
	rm -f *.so *.o *.s
