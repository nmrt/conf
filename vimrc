if exists("g:loaded_user_vimrc") 
  finish 
endif

" Vundle stuff
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'embear/vim-localvimrc'

" Syntax & style
Plugin 'jelera/vim-javascript-syntax'
"Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/syntastic'
"Plugin 'wookiehangover/jshint.vim'
"Plugin 'walm/jshint.vim'
"Plugin 'maksimr/vim-jsbeautify'
"Plugin 'einars/js-beautify'

" Navigation
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-unimpaired'
"Plugin 'mileszs/ack.vim'
Plugin 'FuzzyFinder'
  Plugin 'L9' " required by FuzzyFinder
Plugin 'easymotion/vim-easymotion'
"Plugin 'wincent/command-t'
Plugin 'PeterRincker/vim-argumentative'

" Editing & completion
Plugin 'tpope/vim-surround'
"Plugin 'Raimondi/delimitMate'
Plugin 'tomtom/tcomment_vim'
"Plugin 'scrooloose/nerdcommenter'
if !filereadable(expand('~/.at_google'))
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'marijnh/tern_for_vim'
endif
Plugin 'tpope/vim-repeat'
Plugin 'Olical/vim-enmasse'

" Snippets
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" SCM
"Plugin 'git://repo.or.cz/vcscommand'
Plugin 'tpope/vim-fugitive' " Git
Plugin 'mhinz/vim-signify'

" Themes
Plugin 'tomasr/molokai'
Plugin 'bling/vim-airline'
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
"set spell
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

" Leader
let mapleader = ","

" Previous, next tab
nmap <C-n> gt
nmap <C-p> gT

" Removal of the last digit of [count]
map  <Del>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" <C-j> and carriage return are the same
map <C-j> <CR>
lmap <C-j> <CR>
omap <C-j> <CR>

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

" Copy file name
nnoremap <silent> cp :let @+ = expand("%")<CR>

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" PLUGINS
" TODO Clean up this stuff, ideally distribute plugins' configuration into
" separate files and infer their repositories from local path.
" https://github.com/Olical/dotfiles

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

" TeX
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
" Suppose you want to remap the <C-j> key which Latex-Suite (actually
" imaps.vim) uses to jump to the next placeholder. 
"imap <C-space> <Plug>IMAP_JumpForward
let g:Tex_DefaultTargetFormat = 'pdf'
au BufWritePost *.tex silent call Tex_RunLaTeX()

" Ruby
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
let g:rubycomplete_load_gemfile = 1
let g:rubycomplete_use_bundler = 1

" MAN & :help
runtime! ftplugin/man.vim
set keywordprg=:help

" JS
"au FileType javascript call JavaScriptFold()
"au FileType javascript set foldmethod=syntax
" TODO Revert back to auto mode after patching Vim to 1-7. But for now using old
" engine, so that pangloss/vim-javascript and jelera/vim-javascript work.
"au FileType javascript set regexpengine=1 | syntax enable

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
"let g:syntastic_auto_jump = 3
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" TComment options
let g:tcommentOptions = {'whitespace': 'no'}

" Git (fugitive)
"set statusline+=%{fugitive#statusline()}

" easymotion
map <Leader> <Plug>(easymotion-prefix)
nmap / <Plug>(easymotion-sn)\v
xmap / y/"
omap / <Plug>(easymotion-tn)\v
nmap ? /
xmap ? /
omap ? <Plug>(easymotion-Tn)\v
nmap * /<>
" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
nmap n <Plug>(easymotion-next)
nmap N <Plug>(easymotion-prev)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0 " keep cursor colum JK motion
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
let g:EasyMotion_smartcase = 1
au BufNewFile,BufRead * EMCommandLineNoreMap <c-j> <cr>

" YouCompleteMe
let g:ycm_key_list_select_completion = ['<Down>']

" ultisnips
let g:UltiSnipsExpandTrigger="<c-i>"
let g:UltiSnipsJumpForwardTrigger="<c-i>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" FuzzyFinder
map <Leader>ff :FufFile<CR>
map <Leader>fb :FufBuffer<CR>
let g:fuf_keyOpen = '<c-j>'
let g:fuf_keyOpenSplit = '<c-w><c-j>'
let g:fuf_keyOpenTabpage = '<c-w><c-t>'

" airline
set laststatus=2
"let g:airline#extensions#tabline#enabled = 1

" Extensions
if filereadable(expand("~/.vim_extensions"))
  source ~/.vim_extensions
endif

" !!! WARNING !!!
" MAKE SURE THERE IS NO CONFIGURATION BEYOND THIS POINT

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif
