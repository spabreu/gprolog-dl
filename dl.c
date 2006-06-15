#include <stdio.h>
#include <dlfcn.h>

#include <gprolog.h>

Bool dl_open (char *file, int flag, void **result) {
  //  fprintf (stderr, "dl_open (\"%s\", %d)\n", file, flag);
  *result = dlopen (file, flag);
  return TRUE;
}

Bool dl_close (void *handle) {
  return !dlclose (handle);
}

Bool dl_error (char **message) {
  char *e = dlerror ();
  if (e)
    *message = e;
  else
    *message = "";
  return TRUE;
}

Bool dl_sym (void *handle, char *symbol, void **result) {
  *result = dlsym (handle, symbol);
  return TRUE;
}

static char *functions[] = {
  "Object_Initializer",
  "System_Directives",
  "User_Directives",
  0,
};

Bool dl_init (void *handle, int mask) {
  void (*function) ();
  char **f;

  for (f = functions; *f; ++f) {
    if (mask & 1) {
      (void) dlerror ();
      if ((function = (void (*)()) dlsym (handle, *f))) {
	// fprintf (stderr, "dl_init/1: calling %s: (0x%08X)\n", *f, function);
	(*function) ();
      }
      else {
	fprintf (stderr, "dl_init/1: %s undefined: %s\n", *f, dlerror());
	return FALSE;
      }
    }
    mask >>= 1;
  }
  return TRUE;
}
