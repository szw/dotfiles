call pathogen#infect()

"General options
set nocompatible
set smartindent autoindent
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set number
set nowrap
set hls
set mouse=a
set autoread

"Custom .vimrcs
set exrc
set secure

"Search
set ignorecase
set smartcase
set incsearch

"Folding
set foldmethod=indent
set foldlevelstart=20

"Colors
set t_Co=256
colorscheme moloterm

"Encoding
set fileencoding=utf-8
"set fileencodings=utf-8
set termencoding=utf-8
set encoding=utf-8

"Ignore list
set wildignore=.svn,CVS,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc

"Completion settings
set ofu=syntaxcomplete#Complete
set dictionary+=/usr/share/dict/words

"Custom language settings
filetype on
filetype plugin on
filetype indent on

"Remove trailing spaces
au BufWritePre * :%s/\s\+$//e

"Set XClip support (\y - copy, \p - paste)
vmap <Leader>y y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
nmap <Leader>p :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p")")")"))

augroup PHP
	au!
	"au BufNewFile,BufRead *.src set filetype=php
	"au BufNewFile,BufRead *.inc set filetype=php
	au FileType php setlocal omnifunc=phpcomplete#CompletePHP
	au FileType php setlocal tabstop=4 shiftwidth=4 noexpandtab
	"au FileType php,html filetype indent off
	"au FileType php au InsertLeave * pclose
augroup END

augroup Ruby
	au!
    au FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
	au FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
	au FileType ruby,eruby let g:rubycomplete_rails = 1
	au FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
	au FileType ruby,eruby setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
augroup END

augroup Python
	au!
	au FileType python setlocal omnifunc=pythoncomplete#Complete
	au FileType python setlocal completefunc=RopeCompleteFunc
	au FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
	au FileType python setlocal completeopt-=preview "turn off the preview window
augroup END

augroup Javascript
	au!
	au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
augroup END

augroup Html
	au!
	au FileType html setlocal omnifunc=htmlcomplete#CompleteTags
augroup END

augroup Css
	au!
	au FileType css setlocal omnifunc=csscomplete#CompleteCSS
augroup END

augroup Xml
	au!
	au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

augroup Text
	au!
	au FileType text,markdown setlocal textwidth=80 formatoptions+=1
    au FileType text,markdown,gitcommit setlocal complete+=k
    " Support for Markdown preview tool: https://github.com/szw/md
    au FileType markdown command! -buffer -nargs=0 Md :silent! :exe '! md "' . expand('%:p') . '"' | redraw!
augroup END

"Custom plugin settings

"NERDTree
"let g:NERDTreeDirArrows=0

"ACK
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

"Ropevim
let ropevim_vim_completion = 1
let ropevim_extended_complete = 1
let ropevim_guess_project = 1
let g:ropevim_autoimport_modules = ["os.*","traceback","django.*", "xml.etree"]
"imap <Nul> <C-R>=RopeCodeAssistInsertMode()<CR>

"CtrlP
let g:ctrlp_working_path_mode = 'ra'

"Powerline
set laststatus=2

"Syntastic
let g:syntastic_ruby_exec="~/.rvm/rubies/ruby-1.9.3-p286/bin/ruby"

"Dict
let g:dict_hosts = [["dict.org", ["english"]], ["dict.mova.org", ["slovnyk_en-pl", "slovnyk_pl-en"]]]

"Overlen
let g:overlen_line_lengths = [['ruby,eruby,php,python,javascript,html,css,text,markdown', 110], ['gitcommit', 72]]
