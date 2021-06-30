" Fix Vim into replace mode when startup
if $TERM =~ 'xterm'
  set noek
endif
nnoremap <silent> <esc> <esc>:noh<cr>

filetype plugin indent on
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set visualbell	" Use visual bell (no beeping)
set t_vb=
 
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally
set nohlsearch
 
set autoindent	" Auto-indent new lines
set shiftwidth=2	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=2	" Number of spaces per Tab
set expandtab
 
" Advanced
set ruler	" Show row and column ruler information
 
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

set nu rnu
set rtp+=~/.fzf
set pastetoggle=<F2>

" Settings for splitting

" Map moving combinations
nnoremap <C-K> <C-W><C-K>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Upcase in insert mode
inoremap <C-u> <Esc>viwUea

" Natural split opening
set splitbelow
set splitright

runtime macros/matchit.vim

" Plugins ------ {{{
call plug#begin('~/.vim/plugged')

Plug 'kana/vim-textobj-user'

Plug 'nelstrom/vim-textobj-rubyblock'

Plug 'tpope/vim-surround'

Plug 'vim-ruby/vim-ruby'

Plug 'tpope/vim-rails'

Plug 'tpope/vim-unimpaired'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'junegunn/fzf.vim'

Plug 'itchyny/lightline.vim'

Plug 'terryma/vim-multiple-cursors'

Plug 'tpope/vim-eunuch'

Plug 'scrooloose/nerdtree'

Plug 'thoughtbot/vim-rspec'

Plug 'editorconfig/editorconfig-vim'

Plug 'mattn/emmet-vim'

Plug 'w0rp/ale', { 'on': 'ALEToggle' }

Plug 'tpope/vim-fugitive'

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tomtom/tcomment_vim'

Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-rbenv'

Plug 'tpope/vim-bundler'

Plug 'ervandew/supertab'

Plug 'ecomba/vim-ruby-refactoring'

Plug 'https://github.com/easymotion/vim-easymotion.git'

Plug 'udalov/kotlin-vim'

" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

Plug 'https://github.com/tpope/vim-endwise'

Plug 'pangloss/vim-javascript'

Plug 'kchmck/vim-coffee-script'
" }}}

" UltiSnips ------ {{{
"" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" }}}

let mapleader = " "

call plug#end()

" Mapping jk in insert mode as Esc
inoremap jk <Esc>

" NERDTree bindings
map <Leader>\ :NERDTreeToggle<CR>
map <Leader><bar> :NERDTreeFind<CR>

"Mapping opening search pane using ;
map <Leader>o :Files<CR>

"Set timeout delay
set timeoutlen=1000 ttimeoutlen=0

" Previous file
map <Leader><Tab> <C-^>

" Bind reselect pasted text
nnoremap gp `[v`]

" Show cursor underline to indicate Insert Mode 
" autocmd insertenter,insertleave * set cul!

" Autosave the buffer when leave
set autowrite

" Try to map ale_fix
nmap <F8> <Plug>(ale_fix)

" Mapping edit and sourcing .vimrc 
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Run test current line
nnoremap <leader>rt V:Runner<cr>

" ALE bindings
nnoremap <leader>at :ALEToggle<cr>
nnoremap <leader>aj :ALENext<cr>
nnoremap <leader>ak :ALEPrevious<cr>

" New row with 1 blank line between
nnoremap <leader>m o<esc>o

" Set autowrite
set autowrite

" Leader for easy motion
map <Leader> <Plug>(easymotion-prefix)

" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" JK easymotion
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

map <Leader>L <Plug>(easymotion-bd-jk)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" Move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

iabbrev afsl # frozen_string_literal: true<cr>

" Vimscript file settings ------ {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Ruby file settings ------ {{{
augroup filetype_rails
  autocmd!
  autocmd FileType ruby,haml,coffee iabbrev <buffer> def def<CR><Esc>dd<Up>A
  " Fast search accross files for function definition of visual selected function name
  autocmd FileType ruby,haml,coffee vnoremap <buffer> <C-d> iwy:Ag def <C-r>"<CR>
  autocmd FileType ruby,haml,coffee nnoremap <buffer> <C-m> :Emodel 
augroup END
" }}}

augroup filetype_ruby
  autocmd!
  autocmd FileType ruby iabbrev <buffer> TD # TODO,
augroup END

augroup filetype_markdown
  autocmd!
  autocmd FileType markdown onoremap <buffer> ih :<C-u>execute "normal! ?^[=-][=-]\\+$\r:nohlsearch\rkvg_"<CR>
augroup END

" Fast search accross files for visual selected text
vnoremap <C-f> y:Ag <C-r>"<CR>

" Enter Ag search
nnoremap <C-f> :Ag 

" Prefix \v in search
nnoremap / /\v

" Movements
onoremap in( :<C-u>normal! f(vi(<CR>
onoremap il( :<C-u>normal! F(vi(<CR>

set foldlevelstart=0

" Hightlight TODO and todo's content
match Todo /TODO,/
match PmenuSel /\v(TODO, )@<=.*$/

" map saving in normal mode
nnoremap <C-[> :w<CR>
