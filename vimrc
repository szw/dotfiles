" General options
set nocompatible
set hidden
set smartindent autoindent
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set number
set nowrap
set hls
set mouse=a
set ttymouse=xterm2
set autoread
set backspace=indent,eol,start
set shortmess+=I
set timeout timeoutlen=3000 ttimeoutlen=10
set laststatus=2
set statusline=%<%f%(\ %y%m%r%)%(\ %{fugitive#statusline()}%)%=%-7.(%l,%c%V%)\ %P
set showtabline=0
set nostartofline
set noautochdir

" Vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "Lokaltog/vim-easymotion"
Bundle "Raimondi/delimitMate"
Bundle "ervandew/supertab"
Bundle "glts/vim-textobj-comment"
Bundle "gmarik/vundle"
Bundle "jgdavey/vim-blockle"
Bundle "junegunn/vim-easy-align"
Bundle "kana/vim-textobj-entire"
Bundle "kana/vim-textobj-lastpat"
Bundle "kana/vim-textobj-line"
Bundle "kana/vim-textobj-user"
Bundle "kchmck/vim-coffee-script"
Bundle "kshenoy/vim-signature"
Bundle "majutsushi/tagbar"
Bundle "mileszs/ack.vim"
Bundle "nelstrom/vim-markdown-folding"
Bundle "pangloss/vim-javascript"
Bundle "scrooloose/syntastic"
Bundle "shawncplus/phpcomplete.vim"
Bundle "sickill/vim-pasta"
Bundle "szw/seoul256.vim"
Bundle "szw/vim-commentary"
Bundle "szw/vim-ctrlspace"
Bundle "szw/vim-dict"
Bundle "szw/vim-g"
Bundle "szw/vim-indent-object"
Bundle "szw/vim-kompleter"
Bundle "szw/vim-maximizer"
Bundle "szw/vim-smartclose"
Bundle "szw/vim-tags"
Bundle "terryma/vim-multiple-cursors"
Bundle "tpope/vim-abolish"
Bundle "tpope/vim-characterize"
Bundle "tpope/vim-dispatch"
Bundle "tpope/vim-endwise"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-haml"
Bundle "tpope/vim-markdown"
Bundle "tpope/vim-rails"
Bundle "tpope/vim-rake"
Bundle "tpope/vim-repeat"
Bundle "tpope/vim-sleuth"
Bundle "tpope/vim-surround"
Bundle "tpope/vim-unimpaired"
Bundle "vim-ruby/vim-ruby"

" Swap/backup files
set noswapfile
set dir=/tmp
set nowb
set nobackup

" Low updatetime, since we don't write swaps
set updatetime=200

" Custom .vimrcs
set exrc
set secure

" Search
set ignorecase
set smartcase
set incsearch
set noinfercase

" Command line
set history=200
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

if has("user_commands")
  command! -bang -nargs=? -complete=file E e<bang> <args>
  command! -bang -nargs=? -complete=file W w<bang> <args>
  command! -bang -nargs=? -complete=file Wq wq<bang> <args>
  command! -bang -nargs=? -complete=file WQ wq<bang> <args>
  command! -bang Wa wa<bang>
  command! -bang WA wa<bang>
  command! -bang Q q<bang>
  command! -bang QA qa<bang>
  command! -bang Qa qa<bang>
endif

" Folding
set foldmethod=indent
set foldlevelstart=99

nnoremap <silent><Leader>f :if &fdm == "indent" <bar> setl fdm=marker <bar> else <bar> setl fdm=indent <bar> endif<CR>

" Paste mode
set pastetoggle=<F5>

" Jumps
nnoremap <silent><S-TAB> <C-o>

" Toggle wrapping
nnoremap <silent><Leader>w :if &wrap <bar> set nowrap <bar> else <bar> set wrap <bar> endif<CR>

" Insert mode with indent
nnoremap <silent>i @=empty(getline(".")) ? "S" : "i"<CR>
nnoremap <silent>I @=empty(getline(".")) ? "S" : "I"<CR>
nnoremap <silent>a @=empty(getline(".")) ? "S" : "a"<CR>
nnoremap <silent>A @=empty(getline(".")) ? "S" : "A"<CR>

" Encoding
set fileencoding=utf-8
" set fileencodings=utf-8
set termencoding=utf-8
set encoding=utf-8

" Ignore list
set wildignore=.git,.svn,CVS,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,tags,*.tags

" Completion settings
set ofu=syntaxcomplete#Complete
set dictionary+=/usr/share/dict/words

" Omnicompletion trigger
if !has("gui_running")
  inoremap <unique><Nul> <C-x><C-o><C-p>
else
  inoremap <unique><C-Space> <C-x><C-o><C-p>
endif

" Custom language settings
syntax on
" syntax enable
filetype on
filetype plugin on
filetype indent on
runtime macros/matchit.vim

" Colors
let g:seoul256_background = 233
colorscheme seoul256
set background=dark
hi nontext ctermfg=bg guifg=bg cterm=NONE gui=NONE

" Remove trailing spaces
augroup TrailingSpaces
  au!
  au BufWritePre * if &ft != "markdown" | %s/\s\+$//e | endif
augroup END

" Mute highlight search
nnoremap <silent><C-l> :<C-u>nohlsearch<CR><C-l>

" Lispy identifiers support
augroup LispyIdentifiers
  au!
  au FileType lisp,clojure,html,xml,xhtml,haml,eruby,css,scss,sass,javascript,coffee setlocal isk+=-
augroup END

" Custom filetype settings

augroup PHP
  au!
  au FileType php setlocal omnifunc=phpcomplete#CompletePHP
  au FileType php setlocal tabstop=4 shiftwidth=4 noexpandtab
  " au FileType php,html filetype indent off
  " au FileType php au InsertLeave * pclose
augroup END

augroup Ruby
  au!
  au FileType ruby,eruby,haml setlocal omnifunc=rubycomplete#Complete
  au FileType ruby,eruby,haml let g:rubycomplete_buffer_loading = 1
  au FileType ruby,eruby,haml let g:rubycomplete_rails = 1
  au FileType ruby,eruby,haml let g:rubycomplete_classes_in_global = 1
  au FileType ruby,eruby,haml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType ruby setlocal isk-=-
augroup END

augroup Python
  au!
  au FileType python setlocal omnifunc=pythoncomplete#Complete
  au FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
  au FileType python setlocal completeopt-=preview "turn off the preview window
  au FileType python setlocal isk-=-
augroup END

augroup Vimscript
  au!
  au FileType vim setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType vim setlocal isk-=-
augroup END

augroup Javascript
  au!
  au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS tabstop=4 softtabstop=4 shiftwidth=4 expandtab
augroup END

augroup CoffeeScript
  au!
  au FileType coffee setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
augroup END

augroup Html
  au!
  au FileType html setlocal omnifunc=htmlcomplete#CompleteTags
augroup END

augroup Css
  au!
  au FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
  au FileType scss setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
augroup END

augroup Xml
  au!
  au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

augroup Yaml
  au!
  au FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
augroup END

augroup Text
  au!
  au FileType text,markdown setlocal textwidth=80 formatoptions+=1
  au FileType text,markdown,gitcommit setlocal complete+=k infercase
  au FileType text,markdown,gitcommit setlocal isk-=-

  au FileType markdown setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

  " Support for the Markdown Viewer: https://github.com/szw/md
  au FileType markdown command! -buffer -nargs=0 Md :silent! :exe '! md "' . expand('%:p') . '"' | redraw!
  au FileType markdown nnoremap <silent><buffer><F1> :Md<CR>
augroup END

" Custom plugins settings

" delimitMate
augroup DelimitMateSettings
  au!
  au FileType eruby,html,xml let b:delimitMate_matchpairs = "(:),[:],{:}"
augroup END

" Syntastic
let g:syntastic_ruby_exec="~/.rvm/rubies/default/bin/ruby"

" Dict
let g:dict_hosts = [["dict.org", ["english"]], ["dict.mova.org", ["slovnyk_en-pl", "slovnyk_pl-en"]]]

" Tagbar
nmap <silent><F8> :TagbarToggle<CR>

" Maximizer
let g:maximizer_set_mapping_with_bang = 1

" Vim-Fugitive
nnoremap <silent><F12> :Gstatus<CR>

" CtrlSpace
" hi CtrlSpaceSelected term=reverse ctermfg=white ctermbg=black cterm=bold
" hi CtrlSpaceNormal term=NONE ctermfg=black ctermbg=228 cterm=NONE
" hi CtrlSpaceFound ctermfg=125 ctermbg=NONE cterm=bold

" hi CtrlSpaceSelected term=reverse ctermfg=252 ctermbg=89 cterm=bold
" hi CtrlSpaceNormal term=NONE ctermfg=234 ctermbg=224 cterm=NONE

hi CtrlSpaceSelected term=reverse ctermfg=187  ctermbg=23  cterm=bold
" hi CtrlSpaceNormal   term=NONE    ctermfg=245  ctermbg=233 cterm=NONE
hi CtrlSpaceNormal   term=NONE    ctermfg=244  ctermbg=232 cterm=NONE
hi CtrlSpaceFound    ctermfg=220  ctermbg=NONE cterm=bold
" let g:ctrlspace_unicode_font = 0
" let g:ctrlspace_use_ruby_bindings = 0
" SuperTab
let g:SuperTabDefaultCompletionType = "<c-x><c-u>"

" easy-align
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
" easy-align
" vnoremap <silent> <Enter> :EasyAlign<Enter>

" function! s:easy_align_1st_eq(type, ...)
"   '[,']EasyAlign=
" endfunction
" nnoremap <Leader>= :set opfunc=<SID>easy_align_1st_eq<Enter>g@

" function! s:easy_align_1st_colon(type, ...)
"   '[,']EasyAlign:
" endfunction
" nnoremap <Leader>: :set opfunc=<SID>easy_align_1st_colon<Enter>g@

" function! s:easy_align_comma(type, ...)
"   '[,']EasyAlign*,
" endfunction
" nnoremap <Leader>, :set opfunc=<SID>easy_align_comma<Enter>g@

" vim-pasta
let g:pasta_disabled_filetypes = ["python", "coffee", "markdown", "yaml", "slim", "haml"]
