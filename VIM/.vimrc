" $Author: Mihai Şucan $
" $Edited : Meghanad Shingate 
" $Blog: http://linux-myubuntu.blogspot.com/

"set verbose=9

" Only run the script once
if exists("g:did_myvimrc")
  finish
endif

let g:did_myvimrc = 1

" Overview:
" - I use vim 7 in xterminals (gnome-terminal, console, gvim, etc) on light
"   backgrounds.
" - In non-xterminals (like the typical linux terminal) I use dark
"   backgrounds.
" - Generally, I don't change default vim keyboard shortcuts, such that I can
"   use 'pristine' vim installations as well.
" - I enable all the 'cool' features: code folding, syntax highlighting,
"   automatic complete, filetype plugins, indentation, line numbering, custom
"   ruler, custom status line.
" - Even if I use gvim, I actually don't use the GUI features. I disable
"   pretty much everything, except the menus.
" - I use vim modelines.
" - I use the longer names for commands and settings (e.g. 'tabstop' instead
"   of 'ts'), for readability.
" - When saving files the RD_FileWritePre() function checks for $Date: ... $
"   to update the date.
" - I enabled .exrc/.vimrc files per-directory, and I disabled any unsafe
"   commands in such files.
" - New keyboard shortcuts:
"   _' _{ _( _[ _< _t _W _T _c _C _"
"   These are selection wrappers. Select something and type _' to have single
"   quotes around the selection. In normal mode type _W to unwrap the string.
"   For example move over the ' single quote character and type _W: this will
"   remove the ' and the other matching quote.
"   _t and _T are for XML/HTML tags. _t to wrap the selection around a given
"   tag name. _T to strip the tag under the cursor.
"   _c and _C are for comments. It will detect the file type and use propers
"   comments.
" - New command: Fullscreen. Nice for editing text-only documents.
" - I use the matchit and taglist plugins. I do not use XML edit plugins.
" - I have my own XML edit functions, which I like better than those available
"   online in other scripts.
" - New abbreviations:
"   isodate
"   Adds the date in ISO format: 2008-11-04 22:43:09 +0200.
"
"   $Date$
"   Adds the date in ISO format, with a twist: $Date: 2010-12-02 22:56:42 +0530 $ 
"
"   rdcopy
"   My usual 'copyright' notice.
"
" Problems:
" - _c and _C (comment wrapping) is not very good at the moment.
" - XML/HTML editing still needs improvements, but it's usable.


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
set ignorecase

" Auto-complete
" =============

" Scanning included files is really slow for Perl files
" Maybe I should change this only for Perl files
set complete-=i 

" Turn on wild menu which shows auto-complete options in the command mode
set wildmenu


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

"set backup
"set backupcopy=auto
"set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*test*,*temp*,*tmp*,*tst*,*~,*bak

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

" Do not highlight the string we searched.
set nohlsearch 

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

filetype plugin on


"Information about syatem library:

set tags+=/usr/local/include/tags
set tags+=/usr/include/tags

"This builds tags libs for the current working directory (it's super fast):

map <F8> :!/usr/bin/ctags --extra=+f   --langdef=file    --langmap='file:..txt.'    -R .<CR>


" it is useful to have vim search recursively upwards for the tags file:

set tags=tags;/

"so that you only need tags file only in parent directory:

autocmd BufEnter * lcd %:p:h



nnoremap <silent> <C-w> :TlistToggle<CR>
let Tlist_Exit_OnlyWindow = 1     " exit if taglist is last window open
let Tlist_Show_One_File = 1       " Only show tags for current buffer
let Tlist_Enable_Fold_Column = 0  " no fold column (only showing one file)
let tlist_sql_settings = 'sql;P:package;t:table'
let tlist_ant_settings = 'ant;p:Project;r:Property;t:Target'


color morning

"colorscheme solarized

"colorscheme autumn2

map <C-c> "+y<CR>
