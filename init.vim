" Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
" Plugin for languange
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-tsserver']
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'morgsmccauley/vim-react-native-snippets'

 " Linting / Error
Plug 'w0rp/ale'

" Formatter
Plug 'sbdchd/neoformat'

" Basic Editing
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-highlightedyank'

" Fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'

" Git
Plug 'tpope/vim-fugitive'

" Theme
Plug 'vim-airline/vim-airline'
Plug 'haishanh/night-owl.vim'
Plug 'ayu-theme/ayu-vim'
call plug#end()

set nocompatible " not vi compatible

" Syntax and indent "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch " show matching braces when text indicator is over them

set clipboard+=unnamedplus
" Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors
syntax on " turn on syntax highlighting
syntax enable           " enable syntax processing
let ayucolor="dark"
colorscheme ayu
" Editor settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
set nu 					                " number lines
set rnu 		                		" relative line numbering
set incsearch 				            " incremental search (as string is being typed)
set hls 				                " highlight search
set noshowmode 				            " hide mode
set mouse=a                             " Enable your mouse
set ruler              			        " Show the cursor position all the time
set updatetime=300                      " Better completion

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<Space>"

" Buffer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden              " Allows having hidden buffers (not displayed in any window)
set signcolumn=yes

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" Un mapping setting
nmap Q <Nop>
map <C-a> <Nop>   
map <C-x> <Nop>

"Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " Ignore case in searches by default
set smartcase           " But make it case sensitive if an uppercase is entered
" turn off search highlight
vnoremap <C-f> :nohlsearch<cr>
nnoremap <C-f> :nohlsearch<cr>

" Mapping Editor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

" Decent wildmenu
set wildmenu
set wildmode=longest:full,full:
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor

" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Move by line
nnoremap j gj
nnoremap k gk

" Jump to start and end of line using the home row keys
map H ^
map L $

" Change ESC 
inoremap jk <Esc>
inoremap kj <Esc>

" Better tabbing
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
vnoremap < <gv
vnoremap > >gv

" Other Setting
set showcmd " Show (partial) command in status line.

" Better Copy / Paste
vmap <leader>p :read !xsel --clipboard --output<cr>
map <leader>c :w !xsel -ib<cr><cr>

map <Leader>y "*y
map <Leader>p "*p
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fzf
noremap <leader>s :Rg
map <C-p> :Files<CR>
nmap <leader>b :Buffers<CR>
noremap <leader>s :Rg

" ctrlp
nnoremap <leader>b :CtrlPBuffer<CR>
let g:ctrlp_switch_buffer = 0
let g:ctrlp_show_hidden = 1

" Default COC Baisc
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Setting for NerdCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" Setting for NeoFormat
nmap <leader>nf :NeoFormat<cr> 
let g:neoformat_try_formatprg = 1
let g:neoformat_enabled_javascript = ['prettier']
" For Formatting javascript file
augroup NeoformatAutoFormat
    autocmd!
    autocmd FileType javascript setlocal formatprg=prettier\
                                             \--stdin\
                                             \--print-width\ 80\
                                             \--single-quote\
                                             \--trailing-comma\ es5
    autocmd BufWritePre *.js Neoformat
augroup END
" For Formatting jsx file
augroup NeoformatAutoFormat
    autocmd!
    autocmd FileType javascript,javascript.jsx setlocal formatprg=prettier\
                                                            \--stdin\
                                                            \--print-width\ 80\
                                                            \--single-quote\
                                                            \--trailing-comma\ es5
    autocmd BufWritePre *.js,*.jsx Neoformat
augroup END
