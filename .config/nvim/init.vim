" ================================================================================
"
"	 o8o               o8o      .                    o8o
"	 `"'               `"'    .o8                    `"'
"	oooo  ooo. .oo.   oooo  .o888oo     oooo    ooo oooo  ooo. .oo.  .oo.
"	`888  `888P"Y88b  `888    888        `88.  .8'  `888  `888P"Y88bP"Y88b
"	 888   888   888   888    888         `88..8'    888   888   888   888
"	 888   888   888   888    888 . .o.    `888'     888   888   888   888
"	o888o o888o o888o o888o   '888' Y8P     `8'     o888o o888o o888o o888o
"
"					by Andreas Seipajarvi
"
" ================================================================================

" {{{	General

set nocompatible                  " be iMproved, required
filetype off                      " required

call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'
Plug 'junegunn/goyo.vim'
" Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-surround'
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'
" Plug 'dhruvasagar/vim-table-mode'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'
" Plug 'honza/vim-snippets'
" Plug 'pangloss/vim-javascript'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'othree/html5.vim'
" Plug 'scrooloose/nerdtree'
" Plug 'mattn/emmet-vim'
" Plug 'godlygeek/tabular'
" Plug 'SirVer/ultisnips'
" Plug 'ryanoasis/vim-devicons'
" Plug 'vimwiki/vimwiki'
" Plug 'reedes/vim-colors-pencil'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'beewarloc/vim-fuse'
" Plug 'lynnard/pandoc-preview.vim'
" Plug 'jceb/vim-orgmode'

call plug#end()

" }}}
" {{{	Misc

set nu                            " linenumbering
set relativenumber				" Relative linenumbering
syn on                            " syntax highlighting on
set clipboard+=unnamed
set mouse=			" disable mouse
set showcmd			" show incomplete commands
set incsearch		" search as i type
set nohlsearch		" don't highlight the search
set smartcase		" ignore case in search (for now)
set ignorecase		

set nobackup		" no backup files
set noswapfile		" swap only inhibits

set directory=~/.vim-tmp,~/.tmp,/var/tmp,/tmp
if exists('+undofile')
	set undofile
	set undodir=~/.vim-tmp,~/.tmp,/var/tmp,/tmp
endif

set history=1000                            " more history
set undolevels=1000                         " more undo
set shell=zsh                              " set shell for ?
set hidden                                  " allow buffers in background
set listchars=tab:\ \ ,trail:·              " invisible chars
set list                                    " show trails
set showmatch

set splitbelow                              " better splits when opening new window
set splitright

set timeout timeoutlen=1000 ttimeoutlen=100 " responsive timeout

set autoindent                              " autoindent on new lines
set shiftwidth=4
set tabstop=4
set softtabstop=4
set noexpandtab                             " tab chars don't expand to space
set smartindent

" set autoread                                " refresh files when coming back
" set foldlevel=999
" set exrc                                    " autoload local .vimrc files
" set secure                                  " but let's make it secure
" set modelines=5
" set path+=**
" set wildmenu

filetype plugin on

" augroup autosave_buffer
" 	autocmd!
" 	autocmd BufWinLeave *.vim,*.conf mkview
" 	autocmd BufWinEnter *.vim,*.conf silent loadview
" augroup END

set viewoptions-=options
set sessionoptions-=help

" }}}
" {{{	Plugin specific

" {{{ Plugin specific: Pandoc

let g:pandoc#filetypes#pandoc_markdown = 1
let g:pandoc_preview_pdf_cmd = "zathura --fork "
let g:pandoc#spell#enabled = 0
let g:pandoc#formatting#mode = "hA"
let g:pandoc#formatting#textwidth = 74
" let g:pandoc#folding#fdc = 5
let g:pandoc#folding#fdc = 0
let g:pandoc#command#custom_open = "MyPandocOpen"
let g:pandoc#toc#position = "bottom"
let g:pandoc#command#latex_engine = "xelatex"

function! MyPandocOpen(file)
	return 'zathura '. a:file
endfunction

function ZathuraOpen(type)
	let b:zathura = @% . ".pdf"
	execute "!zathura " . shellescape(b:zathura)
endfunction

" augroup pandoc
" 	au BufEnter *.md	set nonu
" 	au BufEnter *.md	set nornu
" augroup END

" }}}
" {{{ Plugin specific: UltiSnips

" let g:UltiSnipsExpandTrigger="<Tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'

" }}}
" {{{ Plugin-specific: ctrlp

let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'wa'
let g:ctrlp_open_multiple_files = 't'
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:10'
let g:ctrlp_show_hidden = 1
let g:ctrlp_by_filename = 0
let g:ctrlp_custom_ignore = {
	\ 'dir':	'\v[\/]\.(git|hg|svn|vivaldi-snapshot)$',
	\ 'file':	'\v\.(exe|so|dll|pdf|jpg|png|svg|eot)$',
	\ }
set wildignore+=*/.git/*,*/.pdf/*

" }}}
" {{{	Keybinds

" Assign mapleader to space and local leader to ','
let mapleader = "\<Space>"	
let maplocalleader = ","

" Insert date
map <leader>r :r! date "+\%d/\%m-\%Y"<CR>

" Easy access to notesdir, vimrc, etc
map <leader>1 :CtrlP $NOTESDIR<CR>
map <leader>2 :CtrlP $PRESENDIR<CR>
map <leader>3 :CtrlP $DEVDIR<CR>
map <leader>0 :e ~/.config/nvim/init.vim<CR>
map <leader>9 :e ~/.zshrc<CR>
map <leader>8 :e ~/.tmux.conf<CR>

" Add ctrl-tab support
" noremap <S-tab> :tabnext<CR>

map <leader>å :TOC<CR>

noremap <CR> <nop>
noremap <Space> <nop>
noremap - <nop>
noremap + <nop>
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" because who needs K anywaays
noremap J 5j
noremap K 5k


" Easy insert exit
inoremap jj <ESC>

" Pandocs
map <leader>mr :Pandoc pdf<CR>
map <leader>mp :Pandoc! pdf<CR>
" map <leader>mf :Pandoc! pdf -V documentclass=report<CR>

" Yank to clipboard
map <leader>y "+y
map <leader>v "+p

" Distraction free mode
map <leader><Tab> :Goyo<CR>

" Comment line
map <leader><leader><leader> gcc

" Tabularize init
map <leader>ll :Tabularize /

" NERDTree
" map <leader>å :NERDTreeToggle<CR>
" map <leader>Å :NERDTree $NOTESDIR<CR>

" Close all but current
map <leader>o <C-w>o

" Move to vertical
map <leader>e <C-w>L

nnoremap <leader>n :tabnew<CR>

" Window close
nnoremap <leader>c <C-w>c

" Easy bracketing
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i
inoremap $T </><esc>i

" Easy markdown math
inoremap $N $${}$$<esc>hhi
inoremap $n ${}$<esc>hi

" Rid of command mode
nnoremap Q <nop>

" Forgot sudo? No problem
com W :w !sudo tee %

set encoding=utf-8	" correct encoding
scriptencoding utf8
set termencoding=utf-8

set linespace=0
