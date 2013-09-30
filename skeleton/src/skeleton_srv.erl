%% @doc
%% Main worker process.

%% @author Aleksey Morarash <aleksey.morarash@gmail.com>
%% @copyright Aleksey Morarash <aleksey.morarash@gmail.com>
%% @since {{DATE}}, skeleton.

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
%% Internal signals, keywords and defs
%% ----------------------------------------------------------------------

-define(CALL_GET_STATE, get_state).

-record(state, {}).

%% ----------------------------------------------------------------------
%% API functions
%% ----------------------------------------------------------------------

%% @doc Start process as part of a supervision tree.
%% @spec start_link() -> {ok, Pid} | ignore | {error, Reason}
%%     Pid = pid(),
%%     Reason = term()
-spec start_link() -> {ok, pid()} | ignore | {error, Reason :: any()}.
start_link() ->
    gen_server:start_link(
      {local, ?MODULE}, ?MODULE, _Args = undefined, _Options = []).

%% @doc Return process internal state term.
%% @hidden
%% @spec get_state() -> tuple()
-spec get_state() -> #state{}.
get_state() ->
    gen_server:call(?MODULE, ?CALL_GET_STATE).

%% ----------------------------------------------------------------------
%% gen_server callbacks
%% ----------------------------------------------------------------------

%% @hidden
-spec init(Args :: any()) -> {ok, InitialState :: #state{}}.
init(_Args) ->
    {ok, #state{}}.

%% @hidden
-spec handle_cast(Request :: any(), State :: #state{}) ->
                         {noreply, NewState :: #state{}}.
handle_cast(_Request, State) ->
    {noreply, State}.

%% @hidden
-spec handle_info(Request :: any(), State :: #state{}) ->
                         {noreply, NewState :: #state{}}.
handle_info(_Request, State) ->
    {noreply, State}.

%% @hidden
-spec handle_call(Requiest :: any(), From :: any(), State :: #state{}) ->
                         {reply, Reply :: any(), NewState :: #state{}} |
                         {noreply, NewState :: #state{}}.
handle_call(?CALL_GET_STATE, _From, State) ->
    {reply, State, State};
handle_call(_Request, _From, State) ->
    {noreply, State}.

%% @hidden
-spec terminate(Reason :: any(), State :: #state{}) -> Ignored :: any().
terminate(_Reason, _State) ->
    ok.

%% @hidden
-spec code_change(OldVersion :: any(), State :: #state{}, Extra :: any()) ->
                         {ok, NewState :: #state{}}.
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

