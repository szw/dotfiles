set guifont=Monaco:h12
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=e
set lines=86 columns=150
set vb

" Vim-CtrlSpace
let g:ctrlspace_symbols = {
      \ "cs"      : "⌗",
      \ "tab"     : "⊙",
      \ "all"     : "∷",
      \ "open"    : "◎",
      \ "tabs"    : "○ ",
      \ "c_tab"   : "● ",
      \ "load"    : "⋮ → ∙",
      \ "save"    : "∙ → ⋮",
      \ "prv"     : "⌕",
      \ "s_left"  : "›",
      \ "s_right" : "‹",
      \ "favs"    : "♡"
      \ }

" Vim-Tags
let g:vim_tags_use_vim_dispatch = 0
let g:vim_tags_ctags_binary = "/usr/local/bin/ctags"
