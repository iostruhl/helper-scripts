" load pathogen
execute pathogen#infect()
filetype plugin on

" show line numbers
set number

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

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

