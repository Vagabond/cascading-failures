#!/bin/sh
erl -noshell -pa _build/default/lib/*/ebin -s memgraph -s crashapp -eval "{ok, C} = logger:get_handler_config(default), #{formatter := {logger_formatter, F}} = C, logger:set_handler_config(default, C#{formatter => {logger_formatter, F#{max_size => 1024, chars_limit => 1024}}}), {_Date, {Hour, Minute, _Second}} = calendar:local_time(), timer:sleep(300000), memgraph:graph(integer_to_list(Hour) ++\":\"++ integer_to_list(Minute), \"memgraph\"), erlang:halt()."
mv memgraph.png memgraph-logger-size-limits.png
