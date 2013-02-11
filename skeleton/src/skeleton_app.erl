%% @doc
%% Application callback module.

%% @author Aleksey Morarash <aleksey.morarash@gmail.com>
%% @copyright Aleksey Morarash <aleksey.morarash@gmail.com>
%% @since 11 Feb 2013, skeleton.

-module(skeleton_app).

-behaviour(application).

%% application callback exports
-export([start/2, start_phase/3, prep_stop/1, stop/1, config_change/3]).

-include("skeleton.hrl").

%% ----------------------------------------------------------------------
%% application callback functions
%% ----------------------------------------------------------------------

%% @hidden
start(_StartType, _StartArgs) ->
    skeleton_sup:start_link().

%% @hidden
start_phase(_Phase, _StartType, _PhaseArgs) ->
    ok.

%% @hidden
prep_stop(_State) ->
    ok.

%% @hidden
stop(_State) ->
    ok.

%% @hidden
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

