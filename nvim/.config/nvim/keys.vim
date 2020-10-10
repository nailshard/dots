" nnoremap <leader>c call NERDCommenterToggle()
" map cc <plug>NERDCommenterToggle()
nmap cc gcc
" nnoremap <space> za
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>% :source %<CR>
nnoremap gev :e $MYVIMRC<CR>
nnoremap gsv :so $MYVIMRC<CR>

cnoremap \WQ :SudoWrite %<CR>:q<CR>
cnoremap \W :SudoWrite %<CR>
cnoremap \X :SudoChod +x<CR>
cnoremap \E  :SudoEdit
nnoremap !  :SudoEdit %

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CocList
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show all diagnostics.
nnoremap <silent> <leader>fa  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <leader>fe  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <leader>fc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <leader>fo  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <leader>fs  :<C-u>CocList -I symbols<cr>
" Do default action for next item in the last list.
nnoremap <silent> <leader>fj  :<C-u>CocNext<CR>
" Do default action for previous item in the last list.
nnoremap <silent> <leader>fk  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <leader>fp  :<C-u>CocListResume<CR>
" Find files in cwd.
nnoremap <silent> <leader>ff  :<C-u>CocList files<CR>
" List all errors (bugs).
nnoremap <silent> <leader>fb :<C-u>CocList locationlist<CR>
" Find buffers.
"TODO map <c-s> and <c-v> to open with splits.
nnoremap <silent> <leader>bf  :<C-u>CocList buffers<CR>


nnoremap <silent> <Leader>ml :call AppendModeline()<CR>
vnoremap < <gv
vnoremap > >gv


nnoremap <silent> K :call <SID>show_documentation()<CR>
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
nnoremap <C-p> :Files<ENTER>
if has('nvim')
  aug fzf_setup
    au!
    au TermOpen term://*FZF tnoremap <silent> <buffer><nowait> <esc> <c-c>
  aug END
end
"
"split navigations
noremap <silent> <m-h> :TmuxNavigateLeft<cr>
noremap <silent> <m-j> :TmuxNavigateDown<cr>
noremap <silent> <m-k> :TmuxNavigateUp<cr>
noremap <silent> <m-l> :TmuxNavigateRight<cr>
noremap <silent> <C-_> :<c-u> call vista#finder#fzf#Run() <CR>

" Use tab to trigger completion and navigate.
" inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" ctrl-space to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to comfirm completion.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap jk <ESC>

" nmap <leader>/ :nohlsearch<CR>
" tagbar
nmap <C-b> :TagbarToggle<CR>

" Use `[g` and `]g` to navigate diagnostics.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Keys for gotos.
" Add any filetype with an lsp to this au.
autocmd FileType c,cpp nmap <silent> gd <Plug>(coc-declaration)
nmap <silent> gw <Plug>(coc-type-definition)
nmap <silent> gy <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window (Or :help for vim keywords).
" Close a help floating window.
nmap <silent> <c-[> <esc>:noh<cr><Plug>(coc-float-hide)

" Rename current word.
"TODO it works in a weird way, that until you save all buffer, the new name is
"not recognized. Do that it will keep analytics before saving.
nmap <leader>lr <Plug>(coc-rename)

" Format selected region.
xmap <leader>lf  <Plug>(coc-format-selected)
nmap <leader>lf  <Plug>(coc-format-selected)

" Do codeAction for selected region, ex: `<leader>laap` for current paragraph.
"TODO realise how you choose the action.
"TODO look for useful actions, and maybe map them separately.
xmap <leader>la  <Plug>(coc-codeaction-selected)
nmap <leader>la  <Plug>(coc-codeaction-selected)

" Do codeAction of current line.
nmap <leader>lc  <Plug>(coc-codeaction)
" Fix autofix problem of current line.
nmap <leader>lq  <Plug>(coc-fix-current)

" Create mappings for function text object (requires document symbols feature of languageserver).
"TODO this is probably like i} and a} (like di}, da}). CONFIRM this!
"TODO this doesnt work!!!
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" Not supported by ccls.
"TODO understand what this does!
"nmap <silent> <C-d> <Plug>(coc-range-select)
"xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=? Unfold :0,$foldopen

" use `:OR` to organize imports of current buffer.
"TODO understand this. you seem to dont have this action. check if ccls has
"it, and generally what the hell is it.
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support for integration with other plugins. checkout `:h coc-status`
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


" nmap <space>e :CocCommand explorer<CR>


" Define mappings
autocmd FileType python map <buffer> <leader>af :call Autoflake()<CR>


" <leader>cs to force commenting of first line comment

map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
            \ && b:NERDTree.isTabTree()) | q | endif

map <leader>L :Prettier
"
" if has ('autocmd')
"     augroup 'vimrc'
"         echo 'heyyy! ' . @%
"         autocmd BufWritePost keys.vim source $MYVIMRC | echom "Reloaded " . $MYVIMRC
"                     \| call MyPlugs()
"                     \| redraw
"     augroup END
" endif " has autocmd
"
"
