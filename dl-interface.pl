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


:- foreign(dl_open(+codes, +integer, -integer)).
:- foreign(dl_close(+integer)).
:- foreign(dl_error(-codes)).
:- foreign(dl_sym(+integer, +codes, -integer)).
:- foreign(dl_init(+integer, +integer)).


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


% $Log$
% Revision 1.2  2006/05/25 09:38:04  spa
% import foreign declarations.
% remove old commented code.
%
% Revision 1.1  2006/05/24 20:44:03  spa
% *** empty log message ***
%
