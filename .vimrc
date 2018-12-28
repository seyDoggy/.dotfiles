" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/PickAColor.vim'
Plug 'wincent/terminus'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mhinz/vim-hugefile'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'altercation/vim-colors-solarized'
" Initialize plugin system
call plug#end()

" General {

    " GVIM- (here instead of .gvimrc)
    if has('gui_running')
        " auto save
        :au FocusLost * silent! wa
        :set autowriteall
    
        set guifont=Hack\ 11,Inconsolata\ for\ Powerline\ 11,Menlo\ Regular\ 11,Consolas\ Regular\ 11,Courier\ New\ Regular\ 11
    
        if has("gui_gtk2")
            " Set GUI Font
            set guifont=Hack\ 11,Inconsolata\ for\ Powerline\ 11,Menlo\ Regular\ 11,Consolas\ Regular\ 11,Courier\ New\ Regular\ 11
        elseif has('gui_macvim')
            " Set GUI Font
            set guifont=Droid\ Sans\ Mono\ for\ Powerline:h11,Menlo\ Regular:h11,Consolas\ Regular:h11,Courier\ New\ Regular:h11
            " Make the window slightly transparent
            set transparency=0
        elseif has('gui_vimr')
            " Set GUI Font
            set guifont=Droid\ Sans\ Mono\ for\ Powerline:h11,Menlo\ Regular:h11,Consolas\ Regular:h11,Courier\ New\ Regular:h11
        endif
    else
        " hack for highlight color in gnome-terminal
        if !has("macunix")
            let g:solarized_termcolors=16
            color solarized
        endif
    endif

    " allow mouse reporting on large terminal sessions
    " https://iterm2.com/faq.html
    if has('mouse_sgr')
        set ttymouse=sgr
    endif
    
    " set column at 80 char
    set colorcolumn=80

    syntax enable
    set background=dark         " Assume a dark background
    colorscheme solarized

    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " Syntax highlighting
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    scriptencoding utf-8

    if has('clipboard')
        if has('unnamedplus')  " When possible use + register for copy-paste
            set clipboard=unnamed,unnamedplus
        else         " On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
    endif

    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h    " Always switch to the current file directory

    set autowrite                       " Automatically write a file when leaving a modified buffer
    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)
    set spell                           " Spell checking on
    set hidden                          " Allow buffer switching without saving
    set iskeyword-=.                    " '.' is an end of word designator
    set iskeyword-=#                    " '#' is an end of word designator
    set iskeyword-=-                    " '-' is an end of word designator
    set laststatus=2                    " Always show statusline


    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

    " http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
    " Restore cursor to file position in previous editing session
    function! ResCur()
        if line("'\"") <= line("$")
            silent! normal! g`"
            return 1
        endif
    endfunction

    augroup resCur
        autocmd!
        autocmd BufWinEnter * call ResCur()
    augroup END

    " Setting up the directories {
        set backup                  " Backups are nice ...
        if has('persistent_undo')
            set undofile                " So is persistent undo ...
            set undolevels=1000         " Maximum number of changes that can be undone
            set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
        endif

        " Add exclusions to mkview and loadview
        " eg: *.*, svn-commit.tmp
        let g:skipview_files = [
            \ '\[example pattern\]'
                \ ]
    " }

" }

" Key mapping {

    let mapleader = ','

    " Easier moving in tabs and windows
    map <C-J> <C-W>j<C-W>_
    map <C-K> <C-W>k<C-W>_
    map <C-L> <C-W>l<C-W>_
    map <C-H> <C-W>h<C-W>_

    " Wrapped lines goes down/up to next row, rather than next line in file.
    noremap j gj
    noremap k gk

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

    " Most prefer to toggle search highlighting rather than clear the current
    nmap <silent> <leader>/ :nohlsearch<CR>

    " map oo to add new line
    nnoremap <C-o> o<Esc>
    
    " My Numbers settings
    let g:enable_numbers = 0
    nnoremap <F3> :NumbersToggle<CR>
    nnoremap <F4> :NumbersOnOff<CR>
    
    " maps \c to ^__ for commenting
    map <leader>c <C-_><C-_>
    
    " maps space to prompt
    map <space> :
    
    " map double space to command-line prompt
    map <space><space> :!
    
    " map F7 to reindent lines
    map <F7> mzgg=G`z<CR>

    " Set word wrap
    map <leader>r :set wrap linebreak nolist<CR>
    map <leader><leader>r :set nowrap<CR>

    " paste with indent and
    " stop visual paste from replacing register
    nnoremap p p=`]
    nnoremap P P=`]
    vnoremap p "_dp=`]
    vnoremap P "_dP=`]
    " paste normal
    nnoremap <leader><leader>p p
    nnoremap <leader><leader>P P

" }

" Plugins {
    " map leader p to color picker
    map <leader>p :PickHEX<CR>

    " GitGutter issue
    let g:gitgutter_realtime = 0
    
    " airline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline#extensions#branch#symbol = ' '
    let g:airline#extensions#readonly#symbol = ''
    let g:airline_linecolumn_prefix = ' '

    " airline tabline - Enable the list of buffers
    let g:airline#extensions#tabline#enabled = 1

    " airline - Show just the filename
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#tabline#show_buffers = 0
    
    " large screen
    let NERDTreeQuitOnOpen = 0
    " small screen
    "let NERDTreeQuitOnOpen = 1

    map <C-e> <plug>NERDTreeTabsToggle<CR>
    map <leader>e :NERDTreeFind<CR>
    nmap <leader>nt :NERDTreeFind<CR>

    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
    let NERDTreeChDirMode=0
    let NERDTreeQuitOnOpen=1
    let NERDTreeMouseMode=2
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1
    let g:nerdtree_tabs_open_on_gui_startup=0

    let g:ctrlp_working_path_mode = 'ra'
    nnoremap <silent> <D-t> :CtrlP<CR>
    nnoremap <silent> <D-r> :CtrlPMRU<CR>
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\.git$\|\.hg$\|\.svn$\|bower_components$\|dist$\|node_modules$\|project_files$\|test$\|coverage$',
        \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

    let s:ctrlp_fallback = 'find %s -type f'

    if exists("g:ctrlp_user_command")
        unlet g:ctrlp_user_command
    endif
    let g:ctrlp_user_command = {
        \ 'types': {
            \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
            \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        \ },
        \ 'fallback': s:ctrlp_fallback
    \ }

    " CtrlP extensions
    let g:ctrlp_extensions = ['funky']

    "funky
    nnoremap <Leader>fu :CtrlPFunky<Cr>
    " narrow the list down with a word under cursor
    nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
" }

