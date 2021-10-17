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



