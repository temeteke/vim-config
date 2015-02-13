DIRS := \
	~ \
	$(shell which cygpath > /dev/null 2>&1 && cygpath "$(USERPROFILE)")
DIRS := $(foreach dir,$(DIRS),$(shell [ -d $(dir) ] && echo $(dir)))
$(if $(DIRS), ,$(error The installation directories are not found))

FILES := .vimrc .gvimrc .vim

.PHONY: all clean install uninstall FORCE
all: .vim/bundle/neobundle.vim

.vim/bundle/neobundle.vim: FORCE
	[ -d .vim/bundle/neobundle.vim ] \
		|| git clone https://github.com/Shougo/neobundle.vim \
		&& (cd .vim/bundle/neobundle.vim && git pull)

clean:
	rm -rf .vim/bundle/neobundle.vim

install: $(FILES)
	for dir in $(DIRS); do \
		cp -r $(FILES) $$dir/; \
	done
		
uninstall:
	for dir in $(DIRS); do \
		rm -rf $(addprefix $$dir/, $(FILES)); \
	done

FORCE:
