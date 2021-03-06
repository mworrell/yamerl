-module('flow_mapping_no_entry_1').

-include_lib("eunit/include/eunit.hrl").

-define(FILENAME, "test/parsing/" ?MODULE_STRING ".yaml").

single_test_() ->
    ?_assertThrow(
      {yamerl_exception,
        [
          {yamerl_parsing_error,error,
            "Unexpected \"yamerl_scalar\" token following a \"yamerl_scalar\" token",
            3,1,unexpected_token,
            {yamerl_scalar,3,1,
              {yamerl_tag,3,1,{non_specific,"!"}},
              flow,double_quoted,"item2"},
            []}
        ]
      },
      yamerl_parser:file(?FILENAME)
    ).
