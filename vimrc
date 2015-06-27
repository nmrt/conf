if exists("g:loaded_user_vimrc") 
  finish 
endif

" Vundle stuff
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'

"Plugin 'wookiehangover/jshint.vim'
"Plugin 'walm/jshint.vim'
Plugin 'tomasr/molokai'
call vundle#end()

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark
set guifont=Ubuntu\ Mono\ 11
"set guioptions-=L
set guioptions-=T
set guioptions+=c
if !has('gui_running')
  set t_Co=256
endif
let g:molokai_original = 1
colorscheme molokai

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set hlsearch
set number
set expandtab
set shiftwidth=2
set smarttab
set smartindent
"set autoindent
set splitbelow
set splitright
" TODO may be not secure
"set modeline
set history=1024
set path+=/usr/lib/gcc/x86_64-linux-gnu/$GCC_VER/include
set listchars=eol:$,tab:>-,trail:-,extends:>,precedes:<
"set noequalalways
set diffopt+=vertical
"set selection=exclusive
"set virtualedit=block
set nojoinspaces

"au WinLeave * set nocursorline nocursorcolumn
"au WinEnter * set cursorline cursorcolumn

" TODO take a closer look at this
"set switchbuf=
"set tildeop

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

" TODO slower, but with aliases etc.
"      breaks `vimdiff' !!! probably because of the `alias' of `diff' ...
"      `ls' produces color escape sequences,
"      even if the $TERM is "dumb", e.g. in GUI
"set shellcmdflag^=-i\ 

"set directory=/var/tmp/
"set grepprg=grep\ -nH
set switchbuf=usetab
set viminfo+=r/tmp

" Spelling & 80+ columns highlighting
"set nospell
set spell
autocmd InsertEnter * 3match Error /\%>80v/
autocmd InsertLeave * 3match none
"autocmd InsertEnter * set spell
"autocmd InsertLeave * set nospell
autocmd BufNewFile,BufRead *.phps set ft=php
autocmd BufNewFile,BufRead *.vimperatorrc* set ft=vimperator

" Session related options
"set sessionoptions-=blank
"set sessionoptions-=buffers
set sessionoptions-=options
set sessionoptions+=localoptions
set sessionoptions+=winpos
set sessionoptions+=resize
let g:session_directory = '.vim-sessions'
let g:session_autosave = 'no'

" Edit process related options
set scrolloff=5
set softtabstop=8
set mousemodel=popup_setpos

" Command line completion related options
"set wildmode=longest:full
"set wildmenu
set wildmode=list:longest
set wildoptions+=tagfile
set wildignorecase

" Clipboard related options
"set clipboard-=autoselect
"set clipboard^=unnamedplus
"set guioptions-=a
"set shellcmdflag=-ic

" Clipboard related key mappings
vnoremap <C-C> "+y
vnoremap <C-X> "+x
map <C-V> "+gP
cmap <C-V> <C-R>+
exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
exe 'vnoremap <script> <C-V> ' . paste#paste_cmd['v']

" Command to write with root permissions
"command W w !sudo tee % > /dev/null
command W w
command Q q

" Window Manager
"let g:winManagerWindowLayout = 'FileExplorer,TagList'

" Mini Buffer Explorer
let g:miniBufExplSplitToEdge = 0
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplModSelTarget = 1

" NERD Tree
nmap <silent> <F5> :NERDTreeFind<CR>
vmap <silent> <F5> <Esc><F5>
imap <silent> <F5> <Esc><F5>

let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeShowBookmarks = 1
let NERDTreeMapHelp = '<F1>'
let NERDTreeWinSize = 50
let NERDTreeBookmarksFile = ".NERDTreeBookmarks"

" Tagbar
nmap <silent> <F9> :TagbarToggle<CR>
vmap <silent> <F9> <Esc><F9>
imap <silent> <F9> <Esc><F9>
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1

" Buffer Explorer (not Mini)
"nmap <silent> <F6> :BufExplorer<CR>
"vmap <silent> <F6> <Esc><F6>
"imap <silent> <F6> <Esc><F6>
" TODO this causes slow down when scrolling
"      if NERDTree plugin is installed
"nmap <silent> <C-TAB> <F5>jt
"vmap <silent> <C-TAB> <Esc><C-TAB>
"imap <silent> <C-TAB> <Esc><C-TAB>
let g:bufExplorerDefaultHelp = 0
let g:bufExplorerShowRelativePath = 1

" Tag List
"let Tlist_Auto_Open = 1
"let Tlist_Close_On_Select = 1
let Tlist_File_Fold_Auto_Close = 1
" NOTE add `gv' to :vmap and replace <Esc> with <C-o> in :imap
" after commenting next line out
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Process_File_Always = 1
"let Tlist_Show_Menu = 1
let Tlist_Use_Right_Window = 1
"let Tlist_Use_SingleClick = 1
nmap <silent> <F8> :TlistToggle<CR>
vmap <silent> <F8> <Esc><F8>
imap <silent> <F8> <Esc><F8>

" PHP
"let php_sql_query = 1
let php_htmlInStrings = 1
autocmd FileType php let php_sync_method = -1

" Snippets
let g:snippets_dir = '~/.vim/snippets/,~/.vim/snippets/my/'

" Previous, next tab
nmap <C-n> gt
nmap <C-p> gT

" Removal of the last digit of [count]
map  <Del>

" Search for selected text
vmap / y/<C-R>"<CR>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" <C-j> and carriage return are the same
map <C-j> <CR>
imap <C-j> <CR>

command SearchComm /\(^\s*\)\@<=\v(\/\/|#|")\V\[ !]\@!
command ClearEmptyLines %s/\v^\s+$//
command SS SaveSession
command OS OpenSession

set textwidth=78
set foldmethod=indent
set modeline
"set formatoptions+=a " Automatic formatting of paragraphs.
set formatoptions+=n " Numbered lists.
set formatoptions+=l " Long lines are not broken in insert mode.
set formatoptions+=1 " Don't break a line after a one-letter word.
set formatoptions+=j " Remove a comment leader when joining lines.

" Disablement of non-undoable :only shortcut
nnoremap <C-W>o <Esc>
nnoremap <C-W><C-O> <Esc>

" For vim-javascript
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

nnoremap <silent> cp :let @+ = expand("%")<CR>

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" Suppose you want to remap the <C-j> key which Latex-Suite (actually
" imaps.vim) uses to jump to the next placeholder. 
imap <C-space> <Plug>IMAP_JumpForward

let g:Tex_DefaultTargetFormat = 'pdf'
au BufWritePost *.tex silent call Tex_RunLaTeX()

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
let g:rubycomplete_load_gemfile = 1
let g:rubycomplete_use_bundler = 1

let g:local_vimrc = '.vimrc'
let g:loaded_user_vimrc = 1

" MAN 
runtime! ftplugin/man.vim

" For jelera/vim-javascript-syntax plugin
au FileType javascript call JavaScriptFold()

" Indent Guides
"let g:indent_guides_guide_size = 1

" Disable matchparen plugin, so that it doesn't throw errors
let loaded_matchparen = 1

" delimitMate
let delimitMate_expand_cr = 1

" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_jump = 3
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
