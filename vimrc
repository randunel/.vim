call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set list
set listchars=tab:▸\ ,eol:.
set number
set noswapfile
set nowritebackup
set backupdir=~/.vim/backup
set nocompatible

"set t_Co=256
"color fu
color bclear

let MRU_File = '/tmp/mru'

filetype off
filetype plugin indent on

if has("autocmd")
  " Enable file type detection
  filetype on

  autocmd BufNewFile,BufRead *.ejs set filetype=html
  autocmd BufNewFile,BufRead Jakefile set filetype=javascript
  autocmd FileType yaml       setlocal ts=2 sts=2 sw=2 et
  autocmd FileType jade       setlocal ts=2 sts=2 sw=2 et
  autocmd FileType ejs        setlocal ts=2 sts=2 sw=2 et
  autocmd FileType ruby       setlocal ts=2 sts=2 sw=2 et
  autocmd FileType cucumber   setlocal ts=2 sts=2 sw=2 noet nolist
  autocmd FileType php        setlocal ts=2 sts=2 sw=2 et
  autocmd FileType make       setlocal ts=4 sts=4 sw=4 noet
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 et
  autocmd FileType coffee     setlocal ts=4 sts=4 sw=4 et

  autocmd FileType html       setlocal ts=2 sts=2 sw=2 et
  autocmd FileType css        setlocal ts=2 sts=2 sw=2 et

  autocmd FileType php let b:surround_45 = "<?php \r ?>"
  autocmd FileType ruby let b:surround_45 = "<% \r %>"
  autocmd FileType ruby let g:surround_61 = "<%= \r %>"
endif

" 80 column hl
" set colorcolumn=80

set autoindent
" Additional 3 lines padding
set so=3

" 10 milliseconds timeout lenght
set tm=10

" setup folding
set foldmethod=marker
set foldlevel=3

" very short timeout
set tm=5

" scrolloff 3 lines
set so=3

" By default, Vim makes it difficult to create hidden buffers. To make Vim
" more liberal about hidden buffers
set hidden

map <silent> <F5> :NERDTreeToggle<CR>
nmap <F6> A do<ESC>oend<ESC>O

" Bubble single lines
nmap <C-Down> ddp=kj
nmap <C-Up> ddkP=j
" Bubble multiple lines
vmap <C-Up> xkP`[V`]=
vmap <C-Down> xp`[V`]=

" jslint
set makeprg=cat\ %\ \\\|\ /usr/bin/js\ ~/.vim/mylintrun.js\ %
set errorformat=%f:%l:%c:%m





" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
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

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

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

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
  	  \ | wincmd p | diffthis
endif
