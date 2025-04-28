syntax on
filetype plugin indent on
set ts=4 sts=4 sw=4 et ai si
set rnu

call plug#begin()

Plug 'neoclide/coc.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'rhysd/vim-clang-format'

call plug#end()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

set termguicolors
colo gruvbox

nmap <C-b> :NERDTreeToggle<CR>

let mapleader=" "

nnoremap <leader>ff :Files<CR>
" fg - Find text (grep)
nnoremap <leader>fg :Rg<CR>
" fb - Find buffers
nnoremap <leader>fb :Buffers<CR>
" fh - Find history (recently opened files)
nnoremap <leader>fh :History<CR>
" fl - Find lines in current buffer
nnoremap <leader>fl :BLines<CR>
" fc - Find commands
nnoremap <leader>fc :Commands<CR>
" fm - Find marks
nnoremap <leader>fm :Marks<CR>

autocmd FileType cpp,c,h,hpp let g:clang_format_style='LLVM'
autocmd FileType cpp,c,h,hpp let g:clang_format_options='-style=LLVM -tab-width=4'
autocmd BufWritePre *.cpp,*.h,*.hpp,*.c exec "ClangFormat"
