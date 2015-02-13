DIRS := \
	~ \
	$(shell which cygpath > /dev/null 2>&1 && cygpath "$(USERPROFILE)")
DIRS := $(foreach dir,$(DIRS),$(shell [ -d $(dir) ] && echo $(dir)))
$(if $(DIRS), ,$(error The installation directories are not found))

FILES := .vimrc .gvimrc .vim

.PHONY: all clean install uninstall FORCE
all: $(FILES) neobundle

neobundle: FORCE
	mkdir -p ~/.vim/bundle
	[ -d .vim/bundle/neobundle.vim ] \
		&& (cd .vim/bundle/neobundle.vim && git pull) \
		|| git clone https://github.com/Shougo/neobundle.vim .vim/bundle/neobundle.vim

clean:
	rm -rf .vim/bundle

install: all
	-for dir in $(DIRS); do \
		cp -r $(FILES) $$dir/; \
	done
	vim +NeoBundleInstall +qall
		
uninstall:
	for dir in $(DIRS); do \
		rm -rf $(addprefix $$dir/, $(FILES)); \
	done

FORCE:
