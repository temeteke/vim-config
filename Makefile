VIM_DIRS := \
	~ \
	$(shell which cygpath > /dev/null 2>&1 && cygpath "$(USERPROFILE)")
VIM_DIRS := $(foreach dir,$(VIM_DIRS),$(shell [ -d $(dir) ] && echo $(dir)))
$(if $(VIM_DIRS), ,$(error The installation directories are not found))

VIM_FILES := .vimrc .gvimrc .vim
VIM_SUB_FILES := map.vim plugin.vim misc.vim

NVIM_DIR := ~/.config/nvim
NVIM_FILES := init.vim map.vim

.PHONY: all clean install install-vim install-nvim uninstall uninstall-vim uninstall-nvim FORCE
all: $(VIM_FILES) neobundle

neobundle: FORCE
	mkdir -p ~/.vim/bundle
	[ -d .vim/bundle/neobundle.vim ] \
		&& (cd .vim/bundle/neobundle.vim && git pull) \
		|| git clone https://github.com/Shougo/neobundle.vim .vim/bundle/neobundle.vim

clean:
	rm -rf .vim/bundle

install: install-vim install-nvim

install-vim: $(VIM_FILES) neobundle
	-for dir in $(VIM_DIRS); do \
		cp -rf $(VIM_FILES) $$dir/; \
	done
	-for dir in $(VIM_DIRS); do \
		cp -rf $(VIM_SUB_FILES) $$dir/.vim; \
	done
	vim +NeoBundleInstall +qall

$(NVIM_DIR):
	mkdir $(NVIM_DIR)

install-nvim: $(NVIM_FILES) $(NVIM_DIR)
	cp -rf $(NVIM_FILES) $(NVIM_DIR)/

uninstall: uninstall-vim uninstall-nvim

uninstall-vim:
	for dir in $(VIM_DIRS); do \
		rm -rf $(addprefix $$dir/, $(VIM_FILES)); \
	done

uninstall-nvim:
	rm -rf $(addprefix $(NVIM_DIR)/, $(NVIM_FILES))
	[ -z "`ls -A $(NVIM_DIR)`" ] && rm -r $(NVIM_DIR)

FORCE:
