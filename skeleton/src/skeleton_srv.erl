%% @doc
%% Main worker process.

%% @author Aleksey Morarash <aleksey.morarash@gmail.com>
%% @copyright Aleksey Morarash <aleksey.morarash@gmail.com>
%% @since 11 Feb 2013, skeleton.

-module(skeleton_srv).

-behaviour(gen_server).

%% API exports
-export([start_link/0]).

%% gen_server callback exports
-export([init/1, handle_call/3, handle_info/2, handle_cast/2,
         terminate/2, code_change/3]).

%% other exports (i.e. debug)
-export([get_state/0]).

-include("skeleton.hrl").

%% ----------------------------------------------------------------------
%% Internal signals and keywords
%% ----------------------------------------------------------------------

-define(CALL_GET_STATE, get_state).

%% ----------------------------------------------------------------------
%% API functions
%% ----------------------------------------------------------------------

%% @doc Start process as part of a supervision tree.
%% @spec start_link() -> {ok, Pid} | ignore | {error, Reason}
%%     Pid = pid(),
%%     Reason = term()
start_link() ->
    gen_server:start_link(
      {local, ?MODULE}, ?MODULE, _Args = undefined, _Options = []).

%% @doc Return process internal state term.
%% @hidden
%% @spec get_state() -> tuple()
get_state() ->
    gen_server:call(?MODULE, ?CALL_GET_STATE).

%% ----------------------------------------------------------------------
%% gen_server callbacks
%% ----------------------------------------------------------------------

-record(state, {}).

%% @hidden
init(_Args) ->
    {ok, #state{}}.

%% @hidden
handle_cast(_Request, State) ->
    {noreply, State}.

%% @hidden
handle_info(_Request, State) ->
    {noreply, State}.

%% @hidden
handle_call(?CALL_GET_STATE, _From, State) ->
    {reply, State, State};
handle_call(_Request, _From, State) ->
    {noreply, State}.

%% @hidden
terminate(_Reason, _State) ->
    ok.

%% @hidden
code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

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

