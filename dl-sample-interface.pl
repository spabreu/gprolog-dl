
dlopen(F) :- dlopen(F, X), g_assign(x, X).
dlopen(F, X) :-
	dl_error(_),
	dl_open(F, 257, X),
	( X = 0 ->
	    dl_error(S), format("~s\n", [S]), !, fail
	; true ).

dlsym(S, V) :- g_read(x, X), dlsym(X, S, V).
dlsym(X, S, V) :-
	dl_error(_),
	dl_sym(X, S, V),
	dl_error(E),
	( E = [] -> true
	; format("~s\n", [E]), !, fail ).

dlinit :- g_read(x, X), dl_init(X, 1).

