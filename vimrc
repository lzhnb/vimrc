" ____    ____  __   _______   _______
" \   \  /   / |  | |       \ |   ____|
"  \   \/   /  |  | |  '--'  ||  |__
"   \      /   |  | |  |  |  ||   __|
"    \    /    |  | |  '--'  ||  |____
"     \__/     |__| |_______/ |_______|
"

set nocompatible

""" set the config root
let $VIMFILES=$HOME."/.vim"

""" theme
colorscheme one " set theme
set background=dark
set t_Co=256    " make vim look better in putty

""" filetype setting
filetype on
filetype indent on
filetype plugin on
nmap <leader>a :set filetype=awk        <CR>
nmap <leader>c :set filetype=css        <CR>
nmap <leader>d :set filetype=htmldjango <CR>
nmap <leader>e :set filetype=sed        <CR>
nmap <leader>g :set filetype=go         <CR>
nmap <leader>h :set filetype=html       <CR>
nmap <leader>j :set filetype=javascript <CR>
nmap <leader>l :set filetype=lua        <CR>
nmap <leader>m :set filetype=markdown   <CR>
nmap <leader>p :set filetype=php        <CR>
nmap <leader>s :set filetype=sh         <CR>
nmap <leader>v :set filetype=vim        <CR>
nmap <leader>y :set filetype=python     <CR>

" tell plugins the default bash
let g:is_bash=1
set shell=/bin/bash

" encoding setting
set ambiwidth=double
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8

" io setting
set autoread           " extern write protection
set nobackup           " delete backup file once writting
set noswapfile         " do not generate temp file
set clipboard+=unnamed " share the clipboard
set pastetoggle=<F4>   " switch the paste and nopaste mode
" set autowriteall       " writing for each modify

" indent setting
set smartindent
set cindent
set autoindent
set smarttab
set shiftwidth=4 " first line
set tabstop=4    " other lines
set expandtab


" interface setting
syntax on
set showcmd           " Show cmd in vim-cmdline.
set number            " show line number
set backspace=2       " define the range of backsapce
set ignorecase        " ignoring case in a pattern 
set smartcase         " help for re search
set complete-=i       " complete content not found from include file 
set visualbell t_vb=  " close the bell and do not shining
set noautochdir       " do not change work dir according to current file
set foldmethod=manual " fold block manually
set noshowmatch       " do not showmatch
set wrapscan          " search wrap around the end of the file 
set scrolloff=6       " set the minimum offset between top/bottom and current line
set textwidth=0       " maximum width of text that is being inserted

" highlight
set cursorline        " highlight current line
nnoremap <F3> :set hlsearch!<CR> 


" terminal
nnoremap <F5> :wa<CR>:vertical botright terminal ++kill=terminal<CR>

" buffer setting
set hidden " hide the buffer files
nmap <C-J> :bnext<CR>
nmap <C-K> :bprev<CR>
nmap <C-D> :bdelete<CR>

" path setting
set undodir=~/.vimtmp/undodir " set the undo directory
            \ directory=~/.vimtmp/directory
            \ backupdir=~/.vimtmp/backupdir
            \ viewdir=~/.vimtmp/view
            \ undofile
" ignore some files and dirs to accelerate search(ctrlp)
set wildignore+=*.git\\*,*.tgz,*.zip,*.url,*.pyc,*.class

"
" syntastic
"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_quiet_messages = { "level": "errors" }

"
" Netrw(replace NERDTree)
"
let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Vexplore!
        set number
    endif
endfunction

map <C-E> :call ToggleNetrw()<CR>
let g:netrw_dirhistmax = 0          " do not generate .netrwhist
let g:netrw_banner = 0              " hide the banner
let g:netrw_winsize = 20            " set the size
let g:netrw_browse_split = 4        " open in previous window
let g:netrw_liststyle = 3           " tree explorer style
let g:netrw_localrmdir = 'trash'    " remove file by trash

source plugins.vim


