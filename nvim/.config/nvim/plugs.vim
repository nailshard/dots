call plug#begin('~/.local/nvim/plugged')
Plug 'vim-jp/vim-vimlparser'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-unimpaired'
Plug 'terryma/vim-multiple-cursors'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'vim-scripts/DrawIt'
Plug 'machakann/vim-highlightedyank'
Plug 'Yggdroot/indentLine'
Plug 'romainl/vim-cool'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
Plug 'vim-scripts/Mouse-Toggle'
Plug 'liuchengxu/vim-which-key' " , { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'ktonga/vim-follow-my-lead'



" completion/snippets/linters
" Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/coc-actions', {'do': 'yarn install'}
Plug 'voldikss/coc-browser', {'do': 'yarn install --frozen-lockfile'}
Plug 'weirongxu/coc-explorer', {'do': 'yarn install'}
Plug 'neoclide/coc-git', {'do': 'yarn install'}
Plug 'neoclide/coc-lists', {'do': 'yarn install'}
Plug 'fannheyward/coc-markdownlint', {'do': 'yarn install'}
Plug 'fannheyward/coc-marketplace', {'do': 'yarn install'}
Plug 'neoclide/coc-python', {'do': 'yarn install'}
Plug 'fannheyward/coc-pyright', {'do': 'yarn install'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install'}
Plug 'neoclide/coc-solargraph', {'do': 'yarn install'}
Plug 'voldikss/coc-template', {'do': 'yarn install'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-vimlsp', {'do': 'yarn install'}

Plug 'dense-analysis/ale'
Plug 'honza/vim-snippets'
Plug 'Shougo/neosnippet-snippets'
Plug 'tomtom/tlib_vim'
Plug 'marcweber/vim-addon-mw-utils'
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'Shougo/denite.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'shougo/neoyank.vim'
Plug 'fisadev/vim-isort', {'for': 'python'}
Plug 'tell-k/vim-autoflake', {'for': 'python'}
Plug 'nvie/vim-flake8'
Plug 'rhysd/vim-clang-format', {'for': 'cpp'}

" syntax
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'bfredl/nvim-ipy', {'for': 'python', 'do': ':UpdateRemotePlugins'}
Plug 'vimjas/vim-python-pep8-indent'
Plug 'fatih/vim-go', {'for': 'go'} ", 'do': ':GoUpdateBinaries'}
Plug 'Glench/Vim-Jinja2-Syntax', {'for': 'jinja'}
Plug 'chrisbra/csv.vim'
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'sheerun/vim-polyglot'
Plug 'vim-python/python-syntax'
Plug 'xuhdev/syntax-dosini.vim'


" sessions
Plug 'vim-scripts/restore_view.vim'
Plug 'gioele/vim-autoswap'


" lint / fix / complete
Plug 'google/yapf'

" Git
Plug 'peterhurford/send.vim'
" Tmux
Plug 'tmux-plugins/vim-tmux'
Plug 'edkolev/tmuxline.vim'
Plug 'wellle/tmux-complete.vim'
Plug 'sunaku/tmux-navigate'



" python
" Plug 'davidhalter/jedi-vim'
" Plug 'jeetsukumaran/vim-pythonsense'
Plug 'liuchengxu/vista.vim'
Plug 'jiangmiao/auto-pairs'
" Plug 'numirias/semshi'
Plug 'plasticboy/vim-markdown'
" Plug 'sbdchd/neoformat'
Plug 'tomlion/vim-solidity'
Plug 'metakirby5/codi.vim'


" utilities
Plug 'mhinz/vim-startify'
Plug 'vimwiki/vimwiki'
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}

    Plug 'voldikss/vim-floaterm'
    Plug 'junegunn/gv.vim'
    Plug 'junegunn/goyo.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'thaerkh/vim-workspace'
Plug 'farmergreg/vim-lastplace'


" zo： Open fold in current cursor postion
" zO： Open fold and sub-fold in current cursor postion recursively
" zc： Close the fold in current cursor position
" zC： Close the fold and sub-fold in current cursor position recursively
Plug 'mbbill/undotree'
Plug 'fholgado/minibufexpl.vim'
" Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/sudo.vim'
Plug 'roxma/nvim-yarp'
Plug 'nailshard/eleline.vim'

" appearance
Plug 'sainnhe/gruvbox-material'
" Plug 'roman/golden-ratio'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/rainbow_parentheses.vim'

" Plug 'lilydjwg/colorizer', { 'on': 'ColorToggle' }
Plug 'norcalli/nvim-colorizer.lua'
Plug 'myusuf3/numbers.vim'
Plug 'wavded/vim-stylus'
Plug 'ryanoasis/vim-devicons'
Plug 'chrisbra/unicode.vim'

call plug#end()

