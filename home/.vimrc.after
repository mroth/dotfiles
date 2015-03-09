""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color schemes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme solarized

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Convenience stuff for specific dev environments
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" bind control-l to hashrocket
imap <C-l> <Space>=><Space>

" convert word into ruby symbol
imap <C-k> <C-o>b:<Esc>Ea
nmap <C-k> lbi:<Esc>E

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim things that only apply to GUI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has ("gui_running")
    set go-=T                 " no toolbar
    set guifont=Monaco:h12		" default font and size
    set background=light
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Weird meta vim shit
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto-source the vimrc file whenever it is saved
if has("autocmd")
    autocmd! bufwritepost .vimrc source $MYVIMRC
endif

" ,v to edit vimrc in new tab
let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>
