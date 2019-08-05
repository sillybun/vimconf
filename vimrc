if has('python3')
endif

let g:mapleader=' '

filetype off                  " required

call plug#begin('~/.vim/plugged')
" " 启用vundle来管理vim插件
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" 安装插件写在这之后

" let Vundle manage Vundle, required
Plug 'VundleVim/Vundle.vim'
" Youcompleteme: 非常好用的自动补全工具
Plug 'https://github.com/Valloric/YouCompleteMe'
" delimitMate: 括号补全工具
Plug 'https://github.com/Raimondi/delimitMate'
" " Ctrlp: 搜索文件工具
" Plug 'https://github.com/kien/ctrlp.vim'
" nnoremap <leader>p :CtrlP<CR>
" nnoremap <leader>n :vsplit<CR>:CtrlP<CR>
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"   \ 'file': '\v\.(exe|so|dll)$',
"   \ 'link': 'some_bad_symbolic_links',
"   \ }

Plug 'airblade/vim-gitgutter'
" 展示git版本之间的区别
set updatetime=1000
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}
let g:Lf_WorkingDirectoryMode = 'a'
let g:Lf_WildIgnore = {
        \ 'dir': ['.mypy_cache', '__python__'],
        \ 'file': ['*.png', '*.jpg', '*.gif', '*.swp', '*.gif']
        \}
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
" nnoremap \ :Ag<Cr>
nnoremap \ :Leaderf rg<Cr>

Plug 'dyng/ctrlsf.vim'
" Mapping selecting mappings
" nmap <leader><tab> <plug>(fzf-maps-n)
" xmap <leader><tab> <plug>(fzf-maps-x)
" omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
" imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
" imap <c-x><c-j> <plug>(fzf-complete-file-ag)
" imap <c-x><c-l> <plug>(fzf-complete-line)
" set rtp+=/usr/local/opt/fzf
" commentary: 这是一个代码注释工具
Plug 'https://github.com/tpope/vim-commentary'
aug VIMCOMMENT
    autocmd!
    autocmd FileType apache setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
aug VIMCOMMENT
" autoformat: 自动对其工具
Plug 'Chiel92/vim-autoformat'
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
" Plug 'altercation/vim-colors-solarized'
" multiple-cursors: 非常好用的格式化代码工具
Plug 'https://github.com/terryma/vim-multiple-cursors'
" 文件树工具
Plug 'https://github.com/scrooloose/nerdtree'
nnoremap <leader>o :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd bufenter * if (winnr("$") == 1 && exists("AsyncRun!")) | q | endif
autocmd bufenter * if (winnr("$") == 1 && (&buftype) == "quickfix") | q | endif
" rainbow_parentheses.vim 彩色的括号！
Plug 'kien/rainbow_parentheses.vim'
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
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['darkcyan',    'SeaGreen3'],
            \ ['darkred',     'DarkOrchid3'],
            \ ['red',         'firebrick3'],
            \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" python 代码折叠工具
Plug 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1
autocmd FileType python nnoremap <space>z za
" python 代码缩进
" 提示行末空格
Plug 'https://github.com/bitc/vim-bad-whitespace'
" molikai 配色风格
Plug 'https://github.com/tomasr/molokai'
" airline 下方提示线
Plug 'https://github.com/bling/vim-airline'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
" function! GetCurrentInput()
"     let l:name = system('xkbswitch -g')
"     if l:name == 0
"         return '中文'
"     else
"         return 'Eng'
"     endif
" endfunction
" let g:airline_section_y = '%{GetCurrentInput()}'
let g:ale_sign_column_always = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['pylint', 'mypy'],
\   'tex': ['redpen'],
\   'plaintex': ['redpen'],
\}
nnoremap <F6> :ALEFix<CR>
" let g:airline#extensions#ale#enabled = 1

" 是否打开tabline
" let g:airline#extensions#tabline#enabled = 1
" 更快的移动
Plug 'easymotion/vim-easymotion'
nmap <leader>s <Plug>(easymotion-s)
" 异步执行
Plug 'skywind3000/asyncrun.vim'
Plug 'sillybun/zytutil'
Plug 'w0rp/ale'
nmap <silent> <leader>b <Plug>(ale_previous_wrap)
nmap <silent> <leader>n <Plug>(ale_next_wrap)
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
autocmd FileType c,c++ let b:ale_fixers = ['clang-format']
" let g:ale_set_highlights = 0
" let g:ale_fix_on_save = 1

" let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" let g:ale_sign_error='✹'
" let g:ale_sign_warning='✴'

"Plug 'sjl/gundo.vim'
Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'sillybun/vim-snippets'
Plug 'sillybun/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)
" let g:UltiSnipsExpandTrigger="<c-v>"
" let g:UltiSnipsJumpForwardTrigger="<c-v>"
" let g:UltiSnipsJumpBackwardTrigger="<c-b>"

Plug 'ervandew/supertab'
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<Right>"
let g:UltiSnipsJumpBackwardTrigger = "<Left>"

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'simnalamburt/vim-mundo'
autocmd bufenter * if (winnr("$") == 2 && (bufwinnr(bufnr("__Mundo__")) !=-1 && bufwinnr(bufnr("__Mundo_Preview__")) != -1)) | call g:MundoClose() | endif
set undofile
set undodir=~/.vim/undo
let g:mundo_prefer_python3 = 1
"let g:gundo_width = 60
"let g:gundo_preview_height = 40
"let g:gundo_right = 1
nnoremap <leader>h :MundoToggle<CR>
" Plug 'terryma/vim-expand-region'
" Plug 'https://github.com/kana/vim-textobj-user'
" Plug 'sgur/vim-textobj-parameter'
Plug 'Yggdroot/indentLine'
" Plug 'https://github.com/kana/vim-textobj-line'
" Plug 'https://github.com/kana/vim-textobj-entire'
" Plug 'https://github.com/kana/vim-textobj-intent'
" vmap v <Plug>(expand_region_expand)
" vmap V <Plug>(expand_region_shrink)
" Plug 'scrooloose/syntastic'
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" Plug 'wakatime/vim-wakatime'

Plug 'sillybun/vim-barbaric'
let g:barbaric_default = 2

" Plug 'sillybun/setbreakpoints_python'
" let g:setbreakpoints_pdb = 0
" autocmd Filetype python nnoremap <F12> <Esc>:call ToggleBreakPoint()<Cr>
Plug 'sillybun/autoformatpythonstatement', {'do': './install.sh'}
" let g:autoformatpython_enabled = 1
Plug 'sillybun/vim-repl'
let g:repl_program = {
            \   'python': 'ipython',
            \   'default': 'zsh',
            \   'r': 'R',
            \   'lua': 'lua',
            \   }
let g:repl_predefine_python = {
            \   'numpy': 'import numpy as np',
            \   'matplotlib': 'from matplotlib import pyplot as plt'
            \   }
" let g:repl_checkpoint_position = '~/.temp/'
let g:repl_auto_sends = ['class ', 'def ', 'for ', 'if ', 'while ']
let g:repl_cursor_down = 1
let g:repl_python_automerge = 1
nnoremap <leader>r :REPLToggle<Cr>
autocmd Filetype python nnoremap <F12> <Esc>:REPLDebugStopAtCurrentLine<Cr>
autocmd Filetype python nnoremap <F10> <Esc>:REPLPDBN<Cr>
autocmd Filetype python nnoremap <F11> <Esc>:REPLPDBS<Cr>
let g:repl_position = 3
" let g:repl_width = 70
" let g:termdebug_wide = 1
Plug 'sillybun/vim-async'
Plug 'sillybun/vim-autodoc'
" let g:autodoc_debug_mode = 1
let g:autodoc_display_runtime_info = 1
autocmd Filetype c,cpp packadd termdebug
Plug 'fisadev/vim-isort'
" Plug 'https://github.com/jpalardy/vim-slime'
Plug 'jacoborus/tender.vim'
Plug 'rakr/vim-one'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'iCyMind/NeoSolarized'
Plug 'crusoexia/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'inkarkat/vim-mark'
Plug 'inkarkat/vim-ingo-library'
nmap <Leader>N <Plug>MarkConfirmAllClear

" Plug 'tenfyzhong/CompleteParameter.vim'
" inoremap <silent><expr> ( complete_parameter#pre_complete("()")
" smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
" imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
" smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
" imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
"
"安装插件写在这之前
" call vundle#end()            " required
" filetype plugin on    " required
call plug#end()

" 常用命令
" :PlugList       - 查看已经安装的插件
" :PlugInstall    - 安装插件
" :PlugUpdate     - 更新插件
" :PlugSearch     - 搜索插件，例如 :PluginSearch xml就能搜到xml相关的插件
" :PlugClean      - 删除插件，把安装插件对应行删除，然后执行这个命令即可

" h: vundle         - 获取帮助

"  vundle的配置到此结束，下面是你自己的配置
"

" colorscheme molokai

" colorscheme NeoSolarized
" colorscheme monokai
colorscheme neodark
" let g:neodark#terminal_transparent = 1
" colorscheme gruvbox
" let g:neodark#background = '#202020'


set nocompatible
syntax on
filetype plugin indent on
set hlsearch incsearch
set cursorline
set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8,ucs-bom,GB2312,big5
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set scrolloff=4
set showmatch
set number
set smartcase
set showcmd
set mouse=a
set regexpengine=1
set viminfo+=:1000
set wildmenu
set noerrorbells
" set hidden

" ---------------
" let s:timer = -1

" function! s:BalloonShow(...)
"   let s:message =
"           \ 'Cursor is at line ' . v:beval_lnum .
"           \', column ' . v:beval_col .
"           \ ' of file ' .  bufname(v:beval_bufnr) .
"           \ ' on word "' . v:beval_text . '"'
"   call balloon_show(s:message)
" endfunction

" function! MyBalloonExpr()
"   call timer_stop( s:timer )
"   let s:timer = timer_start(100, function('s:BalloonShow'))
"   return ''
" endfunction

" set mouse=a
" set ttymouse=sgr
" set balloonexpr=MyBalloonExpr()
" set balloondelay=300
" ---------------

set clipboard=unnamed

nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap tt :tab split<CR>
nnoremap <leader>j <C-f>zz
vnoremap <leader>j <C-f>zz
nnoremap <leader>k <C-b>zz
vnoremap <leader>k <C-b>zz
onoremap p i(
onoremap in( :<c-u>normal! f(vi(<cr>

nnoremap Q @q
vnoremap Q :norm @q<cr>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>q :q<cr>
nnoremap <Bs> <C-o>
"nnoremap <UP> ddkP
"nnoremap <DOWN> ddp
nnoremap <LEFT> b
nnoremap <RIGHT> w
vnoremap <DOWN> xp`[V`]
vnoremap <UP> xkP`[V`]
vnoremap < <`[V`]
vnoremap > >`[V`]

inoremap <C-E> <Esc>$a
inoremap <C-A> <Esc>^i

inoremap 。 .
inoremap ， ,
inoremap ？ ?
inoremap 【 [
inoremap 】 ]
inoremap 「 {
inoremap 」 }
inoremap …… ^
inoremap （ (
inoremap ） )

set langmap=xx


" for LISP
autocmd FileType lisp inoremap ` ()<Esc>ha
autocmd FileType lisp inoremap ;let (let ())<Esc>hha

" for python
let g:python_highlight_all=1
au Filetype python syn match pythonBoolean "\(\W\|^\)\@<=self\(\.\)\@="
au Filetype python syn match pythonBoolean "\((\)\@<=self\(\,\)\@="
" au Filetype python set textwidth=79
" au Filetype python set expandtab
au Filetype python set fileformat=unix
autocmd Filetype python set foldmethod=indent
autocmd Filetype python set foldlevel=99
autocmd FileType python nnoremap <Space> za
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
au Filetype python hi pythonBoolean ctermfg=93
au Filetype python hi pythonBooleanbefore ctermfg=93

" for youcompleteme
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter = '/usr/local/bin/python3'
autocmd Filetype python,c,cpp,Java,vim nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处
let g:ycm_key_invoke_completion = '<c-z>'
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_disable_for_files_larger_than_kb = 2000
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

"let g:ycm_python_binary_path = '/Users/zhangyiteng/miniconda3/bin/python'
let g:ycm_python_binary_path = 'python'
let g:ycm_register_as_syntastic_checker = 0
let g:ycm_max_num_candidates = 70
let g:ycm_complete_in_strings=1
let g:ycm_show_diagnostics_ui = 0
" let g:ycm_log_level = 'debug'

let g:ycm_filetype_whitelist = {
            \ 'c':1,
            \ 'cpp':1,
            \ 'objc':1,
            \ 'python': 1,
            \ 'Java': 1,
            \ 'sh':1,
            \ 'zsh':1,
            \ 'zimbu':1,
            \ 'vim':1,
            \ }

" autorun
""""""""""""""""""""""
"Quickly Run
""""""""""""""""""""""

nnoremap <F5> :call CompileRunGcc()<cr>

func! CompileRunGcc()
    exec 'w'
    if &filetype ==# 'c'
        exec 'gcc -o3 % -o %<'
        exec '!time ./%<'
    elseif &filetype ==# 'cpp'
        exec '!g++ -o3 % -o %<'
        exec '!time ./%<'
    elseif &filetype ==# 'java'
        exec '!javac %'
        exec '!time java %<'
    elseif &filetype ==# 'sh'
        :!time bash %
    elseif &filetype ==# 'python'
        if search('@profile')
            exec 'AsyncRun kernprof -l -v %'
            exec 'copen'
            exec 'wincmd p'
        elseif search('set_trace()')
            exec '!python3 %'
        else
            exec 'AsyncRun -raw python3 %'
            exec 'copen'
            exec 'wincmd p'
        endif
    elseif &filetype ==# 'html'
        exec '!firefox % &'
    elseif &filetype ==# 'go'
        ' exec '!go build %<'
        exec '!time go run %'
    elseif &filetype ==# 'mkd'
        exec '!~/.vim/markdown.pl % > %.html &'
        exec '!firefox %.html &'
    endif
endfunc

au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

autocmd Filetype python set expandtab
set cindent
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
set softtabstop=4

" for terminal mode
tnoremap <C-h> <C-w><C-h>
tnoremap <C-j> <C-w><C-j>
tnoremap <C-k> <C-w><C-k>
tnoremap <C-l> <C-w><C-l>
tnoremap <C-n> <C-w>N
" tnoremap <Esc> <C-w>N
tnoremap <ScrollWheelUp> <C-w>Nk
tnoremap <ScrollWheelDown> <C-w>Nj
" tnoremap <Esc> <C-w>N


" au CursorHoldI * stopinsert
" au InsertEnter * let updaterestore=&updatetime | set updatetime=10000
" au InsertLeave * let &updatetime=updaterestore

set termguicolors
