"set copyindent " copy the previous indentation on autoindenting
set hidden
set nowrap        " don't wrap lines*/ 
set tabstop=4     " a tab is four spaces 
set backspace=indent,eol,start " allow backspacing over everything in insert mode 
set autoindent " always set autoindenting on 
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

" no annoying start screen
set shortmess=atl

:nnoremap <expr> r ':!clear<cr>:w!<cr>:!node ~/Viclib/node_modules/makels.js %:p<cr>'
:nnoremap <expr> <leader>i ':!clear<cr>:w!<cr>:!node ~/Viclib/node_modules/makels.js ~/Viclib/smasharena/index.ls<cr>'

" NERDTree stuff
:let NERDTreeIgnore = ['\.js$']
:let NERDTreeChDirMode = 2
":nmap <leader>t :NERDTree<cr>:set nu<cr>
":nmap <leader>t :NERDTreeToggle<cr>
:nmap <expr> <enter> v:count1 <= 1 ? "<C-h>C<C-w>p" : "@_<C-W>99h". v:count1 ."Go<C-w>l"
:map <delete> <C-h>u<C-w>p
":nmap <expr> <leader>c "@_<C-W>99h". v:count1 ."Go<C-w>l"
au VimEnter * NERDTree
au VimEnter * set nu
au VimEnter * wincmd p
:nmap <expr> <leader>t ":ClearCtrlPCache<cr>:NERDTree<cr>:set nu<cr><C-w>l"

" save easier
:nmap <leader>s :w!<cr>

" Can I solve the ESC out of home problem?
:inoremap ☮ <esc>
:vnoremap ☮ <esc>
:cnoremap ☮ <esc>
" test test when I'm used to using ;j instead of <esc>
":inoremap <esc> <esc>a

" OSX shared clipboard
:set clipboard=unnamed

" quit
:nmap <leader>q :q!<cr>

:map <expr> <space> ":CtrlP ".getcwd()."<cr>"
":let g:ctrl_p_working_path_mode = 'r'
":let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|js)$'
:set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.js     " MacOSX/Linux




" ConqueTerm
:nmap <expr> <leader>c ":sp<cr>12<C-w>+99<C-w>j:ConqueTerm bash<cr>"
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
"au BufEnter * :!ls


" Change Color when entering Insert Mode
hi cursorline cterm=none ctermbg=white
au InsertEnter * set cursorline
au InsertLeave * set nocursorline

"highlight Cursor guifg=white guibg=black
"highlight iCursor guifg=white guibg=steelblue
"set guicursor=n-v-c:block-Cursor
"set guicursor+=i:ver100-iCursor
"set guicursor+=n-v-c:blinkon0
"set guicursor+=i:blinkwait10




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

" word wrap
:set wrap
:set linebreak
:set nolist  " list disables linebreak
:set textwidth=0
:set wrapmargin=0

" leader = ,
" :let mapleader = "," 
:map , <leader>

" join
:nnoremap <leader>j J

" node.js
" :nnoremap <expr> r ':w!<cr>' . 
"	\ ':!osascript ~/applescripts/chromereload.scpt &<cr>'.
"	\ (stridx(@%,".ls")!=-1 ? 
"		\ ':!lsc -d -b -c %<cr>:!' + (stridx(@%,'app')!=-1 ? 'browserify' : 'node') + '.@%[:-4]<cr>' :
"		\ ':!node %<cr>')


" :nmap <expr> R
"	\ ':w!<cr>' . 
"	\ (stridx(@%,".ls")!=-1 ? ':!lsc -d -c %<cr>' : '') .
"	\ ':!sh ~/Viclib/node_modules/make_bundle.sh<cr>' .
"	\ ':!osascript ~/applescripts/chromereload.scpt &<cr>' .
"	\ (strlen(matchstr(@%,'\.[jl]s$'))>0 ? ':!node ' .@%[:-4].'.js<cr>' : '')

" \ ':!node ~/Viclib/node_modules/htmlify %<cr>' .
" :nnoremap <expr> R 
"	\ ':w!<cr>' . 
"	\ (stridx(@%,".ls")!=-1 ? ':!lsc -b -c %<cr>' : '') .
"	\ ':!osascript ~/applescripts/chromereload.scpt &<cr>' .
"	\ ':!node ' .@%[:-4].'.js<cr>'
" :nnoremap <expr> R 
"	\ ':w!<cr>' . 
"	\ (stridx(@%,".ls")!=-1 ? ':!lsc -b -c %<cr>:!browserify '.@%[:-4].'.js -o '.@%[:-4].'.bundle.js<cr>:!rm '.@%[:-4].'.js<cr>:!mv '.@%[:-4].'.bundle.js '.@%[:-4].'.js<cr>' : '') .
"	\ ':!osascript ~/applescripts/chromereload.scpt &<cr>'

" ':w!<cr>' . 'r' . ':!osascript ~/applescripts/chromereload.scpt &<cr>'
" ':!rsync -r -e ssh ~/Viclib/* vh@maia.im:~/Viclib/ &<cr>' 
":imap <D-s> <esc><D-s>

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

" commands
" :nnoremap <leader>q q: 

" easymotion
:nmap f <leader><leader>f
:vmap f <leader><leader>f
:omap f <leader><leader>f
:nmap F <leader><leader>F
:vmap F <leader><leader>F
:omap F <leader><leader>F

" CTRL+y = redo
":nmap <C-y> U
":omap <C-y> U
":vmap <C-y> U

" MARKS SHORTCUTS, LIST OF MARKS
:nnoremap m `
:nnoremap M m
:nnoremap <leader>m :marks abcdefghijklmnopqrstuvwxyz<cr>

" quit
:map <leader>q :q!<cr>:q!<cr>:q!<cr>:q!<cr>:q!<cr>:q!<cr>:q!<cr>


" navigates through marks (if exist), if not, moves fast
:nnoremap <S-j> 4j
:nnoremap <S-k> 4k
:vnoremap <S-j> 4j
:vnoremap <S-k> 4k

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


set autoread
" augroup checktime
    " au!
    " if !has("gui_running")
        " "silent! necessary otherwise throws errors when using command
        " "line window.
        " autocmd BufEnter        * silent! checktime
        " autocmd CursorHold      * silent! checktime
        " autocmd CursorHoldI     * silent! checktime
        " autocmd CursorMoved     * silent! checktime
        " autocmd CursorMovedI    * silent! checktime
    " endif
" augroup END

function! Wipeout()
  " list of *all* buffer numbers
  let l:buffers = range(1, bufnr('$'))

  " what tab page are we in?
  let l:currentTab = tabpagenr()
  try
    " go through all tab pages
    let l:tab = 0
    while l:tab < tabpagenr('$')
      let l:tab += 1

      " go through all windows
      let l:win = 0
      while l:win < winnr('$')
        let l:win += 1
        " whatever buffer is in this window in this tab, remove it from
        " l:buffers list
        let l:thisbuf = winbufnr(l:win)
        call remove(l:buffers, index(l:buffers, l:thisbuf))
      endwhile
    endwhile

    " if there are any buffers left, delete them
    if len(l:buffers)
      execute 'bwipeout' join(l:buffers)
    endif
  finally
    " go back to our original tab page
    execute 'tabnext' l:currentTab
  endtry
endfunction
" :let $PATH=$HOME.'/bin:'.$HOME.'/Android/platform-tools:'.$PATH*/
" :let mapleader = ","*/



" FOLDING
map - zr
map + zm
"set foldtext=MyFoldText()
"set foldmethod=expr
"set foldexpr=GetPotionFold(v:lnum)
autocmd BufEnter * normal zR
function! MyFoldText()
	let lines = 1 + v:foldend - v:foldstart
	let spaces = repeat(' ', indent(v:foldstart))

	let linestxt = 'lines'
	if lines == 1
		linestxt = 'line'
	endif

	let firstline = getline(v:foldstart)
	let line = firstline[ind : ind+80]

	return spaces . substitute(getline(v:foldstart), "\t", "", "g")
	return spaces . '+' . v:folddashes . ' ' . lines . ' ' . linestxt . ': ' . line . ' '
endfunction


function! GetPotionFold(lnum)
    if getline(a:lnum) =~? '\v^\s*$'
		return '-1'
	endif

	let this_indent = IndentLevel(a:lnum)
	let next_indent = IndentLevel(NextNonBlankLine(a:lnum))

	if next_indent == this_indent
		return this_indent
	elseif next_indent < this_indent
		return this_indent
	elseif next_indent > this_indent
		return '>' . next_indent
	endif
endfunction

function! IndentLevel(lnum)
    return indent(a:lnum) / &shiftwidth
endfunction

function! NextNonBlankLine(lnum)
    let numlines = line('$')
	let current = a:lnum + 1

	while current <= numlines
		if getline(current) =~? '\v\S'
			return current
		endif

		let current += 1
	endwhile

	return -2
endfunction
highlight Folded ctermfg=Black ctermbg=white





