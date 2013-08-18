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
Bundle "kana/vim-textobj-entire"
Bundle "kana/vim-textobj-lastpat"
Bundle "kana/vim-textobj-line"
Bundle "kana/vim-textobj-user"
Bundle "kchmck/vim-coffee-script"
Bundle "kien/ctrlp.vim"
Bundle "kshenoy/vim-signature"
Bundle "majutsushi/tagbar"
Bundle "mattn/gist-vim"
Bundle "mattn/webapi-vim"
Bundle "mileszs/ack.vim"
Bundle "pangloss/vim-javascript"
Bundle "scrooloose/nerdtree"
Bundle "scrooloose/syntastic"
Bundle "shawncplus/phpcomplete.vim"
Bundle "sickill/vim-pasta"
Bundle "szw/moloterm"
Bundle "szw/vim-commentary"
Bundle "szw/vim-dict"
Bundle "szw/vim-g"
Bundle "szw/vim-indent-object"
Bundle "szw/vim-kompleter"
Bundle "szw/vim-maximizer"
Bundle "szw/vim-powerline"
Bundle "szw/vim-smartclose"
Bundle "szw/vim-tabb"
Bundle "szw/vim-tags"
Bundle "szw/vim-testrunner"
Bundle "szw/xmledit"
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
set foldlevelstart=20

" Paste mode
set pastetoggle=<F5>

" New tab
noremap <silent><F11> :tabe<CR>
inoremap <silent><F11> <C-[>:tabe<CR>

" Toggle wrapping
noremap <silent><Leader>w :if &wrap <bar> set nowrap <bar> else <bar> set wrap <bar> endif<CR>

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
colorscheme moloterm

" Remove trailing spaces
au BufWritePre * :%s/\s\+$//e

" Mute highlight search
nnoremap <silent><C-l> :<C-u>nohlsearch<CR><C-l>

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
augroup END

augroup Python
  au!
  au FileType python setlocal omnifunc=pythoncomplete#Complete
  au FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
  au FileType python setlocal completeopt-=preview "turn off the preview window
augroup END

augroup Vimscript
  au!
  au FileType vim setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
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
  au FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
augroup END

augroup Text
  au!
  au FileType text,markdown setlocal textwidth=100 formatoptions+=1
  au FileType text,markdown,gitcommit setlocal complete+=k infercase
  " Support for the Markdown Viewer: https://github.com/szw/md
  au FileType markdown command! -buffer -nargs=0 Md :silent! :exe '! md "' . expand('%:p') . '"' | redraw!
augroup END

" Custom plugins settings

" SuperTab
let g:SuperTabDefaultCompletionType = "<c-x><c-u>"

" delimitMate
au FileType eruby,html,xml let b:delimitMate_matchpairs = "(:),[:],{:}"

" NERDTree
nmap <silent><F7> :NERDTreeToggle<CR>
nmap <silent><F6> :NERDTreeFind<CR>
let g:NERDTreeWinSize = 40

" CtrlP
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_extensions = ['tag']
let g:ctrlp_custom_ignore = '\v(tmp|temp)[\/]'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_open_multiple_files = 'i'
let g:ctrlp_mruf_relative = 1

" Syntastic
let g:syntastic_ruby_exec="~/.rvm/rubies/default/bin/ruby"

" Dict
let g:dict_hosts = [["dict.org", ["english"]], ["dict.mova.org", ["slovnyk_en-pl", "slovnyk_pl-en"]]]

" Tagbar
nmap <silent><F8> :TagbarToggle<CR>

" Maximizer
let g:maximizer_set_mapping_with_bang = 1

" Vim-Fugitive
nnoremap <silent><F4> :Gstatus<CR>

" Tabb
hi TabbBufferSelected term=reverse ctermfg=white ctermbg=black cterm=bold
hi TabbBufferNormal term=NONE ctermfg=black ctermbg=228 cterm=NONE
