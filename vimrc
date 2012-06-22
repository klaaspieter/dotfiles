" -----------------------------------------------------------------------------------------
" General
" -----------------------------------------------------------------------------------------
call pathogen#infect()              " Load plugins with pathogen

set nocompatible                    " use vim defaults, no vi compatibility 
set number                          " Show line numbers
set autoread                        " Automatically reload files changed externally
set encoding=utf-8                  " Set default encoding to UTF-8
set term=ansi                       " Tell vim terminal supports colors
syntax on                           " Enable syntax highlighting
filetype plugin indent on           " Enable filetype-specific indenting and plugins

" -----------------------------------------------------------------------------------------
" Indenting
" -----------------------------------------------------------------------------------------
set smartindent                     " Indent after { etc
set tabstop=2                       " 2 tabs
set shiftwidth=2                    " (auto)indent 2
set expandtab                       " Use spaces instead of tabs

" -----------------------------------------------------------------------------------------
" UI 
" -----------------------------------------------------------------------------------------
set t_Co=256                        " Explicitly tell vim that the terminal supports 256 colors
set cursorline                      " Highlight the line the cursor is on
set wildmenu                        " Improve command-line completion
set wildmode=list:longest,full      " Determines how completions are shown 
set splitbelow splitright           " change split order
set bg=dark                         " Set dark background theme
set showmatch                       " Show matching brackets
set ls=2                            " Show current open buffer
set ruler                           " Show location in files
set wrap                            " Wrap long lines

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  colorscheme Tomorrow-Night-Bright
endif

" -----------------------------------------------------------------------------------------
" Searching 
" -----------------------------------------------------------------------------------------
set ignorecase                      " Search case insensitive
set hlsearch                        " Highlight current search

" -----------------------------------------------------------------------------------------
" Mappings 
" -----------------------------------------------------------------------------------------
nnoremap <leader><space> :noh<cr>
nmap tn :tabnew<cr>
nmap tw :tabclose<cr>
nmap tj :tabnext<cr>
nmap tk :tabprev<cr>

" -----------------------------------------------------------------------------------------
" Backups 
" -----------------------------------------------------------------------------------------
set swapfile                        " Use swapfiles
set directory=~/.vim/tmp/swap       " Place swapfiles in ~/.vim/tmp/swap

set undofile                        " Enable undo after closing files
set undodir=~/.vim/tmp/undo         " Place undofiles in ~/.vim/tmp/undo

" --------------------------------------------------------------------------------------------------
" Show tabs and trailing whitespace
" --------------------------------------------------------------------------------------------------
if (&termencoding == "utf-8") || has("gui_running")
  if v:version >= 700
    if has("gui_running")
      set list listchars=tab:▸\ ,trail:·,extends:…,nbsp:‗
    else
      " xterm + terminus hates these
      set list listchars=tab:»·,trail:·,extends:>,nbsp:_
    endif
  else
    set list listchars=tab:»·,trail:·,extends:…
  endif
else
  if v:version >= 700
    set list listchars=tab:>-,trail:.,extends:>,nbsp:_
  else
    set list listchars=tab:>-,trail:.,extends:>
  endif
endif