ERL ?= erl
APP := restmail

.PHONY: deps

all: deps
	@./rebar compile

deps:
	@./rebar get-deps

clean:
	@./rebar clean

distclean: clean
	@./rebar delete-deps

docs:
	@erl -noshell -run edoc_run application '$(APP)' '"."' '[]'

config:
	@mkdir -p include
	@cp src/restmail.hrl.src include/restmail.hrl
