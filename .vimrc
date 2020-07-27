" load pathogen
execute pathogen#infect()
filetype plugin indent on

" set <Leader>
let mapleader = ","

" show line numbers
set number

" allow unsaved changes in buffers
set hidden

" turn on syntax highlighting
syntax on

" easy escape
inoremap jk <esc>
inoremap kj <ESC>

" set tabs to have 4 spaces
set tabstop=4

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show matches while searching
set incsearch

" search highlighting
set hlsearch

" Make double-<Esc> clear search highlights
noremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" show the matching part of the pair for [] {} and ()
set showmatch

" match indentation
set autoindent

" load powerline font
let g:airline_powerline_fonts=1

" set airline theme
let g:airline_theme='simple'

" remove sections from airline
let g:airline_section_y=''
let g:airline_section_warning=''

" highlight and strip whitespace on save
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

" better windowing
set splitbelow
set splitright

" use terminal colors
set background=light

" LaTeX
let g:airline#extensions#vimtex#enabled = 1
let g:tex_flavor='latex'

" highlight length of over 80
nnoremap <Leader>h :call<SID>LongLineHLToggle()<cr>
hi OverLength ctermbg=none cterm=none
match OverLength /\%>80v/
fun! s:LongLineHLToggle()
 if !exists('w:longlinehl')
  let w:longlinehl = matchadd('ErrorMsg', '.\%>80v', 0)
  set colorcolumn=80
  echo "Long lines highlighted"
 else
  call matchdelete(w:longlinehl)
  unl w:longlinehl
  set colorcolumn&
  echo "Long lines unhighlighted"
 endif
endfunction

" quick tab switching
noremap <Leader>1 1gt
noremap <Leader>2 2gt
noremap <Leader>3 3gt
noremap <Leader>4 4gt
noremap <Leader>5 5gt
noremap <Leader>6 6gt
noremap <Leader>7 7gt
noremap <Leader>8 8gt
noremap <Leader>9 9gt
noremap <Leader>0 10gt

" NERDTree commands
noremap <Leader>n :NERDTreeToggle<cr>

" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")
