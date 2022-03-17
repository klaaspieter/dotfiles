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
" Plugins
" -----------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

" Theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'TaDaa/vimade'
Plug 'edkolev/tmuxline.vim'
Plug 'kergoth/vim-hilinks'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'neovim/nvim-lspconfig'
Plug 'GrzegorzKozub/vim-elixirls', { 'do': ':ElixirLsCompileSync' }

" Testing
Plug 'janko-m/vim-test'

" Searching
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
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
Plug 'christoomey/vim-tmux-runner'
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

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" No annoying sound on errors
set noerrorbells visualbell t_vb=
autocmd vimrc GUIEnter * set visualbell t_vb=

colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='medium'

let appleInterfaceStyle = system('printf "%s" "$(defaults read -g AppleInterfaceStyle 2> /dev/null)"')
if appleInterfaceStyle ==? 'dark'
  set background=dark
elseif appleInterfaceStyle ==? 'light'
  set background=light
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
" Language Servers
" -----------------------------------------------------------------------------
lua << EOF

--[[
Configured servers
Update the loop below to make key bindings work for newly configured servers
]]
require'lspconfig'.gopls.setup{}
require'lspconfig'.tsserver.setup{}


require'lspconfig'.elixirls.setup{
  cmd = { vim.fn.expand('~/.vim/plugged/vim-elixirls/elixir-ls/release/language_server.sh') }
}

--[[
Key bindings
]]
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'gopls', 'tsserver' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF

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
" vim-airline
" -----------------------------------------------------------------------------
let g:airline#extensions#branch#enabled = 0

" -----------------------------------------------------------------------------
" vim-tmuxline
" -----------------------------------------------------------------------------
let g:tmuxline_preset = {
      \ 'a': '#S',
      \ 'win': '#I #W',
      \ 'cwin': '#I #W',
      \ 'options': {
      \'status-justify': 'left'}
      \}

" -----------------------------------------------------------------------------
" vim-test
" -----------------------------------------------------------------------------
" Disable jest's interactive test runner
let test#javascript#reactscripts#options = '--watchAll=false'

" Use craco to run tests
" This sill break when running in actual react scripts, but I hardly ever do
" that.
let test#javascript#reactscripts#executable = 'yarn test'

" Support XCTestCase subclasses
" See https://github.com/janko/vim-test/issues/421
let test#swift#patterns.namespace = test#swift#patterns.namespace + ['\v^%(%(public )?%(final )?|%(final )?%(public )?)class ([-_a-zA-Z0-9]+): ([-_ a-zA-Z0-9]+)TestCase']

let test#strategy = 'vtr'
let test#neovim#term_position = 'topright'
let test#neovim#term_position = 'vert'

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
" fzf
" -----------------------------------------------------------------------------
let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }
let g:fzf_preview_window = []
" Search on top, results below
let $FZF_DEFAULT_OPTS='--reverse '

" floating fzf window with borders
function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = '╭' . repeat('─', width - 2) . '╮'
    let mid = '│' . repeat(' ', width - 2) . '│'
    let bot = '╰' . repeat('─', width - 2) . '╯'
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    augroup vimrc
      au BufWipeout <buffer> exe 'bw '.s:buf
    augroup END
endfunction

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
