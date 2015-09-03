" Required {{{
" Folding {{{
set modelines=1 " Connects to bottom line of this file
" }}}
" Vundle {{{
set nocompatible              " be iMproved, required
filetype off                  " required


"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'Lokaltog/vim-powerline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mtth/scratch.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'mbbill/undotree'
Plugin 'vim-scripts/csv.vim'
Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-notes'
"Plugin 'Raimondi/delimitMate'
Plugin 'ervandew/matchem'
Plugin 'tmhedberg/SimpylFold'
"Plugin 'tpope/vim-markdown'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'


" All of your Plugins must be added before the following line
call vundle#end()            " required
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
color wombat256mod
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
" Copy & Paste {{{
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed
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
set tabstop=4
set softtabstop=4
set shiftwidth=4
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
" White Space{{{
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
" }}}
" Leader {{{
let mapleader = ","
" }}}
" Spelling {{{
nmap <F6> :setlocal spell! spelllang=en<CR>
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
" ':' {{{
nnoremap ; :
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

" }}}
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
" }}}

" Plugin settings and help {{{
" Powerline {{{
set laststatus=2
" }}}
" Ctrlp {{{
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
" }}}
" Jedi {{{
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
" }}}
" NERDtree {{{
map <leader>n :NERDTreeToggle<CR>
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
" }}}
" Scratch {{{
"scratch.vim
"gs to open the scratch window or :Scratch
" }}}
" UndoTree {{{
if has("persistent_undo")
    set undodir='~/.undodir/'
    set undofile
endif
nnoremap <leader>u :UndotreeToggle<cr>
" }}}
" Riv {{{
let proj1 = { 'path': '~/rst' }
let g:riv_projects = [proj1]
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
" }}}
" Notes {{{
"let g:notes_directories = ['~/Documents/notes']
" }}}
" Simpyl Fold {{{
let g:SimpylFold_docstring_preview = 1
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
autocmd FileType c,cpp :set foldmethod=syntax
" }}}
" YouCompleteMe {{{
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" }}}
" {{{ Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
"autocmd BufNewFile,BufReadPost *.md set colorscheme=morning
" }}}
" }}}

" Create the folding you see above :)
" vim:foldmethod=marker:foldlevel=0
