# Neovim config

This neovim config has a lot functionalities while keeping minimal. You can
check them all in the plugins directory.

To use vimtex on windows from a wsl: you have to install SumatraPDF
1. install SumatraPDF
2. Copy the sumatrapdf.sh file from https://github.com/lervag/vimtex/issues/2566#issuecomment-1322886643 
   into you ~/.local/bin folder
3. Remember to make it executable with chomod +x
4. Adjust the vimtex.lua file as indicated


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

## Note
* mason-lspconfig "ensure_installed" does not map all the servers that can be installed. The following servers have to be installed manually via :Mason.
    - debugpy
    - mypy
    - black

## vimtex not working from wsl with sumatra
Check this https://github.com/lervag/vimtex/issues/1585
