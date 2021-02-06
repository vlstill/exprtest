# vim: noexpandtab

PWD != pwd

PYSRC_PY != find src -type f -name '*.py'
PYSRC_HASHBANG != find src -type f -executable -exec sh -c 'file {} | grep -iqF python' \; -print
PYSRC != echo $(PYSRC_PY) $(PYSRC_HASHBANG) | tr ' ' '\n' | awk '!a[$$0]++'

-include local.make

MYPY ?= mypy

all : submodules pycheck test

pycheck : $(PYSRC:%=%-mypy)

$(PYSRC:%=%-mypy) :
	env MYPYPATH=$(dir $@) $(MYPY) --check-untyped-defs --warn-redundant-casts --warn-return-any $(@:%-mypy=%)

submodules :
	git submodule update -i

test:
	@echo TODO

doc:
	@echo TODO

.PHONY: all clean test submodules pycheck doc $(PYSRC:%=%-mypy)
