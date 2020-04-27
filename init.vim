call plug#begin('~/.vim/plugged')
" Plugin for jsx format
Plug 'mxw/vim-jsx' 
" Plugin for language
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'StanAngeloff/php.vim'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'sheerun/vim-polyglot'
"Autocomplete
 "if has('nvim')
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
  " Plug 'Shougo/deoplete.nvim'
  " Plug 'roxma/nvim-yarp'
  " Plug 'roxma/vim-hug-neovim-rpc'
" endif
" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-tsserver', 'coc-phpls', 'coc-vetur']
" Linting / Error
Plug 'w0rp/ale'
" Formatter
Plug 'sbdchd/neoformat'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
" NerdTree File Explorer
Plug 'scrooloose/nerdtree'
" Auto pair bracket, quotes, etc
Plug 'jiangmiao/auto-pairs'

"CTRL + P
Plug 'ctrlpvim/ctrlp.vim'

" Theme
" Plug 'morhetz/gruvbox'
if (has("termguicolors"))
 set termguicolors
endif
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'mhartington/oceanic-next'
Plug 'cocopon/iceberg.vim'
Plug 'vim-airline/vim-airline'

"Vim icon
" Plug 'ryanoasis/vim-devicons'

call plug#end()

if (has("termguicolors"))
 set termguicolors
endif
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme OceanicNext
let g:airline_theme='dracula'

let $NVIM_TUI_ENABLE_TRUE_COLOR=1


filetype plugin indent on
" let g:deoplete#enable_at_startup = 1
syntax on 
set relativenumber
set incsearch
set ignorecase
set smartcase
set nohlsearch
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set nowrap
set hidden
set noswapfile
set nobackup
set nowritebackup
set updatetime=300

set shortmess+=c

nmap <silent> <C-D> :NERDTreeToggle<CR>
nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)

"Change icon for ALE
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

let g:prettier#autoformat = 1
