" -----------------------------------------------------------------------------
" General
" -----------------------------------------------------------------------------
set number                           " Show line numbers
set autoread                         " Automatically reload files changed externally
set encoding=utf-8                   " Set default encoding to UTF-8
scriptencoding utf-8
set shortmess=atI                    " Don’t show the intro message
syntax on                            " Enable syntax highlighting
filetype plugin indent on            " Enable filetype-specific indenting and plugins
set clipboard+=unnamed               " Enable integration with system clipboard
set backspace=indent,eol,start
set autowrite

" -----------------------------------------------------------------------------
" ALE Completion
" -----------------------------------------------------------------------------
" Enable ale completion when available.
" This has to be set before ale is loaded.
let g:ale_completion_enabled = 1

" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

" Theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'TaDaa/vimade'

Plug 'kergoth/vim-hilinks'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'GrzegorzKozub/vim-elixirls', { 'do': ':ElixirLsCompileSync' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Testing
Plug 'janko-m/vim-test'

" Searching
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

" Convenience
Plug 'AndrewRadev/splitjoin.vim'
Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'
Plug 'airblade/vim-gitgutter'

" Writing
Plug 'junegunn/goyo.vim', { 'for': ['text', 'notes', 'markdown', 'mkd'] }
Plug 'reedes/vim-pencil', { 'for': ['text', 'notes', 'markdown', 'mkd'] }
Plug 'reedes/vim-wordy', { 'for': ['text', 'notes', 'markdown', 'mkd'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['markdown'] }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': ['markdown'] }

" Tmux
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-obsession'

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
set showmatch                        " Show matching brackets
set laststatus=2                             " Show current open buffer
set ruler                            " Show location in files
set wrap                             " Wrap long lines
set scrolljump=5                     " Lines to scroll when cursor leaves screen
set scrolloff=3                      " Minimum lines to keep above and below cursor
set omnifunc=syntaxcomplete#Complete " Support omnicomplete <C-X><C-O>
let g:netrw_liststyle = 3            " Use tree list style in directory browser
set termguicolors                    " Use true color terminal

augroup vimrc
  autocmd!
augroup END

" Ale appears to have a bug where it will insert autocomplete text even
" when autocomplete wasn't triggered
set completeopt=menu,menuone,preview,noselect,noinsert

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" No annoying sound on errors
set noerrorbells visualbell t_vb=
autocmd vimrc GUIEnter * set visualbell t_vb=

colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'

if $THEME ==# 'light'
  set background=light
elseif $THEME ==# 'dark'
  set background=dark
else
  set background=light
end

let g:airline_theme='gruvbox'

" -----------------------------------------------------------------------------
" Searching
" -----------------------------------------------------------------------------
set ignorecase                       " Search case insensitive
set hlsearch                         " Highlight current search
set incsearch                        " Highlight search while typing

let g:ackprg = 'ag --nogroup --nocolor --colum'

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

" Mimic ctrl-p, but use fzf
nmap <C-p> :GFiles<CR>

" Toggle spell checking
nmap <silent> <leader>s :set spell!<CR>

" Don't jump to first Ack result
cnoreabbrev Ack Ack!

" Start Ack with <Leader>a
nnoremap <Leader>f :Ack!<Space>

" Use Enter and Backspace to navigate vim help
nnoremap <buffer> <CR> <C-]>
nnoremap <buffer> <BS> <C-T>

" -----------------------------------------------------------------------------
" Ale
" -----------------------------------------------------------------------------
" Run Ale fixer when a file is saved
let g:ale_fix_on_save = 1

" Use K to show ALEHover
nmap K <Plug>(ale_hover)

set omnifunc=ale#completion#OmniFunc

" Remap keys for gotos
nmap <silent> gd <Plug>(ale_go_to_definition)
nmap <silent> gy <Plug>(ale_go_to_type_definition)
nmap <silent> gr <Plug>(ale_find_references)

" Run ale fixer with <Leader>v
nmap <Leader>v <Plug>(ale_fix)

let g:ale_elixir_elixir_ls_release = expand('~/.vim') . '/plugged/vim-elixirls/elixir-ls/release'
" https://github.com/JakeBecker/elixir-ls/issues/54
let g:ale_elixir_elixir_ls_config = { 'elixirLS': { 'dialyzerEnabled': v:false } }

let g:ale_sourcekit_lsp_executable = '/Users/kp/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin/sourcekit-lsp'
let g:ale_fixers = {
\  'javascript': ['prettier'],
\  'typescript': ['prettier'],
\  'typescriptreact': ['prettier'],
\  'scss': ['prettier'],
\  'html': ['prettier'],
\  'elixir': ['mix_format'],
\  'ruby': ['rubocop']
\}
let g:ale_linter_aliases = {
\  'jsx': ['css', 'javascript'],
\  'tsx': ['css', 'javascript']
\}
let g:ale_linters = {
\  'jsx': ['stylelint', 'eslint'],
\  'tsx': ['stylelint', 'eslint'],
\  'elixir': ['credo', 'elixir-ls']
\}

let g:ale_fix_on_save=1

" -----------------------------------------------------------------------------
" vim-airline
" -----------------------------------------------------------------------------
let g:airline#extensions#branch#enabled = 0

" -----------------------------------------------------------------------------
" vim-test
" -----------------------------------------------------------------------------
" Disable jest's interactive test runner
let test#javascript#reactscripts#options = '--watchAll=false'

" Support XCTestCase subclasses
" See https://github.com/janko/vim-test/issues/421
let test#swift#patterns.namespace = test#swift#patterns.namespace + ['\v^%(%(public )?%(final )?|%(final )?%(public )?)class ([-_a-zA-Z0-9]+): ([-_ a-zA-Z0-9]+)TestCase']

let test#strategy = 'vimux'

" Setting this to 0 makes vimux clear the screen and tmux scrollback
" See https://github.com/janko/vim-test/issues/133
let test#preserve_screen = 0

nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <Leader>gt :TestVisit<CR>
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
" Vimux
" -----------------------------------------------------------------------------
" Close Vimux runner
map <Leader>vw :VimuxCloseRunner<CR>

" Zoom Vimux runner
map <Leader>vz :VimuxZoomRunner<CR>

let g:VimuxHeight = '40'

" -----------------------------------------------------------------------------
" fzf
" -----------------------------------------------------------------------------
let g:fzf_layout = { 'down': '~20%' }

" -----------------------------------------------------------------------------
" vimade
" -----------------------------------------------------------------------------
let g:vimade = {}
let vimade.enablefocusfading = 1

" -----------------------------------------------------------------------------
" Go
" -----------------------------------------------------------------------------
function! s:SetGolangOptions()

  " Break at lines and indent them by 2 spaces
  set textwidth=0
  set linebreak
  set breakindent
  set breakindentopt=shift:2

  let g:go_list_type = 'quickfix'
  let g:go_fmt_command = 'goimports'

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

autocmd vimrc Filetype go call s:SetGolangOptions()

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

  nmap <leader>p <Plug>MarkdownPreviewToggle

  let g:vim_markdown_conceal = 0
  let g:vim_markdown_conceal_code_blocks = 0
endfunction
autocmd vimrc Filetype markdown call s:SetMarkdownOptions()

" -----------------------------------------------------------------------------
" Writing
" -----------------------------------------------------------------------------
" Enabling spell checking for git commits
autocmd vimrc FileType gitcommit setlocal spell

com! Du set spelllang=nl
com! En set spelllang=en_us

function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
endfunction

function! s:SetWritingOptions()
  autocmd! vimrc FileType markdown,mkd,text call pencil#init()

  autocmd! vimrc User GoyoEnter nested call <SID>goyo_enter()
  autocmd! vimrc User GoyoLeave nested call <SID>goyo_leave()
endfunction

autocmd vimrc Filetype markdown,mkd,text call s:SetWritingOptions()
