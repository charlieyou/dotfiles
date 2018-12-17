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

nnoremap B ^
nnoremap E $
