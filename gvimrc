" set guifont=MonacoB:h12
set guifont=MonacoB:h18
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=e
set lines=34 columns=136
set vb

let $GOPATH = $HOME . "/go"

" Vim-CtrlSpace
let g:ctrlspace_symbols = {
      \ "cs":      "⌗",
      \ "tab":     "∙",
      \ "all":     "፨",
      \ "vis":     "★",
      \ "file":    "⊚",
      \ "tabs":    "○ ",
      \ "c_tab":   "● ",
      \ "ntm":     " ⁺",
      \ "load":    "|∷|",
      \ "save":    "[∷]",
      \ "zoom":    "⌕",
      \ "s_left":  "›",
      \ "s_right": "‹",
      \ "bm":      "♥",
      \ "help":    "?",
      \ "iv":      "☆",
      \ "ia":      "★",
      \ "im":      "+",
      \ "dots":    "…"
      \ }

" Vim-Tags
let g:vim_tags_ctags_binary = "/usr/bin/ctags"
