-module(tree).

-export([empty/0, insert/3, lookup/2]).

empty() -> {node, 'nil'}.

insert(Key, Value, {node, 'nil'}) ->
  {node, {Key, Value, {node, 'nil'}, {node, 'nil'}}};
insert(NewKey, NewValue, {node, {Key, Value, Smaller, Larger}}) when NewKey < Key ->
  {node, {Key, Value, insert(NewKey, NewValue, Smaller), Larger}};
insert(NewKey, NewValue, {node, {Key, Value, Smaller, Larger}}) when NewKey > Key ->
  {node, {Key, Value, Smaller, insert(NewKey, NewValue, Larger)}};
insert(Key, Val, {node, {Key, _, Smaller, Larger}}) ->
  {node, {Key, Val, Smaller, Larger}}.

lookup(_, {node, 'nil'}) ->
  undefined;
lookup(Key, {node, {Key, Value, _, _}}) ->
  {ok, Value};
lookup(IndexKey, {node, {Key, _, Smaller, _}}) when IndexKey < Key ->
  lookup(IndexKey, Smaller);
lookup(Key, {node, {_, _, _, Larger}}) ->
  lookup(Key, Larger).
