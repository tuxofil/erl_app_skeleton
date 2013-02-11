%% @doc
%% skeleton application main interface module.

%% @author Aleksey Morarash <aleksey.morarash@gmail.com>
%% @copyright Aleksey Morarash <aleksey.morarash@gmail.com>
%% @since 11 Feb 2013, skeleton.

-module(skeleton).

%% application maintainance exports
-export([start/0, stop/0]).

%% API exports
-export([]).

-include("skeleton.hrl").

%% ----------------------------------------------------------------------
%% Type definitions
%% ----------------------------------------------------------------------

-export_type([]).

%% ----------------------------------------------------------------------
%% Application maintainance functions
%% ----------------------------------------------------------------------

%% @doc Start application.
%% @spec start() -> ok | {error, Reason}
%%     Reason = term()
start() ->
    application:start(?MODULE).

%% @doc Stop application.
%% @spec stop() -> ok | {error, Reason}
%%     Reason = term()
stop() ->
    application:stop(?MODULE).

%% ----------------------------------------------------------------------
%% API functions
%% ----------------------------------------------------------------------

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

