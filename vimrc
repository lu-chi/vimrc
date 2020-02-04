syntax enable
set background=dark
set backspace=indent,eol,start
set laststatus=2
set number
set hlsearch
set nowrap

set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\:h9
let g:Powerline_symbols='fancy'
set encoding=utf-8

set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

set cul cuc
"if &bg == 'dark'
"    hi CursorLine gui=NONE guibg=#333333
"else
"    hi CursorLine gui=NONE guibg=#CCCCCC
"endif
"
"hi! link CursorColumn CursorLine
"hi CursorColumn ctermbg=8
hi CursorColumn cterm=NONE ctermbg=236 ctermfg=NONE gui=NONE guibg=#2d2d2d guifg=NONE
hi CursorLine   cterm=NONE ctermbg=236 ctermfg=NONE gui=NONE guibg=#2d2d2d guifg=NONE

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set paste
set mouse=a

"---------------------------
" autobrackets

function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf

function CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
 return "\<CR>}"
 else
 return "\<Esc>j0f}a"
 endif
endf

function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 "Inserting a quoted quotation mark into the string
 return a:char
 elseif line[col - 1] == a:char
 "Escaping out of the string
 return "\<Right>"
 else
 "Starting a string
 return a:char.a:char."\<Esc>i"
 endif
endf

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>O
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>





"hi CursorLine guibg=#222222 gui=none
"hi LineNr ctermfg=DarkMagenta guifg=#2b506e guibg=#000000

"set cursorline
"set cursorcolumn

"hi CursorLine ctermbg=8 "ctermfg=15 "8 = dark gray, 15 = white
"hi Cursor ctermbg=15 ctermfg=8

"hi CursorColumn ctermbg=DarkGrey

" Default Colors for CursorLine
"highlight  CursorLine ctermbg=Yellow ctermfg=None

" Change Color when entering Insert Mode
"autocmd InsertEnter * highlight  CursorLine ctermbg=Green
" ctermfg=Red

" Revert Color to default when leaving Insert Mode
"autocmd InsertLeave * highlight  CursorLine ctermbg=Yellow
" ctermfg=None
