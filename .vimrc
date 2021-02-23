" Required {{{
" Folding {{{
set modelines=1 " Connects to bottom line of this file
" }}}
" Vim-Plug {{{
set nocompatible              " be iMproved, required
filetype off                  " required


"set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')
" alternatively, pass a path where Vundle should install plugins

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fholgado/minibufexpl.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'
Plug 'vim-scripts/csv.vim'
Plug 'xolox/vim-misc'
Plug 'ervandew/matchem'
Plug 'fatih/vim-go'
Plug 'tpope/vim-git'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'shawncplus/phpcomplete.vim'
Plug 'xolox/vim-notes'
Plug 'arcticicestudio/nord-vim'
" Add homebrew fzf to the vim path:
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'prettier/vim-prettier'
Plug 'Shougo/vimproc.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'leafgarland/typescript-vim'
Plug 'jparise/vim-graphql'
Plug 'posva/vim-vue'
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'idanarye/vim-merginal'



" All of your Plugins must be added before the following line
call plug#end()              " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" }}}
" }}}

" Colors and Look {{{
" Line Numbers {{{
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set encoding=utf8
set guifont=Knack\ Nerd\ Font:h11
" }}}
" Whitespace {{{
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/
" }}}
" Scheme {{{
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400

set t_Co=256
"color wombat256mod
color nord
autocmd ColorScheme * highlight Visual ctermbg=LightCyan
" }}}
" Syntax {{{
" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on
" }}}
" Columns {{{
au BufRead,BufNewfile *.py set colorcolumn=80
highlight ColorColumn ctermbg=233
" }}}
" }}}

" Vim Behavior {{{
" Wild menu {{{
set wildmenu
set wildmode=full
" }}}
" Shell {{{
set shell=/usr/bin/zsh
" }}}
" Copy & Paste {{{
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
"nnoremap <leader>y "*y
"nnoremap <leader>p "*p
"nnoremap <leader>Y "+P
"nnoremap <leader>P "+P
set pastetoggle=<F2>
set clipboard=unnamedplus
" }}}
" Mouse and backspace {{{
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again
" }}}
" Disable Backups {{{
set nobackup
set nowritebackup
set noswapfile
" }}}
" Auto Reload {{{
autocmd! bufwritepost .vimrc source %
" }}}
" History and Undo {{{
set history=700
set undolevels=700
" }}}
" Tabs and Spacing {{{
" Real programmers don't use TABs but spaces
set softtabstop=4
set shiftwidth=4
au BufRead,BufNewfile *.rb,*.ts,*.js set tabstop=2
au BufRead,BufNewfile *.rb,*.ts,*.js set softtabstop=2
au BufRead,BufNewfile *.rb,*.ts,*.js set shiftwidth=2
set shiftround
set expandtab
" }}}
" Searching {{{
" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase
" }}}
" File Specific {{{

" CSV {{{
au BufRead,BufNewfile *.csv set ft=csv
au BufRead,BufNewfile *.csv set nonumber
" }}}

" TSV {{{
au BufRead,BufNewfile *.tsv set ft=csv
au BufRead,BufNewfile *.tsv set noexpandtab
au BufRead,BufNewfile *.tsv set nonumber
" }}}

" }}}
" }}}

" Custom Shortcuts {{{
" Escape {{{
imap jk <Esc>l
" }}}
" Files {{{
"let $FZF_DEFAULT_COMMAND = 'ag -g ""'
nnoremap <C-p> :GFiles --cached --others --exclude-standard<CR>
" }}}
" Increment {{{
noremap <C-s> <C-a>
" }}}
" White Space{{{
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
" }}}
" Leader {{{
let mapleader = ","
" }}}
" Spelling {{{
nmap <F6> :setlocal spell! spelllang=en<CR>
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell
" }}}
" Tabs {{{
" Reset 4 spaces to 2 spaces
nmap <F7> :set ts=4 sts=4 noet<CR>:retab!<CR>:set ts=2 sts=2 et<CR>:retab<CR>

" Reset 2 spaces to 4 spaces
nmap <F8> :set ts=2 sts=2 noet<CR>:retab!<CR>:set ts=4 sts=4 et<CR>:retab<CR>
" }}}
" Horizontal Scrolling {{{
map L 20zl
map H 20zh
" }}}
" Align {{{
" Simple shortcut to align tsv files
noremap <leader>A :%!column -t<CR>
"}}}
" Highlighting {{{
noremap <C-N> :nohl<CR>
vnoremap <C-N> :nohl<CR>
inoremap <C-N> :nohl<CR>
" }}}
" Quick quit {{{
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows
" }}}
" Fix :W and :Q errors {{{
cmap WQ wq
cmap Wq wq
cmap W w
cmap Q q
" }}}
" ':' {{{"{{{

" }}}
" Movement {{{

" Windows {{{
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
" }}}

" Tabs {{{
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
" }}}

" }}}"}}}
" Sort {{{
vnoremap <Leader>s :sort<CR>
" }}}
" Indention {{{
" Try to go into visual mode (v), then select several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation
" }}}
" Paragraphs {{{
vmap Q gq
nmap Q gqap
" }}}
" Breakpoints {{{
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>
" }}}
" Omnicomplete list {{{
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == '\<C-j>'
            return "\<C-N>"
        elseif a:action == '\<C-k>'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('\<C-j>')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('\<C-k>')<CR>
" }}}
" Folds {{{
nnoremap <space> za
vnoremap <space> zf
" }}}
" rspec {{{
map <leader>r :! rspec % <cr>
" }}}
" json formatting {{{
nmap <leader>j :%!python -m json.tool <cr>
" }}}
" }}}

" Plugin settings and help {{{
" Airline {{{
set noshowcmd
set laststatus=2
let g:airline_theme='nord'
let g:airline#extensions#tagbar#enabled = 1
"let g:airline#extensions#syntastic#enabled = 1
"let g:airline#extensions#ycm#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
" }}}
" Jedi {{{
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
" }}}
" NERDtree {{{
map <leader>n :NERDTreeToggle<CR>
let g:NERDTreeDisableFileExtensionHighlight = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1
let g:NERDTreeWinSize=50
autocmd StdinReadPre * let s:std_in=1
" Auto Open NerdTree
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" }}}
" Surround {{{
" cs"' to change from "Hello world" to 'Hello world'
" cst" to go full circle
" ds" to delete "
" yss ) to wrap the entire line in ()
" }}}
" NERDcommenter {{{
"NERDCommenter
"<,>cc  Comment out the current line or text in visual mode
" }}}
" Tagbar {{{
nmap <leader>t :TagbarToggle<CR>
"let g:tagbar_ctags_bin="/usr/bin/ctags"
" }}}
" Scratch {{{
"scratch.vim
"gs to open the scratch window or :Scratch
" }}}
" UndoTree {{{
set undodir="/home/jonathan/.undodir/"
set undofile
nnoremap <leader>u :UndotreeToggle<cr>
" }}}
" Tabular {{{
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
" }}}
" Minibufexpl {{{
nmap <leader>M :MBEbd<CR>
nmap <leader>T :MBEToggle<cr>
" }}}
" Syntastic {{{
let g:syntastic_python_flake8_args='--ignore=E501, W391'
nmap <leader>S :SyntasticToggleMode<CR>
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall -Wextra -Wpedantic"


" Simpyl Fold {{{
let g:SimpylFold_docstring_preview = 1
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
autocmd FileType c,cpp :set foldmethod=syntax
" }}}
" {{{ Markdown
"autocmd BufNewFile,BufReadPost *.md set filetype=markdown
"autocmd BufNewFile,BufReadPost *.md set colorscheme=morning
let g:tagbar_type_typescript = {                                                  
  \ 'ctagsbin' : 'tstags',                                                        
  \ 'ctagsargs' : '-f-',                                                           
  \ 'kinds': [                                                                     
    \ 'e:enums:0:1',                                                               
    \ 'f:function:0:1',                                                            
    \ 't:typealias:0:1',                                                           
    \ 'M:Module:0:1',                                                              
    \ 'I:import:0:1',                                                              
    \ 'i:interface:0:1',                                                           
    \ 'C:class:0:1',                                                               
    \ 'm:method:0:1',                                                              
    \ 'p:property:0:1',                                                            
    \ 'v:variable:0:1',                                                            
    \ 'c:const:0:1',                                                              
  \ ],                                                                            
  \ 'sort' : 0                                                                    
\ }   
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }
" }}}
" {{{ Markdown Preview
let vim_markdown_preview_hotkey='<C-w>'
let vim_markdown_preview_github=1
"let vim_markdown_preview_browser='Google Chrome'

" }}}
" {{{ Php Complete
let g:phpcomplete_parse_docblock_comments=1
" }}}
" {{{ Vim-notes
let g:notes_directories = ['~/Documents/notes']
"let g:notes_directories = ['/run/user/1000/gvfs/google-drive:host=gmail.com,user=poisson.jonathan777/1QcP5UbMVfwTFQBKE1KlYOG5LUW8sraYU']
" }}}
" {{{ Vim-Plug
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
unmap! 
" }}}
" }}}

" Create the folding you see above :)
" vim:foldmethod=marker:foldlevel=0
