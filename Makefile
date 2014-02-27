include MANIFEST

TARGETS=$(dotfiles:%=$(HOME)/.%)
CWD=$(shell pwd)

$(HOME)/.%: %
	@if [ -e $@ ]; then mv $@ $@.bak; fi
	@echo "Installing $<"
	@ln -sf $(CWD)/$< $@

install: $(TARGETS)
	git clone https://github.com/sorin-ionescu/prezto.git zprezto
	git clone https://github.com/gmarik/vundle.git vim/bundle/vundle
	vim -es +BundleInstall +qall || true
	#bash osx

uninstall:
	rm -f $(TARGETS)

update:
	git pull
	cd zprezto; git pull
	cd vim/bundle/vundle; git pull
	vim -es +BundleUpdate +qall || true

.PHONY: install uninstall update
