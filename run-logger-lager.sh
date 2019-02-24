#!/bin/sh
erl -noshell -pa _build/default/lib/*/ebin -s memgraph -s crashapp -eval "logger:set_primary_config(level, debug), {ok, C} = logger:get_handler_config(default), logger:set_handler_config(default, C#{formatter => {lager_logger_formatter, #{report_cb => fun lager_logger_formatter:report_cb/1}}}), {_Date, {Hour, Minute, _Second}} = calendar:local_time(), timer:sleep(300000), memgraph:graph(integer_to_list(Hour) ++\":\"++ integer_to_list(Minute), \"memgraph\"), erlang:halt()."
mv memgraph.png memgraph-logger-lager.png
