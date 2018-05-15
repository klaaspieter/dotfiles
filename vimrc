" -----------------------------------------------------------------------------
" General
" -----------------------------------------------------------------------------
set nocompatible                     " use vim defaults, no vi compatibility
set number                           " Show line numbers
set autoread                         " Automatically reload files changed externally
set encoding=utf-8                   " Set default encoding to UTF-8
set shortmess=atI                    " Don’t show the intro message
syntax on                            " Enable syntax highlighting
filetype plugin indent on            " Enable filetype-specific indenting and plugins
set clipboard+=unnamed               " Enable integration with system clipboard
set backspace=indent,eol,start
set autowrite

" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

" Theme
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'

" Syntax
Plug 'fatih/vim-go'
Plug 'keith/swift.vim'
Plug 'kelan/gyp.vim'
Plug 'vim-syntastic/syntastic'
Plug 'elixir-lang/vim-elixir'
Plug 'mustache/vim-mustache-handlebars'

" Searching
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

" Convenience
Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" Writing
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-pencil'

" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'

call plug#end()

" -----------------------------------------------------------------------------
" Indenting
" -----------------------------------------------------------------------------
set smartindent                      " Indent after { etc
set tabstop=2                        " 2 tabs
set softtabstop=2                    " Backspace deletes tab
set shiftwidth=2                     " (auto)indent 2
set expandtab                        " Use spaces instead of tabs

" -----------------------------------------------------------------------------
" UI
" -----------------------------------------------------------------------------
set t_Co=256                         " Explicitly tell vim that the terminal supports 256 colors
set nocursorline                     " Don't highlight the line the cursor is (very slow)
set wildmenu                         " Improve command-line completion
set wildmode=list:longest,full       " Determines how completions are shown
set splitbelow splitright            " change split order
set bg=light                         " Set dark background theme
set showmatch                        " Show matching brackets
set ls=2                             " Show current open buffer
set ruler                            " Show location in files
set wrap                             " Wrap long lines
set scrolljump=5                     " Lines to scroll when cursor leaves screen
set scrolloff=3                      " Minimum lines to keep above and below cursor

" No annoying sound on errors
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  colorscheme solarized
endif

" -----------------------------------------------------------------------------
" Searching
" -----------------------------------------------------------------------------
set ignorecase                       " Search case insensitive
set hlsearch                         " Highlight current search
set incsearch                        " Highlight search while typing

let g:ackprg = "ag --nogroup --nocolor --colum"

" -----------------------------------------------------------------------------
" Mappings
" -----------------------------------------------------------------------------
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

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Mimic ctrl-p, but use fzf
nmap <C-p> :Files<CR>

" -----------------------------------------------------------------------------
" Backups
" -----------------------------------------------------------------------------
set swapfile                         " Use swapfiles
set directory=~/.vim/tmp/swap        " Place swapfiles in ~/.vim/tmp/swap

set undofile                         " Enable undo after closing files
set undodir=~/.vim/tmp/undo          " Place undofiles in ~/.vim/tmp/undo

" -----------------------------------------------------------------------------
" Show tabs and trailing whitespace
" -----------------------------------------------------------------------------
set list listchars=tab:▸\ ,eol:¬,trail:.

" -----------------------------------------------------------------------------
" Airline
" -----------------------------------------------------------------------------
function! AirlineInit()
    call airline#parts#define_empty(['obsession'])
    let spc = g:airline_symbols.space
    call airline#parts#define_raw('indentation', '% sw %{&sw} % ts %{&ts}')
    if winwidth(0) > 80
      let g:airline_section_z = airline#section#create(['windowswap', 'obsession', 'indentation', 'linenr', 'maxlinenr', spc.':%3v'])
    else
      let g:airline_section_z = airline#section#create(['indentation', 'linenr',  ':%3v'])
    endif
endfunction
autocmd User AirlineAfterInit call AirlineInit()


" -----------------------------------------------------------------------------
" fzf
" -----------------------------------------------------------------------------
let g:fzf_layout = { 'down': '~20%' }

" -----------------------------------------------------------------------------
" Go
" -----------------------------------------------------------------------------
function! s:SetGolangOptions()

  " Break at lines and indent them by 2 spaces
  set textwidth=0
  set linebreak
  set breakindent
  set breakindentopt=shift:2

  let g:go_list_type = "quickfix"
  let g:go_fmt_command = "goimports"

  nmap <leader>r <Plug>(go-run)
  nmap <leader>t <Plug>(go-test)
  nmap <Leader>c <Plug>(go-coverage-toggle)
  nmap <Leader>i <Plug>(go-info)

  " run :GoBuild or :GoTestCompile based on the go file
  function! s:build_go_files()
    let l:file = expand('%')
    if l:file =~# '^\f\+_test\.go$'
      call go#cmd#Test(0, 1)
    elseif l:file =~# '^\f\+\.go$'
      call go#cmd#Build(0)
    endif
  endfunction

  nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
  command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

endfunction

autocmd Filetype go call s:SetGolangOptions()

" -----------------------------------------------------------------------------
" shellcheck
" -----------------------------------------------------------------------------
" Allow following external source
let g:syntastic_sh_shellcheck_args = "-x"

" -----------------------------------------------------------------------------
" gyp
" -----------------------------------------------------------------------------
let g:syntastic_filetype_map = { "gyp": "python" }

" -----------------------------------------------------------------------------
" Markdown
" -----------------------------------------------------------------------------
function! s:SetMarkdownOptions()
  " Disable folding in markdown files
  setlocal nofoldenable

  " Prevent breaking at 80 columns
  setlocal textwidth=0

  " Break at 80 columns with inserting EOLs
  setlocal linebreak

  " Enable spell checking
  setlocal spell
endfunction
autocmd Filetype markdown call s:SetMarkdownOptions()

" -----------------------------------------------------------------------------
" Writing
" -----------------------------------------------------------------------------
let g:pencil#wrapModeDefault = 'soft'

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text call pencil#init()
augroup END

augroup markdown
  autocmd!
  autocmd Filetype markdown,mkd Goyo
augroup END

function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()
