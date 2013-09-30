%% @doc
%% Application callback module.

%% @author Aleksey Morarash <aleksey.morarash@gmail.com>
%% @copyright Aleksey Morarash <aleksey.morarash@gmail.com>
%% @since {{DATE}}, skeleton.

-module(skeleton_app).

-behaviour(application).

%% application callback exports
-export([start/2, start_phase/3, prep_stop/1, stop/1, config_change/3]).

-include("skeleton.hrl").

%% ----------------------------------------------------------------------
%% application callback functions
%% ----------------------------------------------------------------------

%% @hidden
-spec start(StartType :: application:start_type(), StartArgs :: list()) ->
                   {ok, pid()} | {error, Reason :: any()}.
start(_StartType, _StartArgs) ->
    skeleton_sup:start_link().

%% @hidden
-spec start_phase(Phase :: any(), StartType :: application:start_type(),
                  PhaseArgs :: list()) -> ok.
start_phase(_Phase, _StartType, _PhaseArgs) ->
    ok.

%% @hidden
-spec prep_stop(State :: any()) -> ok.
prep_stop(_State) ->
    ok.

%% @hidden
-spec stop(State :: any()) -> ok.
stop(_State) ->
    ok.

%% @hidden
-spec config_change(Changed :: any(), New :: any(), Removed :: any()) -> ok.
config_change(_Changed, _New, _Removed) ->
    ok.

%% ----------------------------------------------------------------------
%% Internal functions
%% ----------------------------------------------------------------------

%% ----------------------------------------------------------------------
%% eunit tests
%% ----------------------------------------------------------------------

-ifdef(TEST).

main_test() ->
    %% todo: implement
    ok.

-endif.

