" setting
" 文字コードをUFT-8に設定
set fenc=utf-8 
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
"
" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示(縦)
" set cursorcolumn
" 行末の一文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の体う往する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインを補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動をできるように
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk

" Tab系
" 不可視文字を可視化
set list listchars=tab:\▸\-
" tab文字を半角スペースに
set expandtab
" 行頭以外のTab文字の表示はば
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に文字列が含まれている場合は区別して検索する
set smartcase
" 検索文字列に入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
" <Esc><Esc> :nohlsearch<CR><Esc>

" シンタックスハイライト
syntax on

" 全角文字
set ambiwidth=double

augroup vimrc-auto-mkdir  " {{{
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)  " {{{
    if !isdirectory(a:dir) && (a:force ||
    \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction  " }}}
augroup END  " }}}

" 現在日時を入力
nmap <C-o><C-o> <ESC>i<C-r>=strftime("# %Y-%m-%d")<CR><CR>

hi ZenkakuSpace gui=underline guibg=DarkBlue cterm=underline ctermfg=LightBlue " 全角スペースの定義 match ZenkakuSpace /　/

" inoremap <ESC> <ESC>:set iminsert=0<CR>


