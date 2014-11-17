-module(recursive).

-export([factorial/1, len/1, duplicate/2, sublist/2, zip/2]).

factorial(N) when is_integer(N), N > 0 -> tail_factorial(N, 1).

tail_factorial(1, Accumulator) -> Accumulator;
tail_factorial(N, Accumulator) -> tail_factorial(N - 1, N * Accumulator).

len(L) when is_list(L) -> tail_len(L, 0).

tail_len([], Accumulator) -> Accumulator;
tail_len([_|T], Accumulator) -> tail_len(T, Accumulator + 1).

duplicate(N, Term) when is_integer(N), N >= 0 -> tail_duplicate(N, Term, []).

tail_duplicate(0, _, Accumulator) -> Accumulator;
tail_duplicate(N, Term, Accumulator) -> tail_duplicate(N - 1, Term, [Term|Accumulator]).

sublist(L, N) when is_list(L), is_integer(N) -> lists:reverse(tail_sublist(L, N, [])).

tail_sublist(_, 0, Sublist) -> Sublist;
tail_sublist([], _, Sublist) -> Sublist;
tail_sublist([H|T], N, Sublist) -> tail_sublist(T, N - 1, [H|Sublist]).

zip(L1, L2) -> lists:reverse(tail_zip(L1, L2, [])).

tail_zip([], _, Zipped) -> Zipped;
tail_zip(_, [], Zipped) -> Zipped;
tail_zip([H1|T1], [H2|T2], Zipped) -> tail_zip(T1, T2, [{H1, H2}|Zipped]).
