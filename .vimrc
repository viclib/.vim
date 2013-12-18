set ttyfast
set nofoldenable
set ttyscroll=3
set lazyredraw
set hidden
set wrap      
set tabstop=4     " a tab is four spaces 
set backspace=indent,eol,start " allow backspacing over everything in insert mode 
set autoindent    " always set autoindenting on 
set number        " always show line numbers 
set shiftwidth=4  " number of spaces to use for autoindenting 
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>' 
set showmatch     " set show matching parenthesis 
set ignorecase    " ignore case when searching 
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise 
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop 
set hlsearch      " highlight search terms 
set incsearch     " show search matches as you type 
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set nobackup
set noswapfile
set nocompatible
set viminfo='1000,f1,<500,:100,/100,h  "
set shortmess=atl " no annoying start screen
set linebreak
set nolist  " list disables linebreak
set textwidth=0
set wrapmargin=0


:map z :!clear;

:map j gj
:map k gk

:nmap <leader>d :w!<cr>:!clear<cr>:!ghc -o %:r %<cr>:!./%:r<cr>
:nnoremap <expr> <leader>i ':!clear<cr>:w!<cr>:!node ~/Viclib/node_modules/makels.js ~/Viclib/smasharena/index.ls<cr>'

" temp
let gcc_opts = '-I/usr/local/Qt-5.1.1/include'
:nnoremap <expr> r ':!clear<cr>:w!<cr>'.(
	\ &ft=='python' ? ':!python %<cr>' : 
	\ &ft=='scheme' ? ':!csc %<cr>:!./%:r<cr>' : 
	\ &ft=='racket' ? ':!racket %<cr>' : 
	\ &ft=='dvl' ? ':!dvl run %<cr>' : 
	\ &ft=='javascript' ? ':!node %<cr>' :
	\ &ft=='haskell' ? ':!ghc -o %:r %<cr>:!./%:r<cr>' : 
	\ &ft=='idris' ? ':!idris % -o %:r<cr>:!./%:r<cr>' :
	\ expand('%:t')=='maingl.cpp' ? ':!clang++ -std=c++11 '.gcc_opts.' -framework OpenGL -framework GLUT % -o %:r;./%:r<cr>' :
	\ &ft=='c' ? ':!clang -Wall -std=c99 % -o %:r<cr>:!./%:r<cr>' : 
	\ &ft=='cpp' ? ':!clang++ ' . gcc_opts . ' -std=c++11 -stdlib=libc++ % -o %:r<cr>:!./%:r<cr>' : 
	\ &ft=='agda' ? ':!agda % -o %:r<cr>:!./%:r<cr>' :
	\ &ft=='ls' ? ':!node ~/Viclib/node_modules/makels.js %:p<cr>' :
	\ ':!lis % > %:r.js<cr>:!node %:r.js<cr>')
	"\ &ft=='cpp' ? ':!g++ % -o %:r<cr>:!./%:r<cr>' : 
	"\ expand("%:t")=='index.ls' ? ':!appls '.expand("%:r").'<cr>:!browserrefresh<cr>' :
	"\ ':!node ~/Viclib/node_modules/makels.js %:p<cr>')
	"\ expand("%:t")=='index.ls' ? ':!appls '+expand('%:r')+'' :
	"\ ':!lsc -cp '.expand("%:p").' > '.expand("%:r.js").'<cr>')
	"\ expand("%:t")=='index.ls' ? ':!appls '.expand("%:t:r").'<cr>' : 
	"\ ':!lsc -cp '.expand("%:p").' > '.expand("%:r.js").'<cr>')

" :nmap <expr> <leader>r 'r:!killall node; node ~/Viclib/server.js 8080<cr>'

" NERDTree stuff
":let NERDTreeIgnore = ['\.js$','\.pyc$']
:let NERDTreeChDirMode = 2
:nmap <expr> <enter> v:count1 <= 1 ? "<C-h>C<C-w>p" : "@_<C-W>99h". v:count1 ."Go<C-w>l"
au VimEnter * NERDTree
au VimEnter * set nu
au VimEnter * wincmd p
:nmap <expr> <leader>t ":ClearCtrlPCache<cr>:NERDTree<cr>:set nu<cr><C-w>l"

" Can I solve the ESC out of home problem?
:inoremap ☮ <esc>
:vnoremap ☮ <esc>
:cnoremap ☮ <esc>

" shared clipboard
:set clipboard=unnamed

:map <expr> <space> ":CtrlP ".getcwd()."<cr>"
":set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.js,*.pyc     " MacOSX/Linux
:set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc     " MacOSX/Linux

" ConqueTerm
":nmap <expr> <leader>c ":sp<cr>12<C-w>+99<C-w>j:ConqueTerm bash<cr>"
":nnoremap <leader>r 10<C-w>jaclear<cr>sudo node server 80<cr><esc><C-w>p

" PBufferWindows
:map <left> 4<C-w><
:map <right> 4<C-w>>
:map <up> 4<C-w>-
:map <down> 4<C-w>+
:noremap <C-j> <esc><C-w>j
:noremap <C-k> <esc><C-w>k
:noremap <C-h> <esc><C-w>h
:noremap <C-l> <esc><C-w>l
:map! <C-j> <esc><C-w>j
:map! <C-k> <esc><C-w>k
:map! <C-h> <esc><C-w>h
:map! <C-l> <esc><C-w>l

" Change Color when entering Insert Mode
hi cursorline cterm=none ctermbg=white
au InsertEnter * set cursorline
au InsertLeave * set nocursorline

" vim-ls
call pathogen#runtime_append_all_bundles()
hi link lsSpaceError NONE
hi link lsReservedError NONE

" Vim can automatically change the current working directory to the directory where the file you are editing lives. 
" set autochdir*/

" space to enter command
" :nnoremap <space> :
:syntax on

" cursor always in middle of screen
:set so=99999


:map , <leader>

" join
:nnoremap <leader>j J

" default the statusline to green when entering Vim
hi StatusLine ctermfg=lightblue ctermbg=black
hi StatusLineNC ctermfg=lightgray ctermbg=black
hi VertSplit ctermfg=lightgray ctermbg=black

" NERDComment
:map ! <leader>c<space>

" d/ to unhighlight search matches
:nnoremap d/ :nohl<cr>

" R to search&replace
" :nnoremap R :%s/*/

" macros
:nnoremap q qa<esc>
:nnoremap Q @a

" vimrc autosave
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so ~/.vim/.vimrc "$MYVIMRC
augroup END
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" previous and next location
:nnoremap <C-u> <C-o>
":nnoremap <C-i> <C-i>

" easymotion
:nmap f <leader><leader>f
:vmap f <leader><leader>f
:omap f <leader><leader>f

" MARKS SHORTCUTS, LIST OF MARKS
:nnoremap m `
:nnoremap M m
:nnoremap <leader>m :marks abcdefghijklmnopqrstuvwxyz<cr>

" quit
:map <leader>q :q!<cr>:q!<cr>:q!<cr>:q!<cr>:q!<cr>:q!<cr>:q!<cr>:q!<cr>:q!<cr>:q!<cr>:q!<cr>:q!<cr>:q!<cr>

" navigates through marks (if exist), if not, moves fast
:nnoremap <S-j> 6j
:nnoremap <S-k> 6k
:vnoremap <S-j> 6j
:vnoremap <S-k> 6k

" line join (because <S-j> is taken)
:nnoremap <leader>j J

" go to previous location
:nmap <D-h>	<C-o>

" :inoremap <S-space> <tab>
:nmap ( <<
:nmap ) >>
:nmap <tab> >>
:nmap <S-tab> << 
:map U <C-r>
:nmap <C-j> <C-w>j
:nmap <C-k> <C-w>k
:nmap <C-l> <C-w>l
:nmap <C-h> <C-w>h

" begin/end of line
:nnoremap H ^
:nnoremap L $
:vnoremap H ^
:vnoremap L $

" idris ft
"au BufNewFile,BufRead *.ls set filetype=Livescript
au BufNewFile,BufRead *.idr set filetype=idris
au BufNewFile,BufRead *.agda set filetype=agda
au BufNewFile,BufRead *.lis set filetype=lis
au BufNewFile,BufRead *.dvl set filetype=dvl

" C++11 syntax
au BufNewFile,BufRead *.cpp set syntax=cpp11
