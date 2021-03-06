source $HOME/.config/nvim/vim-plug/plugins.vim

syntax enable
filetype plugin indent on
set number
set modifiable
set mouse=a
autocmd vimenter * ++nested colorscheme gruvbox

" Completion
"-- Better completion
"-- menuone: popup even when there's only one match
"-- noinsert: Do not insert text until a selection is made
"-- noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

"-- Better display for messages
set cmdheight=2
"-- You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

"-- Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

set guioptions-=T 
set vb t_vb=
set backspace=2
set nofoldenable
set ttyfast
set lazyredraw
set synmaxcol=500
set laststatus=2
set relativenumber
set number 
set diffopt+=iwhite 
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic
" set colorcolumn=80 
set showcmd 
set shortmess+=c 

let g:rustfmt_autosave=1
let NERDTreeShowHidden=1

if has("autocmd")
  au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" Set completeopt to have a better completion experience
" " :help completeopt
" " menuone: popup even when there's only one match
" " noinsert: Do not insert text until a selection is made
" " noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" " Avoid showing extra messages when using completion
set shortmess+=c
"
"" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Up>   pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"

" use <Tab> as trigger keys
" "imap <Tab> <Plug>(completion_smart_tab)
" "imap <S-Tab> <Plug>(completion_smart_s_tab)
"
map <F2> :NERDTreeToggle<CR>
"
" " Code navigation shortcuts
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nmap <leader>w :w<CR>
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "<C-n>" : "<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "<C-p>" : "<S-Tab>"

" " Configure LSP
" " https://github.com/neovim/nvim-lspconfig#rust_analyzer
if has('nvim')
	set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
  set inccommand=nosplit
  noremap <C-q> :confirm qall<CR>
  noremap @q ciw""<Esc>P
endif


lua <<EOF

-- nvim_lsp object
local nvim_lsp = require'lspconfig'

-- function to attach completion when setting up lsp
local on_attach = function(client)
  require'completion'.on_attach(client)
end

-- Enable rust_analyzer
nvim_lsp.rust_analyzer.setup({ on_attach=on_attach   })


-- autocmd CursorHold,CursorHoldI *.rs :lua require'lsp_extensions'.inlay_hints{ only_current_line = true  }

EOF
