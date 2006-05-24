GPLC = gplc
FPFX = _
STDOUT = /dev/stdout		# system dependent!

%.so: %.pl
	( echo .globl $(FPFX)Object_Initializer;	\
	  echo .globl $(FPFX)System_Directives;		\
	  echo .globl $(FPFX)User_Directives;		\
	  $(GPLC) -S -o $(STDOUT) $< ) |		\
	as -o $@.o;					\
	ld -dylib -o $@ $@.o;				\
	rm $@.o

%.o: %.pl
	$(GPLC) -c $<

all:

clean:
	rm -f *.so *.o *.s
