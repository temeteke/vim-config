ROOT_DIR := ~/.local

NVIM_TAR_NAME := nvim-linux64
NVIM_TAR_FILE := $(NVIM_TAR_NAME).tar.gz
NVIM_TAR_URL := https://github.com/neovim/neovim/releases/download/stable/$(NVIM_TAR_FILE)

VIM_DIR := ~
VIM_FILES := .vimrc .gvimrc
VIM_SUB_DIR := $(VIM_DIR)/.vim
VIM_SUB_FILES := map.vim color.vim plugin.vim jetpack.vim plugin_dein_basic.toml plugin_dein_main.toml plugin_dein_lazy.toml plugin_dein_vim.toml plugin_dein_nodenops.toml plugin_dein_denops.toml gui.vim misc.vim

NVIM_DIR := ~/.config/nvim
NVIM_PLUGIN_DIR := ~/.cache/dein
NVIM_FILES := init.vim ginit.vim map.vim color.vim plugin.vim jetpack.vim plugin_dein_basic.toml plugin_dein_main.toml plugin_dein_lazy.toml plugin_dein_nvim.toml plugin_dein_nodenops.toml plugin_dein_denops.toml gui.vim misc.vim

.PHONY: all clean FORCE
all: dein.vim $(NVIM_TAR_FILE)

dein.vim:
	git clone --depth 1 https://github.com/Shougo/dein.vim -b 2.2 $@

$(NVIM_TAR_FILE):
	curl -LR -o $@ $(NVIM_TAR_URL)

clean:
	rm -fr dein.vim
	rm -fr $(NVIM_TAR_FILE)

FORCE:


# Install
.PHONY: install install-vim install-vim-files install-vim-dein install-nvim install-nvim-files install-nvim-dein
install: install-vim install-nvim

# Install Vim
install-vim: install-vim-files install-vim-dein install-vim-vimspector

install-vim-files: $(VIM_FILES) $(VIM_DIR) $(VIM_SUB_FILES) $(VIM_SUB_DIR)
	cp -afr $(VIM_FILES) $(VIM_DIR)/
	cp -afr $(VIM_SUB_FILES) $(VIM_SUB_DIR)/
	mkdir -p $(VIM_SUB_DIR)/undo

$(VIM_DIR):
	mkdir -p $@

$(VIM_SUB_DIR):
	mkdir -p $@

install-vim-dein: $(VIM_DIR)/.vim/bundles/repos/github.com/Shougo/dein.vim
	type vim > /dev/null 2>&1 && vim "+call dein#install()" +qall || echo Vim is not installed

$(VIM_DIR)/.vim/bundles/repos/github.com/Shougo/dein.vim: dein.vim
	mkdir -p $@
	cp -afrT $< $@

install-vim-vimspector: install-vim-dein
	mkdir -p $(VIM_DIR)/.vim/bundles/repos/github.com/puremourning/vimspector/configurations/linux/python
	cp -a vimspector/python.json $(VIM_DIR)/.vim/bundles/repos/github.com/puremourning/vimspector/configurations/linux/python/python.json

# Install Neovim
install-nvim: install-nvim-bin install-nvim-files install-nvim-dein install-nvim-vimspector

install-nvim-bin: $(NVIM_TAR_FILE)
	mkdir -p $(ROOT_DIR)
	tar -xf $(NVIM_TAR_FILE) -C $(ROOT_DIR) --strip-components 1

install-nvim-files: $(NVIM_FILES) $(NVIM_DIR)
	cp -afr $(NVIM_FILES) $(NVIM_DIR)/

$(NVIM_DIR):
	mkdir -p $@

install-nvim-dein: $(NVIM_PLUGIN_DIR)/repos/github.com/Shougo/dein.vim
	type nvim > /dev/null 2>&1 && nvim "+call dein#install()" +qall || echo Neovim is not installed

$(NVIM_PLUGIN_DIR)/repos/github.com/Shougo/dein.vim: dein.vim
	mkdir -p $@
	cp -frT $< $@

install-nvim-vimspector: install-nvim-dein
	mkdir -p $(NVIM_PLUGIN_DIR)/repos/github.com/puremourning/vimspector/configurations/linux/python
	cp -a vimspector/python.json $(NVIM_PLUGIN_DIR)/repos/github.com/puremourning/vimspector/configurations/linux/python/python.json

# Uninstall
.PHONY: uninstall uninstall-vim uninstall-nvim
uninstall: uninstall-vim uninstall-nvim

uninstall-vim:
	rm -fr $(addprefix $(VIM_DIR)/, $(VIM_FILES))
	rm -fr $(VIM_SUB_DIR)

uninstall-nvim:
	rm -fr $(addprefix $(NVIM_DIR)/, $(NVIM_FILES))
	rm -fr $(NVIM_PLUGIN_DIR)


WINDOWS_VIM_DIR := $(shell type wslpath > /dev/null 2>&1 && type wslvar > /dev/null && wslpath "$(shell type wslvar > /dev/null 2>&1 && type wslvar > /dev/null && wslvar USERPROFILE)")
WINDOWS_VIM_SUB_DIR := $(WINDOWS_VIM_DIR)/.vim
WINDOWS_NVIM_DIR := $(shell type wslpath > /dev/null 2>&1 && type wslvar > /dev/null && wslpath "$(shell type wslvar > /dev/null 2>&1 && type wslvar > /dev/null && wslvar LOCALAPPDATA)\\nvim")
WINDOWS_NVIM_PLUGIN_DIR := $(shell type wslpath > /dev/null 2>&1 && type wslvar > /dev/null && wslpath "$(shell type wslvar > /dev/null 2>&1 && type wslvar > /dev/null && wslvar USERPROFILE)\\.cache\\dein")

# Install in Windows
.PHONY: windows-install windows-install-vim windows-install-vim-files windows-install-vim-dein windows-install-nvim windows-install-nvim-files windows-install-nvim-dein
windows-install: windows-install-vim windows-install-nvim

# Install Vim in Windows
windows-install-vim: windows-install-vim-files windows-install-vim-dein

windows-install-vim-files: $(VIM_FILES) $(WINDOWS_VIM_DIR) $(VIM_SUB_FILES) $(WINDOWS_VIM_SUB_DIR)
	cp -fr $(VIM_FILES) $(WINDOWS_VIM_DIR)/
	cp -fr $(VIM_SUB_FILES) $(WINDOWS_VIM_SUB_DIR)/
	mkdir -p $(WINDOWS_VIM_SUB_DIR)/undo

$(WINDOWS_VIM_DIR):
	mkdir -p $@

$(WINDOWS_VIM_SUB_DIR):
	mkdir -p $@

windows-install-vim-dein: $(WINDOWS_VIM_DIR)/.vim/bundles/repos/github.com/Shougo/dein.vim

$(WINDOWS_VIM_DIR)/.vim/bundles/repos/github.com/Shougo/dein.vim: dein.vim
	mkdir -p $@
	cp -frT $< $@

# Install Neovim in Windows
windows-install-nvim: windows-install-nvim-files windows-install-nvim-dein

windows-install-nvim-files: $(WINDOWS_NVIM_DIR) $(NVIM_FILES)
	cp -arf $(NVIM_FILES) $(WINDOWS_NVIM_DIR)/

$(WINDOWS_NVIM_DIR):
	mkdir -p $@

windows-install-nvim-dein: $(WINDOWS_NVIM_PLUGIN_DIR)/repos/github.com/Shougo/dein.vim

$(WINDOWS_NVIM_PLUGIN_DIR)/repos/github.com/Shougo/dein.vim: dein.vim
	mkdir -p $@
	cp -afrT $< $@

# Uninstall in Windows
.PHONY: windows-uninstall windows-uninstall-vim windows-uninstall-nvim
windows-uninstall: windows-uninstall-vim windows-uninstall-nvim

windows-uninstall-vim:
	rm -fr $(addprefix $(WINDOWS_VIM_DIR)/, $(VIM_FILES))
	rm -fr $(WINDOWS_VIM_SUB_DIR)

windows-uninstall-nvim:
	rm -fr $(addprefix $(WINDOWS_NVIM_DIR)/, $(NVIM_FILES))
	rm -fr $(WINDOWS_NVIM_PLUGIN_DIR)
