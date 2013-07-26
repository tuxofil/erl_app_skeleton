APP=skeleton
VERSION=`cat version`

.PHONY: all compile doc test eunit dialyze all-tests clean dist-clean figures

all: compile doc

COPTS = {outdir, ebin}, {i, \"include\"}, warn_unused_function, \
 warn_bif_clash, warn_deprecated_function, warn_obsolete_guard, verbose, \
 warn_shadow_vars, warn_export_vars, warn_unused_records, warn_unused_import

ifdef DEBUG
COPTS := $(COPTS), debug_info
endif

ifdef TEST
COPTS := $(COPTS), {d, 'TEST'}
endif

ifdef STRICT
COPTS := $(COPTS), warnings_as_errors
endif

compile: ebin/$(APP).app
	echo '[$(FIRST_MODS)"src/*"].' > Emakefile
	erl -noinput -pa ebin -eval "up_to_date=make:all([$(COPTS)]),halt()"

doc: doc/overview.edoc figures
	erl -noinput -eval "edoc:application($(APP),\".\",[]),halt()"

figures: $(patsubst doc/%.dot, doc/%.png, $(wildcard doc/*.dot))

doc/%.png: doc/%.dot
	dot -T png $< > $@

test:
	$(MAKE) -C test

eunit:
	$(MAKE) clean TEST=y compile
	erl -noinput -pa ebin \
		-eval 'ok=eunit:test({application,$(APP)},[verbose]),halt()'

all-tests: eunit test dialyze

clean:
	rm --force -- doc/*.html doc/*.css doc/*.png doc/edoc-info \
		ebin/*.beam Emakefile doc/overview.edoc ebin/$(APP).app
	$(MAKE) -C test clean

dist-clean: clean
	rm --force --recursive -- erl_crash.dump ebin
	find . -type f -name '*~' -print -delete

ebin/$(APP).app: src/$(APP).app.in version
	mkdir --parents ebin
	sed "s/{{VERSION}}/$(VERSION)/" $< > $@

doc/overview.edoc: doc/overview.edoc.in version
	sed "s/{{VERSION}}/$(VERSION)/" $< > $@

PLT=.dialyzer_plt

dialyze: $(PLT)
	$(MAKE) clean DEBUG=y compile
	dialyzer --plt $< -r . \
		-Wunmatched_returns -Werror_handling -Wrace_conditions
	dialyzer --src --plt $< -r . \
		-Wunmatched_returns -Werror_handling -Wrace_conditions

$(PLT):
	dialyzer --build_plt --output_plt $@ \
		--apps erts kernel stdlib crypto compiler

