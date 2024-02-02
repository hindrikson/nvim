# Neovim config

This neovim config has a lot functionalities while keeping minimal. You can
check them all in the plugins directory.

## Keymaps 
Some plugins have keymaps on their own, so you may check their
documentation, (vimtex, commentary, among others).

## Instructions To install: 
    - for mason:
        * node (via node version manager if you will)
    - for telescope: 
        * ripgrep (for telescope)

To start copilot run ":Copilot auth signin" and follow the instructions.

On vimwiki.lua you should specify the paths for your own vimwiki directories.

Since I am using lazygit, I am not adding fugitive or gitsigns.

When using the **debugger** make sure to disable conda environment, or specify the
python binary of the current environment you are using by inserting the right
path on the setup function of dap-python in the debugger.lua file.

## Problems
* ensure_install on mason lspconfig [may](may) not work, so install the servers
  manually via ":Mason".
