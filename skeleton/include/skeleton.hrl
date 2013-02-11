-ifndef(_SKELETON).
-define(_SKELETON, true).

%% ----------------------------------------------------------------------
%% configuration options names and their default values

%% command line options

%% default values
-define(
   DEFAULTS,
   []).

%% ----------------------------------------------------------------------
%% other definitions

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

-endif.

