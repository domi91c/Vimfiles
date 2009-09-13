" General settings:
set nocompatible
set backspace=indent,eol,start
set ruler
set showcmd
set incsearch
set nohlsearch
set ignorecase smartcase
set autoindent
set number
set wildmenu
set shortmess=aTI
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab
set completeopt=menu
set backupdir=~/.backup/
set noswapfile
set ffs=unix,dos
set sidescroll=4
set path=$PWD/**
set linebreak
set showbreak=+>

" GUI options:
set guifont=Andale\ Mono\ 14
set guioptions=crbh

" define the toggling function
function! MapToggle(key, opt)
  let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
  exec 'nnoremap '.a:key.' '.cmd
  exec 'inoremap '.a:key." \<C-O>".cmd
endfunction
command! -nargs=+ MapToggle call MapToggle(<f-args>)

MapToggle <F7> list
MapToggle <F8> hlsearch
MapToggle <F9> wrap

colo elflord

hi Pmenu ctermbg=Black
hi NonText cterm=NONE ctermfg=NONE

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif

autocmd FileType text setlocal textwidth=98
autocmd FileType php set filetype=php.html.javascript
autocmd FileType html set filetype=html.javascript

syntax on
filetype plugin indent on

" Moving through tabs:
if &term == "rxvt-256color"
  nmap Oc gt
  nmap Od gT 
else
  nmap <C-Right> gt
  nmap <C-Left> gT
endif

" Toggling the NERD tree
nmap <C-o> :NERDTreeToggle<cr>

" Moving through splits:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Faster scrolling:
nmap J 4j
nmap K 4k

" Completion:
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

" Indent/Unindent:
nmap <Tab> >>
nmap <S-Tab> <<

" Using the clipboard on Linux:
noremap d "+d
noremap dd "+dd
noremap D "+D
nnoremap p "+p
nnoremap P "+P
vnoremap y "+y
nnoremap y "+y
nnoremap yy "+yy

" Move through visual lines:
nnoremap j gj
nnoremap k gk

" Run file through ghci
command! Ghci !ghci %
" Run file through swi-prolog
command! Swi !pl -f % -g true
" Compile cpp file as prog.exe
command! Compile !g++ -o prog %

let g:AutoComplPop_NotEnableAtStartup = 1

" Dbext profile:
source ~/.dbextrc

" Snippet settings:
let g:snippets_dir = "~/.vim/custom_snippets/"
let g:snips_author = "Andrew Radev"
