" plugin config setting

let s:enabled = {"simple": 1, "high": 1, "lightline": 1, "lsp-lcn": 1, "ale": 1, "which-key": 1, "leaderf": 1, "supertab": 1, "nerdtree": 1, "vista": 1}

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

    source $HOME/.vim/site/bundle/easymotion.vim
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
    source $HOME/.vim/site/bundle/lightline.vim
endif

 if has_key(s:enabled, 'lsp-lcn')
	Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ }
    source $HOME/.vim/site/bundle/lcn.vim
 endif

if has_key(s:enabled, 'ale')
	Plug 'w0rp/ale'
    source $HOME/.vim/site/bundle/ale.vim
endif

if has_key(s:enabled, 'which_key')
	Plug 'liuchengxu/vim-which-key'
    source $HOME/.vim/site/bundle/which_key.vim
endif

if has_key(s:enabled, 'leaderf')
	Plug 'Yggdroot/LeaderF'
	Plug 'tamago324/LeaderF-filer'
	Plug 'voldikss/LeaderF-emoji'
    source $HOME/.vim/site/bundle/leaderf.vim
endif

if has_key(s:enabled, 'vista')
    Plug 'liuchengxu/vista.vim'
endif

if has_key(s:enabled, 'supertab')
	Plug 'ervandew/supertab'
endif

if has_key(s:enabled, 'nerdtree')
	Plug 'scrooloose/nerdtree', {'on': ['NERDTree', 'NERDTreeFocus', 'NERDTreeToggle', 'NERDTreeCWD', 'NERDTreeFind'] }
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    source $HOME/.vim/site/bundle/nerdtree.vim
endif

call plug#end()

"
" markdown
"
let g:vim_markdown_folding_disabled = 1


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
" nerdtree
"
nmap <C-N> :NERDTreeToggle<CR>


"
" which-key
"
let g:mapleader = "\<Space>"
let g:maplocalleader = ","

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :WhichKey ','<CR>



