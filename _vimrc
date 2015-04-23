set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
"let mapleader = " "
"let g:mapleader = " "
map <Space> <Leader>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copied from Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
let path='$HOME/vimfiles/bundle'
call vundle#begin(path)
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'ervandew/supertab'
"Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimfiler.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/unite.vim'
Plugin 'flazz/vim-colorschemes'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" General
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>H :wincmd H<CR>
nnoremap <leader>J :wincmd J<CR>
nnoremap <leader>K :wincmd K<CR>
nnoremap <leader>L :wincmd L<CR>
nnoremap <leader>o :wincmd o<cr>
nnoremap <leader>= :wincmd =<cr>

nnoremap <leader>q :bd<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Remap
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Gundo
"nnoremap <leader>u :GundoToggle<CR>

" VimFiler
"let g:vimfiler_as_default_explorer = 1
nnoremap <silent> <leader>ee :VimFilerBufferDir<CR>
nnoremap <silent> <leader>eb :VimFiler bookmark:<CR>

"" Unite
nnoremap    [unite]   <Nop>
nmap    <leader> [unite]
nnoremap <silent> [unite]ff :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]fb :<C-u>Unite buffer bookmark file_mru<CR>
nnoremap <silent> [unite]fs :<C-u>Unite source<CR>
nnoremap <silent> [unite]fr :<C-u>UniteResume<CR>
nnoremap <silent> [unite]fg :<C-u>Unite vimgrep<CR>
nnoremap <silent> [unite]fa :<C-u>UniteBookmarkAdd 

let g:unite_source_history_yank_enable = 1
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])

autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
"filetype plugin on
"filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Automatically change the current directory
"set autochdir

" If above doesnt work use below
autocmd BufEnter * silent! lcd %:p:h


" Bakups
set backup
set backupdir=~/.vim-tmp
set backupskip=/tmp/*
set directory=~/.vim-tmp
set writebackup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
"set so=7

" visual autocomplete for menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

"Always show current position
set ruler

" Height of the command bar
"set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" In many terminal emulators the mouse works just fine, thus enable it.
"if has('mouse')
"  set mouse=a
"endif

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" show line numbers
set number

" show command in bottom bar
set showcmd

" hilight current line
set cursorline

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
"set magic

" Show matching brackets when text indicator is over them
set showmatch 

" No annoying sound on errors
"set noerrorbells
"set novisualbell
"set t_vb=
"set tm=500

" Add a bit extra margin to the left
"set foldcolumn=1

" FOLDING
"set foldenable " enable folding
"set foldlevelstart=10 " open most folds by default
"set foldnestmax=10 " 10 nested fold max

" MOVEMENT
nnoremap j gj
nnoremap k gk

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 
set background=dark
"color grb256
color solarized
set guifont=Consolas:h10:cANSI

" Set utf8 as standard encoding and en_US as the standard language
"set encoding=utf8

" Use Unix as the standard file type
"set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
"set lbr
"set tw=500

"set ai "Auto indent
"set si "Smart indent
set wrap "Wrap lines

" default of gvim is tcq
" t > auto-wrap text using textwidth
" c > auto-wrap comments using text width, inserting the current comment
" q > auto formatting of comments with gq
set formatoptions =""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"set diffexpr=MyDiff()
"function MyDiff()
"  let opt = '-a --binary '
"  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"  let arg1 = v:fname_in
"  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"  let arg2 = v:fname_new
"  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"  let arg3 = v:fname_out
"  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"  let eq = ''
"  if $VIMRUNTIME =~ ' '
"    if &sh =~ '\<cmd'
"      let cmd = '""' . $VIMRUNTIME . '\diff"'
"      let eq = '"'
"    else
"      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"    endif
"  else
"    let cmd = $VIMRUNTIME . '\diff'
"  endif
"  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
"endfunction
