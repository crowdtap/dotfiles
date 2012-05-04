include MANIFEST

TARGETS=$(dotfiles:%=$(HOME)/.%)
CWD=$(shell pwd)

$(HOME)/.%: %
	@if [ -e $@ ]; then echo "Remove $@ before proceeding"; false; fi
	@echo "Installing $<"
	@ln -sf $(CWD)/$< $@

install: $(TARGETS)

uninstall:
	rm -f $(TARGETS)

update:
	git submodule init
	git submodule update

.PHONY: install uninstall update
