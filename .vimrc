"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

call pathogen#infect()
" autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
:set mouse=a
set et 
set sw=4 
set smarttab

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set rtp+=~/.fzf

syntax enable
set background=dark
let g:solarized_termtrans = 1
let g:solarized_termcolors=256
let g:solarized_contrast='high'
colorscheme solarized
set t_Co=256

filetype plugin indent on
set autoindent		" always set autoindenting on
set nobackup		" do not keep a backup file, use versions instead
set history=50		" keep 50 lines of command line history
set number
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set laststatus=2
set encoding=utf-8
set linebreak
let g:Powerline_symbols = 'fancy'

let g:indent_guides_auto_colors = 0
"let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 4
let g:indent_guides_color_change_percent = 10

autocmd BufReadPre,FileReadPre * :IndentGuidesEnable
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#121212 ctermbg=237
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#121212 ctermbg=236


nnoremap <C-m> :call NERDComment(0,"toggle")<C-m>

" Don't use Ex mode, use Q for formatting
map Q gq

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")

setlocal shell=/bin/sh
