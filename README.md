# Neovim config

This neovim config has a lot functionalities while keeping minimal. You can
check them all in the plugins directory.

To use vimtex on windows from a wsl: you have to install SumatraPDF on windows
1. install SumatraPDF
2. Add sumatrapdf.exe to your WINDOWS path so it can be called from wsl
   console.
3. Copy the sumatrapdf.sh file from
   https://github.com/lervag/vimtex/issues/2566#issuecomment-1322886643 into
   /usr/local/bin directory in your wsl.
4. Remember to make it executable with chomod +x, and to make sure the
   /usr/local/bin is in your wsl path by adding it to your bashrc or zshrc.
5. In your wsl home directory, add a ".wsl_flag" file to your home directory ("touch .wsl_flag")
6. The script in vimtex.lua is going to check if you are on a wsl or on a
   normal linux and set the according options.


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

Since I am using lazygit, I am not adding fugitive.

When using the **debugger** make sure to disable conda environment, or specify the
python binary of the current environment you are using by inserting the right
path on the setup function of dap-python in the debugger.lua file.

## ltex
DO NOT install ltex via mason. If you have install ltex via mason, delete it.
Install it by downloading the tar file from the github releases page. Extract
the tar file, then copy the folder to the /opt/ directory, and add the bin
folder to your path. Add then require'lspconfig'.ltex.setup{} to your lsp
[config](config). This should work.
   


## Note
* mason-lspconfig "ensure_installed" does not map all the servers that can be installed. The following servers have to be installed manually via :Mason.
    - debugpy
    - mypy
    - black

* on after/ftplugin you can specify filetyper specific settings.

