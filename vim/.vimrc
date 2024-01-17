" プラグインのインストール先
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vimがない場合はgithubから落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif

" プラグインの設定ファイルを読み込む
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " .toml file
  let s:rc_dir = expand('~/.vim')
  if !isdirectory(s:rc_dir)
    call mkdir(s:rc_dir, 'p')
  endif
  let s:toml = s:rc_dir . '/dein.toml'

  " read toml and cache
  call dein#load_toml(s:toml, {'lazy': 0})

  " end settings
  call dein#end()
  call dein#save_state()
endif
" }}}

" plugin installation check
if dein#check_install()
  call dein#install()
endif

" plugin remove check
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif

" nerdtree起動時にカーソルをファイルに移動する
function! s:MoveToFileAtStart()
  call feedkeys("\<C-w>")
  call feedkeys("\w")
endfunction

" nerdtree settings
map <C-n> :NERDTreeTabsToggle<CR>
autocmd vimenter * NERDTree | call s:MoveToFileAtStart()
let NERDTreeShowHidden = 1
let g:nerdtree_tabs_open_on_new_tab = 1

" vim-devicons settings
set guifont=HackGen35\ Console\ NF
set encoding=utf-8
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" vim-gitgutter settings
set updatetime=100
" let g:gitgutter_highlight_lines = 1 " ハイライトの設定
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
augroup vimrc_vim_gitgutter
  autocmd!
  " colorscheme読み込み後、サイン列の記号の背景色を設定
  autocmd VimEnter,ColorScheme * highlight GitGutterAdd guibg=NONE ctermbg=NONE guifg=#000900 ctermfg=2
  autocmd VimEnter,ColorScheme * highlight GitGutterChange guibg=NONE ctermbg=NONE guifg=#bbbb00 ctermfg=3
  autocmd VimEnter,ColorScheme * highlight GitGutterDelete guibg=NONE ctermbg=NONE guifg=#ff2222 ctermfg=1
augroup END

" vim-airline settings
let g:airline_theme = 'angr'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1  

" general settings
set fileformats=unix,dos,mac
set number
set nocompatible
set ruler
set cursorline
set showmatch
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2
set incsearch
set hlsearch
set mouse=a
set backspace=indent,eol,start
set laststatus=2
set backupskip=/tmp/*,/private/tmp/*
set noswapfile
set directory=~/.vim/tmp
set clipboard+=unnamed