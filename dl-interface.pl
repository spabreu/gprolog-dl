% $Id$ -*- Prolog -*-

% -----------------------------------------------------------------------------
%
% provide a basic dynamic unit loader.
%
% API:
%  ensure_loaded(UNIT).
%  load_unit(UNIT).
%  unload_unit(UNIT).   -- not just yet
%  clauses for load_path/1 can be used

:- dynamic(load_path/1).

ensure_loaded(UNIT) :- current_unit(UNIT, _), !.
ensure_loaded(UNIT) :- load_unit(UNIT).

load_unit(UNIT) :-
	load_unit_path(UNIT, PATH),
	dl_error(_), dl_open(PATH, 257, X), X \= 0, !,
	dl_init(X, 1).
load_unit(UNIT) :-
	throw(error(unit_not_found(UNIT), load_unit/1)).


unit_path_suffix(".so").
unit_path_suffix("").

unit_path_prefix("./").
unit_path_prefix("").
unit_path_prefix(PATH) :- load_path(PATH).

load_unit_path(UNIT, PATH) :-
	unit_path_suffix(SFX),
	unit_path_prefix(PFX),
	format_to_codes(PATH, "~s~w~s", [PFX, UNIT, SFX]).

% dlopen(F) :- dlopen(F, X), g_assign(x, X).
% dlopen(F, X) :-
% 	dl_error(_),
% 	dl_open(F, 257, X),
% 	( X = 0 ->
% 	    dl_error(S), format("~s\n", [S]), !, fail
% 	; true ).

% dlsym(S, V) :- g_read(x, X), dlsym(X, S, V).
% dlsym(X, S, V) :-
% 	dl_error(_),
% 	dl_sym(X, S, V),
% 	dl_error(E),
% 	( E = [] -> true
% 	; format("~s\n", [E]), !, fail ).

% dlinit :- g_read(x, X), dl_init(X, 1).

% dlload(F) :- dlopen(F), dlinit.

% $Log$
% Revision 1.1  2006/05/24 20:44:03  spa
% *** empty log message ***
%
