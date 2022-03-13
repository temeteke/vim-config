VIM_DIR := ~
VIM_FILES := .vimrc .gvimrc .vim
VIM_SUB_FILES := map.vim plugin.vim misc.vim

NVIM_DIR := ~/.config/nvim
NVIM_FILES := init.vim map.vim

.PHONY: all clean install install-vim install-nvim uninstall uninstall-vim uninstall-nvim FORCE
all: $(VIM_FILES) neobundle

.vim:
	mkdir .vim

neobundle: .vim FORCE
	mkdir -p .vim/bundle
	[ -d .vim/bundle/neobundle.vim ] \
		&& (cd .vim/bundle/neobundle.vim && git pull) \
		|| git clone https://github.com/Shougo/neobundle.vim .vim/bundle/neobundle.vim

clean:
	rm -rf .vim

install: install-vim install-nvim

install-vim: $(VIM_FILES) neobundle
	cp -rf $(VIM_FILES) $(VIM_DIR)/
	cp -rf $(VIM_SUB_FILES) $(VIM_DIR)/.vim/
	vim +NeoBundleInstall +qall

$(NVIM_DIR):
	mkdir $(NVIM_DIR)

install-nvim: $(NVIM_FILES) $(NVIM_DIR)
	cp -rf $(NVIM_FILES) $(NVIM_DIR)/

uninstall: uninstall-vim uninstall-nvim

uninstall-vim:
	rm -rf $(addprefix $(VIM_DIR)/, $(VIM_FILES))

uninstall-nvim:
	rm -rf $(addprefix $(NVIM_DIR)/, $(NVIM_FILES))
	[ -z "`ls -A $(NVIM_DIR)`" ] && rm -r $(NVIM_DIR)

FORCE:
