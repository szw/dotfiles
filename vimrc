call pathogen#infect()

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

"Swap files
set swapfile
set dir=/tmp

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

" Colors
colorscheme moloterm

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

" Custom language settings
syntax on
filetype on
filetype plugin on
filetype indent on
runtime macros/matchit.vim

" Remove trailing spaces
au BufWritePre * :%s/\s\+$//e

" Mute highlight search
nnoremap <silent><C-l> :<C-u>nohlsearch<CR><C-l>

" Custom filetype settings

augroup PHP
  au!
  " au BufNewFile,BufRead *.src set filetype=php
  " au BufNewFile,BufRead *.inc set filetype=php
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
  au FileType python setlocal completefunc=RopeCompleteFunc
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

" delimitMate
au FileType eruby,html,xml let b:delimitMate_matchpairs = "(:),[:],{:}"

" NERDTree
nmap <silent><F7> :NERDTreeToggle<CR>
nmap <silent><F6> :NERDTreeFind<CR>

" Ropevim
let ropevim_vim_completion = 1
let ropevim_extended_complete = 1
let ropevim_guess_project = 1
let g:ropevim_autoimport_modules = ["os.*", "traceback", "django.*", "xml.etree"]
" imap <Nul> <C-R>=RopeCodeAssistInsertMode()<CR>

" CtrlP
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_extensions = ['tag']
let g:ctrlp_custom_ignore = '\v(tmp|temp)[\/]'

" Powerline
set laststatus=2

" Syntastic
let g:syntastic_ruby_exec="~/.rvm/rubies/default/bin/ruby"

" Dict
let g:dict_hosts = [["dict.org", ["english"]], ["dict.mova.org", ["slovnyk_en-pl", "slovnyk_pl-en"]]]

" Tagbar
nmap <silent><F8> :TagbarToggle<CR>

" Maximizer
let g:maximizer_use_mapping_with_bang = 1

" BufferList
let g:BufferListMaxWidth = 50
let g:BufferListMaxHeight = 15
let g:BufferListBottom = 1
map <silent><F2> :BufferList<CR>

" RuboCop
nnoremap <silent><F12> :RuboCop<CR>
