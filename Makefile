include MANIFEST

TARGETS=$(dotfiles:%=$(HOME)/.%)
CWD=$(shell pwd)

$(HOME)/.%: %
	@if [ -e $@ ]; then echo "Remove $@ before proceeding"; false; fi
	@echo "Installing $<"
	@ln -sf $(CWD)/$< $@

install: $(TARGETS)
	git submodule update --init
	bash osx

uninstall:
	rm -f $(TARGETS)

update:
	git pull
	git submodule sync
	git submodule update --init
	bash osx

.PHONY: install uninstall update
