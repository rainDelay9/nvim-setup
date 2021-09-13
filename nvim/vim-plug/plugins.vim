" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	"autocmd VimEnter * PlugInstall
	"autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

     " Better Syntax Support
     Plug 'sheerun/vim-polyglot'
     " File Explorer
     Plug 'scrooloose/NERDTree'
     " Auto pairs for '(' '[' '{'
     Plug 'jiangmiao/auto-pairs'
		 " Collection of common configurations for the Nvim LSP client
		 Plug 'neovim/nvim-lspconfig'
		 " Extensions to built-in LSP, for example, providing type inlay hints
		 Plug 'nvim-lua/lsp_extensions.nvim'
		 " Autocompletion framework for built-in LSP
		 Plug 'nvim-lua/completion-nvim'
		 Plug 'neoclide/coc.nvim', {'branch': 'release'}
		 Plug 'morhetz/gruvbox'
		 Plug 'wadackel/vim-dogrun'
		 Plug 'machakann/vim-highlightedyank'
call plug#end()
