:- initialization(write(init(foo))).

:- unit(foo(X)).

foo :- :< C, format("foo/1:foo/0: context is ~w\n", [C]).

grok(Z) :- member(Z, X).

