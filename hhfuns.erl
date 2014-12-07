-module(hhfuns).
-compile(export_all).
 
one() -> 1.
two() -> 2.
 
add(X,Y) -> X() + Y().

increment(L) -> map(fun(N) -> N + 1 end, L). 

decrement(L) -> map(fun(N) -> N - 1 end, L).

map(_, []) -> [];
map(F, [H|T]) -> [F(H)|map(F,T)].

filter(Pred, L) -> lists:reverse(filter(Pred, L,[])).
 
filter(_, [], Acc) -> Acc;
filter(Pred, [H|T], Acc) ->
  case Pred(H) of
    true  -> filter(Pred, T, [H|Acc]);
    false -> filter(Pred, T, Acc)
  end.
