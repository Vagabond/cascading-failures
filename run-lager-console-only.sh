#!/bin/sh
erl -noshell -pa _build/default/lib/*/ebin -s memgraph -s crashapp -eval "application:load(lager), application:set_env(lager, crash_log, false), application:set_env(lager, handlers, [{lager_console_backend, [{level, notice}]}]), lager:start(), {_Date, {Hour, Minute, _Second}} = calendar:local_time(), timer:sleep(300000), memgraph:graph(integer_to_list(Hour) ++\":\"++ integer_to_list(Minute), \"memgraph\"), erlang:halt()."
mv memgraph.png memgraph-lager-console-only.png
