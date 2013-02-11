%% @doc
%% Main supervisor process.

%% @author Aleksey Morarash <aleksey.morarash@gmail.com>
%% @copyright Aleksey Morarash <aleksey.morarash@gmail.com>
%% @since 11 Feb 2013, skeleton.

-module(skeleton_sup).

-behaviour(supervisor).

%% API exports
-export([start_link/0]).

%% supervisor callback exports
-export([init/1]).

-include("skeleton.hrl").

%% ----------------------------------------------------------------------
%% API functions
%% ----------------------------------------------------------------------

%% @doc Start top supervisor process.
%% @spec start_link() -> {ok, Pid} | ignore | {error, Reason}
%%     Pid = pid(),
%%     Reason = term()
start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, _Args = undefined).

%% ----------------------------------------------------------------------
%% supervisor callback functions
%% ----------------------------------------------------------------------

%% @hidden
init(_Args) ->
    {ok,
     {{one_for_one, 5, 1},
      [
       {skeleton_srv, {skeleton_srv, start_link, []},
        permanent, 100, worker, [skeleton_srv]}
      ]
     }}.

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

