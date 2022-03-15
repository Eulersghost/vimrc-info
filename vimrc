filetype plugin indent on
  2 filetype off
  3 syntax on
  4 set t_Co=256
  5 set t_u7=
  6 let w:persistent_cursor = 1
  7 set wildmenu
  8 set cursorcolumn
  9 set cursorline
 10 set incsearch
 11 set mouse=a
 12 set splitright
 13 set splitbelow
 14 set tabstop=2
 15 set shiftwidth=2
 16 set ignorecase
 17 set hidden
 18 set number
 19 set autoindent
 20 set smarttab
 21 set smartcase
 22 set tabstop=4 softtabstop=4
 23 set expandtab
 24 inoremap jkl <ESC>
 25 let mapleader=" "
 26 let g:user_emmet_leader_key=","
 27 nnoremap <Leader>tab :tabnew <CR>
 28 highlight ColorColumn ctermbg=0 guibg=lightgrey
 29
 30
 31 "Some experimental key bindings
 32
 33 "An option to toggle YCM on and off lets see if it works
 34 "let g:loaded_youcompleteme = 1
 35 "nnoremap j gj
 36 "nnoremap k gk
 37 "let g:ackprg = 'ap --nogroup --nocolor --column'
 38 nnoremap <Leader>fzf :FZF<CR>
 39 let g:ctrlp_map = '<c-p>'
 40 let g:ctrlp_cmd = 'CtrlP'
 41 "Window split and pane management:
 42 "
 43 nnoremap wv :vnew<CR>
 44 nnoremap wh :new<CR>
 45
 46 "Set remaps for splits and navigation for the leader key Ctrl and the h, j ,
 47 "k, l
 48 nnoremap <C-h> <C-w>h
 49 nnoremap <C-j> <C-w>j
 50 nnoremap <C-k> <C-w>k
 51 nnoremap <C-l> <C-w>l
 52
 53 "Minor windoes adjustment settings and sizes by a factor of +/-3
 54 "
 55 nnoremap <silent> <C-left> :vertical resize +3 <CR>
 56 nnoremap <silent> <C-Right> :vertical resize -3 <CR>
 57 nnoremap <silent> <C-Up> :resize +3 <CR>
 58 nnoremap <silent> <C-Down> :resize -3<CR>
 59
 60 "Change 2 split windows from vertical to horizontal and vice versa
 61 "
 62 map <Leader>th <C-w>t<C-W>H
 63 map <Leader>tk <C-w>t<C-w>K
 64
