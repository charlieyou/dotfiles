let g:solarized_termtrans=1
colorscheme solarized

imap jk <Esc>
imap kj <Esc>

set relativenumber
set number
set mouse=a

autocmd BufWritePost *.py call Flake8()

set colorcolumn=80

nnoremap j gj
nnoremap k gk

nmap B ^
nmap E $

nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>] :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>[ :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
