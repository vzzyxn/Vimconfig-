syntax on 
set nu
set smartcase
set tabstop=4 softtabstop=4
set expandtab
set nowrap 
set showcmd
set incsearch
set noswapfile 
set shiftwidth=4 
set backspace=indent,eol,start 
auto filetype cpp nnoremap <F5> :w <bar> !g++ -std=c++11 -02 -Wall % -o %:r && %:r.exe <CR>
set smartindent 
set background=dark
set guifont=Consolas:h11
highlight Normal ctermfg=grey ctermbg=darkblue
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:wesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Sections:
" 
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500
" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
        set wildignore+=.git\*,.hg\*,.svn\*
        else
                set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
                endif

                " Always show current position
                set ruler

                " Height of the command bar
                set cmdheight=1
                " A buffer becomes hidden when it is abandoned
                set hid

                " Configure backspace so it acts as it should act
                set backspace=eol,start,indent
                set whichwrap+=<,>,h,l

                " Ignore case when searching
                set ignorecase

                " When searching try to be smart about cases
                set smartcase

                " Highlight search results
                set hlsearch

                " Makes search act like search in modern browsers
                set incsearch

                " Don't redraw while executing macros (good performance config)
                set lazyredraw

                " For regular expressions turn magic on
                set magic

                " Show matching brackets when text indicator is over them
                set showmatch

                " How many tenths of a second to blink when matching brackets
                set mat=2

                " No annoying sound on errors
                set noerrorbells
                set novisualbell
                set t_vb=
                set tm=500

                " Properly disable sound on errors on MacVim
                if has("gui_macvim")
                        autocmd GUIEnter * set vb t_vb=
                        endif

                        " Add a bit extra margin to the left
                        set foldcolumn=1


                        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                        " => Colors and Fonts
                        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                        " Enable syntax highlighting
                        syntax enable

                        " Enable 256 colors palette in Gnome Terminal
                        if $COLORTERM == 'gnome-terminal'
                                set t_Co=256
                                endif

                                try
                                    colorscheme koehler
                                    catch
                                    endtry
                                    if has("gui_running")
                                                    set t_Co=256
                                                        set guitablabel=%M\ %t
                                                        endif

                                                        " Set utf8 as standard encoding and en_US as the standard language
                                                        set encoding=utf8

                                                        " Use Unix as the standard file type
                                                        set ffs=unix,dos,mac

                                                        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                        " => Files, backups and undo
                                                        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                        " Turn backup off, since most stuff is in SVN, git etc. anyway...
                                                        set nobackup
                                                        set nowb
                                                        set noswapfile


                                                        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                        " => Text, tab and indent related
                                                        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                        " Use spaces instead of tabs
                                                        set expandtab

                                                        " Be smart when using tabs ;)
                                                        set smarttab

                                                        " 1 tab == 4 spaces
                                                        set shiftwidth=4
                                                        set tabstop=4

                                                        " Linebreak on 500 characters
                                                        set lbr
                                                        set tw=500

                                                        set ai "Auto indent
                                                        set si "Smart indent
                                                        set wrap "Wrap lines


                                                        """"""""""""""""""""""""""""""
                                                        " => Visual mode related
                                                        """"""""""""""""""""""""""""""
                                                        " Visual mode pressing * or # searches for the current selection
                                                        " Super useful! From an idea by Michael Naumann
                                                        vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
                                                        vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


                                                        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                        " => Moving around, tabs, windows and buffers
                                                        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                        " Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
                                                        map <space> /
                                                        map <C-space> ?

                                                        " Disable highlight when <leader><cr> is pressed
                                                        map <silent> <leader><cr> :noh<cr>

                                                        " Smart way to move between windows
                                                        map <C-j> <C-W>j
                                                        map <C-k> <C-W>k
                                                        map <C-h> <C-W>h
                                                        map <C-l> <C-W>l

                                                        " Close the current buffer
                                                        map <leader>bd :Bclose<cr>:tabclose<cr>gT

                                                        " Close all the buffers
                                                        map <leader>ba :bufdo bd<cr>

                                                        map <leader>l :bnext<cr>
                                                        map <leader>h :bprevious<cr>

                                                        " Useful mappings for managing tabs
                                                        map <leader>tn :tabnew<cr>
                                                        map <leader>to :tabonly<cr>
                                                        map <leader>tc :tabclose<cr>
                                                        map <leader>tm :tabmove
                                                        map <leader>t<leader> :tabnext

                                                        " Let 'tl' toggle between this and the last accessed tab
                                                        let g:lasttab = 1
                                                        nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
                                                        au TabLeave * let g:lasttab = tabpagenr()


                                                        " Opens a new tab with the current buffer's path
                                                        " Super useful when editing files in the same directory
                                                        map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

                                                        " Switch CWD to the directory of the open buffer
                                                        map <leader>cd :cd %:p:h<cr>:pwd<cr>

                                                        " Specify the behavior when switching between buffers
                                                        try
                                                          set switchbuf=useopen,usetab,newtab
                                                            set stal=2
                                                            catch
                                                            endtry

                                                            " Return to last edit position when opening files (You want this!)
                                                            au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


                                                            """"""""""""""""""""""""""""""
                                                            " => Status line
                                                            """"""""""""""""""""""""""""""
                                                            " Always show the status line
                                                            set laststatus=2

                                                            " Format the status line
                                                            set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


                                                            """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                            " => Editing mappings
                                                            """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                            " Remap VIM 0 to first non-blank character
                                                            map 0 ^

                                                            " Move a line of text using ALT+[jk] or Command+[jk] on mac
                                                            nmap <M-j> mz:m+<cr>`z
                                                            nmap <M-k> mz:m-2<cr>`z
                                                            vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
                                                            vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

                                                            if has("mac") || has("macunix")
                                                                  nmap <D-j> <M-j>
                                                                    nmap <D-k> <M-k>
                                                                      vmap <D-j> <M-j>
                                                                        vmap <D-k> <M-k>
                                                                        endif

                                                                        " Delete trailing white space on save, useful for some filetypes ;)
                                                                        fun! CleanExtraSpaces()
                                                                            let save_cursor = getpos(".")
                                                                                let old_query = getreg('/')
                                                                                    silent! %s/\s\+$//e
                                                                                        call setpos('.', save_cursor)
                                                                                            call setreg('/', old_query)
                                                                                            endfun

                                                                                            if has("autocmd")
                                                                                                    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
                                                                                                    endif


                                                                                                    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                                                                    " => Spell checking
                                                                                                    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                                                                    " Pressing ,ss will toggle and untoggle spell checking
                                                                                                    map <leader>ss :setlocal spell!<cr>

                                                                                                    " Shortcuts using <leader>
                                                                                                    map <leader>sn ]s
                                                                                                    map <leader>sp [s
                                                                                                    map <leader>sa zg
                                                                                                    map <leader>s? z=


                                                                                                    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                                                                    " => Misc
                                                                                                    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                                                                    " Remove the Windows ^M - when the encodings gets messed up
                                                                                                    noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

                                                                                                    " Quickly open a buffer for scribble
                                                                                                    map <leader>q :e ~/buffer<cr>

                                                                                                    " Quickly open a markdown buffer for scribble
                                                                                                    map <leader>x :e ~/buffer.md<cr>

                                                                                                    " Toggle paste mode on and off
                                                                                                    map <leader>pp :setlocal paste!<cr>


                                                                                                    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                                                                    " => Helper functions
                                                                                                    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                                                                    " Returns true if paste mode is enabled
                                                                                                    function! HasPaste()
                                                                                                        if &paste
                                                                                                                    return 'PASTE MODE  '
                                                                                                                        endif
                                                                                                                            return ''
                                                                                                                            endfunction

                                                                                                                            " Don't close window, when deleting a buffer
                                                                                                                            command! Bclose call <SID>BufcloseCloseIt()
                                                                                                                            function! <SID>BufcloseCloseIt()
                                                                                                                                let l:currentBufNum = bufnr("%")
                                                                                                                                    let l:alternateBufNum = bufnr("#")

                                                                                                                                        if buflisted(l:alternateBufNum)
                                                                                                                                                    buffer #
                                                                                                                                                        else
                                                                                                                                                                    bnext
                                                                                                                                                                        endif

                                                                                                                                                                            if bufnr("%") == l:currentBufNum
                                                                                                                                                                                        new
                                                                                                                                                                                            endif

                                                                                                                                                                                                if buflisted(l:currentBufNum)
                                                                                                                                                                                                            execute("bdelete! ".l:currentBufNum)
                                                                                                                                                                                                                endif
                                                                                                                                                                                                                endfunction

                                                                                                                                                                                                                function! CmdLine(str)
                                                                                                                                                                                                                    call feedkeys(":" . a:str)
                                                                                                                                                                                                                    endfunction

                                                                                                                                                                                                                    function! VisualSelection(direction, extra_filter) range
                                                                                                                                                                                                                        let l:saved_reg = @"
                                                                                                                                                                                                                            execute "normal! vgvy"

                                                                                                                                                                                                                                let l:pattern = escape(@", "\\/.*'$^~[]")
                                                                                                                                                                                                                                    let l:pattern = substitute(l:pattern, "\n$", "", "")

                                                                                                                                                                                                                                        if a:direction == 'gv'
                                                                                                                                                                                                                                                    call CmdLine("Ack '" . l:pattern . "' " )
                                                                                                                                                                                                                                                        elseif a:direction == 'replace'
                                                                                                                                                                                                                                                                call CmdLine("%s" . '/'. l:pattern . '/')
                                                                                                                                                                                                                                                                    endif

                                                                                                                                                                                                                                                                        let @/ = l:pattern
                                                                                                                                                                                                                                                                            let @" = l:saved_reg
                                                                                                                                                                                                                                                                            endfunction
"       Amir Salihefendic Î

" plugins starting....
"       This requires that you install https://github.com/amix/vimrc !
"       "
"       """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" => Load pathogen paths
" """"""""""""""""""""""""""""""
" let s:vim_runtime = expand('<sfile>:p:h')."/.."
" call pathogen#infect(s:vim_runtime.'/sources_forked/{}')
" call pathogen#infect(s:vim_runtime.'/sources_non_forked/{}')
" call pathogen#infect(s:vim_runtime.'/my_plugins/{}')
" call pathogen#helptags()
"
"
" """"""""""""""""""""""""""""""
" " => bufExplorer plugin
" """"""""""""""""""""""""""""""
" let g:bufExplorerDefaultHelp=0
" let g:bufExplorerShowRelativePath=1
" let g:bufExplorerFindActive=1
" let g:bufExplorerSortBy='name'
" map <leader>o :BufExplorer<cr>
"
"
" """"""""""""""""""""""""""""""
" " => MRU plugin
" """"""""""""""""""""""""""""""
" let MRU_Max_Entries = 400
" map <leader>f :MRU<CR>
"
"
" """"""""""""""""""""""""""""""
" " => YankStack
" """"""""""""""""""""""""""""""
" let g:yankstack_yank_keys = ['y', 'd']
"
" nmap <C-p> <Plug>yankstack_substitute_older_paste
" nmap <C-n> <Plug>yankstack_substitute_newer_paste
"
"
" """"""""""""""""""""""""""""""
" " => CTRL-P
" """"""""""""""""""""""""""""""
" let g:ctrlp_working_path_mode = 0
"
" " Quickly find and open a file in the current working directory
" let g:ctrlp_map = '<C-f>'
" map <leader>j :CtrlP<cr>
"
" " Quickly find and open a buffer
" map <leader>b :CtrlPBuffer<cr>
"
" let g:ctrlp_max_height = 20
" let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'
"
"
" """"""""""""""""""""""""""""""
" " => ZenCoding
" """"""""""""""""""""""""""""""
" " Enable all functions in all modes
" let g:user_zen_mode='a'
"
"
" """"""""""""""""""""""""""""""
" " => snipMate (beside <TAB> support <CTRL-j>)
" """"""""""""""""""""""""""""""
" ino <C-j> <C-r>=snipMate#TriggerSnippet()<cr>
" snor <C-j> <esc>i<right><C-r>=snipMate#TriggerSnippet()<cr>
" let g:snipMate = { 'snippet_version' : 1 }
"
"
" """"""""""""""""""""""""""""""
" " => Vim grep
" """"""""""""""""""""""""""""""
" let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
" set grepprg=/bin/grep\ -nH
"
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Nerd Tree
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:NERDTreeWinPos = "right"
" let NERDTreeShowHidden=0
" let NERDTreeIgnore = ['\.pyc$', '__pycache__']
" let g:NERDTreeWinSize=35
" map <leader>nn :NERDTreeToggle<cr>
" map <leader>nb :NERDTreeFromBookmark<Space>
" map <leader>nf :NERDTreeFind<cr>
"
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => vim-multiple-cursors
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:multi_cursor_use_default_mapping=0
"
" " Default mapping
" let g:multi_cursor_start_word_key      = '<C-s>'
" let g:multi_cursor_select_all_word_key = '<A-s>'
" let g:multi_cursor_start_key           = 'g<C-s>'
" let g:multi_cursor_select_all_key      = 'g<A-s>'
" let g:multi_cursor_next_key            = '<C-s>'
" let g:multi_cursor_prev_key            = '<C-p>'
" let g:multi_cursor_skip_key            = '<C-x>'
" let g:multi_cursor_quit_key            = '<Esc>'
"
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => surround.vim config
" " Annotate strings with gettext 
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vmap Si S(i_<esc>f)
" au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>
"
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => lightline
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"             \ 'active': {
"                   \   'left': [ ['mode', 'paste'],
"                         \             ['fugitive', 'readonly', 'filename', 'modified'] ],
"                               \   'right': [ [ 'lineinfo' ], ['percent'] ]
"                                     \ },
"                                           \ 'component': {
"                                                 \   'readonly': '%{&filetype=="help"?"":&readonly?"ÎõÎõ":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*FugitiveHead")?FugitiveHead():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimroom
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:goyo_width=100
" let g:goyo_margin_top = 2
" let g:goyo_margin_bottom = 2
" nnoremap <silent> <leader>z :Goyo<cr>
"
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Ale (syntax checker and linter)
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:ale_linters = {
" \   'javascript': ['eslint'],
" \   'python': ['flake8'],
" \   'go': ['go', 'golint', 'errcheck']
" \}
"
" nmap <silent> <leader>a <Plug>(ale_next_wrap)
"
" " Disabling highlighting
" let g:ale_set_highlights = 0
"
" " Only run linting when saving the file
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_enter = 0
"
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Git gutter (Git diff)
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:gitgutter_enabled=0
" nnoremap <silent> <leader>d :GitGutterToggle<cr>
"
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => EditorConfig (project-specific EditorConfig rule)
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:EditorConfig_exclude_patterns = ['fugitive://.*']
"
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Fugitive
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Copy the link to the line of a Git repository to the clipboard
" nnoremap <leader>v :.GBrowse!<CR>
" xnoremap <leader>v :'<'>GBrowse!<CR>
