filetype plugin indent on
filetype off
syntax on
set t_Co=256
set t_u7=
let w:persistent_cursor = 1
set wildmenu
set cursorcolumn
set cursorline
set incsearch
set mouse=a
set splitright
set splitbelow
set tabstop=2
set shiftwidth=2
set ignorecase
set hidden
set number
set autoindent 
set smarttab 
set smartcase
set tabstop=4 softtabstop=4
set expandtab
inoremap jkl <ESC>
let mapleader=" "
let g:user_emmet_leader_key=","
nnoremap <Leader>tab :tabnew <CR>
"set background=dark
highlight ColorColumn ctermbg=0 guibg=lightgrey


"Some experimental key bindings

"nnoremap j gj
"nnoremap k gk
"let g:ackprg = 'ap --nogroup --nocolor --column'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"Window split and pane management:
"
nnoremap wv :vsplit<CR>
nnoremap wh :split<CR>

"Set remaps for splits and navigation for the leader key Ctrl and the h, j ,
"k, l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Minor windoes adjustment settings and sizes by a factor of +/-3
"
nnoremap <silent> <C-left> :vertical resize +3 <CR>
nnoremap <silent> <C-Right> :vertical resize -3 <CR>
nnoremap <silent> <C-Up> :resize +3 <CR>
nnoremap <silent> <C-Down> :resize -3<CR>

"Change 2 split windows from vertical to horizontal and vice versa 
"
map <Leader>th <C-w>t<C-W>H
map <Leader>tk <C-w>t<C-w>K

call plug#begin('~/.vim/plugged')
"Plugs for costmetic appearances
"
Plug 'morhetz/gruvbox'
Plug 'drewtempelmeyer/palenight.vim' 
Plug 'sonph/onehalf', {'rtp': 'vim'} 
Plug 'ghifarit53/tokyonight-vim' 
Plug 'folke/tokyonight.nvim', {'branch': 'main'}
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes' 
Plug 'powerline/powerline' 
Plug 'junegunn/goyo.vim' 
Plug 'junegunn/limelight.vim' 
Plug 'severin-lemaignan/vim-minimap' 
Plug 'mbbill/undotree' 
Plug 'junegunn/fzf', {'do': {-> fzf#install()}} 
Plug 'mg979/vim-visual-multi', {'branch': 'master'}




Plug 'junegunn/vim-easy-align'
Plug 'ryanoasis/nerd-fonts'
Plug 'preservim/nerdtree' |
      \Plug 'Xuyuanp/nerdtree-git-plugin'|
      \Plug 'ryanoasis/vim-devicons'

Plug 'prettier/vim-prettier', {
     \'do': 'yarn install',
    \'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html']}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc-pairs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'

Plug 'tmux-plugins/vim-tmux-focus-events'
"Plug 'ycm-core/YouCompleteMe'
Plug 'kien/ctrlp.vim'
call plug#end()

"Cosmetic Configuration Settings:
set termguicolors
colorscheme tokyonight "onehalfdark onehalflight tokyonight gruvbox
let g:airline_theme='tokyonight' "onehalfdark    
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

let g:tokyonight_style = 'storm' "also available is storm and night
let g:tokyonight_enable_italic=1


"Minimap Settings:
"

let g:minimap_show='<leader>ms'
let g:minimap_update='<leader>mu'
let g:minimap_close='<leader>gc'
let g:minimap_toggle='<leader>gt'


let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
   augroup WSLYank
       autocmd!
       autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
   augroup END
 endif"
"NERDTree Configuration:
"

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>nt :NERDTree<CR>
nnoremap <leader>ntt :NERDTreeToggle<CR>
nnoremap <leader>ntf :NERDTreeFind<CR>

"YouCompleteMe configuration settings:
"let g:ycm_server_python_interpreter


"CoC Configuration settings:
set encoding=utf-8
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c

if has("nvim-0.5.0") || has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction
 if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif


noremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
 nmap <silent> gd <Plug>(coc-definition)
 nmap <silent> gy <Plug>(coc-type-definition)
 nmap <silent> gi <Plug>(coc-implementation)
 nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg ." " .expand('<cword>')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
      augroup end

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)


if has('nvim-0.4.0') || has('patch-8.2.0750')
   nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
   nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
   inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
   inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
   vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
   vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif


nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}



nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
noremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>



"GoYo and Limelight settings

nmap <Leader>l <Plug>(Limelight) 
xmap <Leader>l <Plug>(Limelight)
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
"
" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
"
" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
 let g:limelight_paragraph_span = 1
"
"" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   "   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'
"
" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
" "
" "
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!



" Width
" Goyo 120
"g:goyo_width = 120

" " Height
" Goyo x30
"g:goyo_height = 300
"" Both
"Goyo 120x30

" In percentage
" Goyo 120x50%
"
"" With offsets
"Goyo 50%+25%x50%-25%"
" "
" "
nnoremap <Leader>ud :UndotreeToggle<CR>
