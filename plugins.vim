" plugin config setting

let s:enabled = {"simple": 1, "high": 1, "lightline": 1, "lsp-lcn": 1, "ale": 1, "which-key": 1, "LeaderF": 1, "supertab": 1, "nerdtree": 1}

call plug#begin(get(g:, "bundle_home", "~/.vim/bundles"))
"----------------------------------------------------------------------
" package group - simple
"----------------------------------------------------------------------
if has_key(s:enabled, "simple")
    Plug 'easymotion/vim-easymotion'
	Plug 'Raimondi/delimitMate'
	Plug 'justinmk/vim-dirvish'
	Plug 'justinmk/vim-sneak'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-unimpaired'
    Plug 'plasticboy/vim-markdown'
    Plug 'mzlogin/vim-markdown-toc'
	Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
    Plug 'dstein64/vim-startuptime', {'on': 'StartupTime'}
    Plug 'bootleq/vim-cycle'
	Plug 'tpope/vim-surround'

	nnoremap gb= :Tabularize /=<CR>
	vnoremap gb= :Tabularize /=<CR>
	nnoremap gb/ :Tabularize /\/\//l4c1<CR>
	vnoremap gb/ :Tabularize /\/\//l4c1<CR>
	nnoremap gb* :Tabularize /\/\*/l4c1<cr>
	vnoremap gb* :Tabularize /\/\*/l4c1<cr>
	nnoremap gb, :Tabularize /,/r0l1<CR>
	vnoremap gb, :Tabularize /,/r0l1<CR>
	nnoremap gbl :Tabularize /\|<cr>
	vnoremap gbl :Tabularize /\|<cr>
	nnoremap gbc :Tabularize /#/l4c1<cr>
	nnoremap gb<bar> :Tabularize /\|<cr>
	vnoremap gb<bar> :Tabularize /\|<cr>
	nnoremap gbr :Tabularize /\|/r0<cr>
	vnoremap gbr :Tabularize /\|/r0<cr>
	map gz <Plug>Sneak_s
	map gZ <Plug>Sneak_S
endif

"----------------------------------------------------------------------
" package group - high
"----------------------------------------------------------------------
if has_key(s:enabled, 'high')
	Plug 'kshenoy/vim-signature'
	Plug 'mhinz/vim-signify'
	Plug 'junegunn/fzf'
	Plug 'junegunn/fzf.vim'
	Plug 'jceb/vim-orgmode', { 'for': 'org' }
	Plug 'itchyny/calendar.vim', { 'on': 'Calendar' }
	Plug 'francoiscabrol/ranger.vim'
	Plug 'dhruvasagar/vim-table-mode'

	if has('python3') || has('python2')
		Plug 'chiel92/vim-autoformat'
	endif

	let g:errormarker_disablemappings = 1
	nnoremap <silent> <leader>cm :ErrorAtCursor<CR>
	nnoremap <silent> <leader>cM :RemoveErrorMarkers<cr>

	let g:ranger_map_keys = 0

end

" lightline
if has_key(s:enabled, 'lightline')
	Plug 'itchyny/lightline.vim'
	Plug 'ap/vim-buftabline'
endif

" if has_key(s:enabled, 'lsp-lcn')
"	Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next' }
" endif

if has_key(s:enabled, 'ale')
	Plug 'w0rp/ale'
endif

if has_key(s:enabled, 'which_key')
	Plug 'liuchengxu/vim-which-key'
	IncScript site/bundle/which_key.vim
endif

if has_key(s:enabled, 'LeaderF')
		Plug 'Yggdroot/LeaderF'
		Plug 'tamago324/LeaderF-filer'
		Plug 'voldikss/LeaderF-emoji'
endif

if has_key(s:enabled, 'supertab')
	Plug 'ervandew/supertab'
endif

if has_key(s:enabled, 'nerdtree')
	Plug 'scrooloose/nerdtree', {'on': ['NERDTree', 'NERDTreeFocus', 'NERDTreeToggle', 'NERDTreeCWD', 'NERDTreeFind'] }
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
endif

call plug#end()

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
" nerdtree
"
nmap <C-N> :NERDTreeToggle<CR>


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



