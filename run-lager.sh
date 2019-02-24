#!/bin/sh
erl -noshell -pa _build/default/lib/*/ebin -s memgraph -s lager -s crashapp -eval "{_Date, {Hour, Minute, _Second}} = calendar:local_time(), timer:sleep(300000), memgraph:graph(integer_to_list(Hour) ++\":\"++ integer_to_list(Minute), \"memgraph\"), erlang:halt()."
mv memgraph.png memgraph-lager.png
