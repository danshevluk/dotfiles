" Plugins setup
call plug#begin(expand('$HOME/.config/nvim/bundle'))
" Navigation
Plug 'kyazdani42/nvim-tree.lua'
Plug 'ryanoasis/vim-devicons'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'nvim-telescope/telescope.nvim'

"  Formatting
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" Code completion
Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"  Themes
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'folke/tokyonight.nvim'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'f-person/auto-dark-mode.nvim'

call plug#end()

" Basic
syntax on
set encoding=utf-8
set nocompatible

" Turn off bells
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Style
set termguicolors
set background=dark
colorscheme onedark

"" Auto Theme Switch
lua << EOF
local auto_dark_mode = require('auto-dark-mode')
auto_dark_mode.setup({
	update_interval = 1000,
	set_dark_mode = function()
		vim.api.nvim_set_option('background', 'dark')
		vim.cmd('colorscheme onedark')
	end,
	set_light_mode = function()
		vim.api.nvim_set_option('background', 'light')
		vim.cmd('colorscheme tokyonight')
        vim.g.tokyonight_style = 'day'
	end,
})
auto_dark_mode.init()
EOF

set relativenumber
set autoread
set clipboard=unnamed
set number

set tabstop=4
set shiftwidth=4
set backspace
set shiftround
set smarttab
set expandtab

set autoindent
set smartindent
set wrap
set laststatus=2
set expandtab
set scrolloff=3
set colorcolumn=120
set hidden

" Search
set showmatch
set hlsearch
set incsearch
set ignorecase

" Autocomplete
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=number
nnoremap <silent> K :call ShowDocumentation()<CR>

" Mappings
let mapleader = "\\"
nnoremap <Leader><Leader> :noh<return>
vmap <C-c> :w !pbcopy<CR><CR>
"" Exit terminal
tnoremap <Esc> <C-\><C-n>

" Spell check
" nmap <silent> <leader>s :set spell!<CR>

inoremap <silent><expr> <Leader>l coc#refresh()

" Navigation --------------------

"" Tree view
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

"" Telescope
nnoremap <Leader>ff <cmd>Telescope find_files<cr>
nnoremap <Leader>fg <cmd>Telescope live_grep<cr>

lua << EOF
require'nvim-tree'.setup { }
EOF

"" Panels switch
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <Leader>v :vsplit<enter>
nnoremap <Leader>s :split<enter>

nnoremap <S-h> 0
nnoremap <S-l> $

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'

" YCM
let g:ycm_min_num_of_chars_for_completion = 0
let g:ycm_auto_trigger = 1
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
set omnifunc=syntaxcomplete#Complete

" Ruby
autocmd FileType ruby,eruby setlocal sw=2 ts=2 sts=2
autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" Swift
autocmd BufNewFile,BufRead *.swift set filetype=swift

" Filetypes
au BufRead,BufNewFile Podfile setfiletype ruby
au BufRead,BufNewFile Fastfile setfiletype ruby
au BufRead,BufNewFile Appfile setfiletype ruby

" Indent guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black   ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgray ctermbg=237

let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Trailing whitespaces
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc

autocmd BufWrite *.m,*.h,*.py,*.rb,*.swift,*.c,*.js :call DeleteTrailingWS()

