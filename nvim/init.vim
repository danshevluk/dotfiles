" NeoBundle Scripts-----------------------------
if has('vim_starting')
  set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
  set runtimepath+=~/.config/nvim/
endif

let neobundle_readme=expand('~/.config/nvim/bundle/neobundle.vim/README.md')

if !filereadable(neobundle_readme)
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.config/nvim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.config/nvim/bundle/neobundle.vim/
  let g:not_finsh_neobundle = "yes"
endif

call neobundle#begin(expand('$HOME/.config/nvim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

" ------------------------------------
"  Navigation
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'kien/ctrlp.vim'

"  Formatting
NeoBundle 'Chiel92/vim-autoformat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tomtom/tcomment_vim'

"  Languages and frameworks
NeoBundle 'tpope/vim-rails'
NeoBundle 'keith/swift.vim'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'udalov/kotlin-vim'

NeoBundle 'Shougo/deoplete.nvim'
NeoBundle 'mitsuse/autocomplete-swift'

NeoBundle 'pangloss/vim-javascript'

"  Themes
NeoBundle 'bling/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'dracula/vim'

" ------------------------------------
call neobundle#end()
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

" Basic
syntax on
set encoding=utf-8
set nocompatible

" Beeps are evil!
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Style
colorscheme dracula

" set relativenumber
set autoread
set clipboard=unnamed
set number
set tabstop=2
set shiftwidth=2
set backspace=2
set shiftround
set smarttab
set expandtab
set et
set autoindent
set smartindent
set nowrap
set scrolloff=3
set laststatus=2
set colorcolumn=120

" Search
set showmatch
set hlsearch
set incsearch
set ignorecase

"====================
" Mappings
let mapleader = "\\"
nnoremap <Leader><Leader> :noh<return>
vmap <C-c> :w !pbcopy<CR><CR>
noremap <Leader>= :Autoformat<CR>
"" Exit terminal
tnoremap <Esc> <C-\><C-n>

" Resize splits
nnoremap <C-k> <C-w>+
nnoremap <C-j> <C-w>-
nnoremap <C-l> <C-w><
nnoremap <C-h> <C-w>>

" Nerd tree
map <C-n> :NERDTreeToggle<CR>

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'murmur'

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

"================ Vim indent guides ==============

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black   ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgray ctermbg=237

let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

autocmd BufWrite *.m,*.h,*.py,*.rb,*.swift,*.c,*.js :call DeleteTrailingWS()

let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,ruby-rails'
