set t_Co=256               " 256 colors
set nocompatible               " be iMproved
let mapleader=","              " change the leader to be a comma vs slash
filetype off                  " required

set hidden
set showtabline=0

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle  # begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here(note older versions of Vundle used Bundle instead of Plugin)
"------------------ -= == Code/Project navigation == =-------------
Plugin 'scrooloose/nerdtree'                " Project and file navigation
Plugin 'Xuyuanp/nerdtree-git-plugin'        " NerdTree git functionality
Plugin 'majutsushi/tagbar'                  " Class/module browser
Plugin 'vim-ctrlspace/vim-ctrlspace'        " Tabs/Buffers/Fuzzy/Workspaces/Bookmarks
Plugin 'ctrlpvim/ctrlp.vim'                 " Fuzzy file search
Plugin 'mileszs/ack.vim'                    " Ag/Grep
Plugin 'vim-airline/vim-airline'            " Lean & mean status/tabline for vim
Plugin 'vim-airline/vim-airline-themes'     " Themes for airline
Plugin 'thaerkh/vim-indentguides'           " Visual representation of indents
Plugin 'triglav/vim-visual-increment'
"Plugin 'MattesGroeger/vim-bookmarks'        " Bookmarks
"Plugin 'yuttie/comfortable-motion.vim'      " Smooth scrolling

"------------------ -= == Other == =-------------------------------
Plugin 'tpope/vim-surround'                 " Parentheses, brackets, quotes, XML tags, and more
Plugin 'flazz/vim-colorschemes'             " Colorschemes
Plugin 'kien/rainbow_parentheses.vim'       " Rainbow Parentheses
Plugin 'chriskempson/base16-vim'            " Base 16 colors
Plugin 'ryanoasis/vim-devicons'             " Dev Icons
Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'

"------------------ -= == Snippets support == =--------------------
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'                 " snippets repo
" Plugin 'ervandew/supertab'
Plugin 'MarcWeber/vim-addon-mw-utils'       " dependencies  # 1
Plugin 'tomtom/tlib_vim'                    " dependencies  # 2

"------------------ -= == Languages support == =-------------------
Plugin 'scrooloose/nerdcommenter'           " Easy code documentation
Plugin 'mitsuhiko/vim-sparkup'              " Sparkup(XML/jinja/htlm-django/etc.) support
Plugin 'w0rp/ale'

"------------------ -= == Latex == =-----------------------------
"Plugin 'GCBallesteros/vim-autocite'
Plugin 'lervag/vimtex'

"------------------ -= == Python == =-----------------------------
Plugin 'klen/python-mode'                   " Python mode(docs, refactor, lints...)
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'mitsuhiko/vim-python-combined'
Plugin 'mitsuhiko/vim-jinja'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'cjrh/vim-conda'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on     " required!

"== == == == == == == == == == == == == == == == == == == == == == == == == == =
"" General settings
"== == == == == == == == == == == == == == == == == == == == == == == == == == =
if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif
set encoding=utf-8

"""" Display
if has("gui_running")
     colorscheme mustang
    " Remove menu bar
    set guioptions-=m

    " Remove toolbar
    set guioptions-=T
else
    if &t_Co>=256
        colorscheme mustang
    else
        "colorscheme wargrey
    endif
endif

" Mouse on xterm
if has('mouse')
  set mouse=a
  if &term=~"xterm" || &term=~"screen"
    set ttymouse=xterm2
    autocmd VimEnter,FocusGained,BufEnter * set ttymouse=xterm2
  endif
endif

syntax enable                               " enable syntax highlighting

set pyxversion=0
let g:loaded_python_provider=1
set shell=/bin/bash
set number                                  " show line numbers
set ruler
set ttyfast                                 " terminal acceleration
set tabstop=4                               " 4 whitespaces for tabs visual presentation
set shiftwidth=4                            " shift lines by 4 spaces
set smarttab                                " set tabs for a shifttabs logic
set expandtab                               " expand tabs into spaces
set autoindent                              " indent when moving to the next line while writing code
set showmatch                               " shows matching part of bracket pairs (), [], {}
set enc=utf-8                            " utf-8 by default
set nobackup                            " no backup files
set nowritebackup                           " only in case you don't want a backup file while editing
set noswapfile                            " no swap files
set backspace=indent,eol,start              " backspace removes all (indents, EOLs, start) What is start?
set scrolloff=10                            " let 10 lines before/after cursor during scroll
set clipboard=unnamedplus                   " use system clipboard
set exrc                                    " enable usage of additional .vimrc files from working directory
set secure                                  " prohibit .vimrc files to execute shell, create files, etc...

"=====================================================
"" Tabs / Buffers settings
"=====================================================
tab sball
set switchbuf=useopen
set laststatus=2
nmap <F9> :bprev<CR>
nmap <F10> :bnext<CR>

"=====================================================
"" Relative Numbering 
"=====================================================
nnoremap <F4> :set relativenumber!<CR>

"=====================================================
"" Search settings
"=====================================================
set incsearch	                            " incremental search
set hlsearch	                            " highlight search results
" hide matches on <leader>space
nnoremap <leader><space> :nohlsearch<cr>

"=====================================================
"" Comfortable Motion Settings
"=====================================================
" let g:comfortable_motion_scroll_down_key="j"
" let g:comfortable_motion_scroll_up_key="k"
" let g:comfortable_motion_no_default_key_mappings=1
" let g:comfortable_motion_impulse_multiplier=25  " Feel free to increase/decrease this value.
" nnoremap <silent> <C-d> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
" nnoremap <silent> <C-u> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>
" nnoremap <silent> <C-f> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 4)<CR>
" nnoremap <silent> <C-b> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -4)<CR>

"=====================================================
"" AirLine settings
"=====================================================
let g:airline_theme='badwolf' 
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#ale#enabled=1

"=====================================================
"" TagBar settings
"=====================================================
let g:tagbar_autofocus=0
let g:tagbar_width=42
autocmd BufEnter *.py :call tagbar#autoopen(0)
autocmd BufWinLeave *.py :TagbarClose

"=====================================================
"" NERDTree settings
"=====================================================
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
let NERDTreeWinSize=40
autocmd VimEnter * if !argc() | NERDTree | endif  " Load NERDTree only if vim is run without arguments
nmap " :NERDTreeToggle<CR>

"=====================================================
"" NERDComment Settings 
"=====================================================
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims=1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs=1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign='left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java=1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters={ 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines=1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace=1

"=====================================================
"" DevIcon Settings
"=====================================================
" loading the plugin 
let g:webdevicons_enable=1
" adding the flags to NERDTree 
let g:webdevicons_enable_nerdtree=1
" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline=1
" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline=1
" turn on/off file node glyph decorations (not particularly useful)
let g:WebDevIconsUnicodeDecorateFileNodes=1
" use double-width(1) or single-width(0) glyphs 
" only manipulates padding, has no effect on terminal or set(guifont) font
let g:WebDevIconsUnicodeGlyphDoubleWidth=1
" whether or not to show the nerdtree brackets around flags 
let g:webdevicons_conceal_nerdtree_brackets=0
" the amount of space to use after the glyph character (default ' ')
let g:WebDevIconsNerdTreeAfterGlyphPadding=' '
" Force extra padding in NERDTree so that the filetype icons line up vertically
let g:WebDevIconsNerdTreeGitPluginForceVAlign=1 
" change the default character when no match found
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol='ƛ'
" set a byte character marker (BOM) utf-8 symbol when retrieving file encoding
" disabled by default with no value
let g:WebDevIconsUnicodeByteOrderMarkerDefaultSymbol=''
" enable folder/directory glyph flag (disabled by default with 0)
let g:WebDevIconsUnicodeDecorateFolderNodes=1
" enable open and close folder/directory glyph flags (disabled by default with 0)
let g:DevIconsEnableFoldersOpenClose=1
" enable pattern matching glyphs on folder/directory (enabled by default with 1)
let g:DevIconsEnableFolderPatternMatching=1
" enable file extension pattern matching glyphs on folder/directory (disabled by default with 0)
let g:DevIconsEnableFolderExtensionPatternMatching=0

"=====================================================
"" YCM/Jedi settings
"=====================================================
let g:ycm_path_to_python_interpreter='/home/eb0025/anaconda/bin/python'
let g:ycm_python_binary_path = '/home/eb0025/anaconda/bin/python'

"" let g:conda_startup_msg_suppress = 1
if !exists('g:ycm_semantic_triggers')
   let g:ycm_semantic_triggers = {}
endif

let g:ycm_semantic_triggers = {
	\   'python': [ 're!(import\s+|from\s+(\w+\s+(import\s+(\w+,\s+)*)?)?)' ]
	\ }

nmap K :YcmCompleter GetDoc<CR>

set previewheight=25
"" close preview window automatically when we move around
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"  Enable jedi for function signature display
let g:jedi#documentation_command = ""
let g:jedi#completions_enabled = 0 " avoid conflicts with YCM
let g:jedi#force_py_version = 2

"=====================================================
"" UltiSnips settings
"=====================================================
" This will make tab work as snippet when matched to pattern, otherwise will
" trigger YCM.
"let g:SuperTabDefaultCompletionType    = '<C-n>'
"let g:SuperTabCrMapping                = 0
"let g:UltiSnipsExpandTrigger           = '<tab>'
"let g:UltiSnipsJumpForwardTrigger      = '<tab>'
"let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
"let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
"
"Simpler trigger
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:UltisnipsUsePythonVersion = 2

"=====================================================
" Ale settings
"=====================================================
let g:ale_sign_column_always=0
let g:ale_fix_on_save=0
let g:ale_emit_conflict_warnings=0
let b:ale_linters=['flake8'] " pylint is annoying
let b:ale_fixers=['autopep8', 'yapf']
nmap <leader>f <Plug>(ale_fix)

"=====================================================
"" vimtex settings
"=====================================================
"
let g:vimtex_complete_recursive_bib = 1
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

"=====================================================
"" Rainbow Parentheses Autoload 
"=====================================================
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"=====================================================
"" Indent Guides Settings 
"=====================================================
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

"=====================================================
"" Python settings
"=====================================================

" python executables for different plugins
let g:pymode_python='python'

" rope
let g:pymode_rope=0
let g:pymode_rope_completion=0
let g:pymode_rope_complete_on_dot=0
let g:pymode_rope_auto_project=0
let g:pymode_rope_enable_autoimport=0
let g:pymode_rope_autoimport_generate=0
let g:pymode_rope_guess_project=0

" documentation
let g:pymode_doc=0
let g:pymode_doc_bind='K'

" lints
let g:pymode_lint=0

" virtualenv
let g:pymode_virtualenv=1

" breakpoints
let g:pymode_breakpoint=1
let g:pymode_breakpoint_key='<leader>b'

" syntax highlight
let g:pymode_syntax=1
let g:pymode_syntax_slow_sync=1
let g:pymode_syntax_all=1
let g:pymode_syntax_print_as_function=g:pymode_syntax_all
let g:pymode_syntax_highlight_async_await=g:pymode_syntax_all
let g:pymode_syntax_highlight_equal_operator=g:pymode_syntax_all
let g:pymode_syntax_highlight_stars_operator=g:pymode_syntax_all
let g:pymode_syntax_highlight_self=g:pymode_syntax_all
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_string_formatting=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all
let g:pymode_syntax_string_format=g:pymode_syntax_all
let g:pymode_syntax_string_templates=g:pymode_syntax_all
let g:pymode_syntax_doctests=g:pymode_syntax_all
let g:pymode_syntax_builtin_objs=g:pymode_syntax_all
let g:pymode_syntax_builtin_types=g:pymode_syntax_all
let g:pymode_syntax_highlight_exceptions=g:pymode_syntax_all
let g:pymode_syntax_docstrings=g:pymode_syntax_all

" highlight 'long' lines (>= 80 symbols) in python files
augroup vimrc_autocmds
    autocmd!
    autocmd FileType python,rst,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python,rst,c,cpp match Excess /\%81v.*/
    autocmd FileType python,rst,c,cpp set nowrap
    autocmd FileType python,rst,c,cpp set colorcolumn=80
augroup END

" code folding
let g:pymode_folding=0

" pep8 indents
let g:pymode_indent=1

" code running
let g:pymode_run=1
let g:pymode_run_bind='<F5>'

let g:pymode_rope_lookup_project=0

imap <F5> <Esc>:w<CR>:!clear;python %<CR>

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" Open file on last modified line
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm$"|endif|endif

" ===========================================================
" FileType specific changes
" ============================================================
" Mako/HTML
autocmd BufNewFile,BufRead *.mako,*.mak,*.jinja2 setlocal ft=html
autocmd FileType html,xhtml,xml,css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Python
"au BufRead *.py compiler nose
au FileType python map <leader>( [[
au FileType python map <leader>) ]]
au FileType python let g:airline_detect_whitespace=1
au FileType python setlocal completeopt-=preview
"au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
" Don't let pyflakes use the quickfix window
au FileType python syn keyword pythonDecorator True None False self
au BufNewFile *.py 0r ~/.vim/python.hdr

"-----------------------------------------------------------------------------
" Add spellcheck to latex files. Language is set to portuguese
"-----------------------------------------------------------------------------
"au FileType tex set spell

" Proper super tab behaviour for label/ref completion
au FileType tex set iskeyword+=:,_
" au BufRead,BufNewFile *.tex setlocal spell spelllang=pt_br
au BufRead,BufNewFile *.tex setlocal spell spelllang=en_GB

"-----------------------------------------------------------------------------
" Fix constant spelling mistakes
"-----------------------------------------------------------------------------
iab teh       the
iab Teh       The
iab taht      that
iab Taht      That
iab alos      also
iab Alos      Also
iab aslo      also
iab Aslo      Also
iab becuase   because
iab Becuase   Because
iab bianry    binary
iab Bianry    Binary
iab bianries  binaries
iab Bianries  Binaries
iab charcter  character
iab Charcter  Character
iab charcters characters
iab Charcters Characters
iab exmaple   example
iab Exmaple   Example
iab exmaples  examples
iab Exmaples  Examples
iab shoudl    should
iab Shoudl    Should
iab seperate  separate
iab Seperate  Separate
iab fone      phone
iab Fone      Phone
