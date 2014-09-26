" -----------------------------------------------------------------------------------------
" General
" -----------------------------------------------------------------------------------------
call pathogen#infect()               " Load plugins with pathogen
call pathogen#helptags()

set nocompatible                     " use vim defaults, no vi compatibility 
set number                           " Show line numbers
set autoread                         " Automatically reload files changed externally
set encoding=utf-8                   " Set default encoding to UTF-8
set shortmess=atI                    " Don’t show the intro message
set term=ansi                        " Tell vim terminal supports colors
set noesckeys                        " recognize single <Esc> immediately
syntax on                            " Enable syntax highlighting
filetype plugin indent on            " Enable filetype-specific indenting and plugins
set clipboard+=unnamed               " Enable integration with system clipboard

" -----------------------------------------------------------------------------------------
" Indenting
" -----------------------------------------------------------------------------------------
set smartindent                      " Indent after { etc
set tabstop=2                        " 2 tabs
set softtabstop=2                    " Backspace deletes tab
set shiftwidth=2                     " (auto)indent 2
set expandtab                        " Use spaces instead of tabs

" -----------------------------------------------------------------------------------------
" UI 
" -----------------------------------------------------------------------------------------
set t_Co=256                         " Explicitly tell vim that the terminal supports 256 colors
set nocursorline                     " Don't highlight the line the cursor is (very slow)
set wildmenu                         " Improve command-line completion
set wildmode=list:longest,full       " Determines how completions are shown 
set splitbelow splitright            " change split order
set bg=dark                          " Set dark background theme
set showmatch                        " Show matching brackets
set ls=2                             " Show current open buffer
set ruler                            " Show location in files
set wrap                             " Wrap long lines
set scrolljump=5                     " Lines to scroll when cursor leaves screen
set scrolloff=3                      " Minimum lines to keep above and below cursor
set noshowmode                       " Hide the default mode (e.g. -- INSERT -- below powerline)

autocmd Filetype gitcommit setlocal spell textwidth=72

" Configure indent-guides plugin
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

" Configure rspec plugin
let g:rspec_command = "!bundle exec rspec {spec}"

" No annoying sound on errors
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  colorscheme Tomorrow-Night-Bright
endif

" -----------------------------------------------------------------------------------------
" Searching 
" -----------------------------------------------------------------------------------------
set ignorecase                       " Search case insensitive
set hlsearch                         " Highlight current search

" -----------------------------------------------------------------------------------------
" Mappings 
" -----------------------------------------------------------------------------------------
" Convenient mapping for hiding search highlighting
nnoremap <leader><space> :noh<cr>

" Useful mappings for managing tabs
nmap tn :tabnew<cr>
nmap tw :tabclose<cr>
nmap tj :tabnext<cr>
nmap tk :tabprev<cr>

" Treat long lines as break lines
map j gj
map k gk

" inserts new line without going into insert mode
map <S-Enter> O<ESC>
map <Enter> o<ESC>

" Run rspec convenience mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" -----------------------------------------------------------------------------------------
" Backups 
" -----------------------------------------------------------------------------------------
set swapfile                         " Use swapfiles
set directory=~/.vim/tmp/swap        " Place swapfiles in ~/.vim/tmp/swap

set undofile                         " Enable undo after closing files
set undodir=~/.vim/tmp/undo          " Place undofiles in ~/.vim/tmp/undo

" --------------------------------------------------------------------------------------------------
" Show tabs and trailing whitespace
" --------------------------------------------------------------------------------------------------
set list listchars=tab:▸\ ,eol:¬,trail:.

" --------------------------------------------------------------------------------------------------
" Writing
" --------------------------------------------------------------------------------------------------

" Wrap lines in md files at 80 characters
au BufRead,BufNewFile *.md setlocal textwidth=80
