" vim:fdm=marker
": Plugins {{{
" Install vim-plug if not installed

" set verbose=2
" set verbosefile=/tmp/nvim.log

set termguicolors


if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif


source $HOME/.config/nvim/plugs.vim
" lua require'colorizer'.setup()
lua << EOF
require'colorizer'.setup(
    {'*';},
    { 
        RGB      = true;         -- #RGB hex codes
        RRGGBB   = true;         -- #RRGGBB hex codes
        names    = true;         -- "Name" codes like Blue
        RRGGBBAA = true;         -- #RRGGBBAA hex codes
        rgb_fn   = true;         -- CSS rgb() and rgba() functions
        hsl_fn   = true;         -- CSS hsl() and hsla() functions
        css      = true;         -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn   = true;         -- Enable all CSS *functions*: rgb_fn, hsl_fn
    })
EOF

source $HOME/.config/nvim/keys.vim
source $HOME/.config/nvim/vim-commentary.vim
source $HOME/.config/nvim/nerd-commenter.vim
source $HOME/.config/nvim/which-key.vim
source $HOME/.config/nvim/codi.vim
source $HOME/.config/nvim/indentline.vim
"
" ": directories {{{
" set browsedir=buffer
" set wildignore=*.o,*.pyc,*__pycache__/,*.egg-info/
" set wildmode=list:longest,list:full
" set wildignorecase
" set autochdir
" " }}}
"
" persistence {{{
set hidden
set undofile
set viewoptions=cursor,folds,slash,unix
set sessionoptions=buffers
" }}}
" visual elements {{{
set visualbell
set confirm
set showmatch
set hlsearch
set incsearch
set number
set cursorline
set cursorcolumn  "guibg=#404040
hi CursorColumn guibg=NONE guifg=#302e31
set relativenumber
" hi! CursorLine ctermfg=blue
set colorcolumn=80
set splitbelow
set splitright
" set spelllang=en_us.utf-8

set foldlevelstart=10   " open most folds by default
"
" ==================================================
" XML folding
" ==================================================
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

" ==================================================
" JSON folding
" ==================================================
au FileType json setlocal foldmethod=syntax
au FileType yaml setlocal foldmethod=syntax

" set foldlevel=80
" }}}



" tab/indentation settings {{{
set modeline
set modelines=5
set modelineexpr

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set shiftround
set autoindent
set smartindent
if has('linebreak')      " Break indent wrapped lines
    set breakindent
    let &showbreak = '↳ '
    set cpo+=n
end
" }}}

syntax enable
syntax on
" misc {{{
set shell=/usr/bin/bash
" set omnifunc=syntaxcomplete#Complete
set grepprg=ag\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m
" set completeopt=menu
" set mouse-=a
set mouse=ivh
set ignorecase
set smartcase
set infercase
" }}}
" highlight WhitespaceEOL ctermbg=red guibg=red
" match WhitespaceEOL /\s\+$/
" let g:python3_host_prog = '/usr/bin/python3'
let g:python3_host_prog = '/home/tom/.pyenv/versions/neovim3/bin/python'
let g:python_host_prog = '/home/tom/.pyenv/versions/neovim2/bin/python'
let g:markdown_fenced_languages = [
            \ 'vim',
            \ 'nvim',
            \ 'help'
            \]

set pastetoggle=<F3>


set bg=dark
" colorscheme gruvbox
" colorscheme dracula
" let g:gruvbox_material_background = 'hard'
" let g:gruvbox_material_enable_italic = 1
" let g:gruvbox_material_enable_italic_comment = 1
colorscheme gruvbox-material
" source $HOME/.config/nvim/colors/bliss.vim
" colorscheme bliss
autocmd VimEnter *
            \ call MyPlugs()
\|  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
\|   PlugInstall --sync | q
\| endif
" BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw

function MyPlugs()
    if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
        echom 'plug it up'
        PlugInstall --sync | q
    endif
endfunction

if has ('autocmd')
    augroup vimrc
        autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC
                    \| call MyPlugs()
                    \| redraw
    augroup END
endif " has autocmd


let g:indent_guides_enable_on_vim_startup = 1

" plugin settings


"
" ale
" let g:ale_linters = {
"     \   'css': ['csslint', 'prettier'],
"     \   'c': ['clang', 'clangd', 'ccls','gcc'],
"     \   'cpp': ['clang', 'clangd', 'ccls','gcc','cpplint'],
"     \   'cuda': ['clang-format', 'nvcc'],
"     \   'cmake': ['cmakelint'],
"     \   'git': ['gitlint'],
"     \   'git commit': ['gitlint'],
"     \   'javascript': ['eslint'],
"     \   'json': ['jsonlint','jq'],
"     \   'lua': ['luac','luacheck'],
"     \   'python': ['flake8'],
"     \   'ruby': ['standardrb', 'rubocop'],
"     \   'sh': ['sh-language-server','shellcheck','shfmt'],
"     \    'vim': ['vimls','vint'],
"     \   'yaml': ['yamllint', 'prettier']
"       \}
"             " \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" let g:ale_fixers = {
"             \   'sh': ['bash_language_server', 'start'],
"             \   'python': [
"             \       'black',
"             \       'yapf',
"             \       'add_blank_lines_for_python_control_statements',
"             \       'autopep8',
"             \       'isort',
"             \       'reorder-python-imports'
"             \   ],
"             \   'c': [
"             \       'clang',
"             \       'clangd',
"             \       'ccls',
"             \       'gcc'
"             \   ],
"             \   'yaml': ['prettier']
"             \}
" let g:ale_fixers = ['remove_trailing_lines', 'trim_whitespace']
" let g:ale_javascript_prettier_options = '--single-quote --trailing-comma all'
" let g:ale_yaml_prettier_options = '--single-quote --trailing-comma all'


let g:ale_python_flake8_executable = '/usr/bin/flake8'
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
" let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 0
let g:airline#extensions#coc#enabled = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_insert_leave = 1
" let g:ale_echo_msg_error_str = 'e'
" let g:ale_echo_msg_warning_str = 'w'
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_completion_symbols = {
            \ 'text': '',
            \ 'method': '',
            \ 'function': '',
            \ 'constructor': '',
            \ 'field': '',
            \ 'variable': '',
            \ 'class': '',
            \ 'interface': '',
            \ 'module': '',
            \ 'property': '',
            \ 'unit': 'unit',
            \ 'value': 'val',
            \ 'enum': '',
            \ 'keyword': 'keyword',
            \ 'snippet': '',
            \ 'color': 'color',
            \ 'file': '',
            \ 'reference': 'ref',
            \ 'folder': '',
            \ 'enum member': '',
            \ 'constant': '',
            \ 'struct': '',
            \ 'event': 'event',
            \ 'operator': '',
            \ 'type_parameter': 'type param',
            \ '<default>': 'v'
            \ }
" vim-highlightedyank
" hi HighlightedyankRegion cterm=reverse gui=reverse

" nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in")
            \ && v:this_session == "" | NERDTree | endif

" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0])
"             \ && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene
"                 \ | exe 'cd '.argv()[0] | endif


let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeCascadeSingleChildDir=0
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

command! -nargs=0 Prettier :CocCommand prettier.formatFile




" All status line configuration goes here
set cmdheight=2
set display+=lastline
set updatetime=300
set timeoutlen=500
set shortmess+=c
if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif

" general config
set laststatus=2 " always show status line
set showtabline=2 " always show tabline
set noshowmode " hide default mode text (e.g. INSERT) as airline already displays it


": {{{ lightline config
let g:lightline#bufferline#enable_devicons = 1
let g:lightline = {
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '', 'right': '' },
            \ 'tabline': {
            \   'left': [['buffers']],
            \   'right': [[ 'exit' ]],
            \ },
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'gitbranch', 'readonly', 'filename', 'modified'] ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'fugitive#head'
            \ },
            \ 'component_expand': {
            \   'buffers': 'lightline#bufferline#buffers',
            \ },
            \ 'component_type': {
            \   'buffers': 'tabsel'
            \ },
            \ }
let g:lightline#bufferline#shorten_path = 1
": }}}

" ========================================================
" airline config

let g:airline_powerline_fonts=1
" let g:airline#extensions#tabline#enabled=1  " buffers at the top as tabs
" let g:airline#extensions#tabline#show_tab_type=1
let g:airline#extensions#tmuxline#enabled=0
let g:airline_theme = 'gruvbox'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '#'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.readonly = ''
let g:airline#extensions#quickfix#quickfix_text = 'QF'
let g:airline#extensions#quickfix#location_text = 'LL'

" disable unused extensions (performance)
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#capslock#enabled   = 0
let g:airline#extensions#csv#enabled        = 0
let g:airline#extensions#ctrlspace#enabled  = 0
let g:airline#extensions#eclim#enabled      = 0
let g:airline#extensions#hunks#enabled      = 1
let g:airline#extensions#nrrwrgn#enabled    = 0
let g:airline#extensions#promptline#enabled = 1
let g:airline#extensions#syntastic#enabled  = 0
let g:airline#extensions#taboo#enabled      = 0
" let g:airline#extensions#tagbar#enabled     = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
" let g:airline#extensions#tabline#formatter = 'jsformatter'
"
" " unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.maxlinenr = '☰'
" let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
" let g:airline_symbols.whitespace = 'Ξ'
" let g:pymode_rope_completion = 0
let g:pymode_folding = 0
let g:pymode_rope = 0
let g:pymode_trim_whitespaces = 0
let g:pymode_lint = 0
let g:pymode_doc = 0

  let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-actions',
    \ 'coc-lists',
    \ 'coc-emmet',
    \ 'coc-pairs',
    \ 'coc-tsserver',
    \ 'coc-floaterm',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-emoji',
    \ 'coc-cssmodules',
    \ 'coc-yaml',
    \ 'coc-python',
    \ 'coc-explorer',
    \ 'coc-svg',
    \ 'coc-prettier',
    \ 'coc-vimlsp',
    \ 'coc-xml',
    \ 'coc-yank',
    \ 'coc-json',
    \ 'coc-marketplace',
    \ ]


""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some servers have issues with backup files.
set nobackup
set nowritebackup

" Bigger messages display.
"TODO consider changing this.
set cmdheight=2

" Faster diagnostic messages (defaults 4000)
set updatetime=200
set clipboard=unnamedplus               " Copy paste between vim and everything else

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Have a signs colum on the left
set signcolumn=yes




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Fix enter key behavior quickfix window

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType json setlocal formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    "TODO realise exactly what this does.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction


function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction




function! Fzf_dev()
    function! s:files()
        let files = split(system($FZF_DEFAULT_COMMAND), '\n')
        return s:prepend_icon(files)
    endfunction

    function! s:prepend_icon(candidates)
        let result = []
        for candidate in a:candidates
            let filename = fnamemodify(candidate, ':p:t')
            let icon = WebDevIconsGetFileTypeSymbol(filename, isdirectory(filename))
            call add(result, printf("%s %s", icon, candidate))
        endfor

        return result
    endfunction

    function! s:edit_file(item)
        let parts = split(a:item, ' ')
        let file_path = get(parts, 1, '')
        execute 'silent e' file_path
    endfunction

    call fzf#run({
                \ 'source': <sid>files(),
                \ 'sink':   function('s:edit_file'),
                \ 'options': '-m -x +s',
                \ 'down':    '40%' })
endfunction

autocmd FileType json syntax match Comment +\/\/.\+$+
" define less filetype
au BufNewFile,BufRead *.less set filetype=less

" make the smarty .tpl files html files for our purposes
au BufNewFile,BufRead *.tpl set filetype=html

" json
au! BufRead,BufNewFile *.json set filetype=json
" yaml
au! BufRead,BufNewFile *.yaml set filetype=yaml
au! BufRead,BufNewFile *.yml set filetype=yaml

" jquery
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype xhtml setlocal ts=2 sw=2 expandtab
autocmd Filetype xml setlocal ts=2 sw=2 expandtab
autocmd Filetype css setlocal ts=2 sw=2 expandtab
autocmd Filetype less setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 noexpandtab
autocmd Filetype python setlocal omnifunc=jedi#completions tw=79
            \ completeopt-=preview
            \ formatoptions+=c

" RustFmt uses 100 for line width
autocmd bufreadpre *.rs setlocal colorcolumn=100

" snipMate
autocmd FileType html set ft=htmldjango.html " For SnipMate


" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
    let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
                \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
    let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
    call append(line("$"), l:modeline)
endfunction
let g:golden_ratio_exclude_nonmodifiable = 1
" command! FilesWithIcon :call Fzf_dev()
" vim: set ts=4 sw=4 tw=79 et :

let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1

let g:webdevicons_enable_startify = 1

function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

let g:startify_bookmarks = [
            \ { 'c': '~/.config/polybar/config' },
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ '~/src',
            \ '~/Pictures',
            \ ]

let g:startify_enable_special = 0 

" VimWiki
let g:vimwiki_key_mappings =
            \ {
            \   'all_maps': 1,
            \   'global': 1,
            \   'headers': 1,
            \   'text_objs': 1,
            \   'table_format': 1,
            \   'table_mappings': 1,
            \   'lists': 1,
            \   'links': 1,
            \   'html': 1,
            \   'mouse': 1,
            \ }

" Filetypes enabled for
let g:vimwiki_filetypes = ['markdown']

let g:vimwiki_list = [{'path': '~/.config/nvim/wiki',
            \ 'syntax': 'markdown', 'ext': '.md', 'exclude_files': ['**/README.md', '**/Readme.md'] }]

" let g:vimwiki_auto_header = 0
" let g:vimwiki_markdown_header_style = 1
" let g:vimwiki_tags_header_level = 1
" let g:vimwiki_tags_header = 'Generated Tags'
" let g:vimwiki_links_header_level = 1
" let g:vimwiki_links_header = 'Generated Links'
" let g:vimwiki_auto_chdir = 0
" let g:vimwiki_map_prefix = '<Leader>w'
" let g:vimwiki_toc_link_format = 0
" let g:vimwiki_toc_header_level = 1
" let g:vimwiki_toc_header = 'Contents'
" let g:vimwiki_autowriteall = 1
" let g:vimwiki_conceal_pre = 0
" let g:vimwiki_conceal_onechar_markers = 1
" let g:vimwiki_conceallevel = 2
" let g:vimwiki_user_htmls = ''
" let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr'
" let g:vimwiki_html_header_numbering_sym = ''
" let g:vimwiki_html_header_numbering = 0
" let g:vimwiki_dir_link = ''
" let g:vimwiki_markdown_link_ext = 0
" let g:vimwiki_create_link = 1
" let g:vimwiki_use_calendar = 1
" let g:vimwiki_text_ignore_newline = 1
" let g:vimwiki_list_ignore_newline = 1
" let g:vimwiki_folding = ''
" let g:vimwiki_listsym_rejected = '✗'
" let g:vimwiki_listsyms = '✗○◐●✓'
" let g:vimwiki_global_ext = 1
" let g:vimwiki_hl_cb_checked = 0




let g:vimwiki_diary_months = {
            \ 1: 'January', 2: 'February', 3: 'March',
            \ 4: 'April', 5: 'May', 6: 'June',
            \ 7: 'July', 8: 'August', 9: 'September',
            \ 10: 'October', 11: 'November', 12: 'December'
            \}
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')


