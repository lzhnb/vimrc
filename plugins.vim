" plugin config setting

"
" markdown
"
let g:vim_markdown_folding_disabled = 1

"
" lightline
"
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

"
" LeaderF
"
let g:Lf_ReverseOrder = 1
nmap <C-P> :LeaderfFile<CR>
nmap <C-N> :LeaderfMru<CR>
nmap <F2> :LeaderfFunction!<CR>
nmap <leader>B :LeaderfBuffer<CR>
nmap <leader>T :LeaderfTag<CR>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'onedark'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_PreviewResult = {'Function':0, 'Colorscheme':1}
let g:Lf_NormalMap = {
            \ "File": [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
            \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
            \ "Mru": [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
            \ "Tag": [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
            \ "Function": [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
            \ "Colorscheme": [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
            \ }

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


"
" LeaderF
"
nmap <Leader>en <Plug>(ale_next)
nmap <Leader>ep <Plug>(ale_previous)

"
" which-key
"
let g:mapleader = "\<Space>"
let g:maplocalleader = ","

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :WhichKey ','<CR>



