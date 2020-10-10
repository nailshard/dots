set nocompatible              " be iMproved, required
filetype off                  " required
" install vundle if it isn't vundle
" from: https://github.com/VundleVim/Vundle.vim/issues/769
" thanks dude! ^^^
"
" START - Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :PluginInstall
endif
" END - Setting up Vundle - the vim plugin bundler

let g:clang_library_path='/usr/lib/libclang.so'
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
let code  = { 'for' : ['c', 'cpp', 'haskell', 'lua', 'ruby', 'sh', 'snippets', 'vim'] }
let prose = { 'for' : ['draft', 'mail', 'markdown', 'note', 'wiki', 'html'] }

Plugin 'Shougo/vimproc.vim', { 'do' : 'make' }
Plugin 'simnalamburt/vim-mundo', { 'on' : 'MundoToggle' }  " undo
Plugin 'vim-scripts/YankRing.vim'                 " paste (yank)


Plugin 'junegunn/fzf.vim', { 'dir': '~/.fzf', 'do': './install --all' }  " fuzzy finder
Plugin 'Alok/notational-fzf-vim'        " fzf note search

Plugin 'junegunn/limelight.vim'         " hyperfocus highlighting
Plugin 'machakann/vim-highlightedyank'  " yank highlghting
Plugin 'VundleVim/Vundle.vim'
Plugin 'chrisbra/unicode.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'nathanaelkane/vim-indent-guides', { 'on' : 'IndentGuidesToggle' } " colourized indent columns

Plugin 'tpope/vim-fugitive'

Plugin 'kabbamine/vcoolor.vim'
"Plugin 'kien/rainbow_parentheses.vim'
"Plugin 'dhruvasagar/vim-table-mode'
Plugin 'gorodinskiy/vim-coloresque'
"Plugin 'jelera/vim-javascript-syntax'
"Plugin 'walm/jshint.vim'
"Plugin 'moll/vim-node'
Plugin 'airblade/vim-gitgutter'
Plugin 'Yggdroot/indentLine'
" Plugin 'nvie/vim-flake8'
if has('python')
endif
if has('python3')
"elif has('python3')
"Plugin 'davidhalter/jedi-vim'
"Plugin 'axiaoxin/vim-json-line-format'
Plugin 'SirVer/ultisnips'
endif

" ............................................... Completion
" Plugin 'mattn/emmet-vim'              " html
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'


Plugin 'jiangmiao/auto-pairs'           " insert/delete pairs
Plugin 'Shougo/neocomplete.vim'         " required by snippets
Plugin 'Shougo/neosnippet.vim'          " snippets
Plugin 'tpope/vim-endwise', code        " add 'end' statement
Plugin 'reedes/vim-litecorrect', prose  " autocorrections
"Plugin 'valloric/youcompleteme'
Plugin 'ryanolsonx/vim-lsp-python'



Plugin 'morhetz/gruvbox'
Plugin 'nsf/gocode', {'rtp': 'vim/'}


" Plugin 'axiaoxin/favorite-vim-colorscheme'
"Plugin 'junegunn/vim-emoji'
Plugin 'mhinz/vim-startify'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'suan/vim-instant-markdown'
Plugin 'tpope/vim-surround'
Plugin 'honza/vim-snippets'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'lvht/tagbar-markdown'

Plugin 'christoomey/vim-system-copy'
" ............................................... Formatting
Plugin 'scrooloose/nerdcommenter'
Plugin 'junegunn/vim-easy-align'        " align text objects
Plugin 'reedes/vim-pencil'              " dynamic paragraph formatting

Plugin 'conradirwin/vim-bracketed-paste'
Plugin 'rip-rip/clang_complete'
"Plugin 'tmhedberg/simpylfold'
Plugin 'fatih/vim-go'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'yaasita/edit-slack.vim'

"Plugin 'kovetskiy/sxhkd-vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
unlet code prose
filetype plugin on
filetype indent on    " required
filetype on
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"
"
"""""""""""""""""""""""BASE CONFIG"""""""""""""""""""""""
set mouse=a
set mousehide               " hide mouse when typing

set shell=/bin/sh           " required for plugin system call dependencies
set title                   " change the terminal's title
set ttyfast
set timeout timeoutlen=1000 ttimeoutlen=100
set nobackup
set directory=~/tmp,/tmp    " keep swap files in one location
set noswapfile
set noundofile
silent !mkdir ~/.vim/undo 2>/dev/null
set history=1000            " store lots of :cmdline history
set undodir=~/.vim/undo
set undofile
set undolevels=1000         " maximum number of changes that can be undone
set undoreload=10000        " maximum number lines to save for undo
set nowritebackup
set wrap                    " wrap lines for viewing
set noerrorbells            " don't beep
set shortmess+=filmnrxoOtT  " abbrev. of messages (avoids "hit enter")
set visualbell              " no sounds

" ...................................... White space markers
set nolist  " display tabs and trailing spaces visually
set listchars="tab:▸\<Space>"

" set listchars+=trail:_
set listchars+=trail:·
set listchars+=nbsp:.
set listchars+=extends:>
set listchars+=precedes:<
" set listchars+=eol:¬

" ......................................................... Trailing white space
nmap <silent><leader><Space> :ToggleWhiteSpace<CR>


" split shit
set splitbelow
set splitright
" horizontal / vertical split
noremap <leader>Z  <C-w>v<C-w>l
noremap <leader>z  <C-w>s<C-w>l
" maximize left:right / top:bottom
noremap <leader>ZZ <C-w><Bar>
noremap <leader>zz <C-w>_
" adjust all splits to the same size
noremap <leader>=  <C-w>=

nnoremap <C-Up>    :resize +5<CR>
nnoremap <C-Down>  :resize -5<CR>
nnoremap <C-Left>  :vertical resize -5<CR>
nnoremap <C-Right> :vertical resize +5<CR>

" ............................................................... Switch windows
" switch to left / right split
noremap <Left>     <C-w>h
noremap <Right>    <C-w>l
" switch to top / bottom split
noremap <Up>       <C-w>k
noremap <Down>     <C-w>j

"
set laststatus=2
syntax enable
syntax on
autocmd! bufwritepost .vimrc source %

" buffers
set autoread
set hidden       " allow hidden background buffers
augroup buffer | autocmd! | augroup END

" .....................................................................
" Filetype
let g:filetype = 'sh'  " for new filenames (with no file .extension)

" Diff buffer
" __________________________________________________________________
"
" " .................................................................... Open
" diff
" " go to left window in case a diff window is already open and close it
nmap <silent><leader>dd :silent OpenDiff<CR>
"
" " File actions
" _________________________________________________________________
"
" " .......................................................... Buffer close /
" save
" " save buffers
nmap <silent><leader>w  :silent write!<CR>
nmap <leader>W          :silent write !sudo tee % >/dev/null<CR>
nmap <silent><leader>ww :silent wqall!<CR>
"
" " close buffers
nmap <silent><leader>d  :silent CloseUnique<CR>
nmap <silent><leader>DD :CloseDiff<CR>:%bdelete!<CR>
nmap <leader>D          :silent Singleton<CR>
" " discard quit
nmap <silent><leader>qq :quitall!<CR>


" Buffer handling
" ______________________________________________________________
"
" " ...............................................................
" Initialization
" " always switch to the current file directory, unless uri
autocmd buffer BufEnter    * if bufname('') !~ '^[A-Za-z0-9]*://' | lcd %:p:h | echo | endif
" " return to last edit position when opening files (You want this!)
autocmd buffer BufReadPost * if line("'\"") > 0 && line("'\"") <= line('$') | execute 'normal! g`"' | endif
"
" " ...................................................................
" Modifiable
" " toggle modifiable attribute
nmap <silent><leader>- :let &modifiable = (&modifiable == 0 ? 1 : 0)<CR>

" ................................................................ Switch buffer
nmap <leader>B   :echo '[' . bufnr('%') . '] ' . expand('%:p')<CR>

" beakl si layout specific buffer navigation key assignments, note silent -> silent
if $BEAKL > ''
  " don't wait for statusline refresh to set split colors, see ui.vim s:showInfo()
  nmap <silent><Delete> :CloseDiff<CR>:silent bprevious<CR>:SplitColors<CR>
  nmap <silent><Enter>  :Enter<CR>
else
  nmap <silent>-        :CloseDiff<CR>:silent bprevious<CR>:SplitColors<CR>
  nmap <silent>+        :CloseDiff<CR>:silent bnext<CR>:SplitColors<CR>
endif
" switch to previously edited/viewed buffer
nmap <silent><BS>       :CloseDiff<CR>:silent edit #<CR>:SplitColors<CR>






"set clipboard=unnamed
set hlsearch
set incsearch
set ignorecase
set smartcase
set guifont=Hack:h12
" colorscheme Tomorrow-Night-Bright
colorscheme gruvbox
"colorscheme elflord
set background=dark
set showcmd
set showmatch
set autowrite

set number
set cursorline
set cursorcolumn "guibg=#404040
set relativenumber
set cc=80

set backspace=2
set smarttab
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre * :%s/^$\n\+\%$//ge

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set shiftround
set autoindent
set smartindent
set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" folding -- SimplyFold
"set foldmethod=indent
"set foldlevel=99
"nnoremap <space> za

set t_ti= t_te=
autocmd BufReadPost *
\ if ! exists("g:leave_my_cursor_position_alone") |
\     if line("'\"") > 0 && line ("'\"") <= line("$") |
\         exe "normal g'\"" |
\     endif |
\ endif
"
"
"

cnoremap ww execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

nmap <leader>/ :nohlsearch<CR>


imap jk <Esc>
imap kj <Esc>

nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
nnoremap [t :tabp<CR>
nnoremap ]t :tabn<CR>
nmap <C-c> gg"+yG
vmap <C-c> "+y
"inoremap <C-V> <ESC> "*pa
cmap w!! w !sudo tee >/dev/null %:p
nnoremap <F2> :set nonu!<CR>:set foldcolumn=0<CR>
" nmap <silent> <F3> :NERDTreeToggle<CR>
" nmap <silent> <F4> :TagbarToggle<CR>
"
" "copy
" vmap <F7> "+ygv"zy`>
" paste (Shift-F7 to paste after normal cursor, Ctrl-F7 to paste over visual selection)
" nmap <F7> zgP
" nmap <S-F7> zgp
" imap <F7> <C-r><C-o>z
" vmap <C-F7> zp`]
" cmap <F7> <C-r><C-o>z
" copy register
"
autocmd FocusGained * let @z=@+
" Keyboard shortcuts ___________________________________________________________

" ................................................................. Copy / paste
" prevent cascading paste insert
set pastetoggle=<F3>


" yank from the cursor to the end of the line, to be consistent with C and D.
" yank from the cursor to the end of the line, to be consistent with C and D.
" see yankring for plugin equivalent
nnoremap Y  y$
nnoremap vv V
nnoremap V  <C-v>$

" reselect/reyank text just pasted
nnoremap <leader>v gv
nnoremap <leader>V gvy
map      <leader>p pgvy

" highlight last inserted text
nnoremap <leader>i `[v`]



""""""""""""""""""""""""""""""PLUGIN CONFIG""""""""""""""""""""""""""
" .......................................................................... Fzf
let g:fzf_colors =
  \{
  \  'fg'      : ['fg', 'Normal']
  \, 'bg'      : ['bg', 'Normal']
  \, 'hl'      : ['fg', 'Directory']
  \, 'fg+'     : ['fg', 'CursorLine']
  \, 'bg+'     : ['bg', 'CursorLine']
  \, 'hl+'     : ['fg', 'Directory']
  \, 'border'  : ['fg', 'Ignore']
  \, 'gutter'  : ['bg', 'CursorLine']
  \, 'header'  : ['fg', 'Normal']
  \, 'info'    : ['fg', 'Special']
  \, 'marker'  : ['fg', 'Special']
  \, 'pointer' : ['fg', 'Special']
  \, 'prompt'  : ['fg', 'Directory']
  \, 'spinner' : ['fg', 'Special']
  \}

" close any diff buffer before leaving buffer
nmap <silent><leader>b :CloseDiff<CR>:Buffers<CR>
nmap <silent><leader>l :Lines<CR>
nmap <silent><leader>m :Marks<CR>
" nmap <leader>f       :FZF<CR>  " see notational-fzf for extended content search


" ........................................... Graphical undo
let g:mundo_width           = 40
let g:mundo_preview_bottom  = 1
let g:mundo_preview_height  = 20
let g:mundo_close_on_revert = 1  " automatically close windows
let g:mundo_right           = 1  " side
let g:mundo_verbose_graph   = 0  " condensed tree
let g:mundo_mirror_graph    = 0  " left align tree

function! s:toggleUndo()
  let l:filetype = &filetype  " mundo alters markdown filetype to conf (autocmd buffer side-effect?)
  MundoToggle
  let &filetype = l:filetype
endfunction

" nmap <silent><leader>u :MundoToggle<CR>
nmap <silent><leader>u :call <SID>toggleUndo()<CR>

"autocmd plugin BufEnter  __Mundo__         setlocal numberwidth=3 foldcolumn=0
" for instance when mundo window is orphaned (trap timing conflict)
"autocmd plugin BufHidden __Mundo_Preview__ Quiet bdelete!\ __Mundo_Preview__

" ......................................... Highlighted yank
let g:highlightedyank_highlight_duration = 500

" ............................................ Indent guides
let g:indent_guides_auto_colors = 0  " highlight even indents, see gui:ToggleColumn, theme:Guides()

nmap <silent><leader><Bar> :IndentGuidesToggle<CR>

" ............................................ Nerdcommenter
let g:NERDSpaceDelims            = 1  " space after comment delimiter
let g:NERDCompactSexyComs        = 1  " prettify multi-line
let g:NERDDefaultAlign           = 'left'
let g:NERDCustomDelimiters       = { 'c' : { 'left' : '//', 'right' : '' } }
let g:NERDCommentEmptyLines      = 1  " comment blank lines
let g:NERDTrimTrailingWhitespace = 1  " trim trailing whitespace

" <leader>cs to force commenting of first line comment
map  <leader>c <Plug>NERDCommenterToggle
imap ,c        <C-o>:execute "normal \<Plug>NERDCommenterToggle"<CR>

" ........................................... Notational-fzf
" buffers load after plugins so parse command line for filename
function! s:argFile()
  if argc() > 0 | return argv(0) | endif
  return ''
endfunction

let g:nv_create_note_window  = 'edit'
let g:nv_default_extension   = ''
let g:nv_expect_keys         = []
let g:nv_main_directory      = './'    " create new notes in current directory
let g:nv_preview_direction   = 'right'
let g:nv_preview_width       = 55
let g:nv_search_paths        = ['./']  " default search from current directory
let g:nv_show_preview        = 1       " alt-p to toggle preview
let g:nv_use_short_pathnames = 1
let g:nv_wrap_preview_text   = 1

" notational path rules: [regex, rootpath, ext]
" note: regex magic is not enabled at this stage so force with '\v'
let s:set_notational = [['.wiki$',                          ['~/vimwiki', '~/drafts'],  'wiki' ]
  \,                   ['.draft$',                          ['~/drafts'],               'draft']
  \,                   ['.note$',                           ['~/notes'],                'note' ]
  \,                   ['\v([~]|' . $HOME . '|/stow)/bin/', ['~/bin'],                  ''     ]
  \,                   ['.vim/',                            ['~/.vim/config'],          'vim'  ]
  \,                   ['herbstluftwm/',                    ['~/.config/herbstluftwm'], ''     ]
  \,                   ['archlinux/',                       ['~/build/archlinux'],      ''     ]]

" dynamically setup notational-fzf :)
for i in s:set_notational
  if s:argFile() =~ i[0]
    let g:nv_search_paths      = i[1]
    let g:nv_default_extension = i[2]
    break
  endif
endfor

nnoremap <silent><leader>f :NV<CR>


"
"
"Ctrl-X Ctrl-U emoji
set completefunc=emoji#complete
"

"
" " airline
"let g:airline_section_y = '%{strftime("%H:%M")}'
" tabline
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline#extensions#tabline#buffer_nr_show = 1
"
" " jedi
autocmd FileType python setlocal completeopt-=preview
let g:jedi#completions_command = "<C-n>"
"
" " vim-table-mode: markdown
let g:table_mode_corner="|"
"
" " rainbow_parentheses
let g:rbpt_colorpairs = [
\ ['brown',       'RoyalBlue3'],
\ ['Darkblue',    'SeaGreen3'],
\ ['darkgray',    'DarkOrchid3'],
\ ['darkgreen',   'firebrick3'],
\ ['darkcyan',    'RoyalBlue3'],
\ ['darkred',     'SeaGreen3'],
\ ['darkmagenta', 'DarkOrchid3'],
\ ['brown',       'firebrick3'],
\ ['gray',        'RoyalBlue3'],
\ ['darkmagenta', 'DarkOrchid3'],
\ ['Darkblue',    'firebrick3'],
\ ['darkgreen','RoyalBlue3'],
\ ['darkcyan','SeaGreen3'],
\ ['darkred','DarkOrchid3'],
\ ['red','firebrick3'],
\ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle= 0


"
let g:vcoolor_map = '<leader>cp'
let g:vcool_ins_rgb_map = '<leader>cpr'

let g:vcool_ins_hsl_map = '<leader>cph'

let g:vcool_ins_rgba_map = '<leader>cpra'

" let g:ycm_autoclose_preview_window_after_completion=1
" map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" let g:ycm_key_invoke_completion = '<C-Space>'

" vim-go shit
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
"inoremap <C-Space> <C-x><C-o>
"inoremap <C-@> <C-Space>
""let g:airline_theme='tomorrow'
"let g:airline_theme='gruvbox'

let g:yaasita_slack_token = "xoxp-3722662412-243834316402-273265683716-8d5dc0bb1ca3ac6935fc8df30c462029"

function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()



if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

let g:asyncomplete_auto_popup = 0

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
" imap <c-space> <Plug>(asyncomplete_force_refresh)
