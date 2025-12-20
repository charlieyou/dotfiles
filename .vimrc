let g:solarized_termtrans=1

imap jk <Esc>
imap kj <Esc>

set relativenumber
set number
set mouse=a

nnoremap j gj
nnoremap k gk

noremap B ^
noremap E $

nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>] :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>[ :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

"nnoremap <SPACE> <Nop>
"let mapleader=" "
