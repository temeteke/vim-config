VIM_DIR := ~
VIM_FILES := .vimrc .gvimrc .vim
VIM_SUB_FILES := map.vim color.vim plugin.vim misc.vim

NVIM_DIR := ~/.config/nvim
NVIM_FILES := init.vim map.vim misc.vim

.PHONY: all clean install install-vim install-nvim uninstall uninstall-vim uninstall-nvim FORCE
all: $(VIM_FILES)

.vim: dein

dein: .vim/bundles/repos/github.com/Shougo/dein.vim FORCE
	cd $< && git pull

.vim/bundles/repos/github.com/Shougo/dein.vim:
	git clone --depth 1 https://github.com/Shougo/dein.vim $@

clean:
	rm -rf .vim

install: install-vim install-nvim

install-vim: $(VIM_FILES)
	cp -rf $(VIM_FILES) $(VIM_DIR)/
	cp -rf $(VIM_SUB_FILES) $(VIM_DIR)/.vim/
	vim "+call dein#install()" +qall

install-nvim: $(NVIM_FILES) $(NVIM_DIR)
	cp -rf $(NVIM_FILES) $(NVIM_DIR)/

$(NVIM_DIR):
	mkdir $(NVIM_DIR)

uninstall: uninstall-vim uninstall-nvim

uninstall-vim:
	rm -rf $(addprefix $(VIM_DIR)/, $(VIM_FILES))

uninstall-nvim:
	rm -rf $(addprefix $(NVIM_DIR)/, $(NVIM_FILES))
	[ -z "`ls -A $(NVIM_DIR)`" ] && rm -r $(NVIM_DIR)


WINDOWS_VIM_DIR := $(shell which wslpath > /dev/null 2>&1 && wslpath "$(shell which wslvar > /dev/null 2>&1 && wslvar USERPROFILE)")
WINDOWS_NVIM_DIR := $(shell which wslpath > /dev/null 2>&1 && wslpath "$(shell which wslvar > /dev/null 2>&1 && wslvar LOCALAPPDATA)\\nvim")

windows-install: windows-install-vim windows-install-nvim

windows-install-vim: $(VIM_FILES)
	cp -rf $(VIM_FILES) $(WINDOWS_VIM_DIR)/
	cp -rf $(VIM_SUB_FILES) $(WINDOWS_VIM_DIR)/.vim/

windows-install-nvim: $(NVIM_FILES) $(WINDOWS_NVIM_DIR)
	cp -rf $(NVIM_FILES) $(WINDOWS_NVIM_DIR)/

$(WINDOWS_NVIM_DIR):
	mkdir $(WINDOWS_NVIM_DIR)

windows-uninstall: windows-uninstall-vim windows-uninstall-nvim

windows-uninstall-vim:
	rm -rf $(addprefix $(WINDOWS_VIM_DIR)/, $(VIM_FILES))

windows-uninstall-nvim:
	rm -rf $(addprefix $(WINDOWS_NVIM_DIR)/, $(NVIM_FILES))
	[ -z "`ls -A $(WINDOWS_NVIM_DIR)`" ] && rm -r $(WINDOWS_NVIM_DIR)

FORCE:
