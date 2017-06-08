tabdo set nowrap
map t :tabn<Enter>
map r :tabp<Enter>
tabdo set number
tabdo set ignorecase
tabdo set smartcase
tabdo set incsearch
tabdo set tabpagemax=100

tabdo set autoindent
tabdo set tabstop=4
tabdo set shiftwidth=4
tabdo set expandtab

"folding settings
"set foldmethod=indent
"set foldnestmax=2
"set nofoldenable
"set foldlevel=1
"Then you can toggle folding with za. You can fold everything with zM and unfold everything with zR. zm and zr can be used to get those folds just right. Always remember the almighty help file at “help :folding” if you get stuck.

vnoremap s y:/<C-r>"<CR>
map 0 "0p
map <Tab> :setlocal autoindent<Enter>
map <s-tab> :setlocal noautoindent<Enter>
map w <C-w><C-w>
map <C-u> gU
map <C-l> gu
map <ENTER> <C-f>
map \ <C-b>
map <End> $
map ; $i<Right>;<Esc>
map <C-t> :TComment<Enter>
map l $

highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=black
highlight DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black
highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=white

function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ ygv"=TwiddleCase(@")<CR>Pgv

tabdo set timeoutlen=0
tabdo set vb

tabdo set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]
tabdo set laststatus=2
tabdo set mousehide
tabdo set scrolloff=8
tabdo set incsearch
tabdo set synmaxcol=2048

if &diff
    " diff mode
    tabdo set diffopt+=iwhite
endif

"function! convDevConf()
"    :%s/\/var\/www\//\/home\/rob\/sandbox\//g
"    :%s/.com/.rob.devserver/g
"endfunction

" specify plugin directory
call plug#begin('~/.vim/plugged')

Plug 'tomtom/tcomment_vim'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/vim-easy-align'
Plug 'mileszs/ack.vim'

" Initialize plugin system
call plug#end()
