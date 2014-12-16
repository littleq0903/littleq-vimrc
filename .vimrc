" `git clone git@github.com:Shougo/neobundle.vim.git` to ~/.vim/bundle at first

" NeoBundle Settings
if has('vim_starting')
    set nocompatible
    filetype off
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'

" My bundles
NeoBundle 'baskerville/bubblegum'
NeoBundle 'altercation/vim-colors-solarized'
"NeoBundle 'jnwhiteh/vim-golang'
"NeoBundle 'georgefs/vim-copycat'
"NeoBundle 'nvie/vim-flake8'
"NeoBundle 'klen/python-mode'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ervandew/supertab'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'oscarh/vimerl'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'andviro/flake8-vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'jmcantrell/vim-virtualenv'
NeoBundle 'leshill/vim-json'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'mmozuras/vim-github-comment'
NeoBundle 'mattn/webapi-vim.git'
NeoBundle 'gkz/vim-ls'
NeoBundle 'shougo/vimshell'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'rizzatti/funcoo.vim'
NeoBundle 'rizzatti/dash.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'Pychimp/Pychimp-vim'
NeoBundle 'farseer90718/flattr.vim'
NeoBundle 'hynek/vim-python-pep8-indent'

call neobundle#end()

NeoBundleCheck

"" Vimrc Part
"" Global settings
let mapleader=","


"" VIM settings
syntax on
filetype plugin indent on
set ofu=syntaxcomplete#Complete
set mouse=a
set number
set numberwidth=5
set showmode
set showcmd
set modeline

"" Indentation
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

""" Filetype detection
autocmd BufRead,BufNewFile *.webapp,*.json set ft=json
autocmd BufRead,BufNewFile volofile set ft=javascript
autocmd BufRead,BufNewFile *.tpl set ft=htmldjango
autocmd BufRead,BufNewFile *.md set ft=markdown
autocmd BufRead,BufNewFile boss.*config set ft=erlang

""" related to javascript-libraries-syntax.vim
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1


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

"" Dash.vim
map <c-b> :Dash<CR>

"" NerdTree related
" open a NERDTree automatically when vim starts up:
autocmd vimenter * if !argc() | NERDTree | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


"" Solarized Color Theme
syntax on
set t_Co=256
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="high"

set background=dark
colorscheme bubblegum

" clean background color
highlight Normal ctermbg=None


set cursorline
"set cursorcolumn

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
"noremap   <Up>     <NOP>
"noremap   <Down>   <NOP>
"noremap   <Left>   <NOP>
"noremap   <Right>  <NOP>

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
set backspace=indent,eol,start

" Dim inactive windows using 'colorcolumn' setting
" This tends to slow down redrawing, but is very useful.
" Based on https://groups.google.com/d/msg/vim_use/IJU-Vk-QLJE/xz4hjPjCRBUJ
" XXX: this will only work with lines containing text (i.e. not '~')
function! s:DimInactiveWindows()
  for i in range(1, tabpagewinnr(tabpagenr(), '$'))
    let l:range = ""
    if i != winnr()
      if &wrap
        " HACK: when wrapping lines is enabled, we use the maximum number
        " of columns getting highlighted. This might get calculated by
        " looking for the longest visible line and using a multiple of
        " winwidth().
        let l:width=300 " max
      else
        let l:width=winwidth(i)
      endif
      let l:range = join(range(1, l:width), ',')
    endif
    call setwinvar(i, '&colorcolumn', l:range)
  endfor
endfunction
augroup DimInactiveWindows
  au!
  au WinEnter * call s:DimInactiveWindows()
augroup END

" vim-github-comment plugin
let g:github_user = 'littleq0903'

" gkz/vim-ls
au BufNewFile,BufReadPost *.ls setl foldmethod=indent nofoldenable
au BufNewFile,BufReadPost *.ls setl shiftwidth=2 expandtab

" andviro/flake8-vim
let g:PyFlakeCWindow = 10
let g:PyFlakeRangeCommand = 'Q'
let g:PyFlakeMaxLineLength = 100
let g:PyFlakeDisabledMessages = 'W0311,E501'
let g:PyFlakeOnWrite = 1

"" scrooloose/syntastic
let g:syntastic_javascript_checkers = ['gjslint']
let g:syntastic_erlc_include_path = "~/erlang/r15b03/bin/"
