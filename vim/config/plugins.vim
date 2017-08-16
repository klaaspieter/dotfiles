call plug#begin('~/.vim/plugged')

" Theme
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'

" Syntax
Plug 'fatih/vim-go'
Plug 'kballard/vim-swift'
Plug 'kelan/gyp.vim'
Plug 'vim-syntastic/syntastic'
Plug 'elixir-lang/vim-elixir'

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

call plug#end()
