
" NeoBundle Settings
if has('vim_starting')
    set nocompatible
    filetype off
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'

" My bundles
NeoBundle 'baskerville/bubblegum'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'bling/vim-airline'
"NeoBundle 'georgefs/vim-copycat'
NeoBundle 'ervandew/supertab'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'oscarh/vimerl'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'nvie/vim-flake8'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'kchmck/vim-coffee-script'



"" Vimrc Part
"" Global settings
let mapleader=","

"" Google JavaScript Linter
let g:syntastic_javascript_checkers = ['gjslint']
let g:syntastic_erlc_include_path = "~/erlang/r15b03/bin/"

"" VIM settings
syntax on
filetype plugin indent on
set ofu=syntaxcomplete#Complete
set mouse=a
set number
set numberwidth=5
set showmode
set showcmd
" for indentation
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set shiftround
set cindent
set smartindent
set autoindent

set nocompatible

set wildmenu
set wildmode=longest:full,full

"" for search
set hlsearch
set incsearch

"" Set do not expand the tab to spaces if the editing file is makefile
autocmd BufRead,BufNewFile makefile,MAKEFILE set noexpandtab
autocmd BufRead,BufNewFile *.sh set omnifunc=syntaxcomplete#Complete
autocmd BufRead,BufNewFile *.webapp,*.json set ft=json
autocmd BufRead,BufNewFile volofile set ft=javascript
autocmd BufRead,BufNewFile *.tpl set ft=htmldjango
autocmd BufRead,BufNewFile *.md set ft=markdown
autocmd BufRead,BufNewFile boss.*config set ft=erlang
autocmd BufWritePost *.py call Flake8()

"" ZenCoding
let g:user_emmet_mode='inv'
let g:user_emmet_expandabbr_key = '<c-e>'
let g:user_emmet_complete_tag = 1
let g:user_emmet_settings = {
\    "indentation" : "    "
\}

"" Key Mappings
" tab config
map tn :tabnext<CR>
map tp :tabprev<CR>
map te :tabnew 
map tc :tabclose<CR>
" buffer config
map bn :bn<CR>
map bp :bp<CR>
map ba :badd 
map bd :bd<CR>
" Normal Mode時,可用tab及shift-Tab做縮排
nmap <tab> v>
nmap <s-tab> v<
" Visual/Select Mode時，也行
vmap <tab> >gv
vmap <s-tab> <gv

"" Function Keys
map <F1> :NERDTreeToggle<CR>
map <F2> :TagbarToggle<CR>
map <F5> :let @/=""<CR>

"" pageup/pagedown
map <c-j> <c-f>
map <c-k> <c-b>

"" NerdTree related
" open a NERDTree automatically when vim starts up:
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


"" Solarized Color Theme
syntax enable
set t_Co=256
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

"" Status line
set laststatus=2

"" Command-T related settings
nnoremap <silent> <Leader>t :CommandT<CR>
nnoremap <silent> <Leader>b :CommandTBuffer<CR>

let g:SuperTabDefaultCompletionType = "context"

""Jedi related settings
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = "<C-p>"
let g:jedi#show_call_signatures = 0
let g:jedi#use_splits_not_buffers = 'right'

"autocmd FileType python set omnifunc=pythoncomplete#Complete
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

"resizing window with up/down/right/left arrow key
noremap   <Right> <c-w>l
noremap   <Left> <c-w>h
noremap   <Up> <c-W>k
noremap   <Down> <c-W>j

map f <Leader><Leader>f
map F <Leader><Leader>F

" cursor will return to the beginning of the next line after exceed the end of line
set whichwrap+=<,>,h,l,[,]

"" Airline settings
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'bubblegum'


"" Copycat
let g:copycat#auto_sync = 1
let g:copycat#overwrite_ctrlkeys = 0

set clipboard=unnamed
