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
colorscheme onedark " set theme
set t_Co=256        " make vim look better in putty

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
nmap <leader>t :set filetype=txt        <CR>
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
set pastetoggle=<F5>   " switch the paste and nopaste mode
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
set cursorline        " highlight current line
set hlsearch          " highlight search result
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

" buffer setting
set hidden " hide the buffer files

" path setting
set undodir=~/.vimtmp/undodir " set the undo directory
            \ directory=~/.vimtmp/directory
            \ backupdir=~/.vimtmp/backupdir
            \ viewdir=~/.vimtmp/view
            \ undofile
" ignore some files and dirs to accelerate search(ctrlp)
set wildignore+=*.git\\*,*.tgz,*.zip,*.url,*.pyc,*.class


""" set the statusline output
function! BufTotalNum()
    return len(filter(range(1, bufnr("$")), "buflisted(v:val)"))
endfunction
function! FileSize(f)
    let l:size = getfsize(expand(a:f))
    if l:size == 0 || l:size == -1 || l:size == -2
        return ""
    endif
    if l:size < 1024
        return l:size." bytes"
    elseif l:size < 1024*1024
        return printf("%.1f", l:size/1024.0)."k"
    elseif l:size < 1024*1024*1024
        return printf("%.1f", l:size/1024.0/1024.0) . "m"
    else
        return printf("%.1f", l:size/1024.0/1024.0/1024.0) . "g"
    endif
endfunction
set laststatus=2
set statusline=%<%1*[B-%n]%*
" TOT is an abbreviation for total
set statusline+=%2*[TOT:%{BufTotalNum()}]%*
set statusline+=%3*\ %{FileSize(@%)}\ %*
set statusline+=%4*\ %F\ %*
set statusline+=%5*\ %m%r%y\ %*
set statusline+=%=%6*\ %{&ff}\ \|\ %{\"\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"\ \|\"}\ %-14.(%l:%c%V%)%*
set statusline+=%7*\ %P\ %*
" default bg for statusline is 236 in space-vim-dark
hi User1 cterm=bold ctermfg=232 ctermbg=179
hi User2 cterm=None ctermfg=214 ctermbg=242
hi User3 cterm=None ctermfg=251 ctermbg=240
hi User4 cterm=bold ctermfg=169 ctermbg=239
hi User5 cterm=None ctermfg=246 ctermbg=237
hi User6 cterm=None ctermfg=250 ctermbg=238
hi User7 cterm=None ctermfg=249 ctermbg=240


let g:vim_markdown_folding_disabled = 1
let g:gitgutter_max_signs=10000

"
" syntastic
"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_quiet_messages = { "level": "errors" }

"
" NERDTree
"
let g:NERDTreeDirArrowExpandable  = "@"
nmap <leader>3 :NERDTreeFind            <CR>
let g:NERDTreeDirArrowCollapsible = "-"
let g:NERDTreeShowHidden          = 0
let g:NERDTreeBookmarksFile       = $HOME."/.vimtmp/NerdBookmarks.txt"
let g:NERDTreeShowBookmarks       = 1
let g:NERDTreeShowFiles           = 1
let g:NERDTreeShowLineNumbers     = 0
let g:NERDTreeWinSize             = 29
let g:NERDTreeMinimalUI           = 1
let g:NERDTreeDirArrows           = 1
let g:NERDTreeIgnore              = [
            \ ".*\.class",
            \ ".*\.pyc",
            \ ".*\.chm",
            \ ".*\.ttf",
            \ ".*\.lnk",
            \ ".*\.cproj",
            \ ".*\.exe",
            \ ".*\.dll",
            \ ".*\.out",
            \ ".*\.files",
            \ ".*\.zip",
            \ ".*\.rar",
            \ ".*\.gif"
            \ ]
let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ "Unknown"   : "?"
            \ }

"
" ctrlp
"
" Making CtrlP.vim load 100x faster — A Tiny Piece of Vim — Medm
" https://medium.com/a-tiny-piece-of-vim/making-ctrlp-vim-load-100x-faster-7a722fae7df6#.emcvo89nx
let g:ctrlp_user_command = [
            \ ".git/",
            \ "git --git-dir=%s/.git ls-files -oc --exclude-standard"
            \ ]
let g:ctrlp_match_window       = "bottom,order:btt,min:5,max:5,results:10"
let g:ctrlp_cmd                = "CtrlPMixed"
let g:ctrlp_mruf_default_order = 1

"
" utime.vim
"
let g:timeStampFormat = "170101"
let g:timeStampString = "%y%m%d"
let g:timeStampLeader = "version"

"
" snips
"
" TODO: add the snips plugin

"
" ale
"
let g:ale_set_highlights = 0
let g:ale_fix_on_save = 1
let g:ale_echo_msg_format = "[#%linter%#] %s [%severity%]"
let g:ale_statusline_format = ["E•%d", "W•%d", "OK"]

let g:ale_sign_error = "X"
let g:ale_sign_warning = "W"
let g:ale_statusline_format = ["X %d", "W %d", "Y OK"] " integrate into statuline

let g:ale_echo_msg_error_str = "E"
let g:ale_echo_msg_warning_str = "W"
let g:ale_echo_msg_format = "[%linter%] %s [%severity%]"

let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_lint_on_text_changed = "normal"
let g:ale_lint_on_insert_leave = 1

" Check Python files with flake8 and pylint.
let b:ale_linters = {
\   "python": ["flake8", "pylint"]
\}
let g:ale_python_flake8_options = "--ignore=E501,W291,N806,F405"
" Fix Python files with autopep8 and yapf.
let b:ale_fixers = {
\   "python": ["autopep8", "yapf"]
\}
" Disable warnings about trailing whitespace for Python files.
let b:ale_warn_about_trailing_whitespace = 0

nmap <Leader>en <Plug>(ale_next)
nmap <Leader>ep <Plug>(ale_previous)
nnoremap <Leader>ts :ALEToggle<CR>


