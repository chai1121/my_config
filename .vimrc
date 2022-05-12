let mapleader=" "
set number " 显示行号
set relativenumber " 显示相对行号，便于跳转
set cursorline " 突出显示当前行
set cursorline  " 在光标所在行显示一条线
set ignorecase " 忽略大小写，针对vim命令也有用
set smartcase  " 搜索时的智能大小写

set wildmenu 

" 移动
map J 5j
map K 5k

set smartindent " 开启新行时使用智能自动缩进
set cindent  " c语言缩进
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
set tabstop=4
set incsearch	
set autochdir  " 自动跳转到当前目录

" 分屏
map <LEADER>l <C-w>l
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k

" 插件
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'  "主题
Plug 'neoclide/coc.nvim', {'branch': 'release'} " coc

Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Markdown
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
call plug#end()
"-----------------------------------------------------------------------------------------------
" coc的配置
let g:coc_global_extensions = ['coc-json','coc-vimlsp']
set updatetime=100 "vim的响应时间
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" 跳转
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" 跳转到文档
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"----------------------------------------------------------------------------------------------------
" markdown 配置
	"let g:mkdp_path_to_chrome = "/usr/local/bin/chrome"
    " 设置 chrome 浏览器的路径（或是启动 chrome（或其他现代浏览器）的命令）
    " 如果设置了该参数, g:mkdp_browserfunc 将被忽略

    let g:mkdp_browserfunc = 'MKDP_browserfunc_default'
    " vim 回调函数, 参数为要打开的 url

    let g:mkdp_auto_start = 0
    " 设置为 1 可以在打开 markdown 文件的时候自动打开浏览器预览，只在打开
    " markdown 文件的时候打开一次

    let g:mkdp_auto_open = 0
    " 设置为 1 在编辑 markdown 的时候检查预览窗口是否已经打开，否则自动打开预
    " 览窗口

    let g:mkdp_auto_close = 1
    " 在切换 buffer 的时候自动关闭预览窗口，设置为 0 则在切换 buffer 的时候不
    " 自动关闭预览窗口

    let g:mkdp_refresh_slow = 0
    " 设置为 1 则只有在保存文件，或退出插入模式的时候更新预览，默认为 0，实时
    " 更新预览

    let g:mkdp_command_for_global = 0
    " 设置为 1 则所有文件都可以使用 MarkdownPreview 进行预览，默认只有 markdown
    " 文件可以使用改命令

    let g:mkdp_open_to_the_world = 0
    " 设置为 1, 在使用的网络中的其他计算机也能访问预览页面
    " 默认只监听本地（127.0.0.1），其他计算机不能访问

"主题配置
colorscheme snazzy
