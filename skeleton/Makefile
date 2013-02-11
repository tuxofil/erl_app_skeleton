APP=skeleton
VERSION=`cat version`

.PHONY: all compile doc test eunit dialyze all-tests clean dist-clean Emakefile figures

all: compile doc

compile: ebin/$(APP).app Emakefile
	erl -noinput -eval 'up_to_date = make:all()' -s erlang halt

doc: doc/overview.edoc figures
	erl -noinput -eval \
		'edoc:application($(APP), ".", [{application, $(APP)}])' \
		-s erlang halt

FIGSSRC=$(wildcard doc/*.dot)
FIGS=$(patsubst doc/%.dot, doc/%.png, $(FIGSSRC))

figures: $(FIGS)

doc/%.png: doc/%.dot
	dot -T png $< > $@

test:
	$(MAKE) -C test

eunit:
	erl -noinput -pa ebin \
		-eval 'ok = eunit:test({application, $(APP)}, [verbose])' \
		-s erlang halt

all-tests:
	$(MAKE) clean
	$(MAKE) TEST=y compile
	$(MAKE) eunit
	$(MAKE) test
	$(MAKE) clean
	$(MAKE) DEBUG=y compile
	$(MAKE) dialyze

clean:
	rm --force -- doc/*.html doc/*.css doc/*.png doc/edoc-info \
		ebin/*.beam Emakefile doc/overview.edoc ebin/$(APP).app
	$(MAKE) -C test clean

dist-clean: clean
	rm --force --recursive -- erl_crash.dump ebin
	find . -type f -name '*~' -print -delete

ebin/$(APP).app: src/$(APP).app.src version
	mkdir --parents ebin
	sed "s/{{VERSION}}/$(VERSION)/" $< > $@

doc/overview.edoc: doc/overview.edoc.src version
	sed "s/{{VERSION}}/$(VERSION)/" $< > $@

ifdef DEBUG
EXTRA_OPTS:=debug_info,
endif

ifdef TEST
EXTRA_OPTS:=$(EXTRA_OPTS) {d,'TEST', true},
endif

Emakefile: Emakefile.src
	sed "s/{{EXTRA_OPTS}}/$(EXTRA_OPTS)/" $< > $@

PLT=.dialyzer_plt

dialyze: $(PLT)
	dialyzer --plt $< -r . \
		-Wunmatched_returns -Werror_handling -Wrace_conditions
	dialyzer --src --plt $< -r . \
		-Wunmatched_returns -Werror_handling -Wrace_conditions

$(PLT):
	dialyzer --build_plt --output_plt $@ \
		--apps erts kernel stdlib crypto compiler

