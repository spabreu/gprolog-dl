:- unit(bar(X)).

bar :- :< C, format("bar/1:bar/0: context is ~w\n", [C]).

grok(f(Z)) :- member(Z, X).
