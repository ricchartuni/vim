"===================================================================
" ALGUMAS INFORMACOES --------------------------------------
"===================================================================
 "Rodando comando da shell: --- COMANDO: :%!sort (%! - arquivo inteiro;
 "                                                n! - a partir da linha n)
 " para fazer apenas selecao: - COMANDO: :!sort

 " INFO identacao ...................
 "     >>   Indent line by shiftwidth spaces
 "     <<   De-indent line by shiftwidth spaces
 "     5>>  Indent 5 lines
 "     5==  Re-indent 5 lines
 "
 "     >%   Increase indent of a braced or bracketed block (place cursor on brace first)
 "     =%   Reindent a braced or bracketed block (cursor on brace)
 "     <%   Decrease indent of a braced or bracketed block (cursor on brace)
 "     ]p   Paste text, aligning indentation with surroundings
 "
 "     =i{  Re-indent the 'inner block', i.e. the contents of the block
 "     =a{  Re-indent 'a block', i.e. block and containing braces
 "     =2a{ Re-indent '2 blocks', i.e. this block and containing block
 "
 "     >i{  Increase inner block indent
 "     <i{  Decrease inner block indent

"   dfo ============> deleta ate a proxima letra o
"   dw  ============> deleta a palavra inteira
"   \<C-X>\<C-P> ===> existing text matching
"   \<C-X>\<C-F> ===> file matching
"   \<C-X>\<C-O> ===> plugin matching
"   \<C-X>\<C-L> ===> line matching
"===================================================================
let g:arqdir  = expand('%:p:h')
let g:arqfull = expand('%:p')
let g:arqname = expand('%:t')
let g:arqext  = expand('%:e')
silent! unlet b:com_leader
silent! unlet b:comentario

 " Recarregar o vimrc
nmap ,r :exec "source" . g:vimdir . "vimrc" <BAR> echo "vimrc recarregado!"<CR>

"syntax on

 " Fonte
"exec "source" . g:vimdir . "fonts/vimload"
set guifont=Monospace\ 10
 " The encoding displayed
set encoding=utf-8
 " The encoding written to file
set fileencoding=utf-8

"No bell
set visualbell t_vb=

"Cursor settings:
"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar
silent! let &t_SI.="\e[5 q" "SI = INSERT mode
silent! let &t_SR.="\e[4 q" "SR = REPLACE mode
silent! let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

 " Mostrar identacao:
"set list listchars=tab:»·,trail:·,eol:$

 " Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

 " Reconhecer maiusculas na hora de salvar e sair:
cab W w
cab Q q
cab Wq wq
cab wQ wq
cab WQ wq

 " Cursor verticalmente centralizado
"set so=999

 " Busca verticalmente centralizada
"nmap  n  nzz
"nmap  N  Nzz
"nmap  *  *zz
"nmap  #  #zz
"nmap g* g*zz
"nmap g# g#zz

 " Busca verticalmente centralizada mostrando ocorrencias
set hlsearch
nnoremap  n  nzz:%s///gn<CR><C-o>
nnoremap  N  Nzz:%s///gn<CR><C-o>
nnoremap  *  *zz:%s///gn<CR><C-o>
nnoremap  #  #zz:%s///gn<CR><C-o>
nnoremap g* g*zz:%s///gn<CR><C-o>
nnoremap g# g#zz:%s///gn<CR><C-o>
 " Busca verticalmente erros de ortografia
nnoremap ]s ]szz
nnoremap [s [szz
nmap ,m ]szz
nmap <M [szz

 " Mostra todas as ocorrencias da busca em separado
nmap <C-f> :vimgrep /<C-r>//g %<CR> \| !:copen \| set modifiable <Enter>

 " procura a medida que vai digitando palavra
set incsearch

" Procura sem case sensitive
set ic
if exists("g:startic")
   if g:startic == "no"
      " Procura com case sensitive
      set noic
   end
end

 " Smart case matching
set sc

 "usa mouse em todos os modos
"set mouse=a "tem que segurar o shift para copiar com o botao do meio
"set mouse=r
"set mouse=v

 " Copiar para externo
vmap <C-Y> "+y
 " Colar de externo
nmap <C-P> "+p
imap <C-P> <C-O>"+P
 " Cortar
vmap <C-X> "+x
imap <C-X> <C-O>"+x
 " Desfazer
noremap <C-Z> u
inoremap <C-Z> <C-O>u
 " Selecionar tudo
map <C-a> <esc>ggvG
 " Apagar com backspace
map <BS> X

 " tecla Home no primeiro caracter
noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <silent> <Home> <C-O><Home>

 " visualizar todas opcoes ao inves de completar
set wildmode=longest,list,full

 " gravar arquivo ao sair do foco da janela
"au FocusLost * :w

 " Carregando ......
exec "source" . g:vimdir . "vimstartup"
exec "source" . g:vimdir . "vimload"
exec "source" . g:vimdir . "vimsmartcase"

silent! exec "source" . g:vimdir . "vimvundle"
silent! Bundle 'ron89/thesaurus_query.vim'
