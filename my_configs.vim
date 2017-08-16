imap jk <Esc>
imap kj <Esc>

set relativenumber
set number
set mouse=a

autocmd BufWritePost *.py call Flake8()

set colorcolumn=80
