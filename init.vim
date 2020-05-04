call plug#begin('~/.vim/plugged')
" Plugin for language
Plug 'mxw/vim-jsx' 
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'StanAngeloff/php.vim'
Plug 'sheerun/vim-polyglot'
" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-tsserver', 'coc-vetur', 'coc-phpls']
" Linting / Error
Plug 'w0rp/ale'
" Commenter
Plug 'scrooloose/nerdcommenter'
" Multiple cursor
Plug 'terryma/vim-multiple-cursors'
" Formatter
Plug 'sbdchd/neoformat'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
" NerdTree File Explorer
Plug 'scrooloose/nerdtree'
" Auto pair bracket, quotes, etc
Plug 'jiangmiao/auto-pairs'
"CTRL + P
Plug 'ctrlpvim/ctrlp.vim'
" GIt
Plug 'tpope/vim-fugitive'
" Formatter
Plug 'sbdchd/neoformat'
" Theme
Plug 'morhetz/gruvbox'
if (has("termguicolors"))
 set termguicolors
endif
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'mhartington/oceanic-next'
Plug 'nanotech/jellybeans.vim'
Plug 'cocopon/iceberg.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
call plug#end()

if (has("termguicolors"))
 set termguicolors
endif
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme gruvbox
set background=dark
let g:airline_theme='iceberg'

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" set leader key
let g:mapleader = "\<Space>"

syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed 
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			            " Show the cursor position all the time
set iskeyword+=-                      	" treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=0                        " Always display the status line
set relativenumber                      " Line numbers
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=100                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else

nmap <silent> <C-D> :NERDTreeToggle<CR>
nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

"Change icon for ALE
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'


augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

