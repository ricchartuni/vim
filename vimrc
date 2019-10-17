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

 " Recarregar o vimrc
"nmap ,r :source ~/.vimrc <BAR> echo "vimrc recarregado!"<CR>
nmap ,r :exec "source" . g:vimdir . "vimrc" <BAR> echo "vimrc recarregado!"<CR>

"syntax on

 " Fonte
set guifont=Monospace\ 8.9

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

 " Copiar
"vmap <C-Y> y
 " Colar
"nmap <C-P> p
"imap <C-P> <C-O>p
 " Cortar
"vmap <C-X> x
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

 " gravar arquivo ao sair do foco da janela
"au FocusLost * :w
 augroup focus_buffer_check " (160715) {{{

 "---------------- FOCUS GAINED: Set your working GUI BACKGROUND COLOR
 au FocusGained *  :hi Normal guibg='grey20'

 "---------------- FOCUS LOST: check the 'modified' option of all visible buffers
 au FocusLost   * let i = 0
 au FocusLost   * while i < bufnr('$')
 au FocusLost   *  if getbufvar(winbufnr(i), '&modified')
 au FocusLost   *   break
 au FocusLost   *  endif
 au FocusLost   *  let i = i+1
 au FocusLost   * endwhile
 "---------------- SET GUI_BACKGROUND_COLOR ACCORDINGLY
 au FocusLost   * if i < bufnr("$")            " FOUND SOME 'modified' buffer
 au FocusLost   *  :hi Normal guibg='#910000'  " -> [ALARM-COLOR]
 au FocusLost   * else"                        " FOUND   NO 'modified' buffer
 au FocusLost   *  :hi Normal guibg='grey20' "'#000033'  " -> [OK-COLOR]
 au FocusLost   *  cclose                      " -> close quickfix window
 au FocusLost   * endif

 augroup END	" focus_buffer_check }}}

 " Carregando ......
exec "source" . g:vimdir . "vimstartup"
exec "source" . g:vimdir . "vimload"

