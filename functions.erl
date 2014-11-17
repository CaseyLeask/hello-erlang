-module(functions).

-export([factorial/1, len/1, duplicate/2, reverse/1]).

factorial(N) when is_integer(N), N > 0 -> tail_factorial(N, 1).

tail_factorial(1, Accumulator) -> Accumulator;
tail_factorial(N, Accumulator) -> tail_factorial(N - 1, N * Accumulator).

len(L) when is_list(L) -> tail_len(L, 0).

tail_len([], Accumulator) -> Accumulator;
tail_len([_|T], Accumulator) -> tail_len(T, Accumulator + 1).

duplicate(N, Term) when is_integer(N), N >= 0 -> tail_duplicate(N, Term, []).

tail_duplicate(0, _, Accumulator) -> Accumulator;
tail_duplicate(N, Term, Accumulator) -> tail_duplicate(N - 1, Term, [Term|Accumulator]).

reverse(List) when is_list(List) -> tail_reverse(List, []).

tail_reverse([], Accumulator) -> Accumulator;
tail_reverse([H|T], Accumulator) -> tail_reverse(T, [H|Accumulator]).
