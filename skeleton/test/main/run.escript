#!/usr/bin/env escript
%%! -smp enable

main(_Args) ->
    log("Started"),
    %% todo: implement
    sleep(1),
    log("Done"),
    terminate(0).

%% ----------------------------------------------------------------------
%% Internal functions

terminate(Status) ->
    try erlang:halt(Status, [{flush, true}])
    catch _:_ -> erlang:halt(Status) end.

sleep(Millis) ->
    log("sleep for ~w millis...", [Millis]),
    ok = timer:sleep(Millis).

log(S) -> log("~s", [S]).
log(F, A) ->
    {{Y, M, D}, {H, Min, S}} = calendar:now_to_local_time({_, _, Micros} = now()),
    io:format(
      "~4..0B-~2..0B-~2..0BT~2..0B:~2..0B:~2..0B.~6..0B " ++ F ++ "~n",
      [Y, M, D, H, Min, S, Micros | A]).

