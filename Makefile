VIM_DIR := ~
VIM_FILES := .vimrc .gvimrc
VIM_SUB_DIR := $(VIM_DIR)/.vim
VIM_SUB_FILES := map.vim color.vim plugin.vim misc.vim

NVIM_DIR := ~/.config/nvim
NVIM_PLUGIN_DIR := ~/.cache/dein
NVIM_FILES := init.vim map.vim color.vim plugin.vim misc.vim

.PHONY: all clean FORCE
all: dein.vim

dein.vim:
	git clone --depth 1 https://github.com/Shougo/dein.vim -b 2.2 $@

clean:
	rm -rf dein.vim

FORCE:


# Install
.PHONY: install install-vim install-vim-files install-vim-dein install-nvim install-nvim-files install-nvim-dein
install: install-vim install-nvim

# Install Vim
install-vim: install-vim-files install-vim-dein

install-vim-files: $(VIM_FILES) $(VIM_DIR) $(VIM_SUB_FILES) $(VIM_SUB_DIR)
	cp -rf $(VIM_FILES) $(VIM_DIR)/
	cp -rf $(VIM_SUB_FILES) $(VIM_SUB_DIR)/

$(VIM_DIR):
	mkdir $@

$(VIM_SUB_DIR):
	mkdir $@

install-vim-dein: $(VIM_DIR)/.vim/bundles/repos/github.com/Shougo/dein.vim
	vim "+call dein#install()" +qall

$(VIM_DIR)/.vim/bundles/repos/github.com/Shougo/dein.vim: dein.vim
	mkdir -p $@
	cp -rfT $< $@

# Install Neovim
install-nvim: install-nvim-files install-nvim-dein

install-nvim-files: $(NVIM_FILES) $(NVIM_DIR)
	cp -rf $(NVIM_FILES) $(NVIM_DIR)/

$(NVIM_DIR):
	mkdir $@

install-nvim-dein: $(NVIM_PLUGIN_DIR)/repos/github.com/Shougo/dein.vim
	nvim "+call dein#install()" +qall

$(NVIM_PLUGIN_DIR)/repos/github.com/Shougo/dein.vim: dein.vim
	mkdir -p $@
	cp -rfT $< $@

# Uninstall
.PHONY: uninstall uninstall-vim uninstall-nvim
uninstall: uninstall-vim uninstall-nvim

uninstall-vim:
	rm -rf $(addprefix $(VIM_DIR)/, $(VIM_FILES))
	rm -rf $(VIM_SUB_DIR)

uninstall-nvim:
	rm -rf $(addprefix $(NVIM_DIR)/, $(NVIM_FILES))
	rm -rf $(NVIM_PLUGIN_DIR)


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
	cp -rf $(VIM_FILES) $(WINDOWS_VIM_DIR)/
	cp -rf $(VIM_SUB_FILES) $(WINDOWS_VIM_SUB_DIR)/

$(WINDOWS_VIM_DIR):
	mkdir $@

$(WINDOWS_VIM_SUB_DIR):
	mkdir $@

windows-install-vim-dein: $(WINDOWS_VIM_DIR)/.vim/bundles/repos/github.com/Shougo/dein.vim

$(WINDOWS_VIM_DIR)/.vim/bundles/repos/github.com/Shougo/dein.vim: dein.vim
	mkdir -p $@
	cp -rfT $< $@

# Install Neovim in Windows
windows-install-nvim: windows-install-nvim-files windows-install-nvim-dein

windows-install-nvim-files: $(WINDOWS_NVIM_DIR) $(NVIM_FILES)
	cp -rf $(NVIM_FILES) $(WINDOWS_NVIM_DIR)/

$(WINDOWS_NVIM_DIR):
	mkdir $@

windows-install-nvim-dein: $(WINDOWS_NVIM_PLUGIN_DIR)/repos/github.com/Shougo/dein.vim

$(WINDOWS_NVIM_PLUGIN_DIR)/repos/github.com/Shougo/dein.vim: dein.vim
	mkdir -p $@
	cp -rfT $< $@

# Uninstall in Windows
.PHONY: windows-uninstall windows-uninstall-vim windows-uninstall-nvim
windows-uninstall: windows-uninstall-vim windows-uninstall-nvim

windows-uninstall-vim:
	rm -rf $(addprefix $(WINDOWS_VIM_DIR)/, $(VIM_FILES))
	rm -rf $(WINDOWS_VIM_SUB_DIR)

windows-uninstall-nvim:
	rm -rf $(addprefix $(WINDOWS_NVIM_DIR)/, $(NVIM_FILES))
	rm -rf $(WINDOWS_NVIM_PLUGIN_DIR)
