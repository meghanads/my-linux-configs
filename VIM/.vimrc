" $Author: Mihai Şucan $
" $Edited : Meghanad Shingate 
" $Blog: http://linux-myubuntu.blogspot.com/

"set verbose=9

" Only run the script once
if exists("g:did_myvimrc")
  finish
endif

let g:did_myvimrc = 1



" Script settings
" ===============

" Memory usage: I allow vim to use a lot of memory.
let s:RD_use_mem = 1

" I allow vim to use colors
let s:RD_use_conn = 1

" I allow vim to save as much information as possible.
let s:RD_privacy = 0

" I change the above values as needed when I copy my .vimrc to different servers.


" Settings
" ========

" I do not like the vi-compatible mode.
set nocompatible 

" Make backspace work as usual.
set backspace=indent,eol,start 

" Diff option: ignore whitespace
set diffopt+=iwhite

" Allow changing the buffer without saving.
set hidden 

if s:RD_use_mem
	" How many lines of history to remember.
	set history=1000 

	" Use all the memory needed, for maximum performance.
	set maxmemtot=2000000 
	set maxmem=2000000 
	set maxmempattern=2000000 
endif


" Do not place the cursor at the start of the line when using Page up/down.
set nostartofline

set nrformats=alpha,hex

" Allow the cursor to be positioned where there is no actual character.
" Visual block mode only.
set virtualedit=block

if s:RD_privacy == 1
	set viminfo=''
else
	" Remember information between vim restarts.
	set viminfo='200,<300,s150,%,h,! 
endif

" Allow specified keys that move the cursor left/right to move to the previous/next line when the cursor is on the first/last character in the line.
" b (backspace), s (space) and the arrows.
set whichwrap=b,s,<,>

" Case insensitive search
" ======================
set ignorecase	  " ignore case
set smartcase     " ignore case if search pattern is all lowercase,
                  " case-sensitive otherwise

" Auto-complete
" =============

" Scanning included files is really slow for Perl files
" Maybe I should change this only for Perl files
" set complete-=i 

" Turn on wild menu which shows auto-complete options in the command mode
" set wildmenu


" File-related
" ============

" Unicode support
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,latin1,default

" Support all three, in this order
set fileformats=unix,dos,mac 

" Detect the type of file and enable filetype-specific indenting.
filetype plugin indent on 


" Backups
" ========

" Make backups...
"set backup
"set backupcopy=auto
"set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*test*,*temp*,*tmp*,*tst*,*~,*bak

"NO backups please ....
set nobackup
set noswapfile
" Start the Visual/Selection mode with using Shift+Arrows/etc
set keymodel=startsel


" User interface
" ==============

if has("gui_win32")
	set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI
endif

if (has("gui_running") || $TERM == 'xterm')
	set background=light
else
	set background=dark
endif

" The command line height.
set cmdheight=2

" As much as possible of the last line in a window will be displayed. When not included, a last line that doesn't fit is replaced with "@" lines.
set display=lastline

" GUI Options:
if has("gui_running")
	" GUI cursor: no blinking
	set guicursor+=a:blinkon0

	" no toolbar
	set guioptions-=T
	" no autoselect 
	set guioptions-=a

	" Use console messages instead of GUI dialogs
	set guioptions+=c
endif

" Always show the status line
set laststatus=2

" Don't blink!
set novisualbell 

" Show the line numbers.
set number

" Threshold for reporting number of lines changed.
set report=0

" Enable the ruler with the format:
" {buffer number}{modified/readonly flag}: {file type} [current line, current column] {position percentage in file}
set ruler
set rulerformat=%25(%n%m%r:\ %Y\ [%l,%v]\ %p%%%)

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=3

" Shorter messages.
set shortmess=as 

" Show (partial) command in status line.
set showcmd

" Status line format:
" {buffer number}: {file name, relative path to the current working directory}{modified flag}{readonly flag}
" {help flag}{preview flag} [file type, encoding, format] [current line-total lines, current column][position percentage in file]
set statusline=%n:\ %f%m%r%h%w\ [%Y,%{&fileencoding},%{&fileformat}]\ [%l-%L,%v][%p%%]

if s:RD_use_conn
	set ttyfast
endif

" Do not redraw while running macros (much faster).
set lazyredraw 

" What to show when you do :set list.
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$ 

" Allow using the mouse everywhere.
set mouse=a


" Formatting and indenting
" ========================

set formatoptions=tcroqn " see help

" Automatic indenting, on new line.
set autoindent

" Enable C-style indenting.
set cindent 

" Real tab chars.
set noexpandtab

" Smart indenting, based on the typed code.
set smartindent 

" Tab spacing.
set tabstop=4 
set shiftwidth=4
set softtabstop=4

" Use tabs at the start of a line, spaces elsewhere.
set smarttab 

" If on Vim will wrap long lines at a character in 'breakat' rather than at the last character that fits on the screen.
set linebreak


" Syntax highlighting and related
" ===============================

if s:RD_use_conn
	" Enable syntax highlighting
	syntax on
endif

" Show matching brackets.
set showmatch 

" highlight the string we searched.
set hlsearch 

" Highlight the searched string, while typing.
set incsearch


" Make the Home key jump to the first non-white space, or to the start of the
" line.
"inoremap <silent> <Home> <C-o>:call <SID>RD_map_home('i')<CR>
"vnoremap <silent> <Home> :<C-u>call <SID>RD_map_home('v')<CR>
"nnoremap <silent> <Home> :call <SID>RD_map_home('n')<CR>

let mapleader='_'

" Quick way to change the directory to the file I am currently editing
noremap <silent> <Leader>. :exe 'cd ' . substitute(expand("%:p:h"), ' ', "\\\\ ", 'g')<CR>



" Variables
" =========

" Changes for the :TOhtml command
let use_xhtml = 1
let html_use_css = 1
let html_ignore_folding = 1
let html_number_lines = 0

" Changes for the TagList
let Tlist_Enable_Fold_Column = 0
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Sort_Type = 'order'
let Tlist_Use_Right_Window = 1
let Tlist_Inc_Winwidth = 0










" The end
" =======

" Enable .exrc files (.vimrc files per-directory)
set exrc

" Disable any unsafe commands in .exrc files
set secure


"Added by Meghanad:
"=================

"Enable Taglist plugin : http://www.thegeekstuff.com/2009/04/ctags-taglist-vi-vim-editor-as-sourece-code-browser/

"filetype plugin on


"Information about syatem library:

set tags+=/usr/local/include/tags
set tags+=/usr/include/tags

"This builds tags libs for the current working directory (it's super fast):

" map <F8> :!/usr/bin/ctags --extra=+f   --langdef=file    --langmap='file:..txt.'    -R .<CR>


" it is useful to have vim search recursively upwards for the tags file:

set tags=tags;/

"so that you only need tags file only in parent directory:

autocmd BufEnter * lcd %:p:h


" shows list of variable, functions in side window - toggle
nnoremap <silent> <F8> :TlistToggle<CR>

let Tlist_Exit_OnlyWindow = 1     " exit if taglist is last window open
let Tlist_Show_One_File = 1       " Only show tags for current buffer
let Tlist_Enable_Fold_Column = 0  " no fold column (only showing one file)
let tlist_sql_settings = 'sql;P:package;t:table'
let tlist_ant_settings = 'ant;p:Project;r:Property;t:Target'
let Tlist_Use_SingleClick = 1	  "use single click to jump to the tag
let Tlist_GainFocus_On_ToggleOpen = 1 "automatically switch to taglist window
let Tlist_Highlight_Tag_On_BufEnter = 1 "highlight current tag in taglist window
let Tlist_Display_Prototype = 1 "display full prototype instead of just function name


" colour schemes
" ==============
color morning

"colorscheme solarized

"colorscheme autumn2

"map <C-c> "+y<CR>



" http://nvie.com/posts/how-i-boosted-my-vim/
" ===========================================
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set pastetoggle=<F2>

nnoremap ; :

" clear searched highlights on pressing "./"
nmap <silent> ./ :nohlsearch<CR>

" CommandT mapping
" ================
nnoremap <silent> ,t :CommandT<CR>


" show line and column markers
" =============================
 "set cursorline
 "set cursorcolumn


" enable soft word wrap
" =====================
set formatoptions=l
set lbr


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

