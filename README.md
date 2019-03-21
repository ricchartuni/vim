\# add to ~/.vimrc file these two lines:

let g:vimdir = "/path/to/vim/project/directory"

exec "source" . g:vimdir . "vimrc"
