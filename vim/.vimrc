call plug#begin('~/.vim/plugged')
  " colorscheme
  Plug 'morhetz/gruvbox'
  Plug 'doums/darcula'
  Plug 'haystackandroid/stellarized'
  Plug 'haystackandroid/snow'

  " a fancy startpage
  Plug 'mhinz/vim-startify'

  " NERDtree
  Plug 'preservim/nerdtree'

  " lightline
  "Plug 'itchyny/lightline.vim'

  " vim-airline
  "Plug 'vim-airline/vim-airline'
  "Plug 'vim-airline/vim-airline-themes'
call plug#end()

set nocompatible
syntax on
filetype plugin indent on

set number
set nowrap
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set spell
set showmatch
set mat=2
set noerrorbells
set novisualbell
set t_vb=
set tm=500
"set foldcolumn=1
set encoding=utf-8
set ffs=unix,dos,mac
set laststatus=2
set noshowmode

set autoread
au FocusGained,BufEnter * checktime
let mapleader=","

set wildmenu
set wildmode=longest:full,full

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Justify text
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
ru macros/justify.vim
set textwidth=79
set formatoptions+=t
nnoremap <C-j> gggqG_j


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spellcheck
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set spelllang=en_us
set spellsuggest=best,9
set spellfile=~/.vim/en.utf-8.add

function! ToggleSpellCheck()
  set spell!
  if &spell
    echo "Spellcheck ON"
  else
    echo "Spellcheck OFF"
  endif
endfunction

nnoremap <silent><F11> :call ToggleSpellCheck()<CR>
inoremap <silent><F11> <C-O>:call ToggleSpellCheck()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorschemes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi Normal guibg=NONE ctermbg=NONE
autocmd VimEnter * hi Normal ctermbg=none
let g:gruvbox_italic=1
let g:gruvbox_transparent_bg=1
set background=dark
colorscheme gruvbox

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabwith per filetype
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType python setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType markdown setlocal shiftwidth=4 softtabstop=4 expandtab


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autowrap per filetype
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup WrapLinesMarkdown
  autocmd!
  autocmd FileType markdown setlocal wrap
  autocmd BufRead,BufNewFile *.md setlocal textwidth=79
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keymappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Reload config
nnoremap <silent><F1> :source ~/.vimrc<CR>

" Toggle linenumbers
nnoremap <silent><F2> :set number!<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDtree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autowrap per filetype
" Jump to last position when reopening a file
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autowrap per filetype
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Statusline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:currentmode={
      \ 'n' : 'NORMAL ',
      \ 'v' : 'VISUAL ',
      \ 'V' : 'V-Line ',
      \ '\<C-V>' : 'V-Block ',
      \ 'i' : 'INSERT ',
      \ 'R' : 'R ',
      \ 'Rv' : 'V-Replace ',
      \ 'c' : 'Command ',
      \}

set laststatus=2
set statusline=
set statusline+=%#StatusLine#
set statusline+=\ %{toupper(g:currentmode[mode()])}
set statusline+=%f          " filename
set statusline+=%m          " modified
set statusline+=%r          " read-only flag
set statusline+=%h          " buffer flag
set statusline+=%w          " window flag
set statusline+=\ %=        " align right
set statusline+=%l/%L       " line numbers / total lines
set statusline+=,%v         " column number
set statusline+=\ %p%%      " percentage of document

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cursorshape
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VTE compatible terminals
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Ghome terminal
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' |
    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

" XFCE4 Terminal
"if has("autocmd")
"  au InsertEnter * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_BLOCK/TERMINAL_CURSOR_SHAPE_UNDERLINE/' ~/.config/xfce4/terminal/terminalrc"
 " au InsertLeave * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_UNDERLINE/TERMINAL_CURSOR_SHAPE_BLOCK/' ~/.config/xfce4/terminal/terminalrc"
 " au VimLeave * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_UNDERLINE/TERMINAL_CURSOR_SHAPE_BLOCK/' ~/.config/xfce4/terminal/terminalrc"
"endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hide it all
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        "set laststatus=0
        "set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        "set laststatus=2
        "set showcmd
    endif
endfunction

nnoremap <silent><S-h> :call ToggleHiddenAll()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Startify
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd User Startified setlocal cursorline

let g:startify_enable_special = 1
let g:startify_files_number = 8
let g:startify_relative_path = 1
let g:startify_change_to_dir = 1
let g:startify_update_oldfiles = 1
let g:startify_session_autoload = 1
let g:startify_session_persistence = 1

let g:startify_skiplist = [
      \ 'COMMIT_EDITMSG',
      \ 'bundle/.*/doc',
      \ ]

let g:startify_bookmarks = [
      \ { 'c': '~/.vim/vimrc' },
      \ '~/.zshrc',
      \ ]

let g:startify_custom_header = startify#center([
      \ '╔══════════════════════════════════════════╗',
      \ '║                                          ║',
      \ '║              TransGirls Vim              ║',
      \ '║                                          ║',
      \ '║      Trans Rights Are Human Rights       ║',
      \ '║                                          ║',
      \ '╚══════════════════════════════════════════╝',
      \ ])

let g:startify_custom_footer = []

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   Menu']           },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

hi StartifyBracket ctermfg=240
hi StartifyFile    ctermfg=147
hi StartifyFooter  ctermfg=240
hi StartifyHeader  ctermfg=147
hi StartifyNumber  ctermfg=215
hi StartifyPath    ctermfg=245
hi StartifySlash   ctermfg=240
hi StartifySpecial ctermfg=240

" show Startify on new tabs
"if has('nvim')
"  autocmd TabNewEntered * Startify
"else
"  autocmd BufWinEnter *
"        \ if !exists('t:startify_new_tab')
"        \     && empty(expand('%'))
"        \     && empty(&l:buftype)
"        \     && &l:modifiable |
"        \   let t:startify_new_tab = 1 |
"        \   Startify |
"        \ endif
"endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:airline_detect_spell=1
"let g:airline_detect_spelllang=0
"let g:airline_powerline_fonts = 0
"let g:airline_skip_empty_sections = 1
"let g:airline#extensions#tabline#enabled = 0
"let g:airline_theme='gruvbox'
"let g:airline#extensions#tabline#formatter = 'default'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:lightline = {
"      \ 'colorscheme': 'simpleblack',
"      \ 'active': {
"      \   'left': [ [ 'mode', 'paste' ],
"      \             [ 'readonly', 'filename' ] ],
"      \ },
"      \ 'component_function': {
"      \   'spellcheck': 'LightLineSpellcheck',
"      \ },
"      \ }

"function! LightLineSpellcheck()
"  let spellcheck = &spell ? ' SPELL' : ''
"  return spellcheck
"endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Edit vimr configuration file
"command Confe :e ~/.vimrc<CR>
" Reload vims configuration file
"command Confr :source ~/.vimrc<CR>
