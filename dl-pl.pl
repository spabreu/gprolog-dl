:- foreign(dl_open(+codes, +integer, -integer)).
:- foreign(dl_close(+integer)).
:- foreign(dl_error(-codes)).
:- foreign(dl_sym(+integer, +codes, -integer)).
:- foreign(dl_init(+integer, +integer)).
