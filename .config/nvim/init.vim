"""""""""""""""""""""""""""""""""""""""" 
"		PLUGINS		       "
""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
" interactive terminal
Plug 'gingerhot/conque-term-vim'

" Autocomplete
Plug 'ycm-core/YouCompleteMe'
"
" Themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Rigellute/rigel'
Plug 'rakr/vim-one'

" Icons
Plug 'ryanoasis/vim-devicons'

" Syntax highlighting
Plug 'ap/vim-css-color'
Plug 'sheerun/vim-polyglot'

" Latex
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'godlygeek/tabular'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Initialize plugin system
call plug#end()


""""""""""""""""""""""""""""""""""""""""
"	    BASIC SETTING	       "
""""""""""""""""""""""""""""""""""""""""
set showmatch
autocmd VimEnter * DoMatchParen
scriptencoding utf-8 
set encoding=utf-8
set spell spelllang=nl,en
set number relativenumber
set splitbelow
set ignorecase
set smartcase
set noswapfile
set nohlsearch
set autoread
set mouse=a
set t_Co=256
" Use system clipboard
set clipboard=unnamedplus
" Colorscheme
set termguicolors
"let g:codedark_conservative = 1
colorscheme one
""""""""""""""""""""""""""""""""""""""""
"	    FOLD SETTING	       "
""""""""""""""""""""""""""""""""""""""""
set foldmethod=marker   
autocmd FileType sh set foldmarker=\ ()\ {,}\ #
autocmd FileType racket set foldmarker=;;,);
autocmd BufNewFile,BufRead *.tex set foldmarker=%begin%,%end%
set foldnestmax=1
"set nofoldenable
set foldlevel=0
""""""""""""""""""""""""""""""""""""""""
"	    MAP CHARACTER	       "
""""""""""""""""""""""""""""""""""""""""
nnoremap <C-q> :q <CR> 
tnoremap <Esc> <C-\><C-n><C-w>k
tnoremap <C-q> <C-\><C-n>:q <CR>
nnoremap gl $
nnoremap gh ^
nnoremap gk H
nnoremap gj L
nnoremap M a<??><Esc>
nnoremap m a<++><Esc>
nnoremap <C-Space> ebb/<++><Enter>"_c4l
nnoremap <Space><Space> /<??><Enter>"_c4l
inoremap <C-Space> <Esc>ebb/<++><Enter>"_c4l
nnoremap <C-d> :,s/ *<++> *//g<CR>
inoremap <C-d> <Esc>:,s/ *<++> *//g<CR>
nnoremap <C-s> :%s//gI<Left><Left><Left>
" Shortcutting split navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
""""""""""""""""""""""""""""""""""""""""
"	        TERMINAL MODE		       "
""""""""""""""""""""""""""""""""""""""""
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

""""""""""""""""""""""""""""""""""""""""
"	        AUTOCOMPLETE		       "
""""""""""""""""""""""""""""""""""""""""
let g:ycm_auto_trigger = 1
let g:ycm_filetype_whitelist = {'*': 1, 'ycm_nofiletype': 1}
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
" don't select the first item
set completeopt=menu,menuone,noselect
set completeopt-=preview
" supress annoy messages.
set shortmess+=c

""""""""""""""""""""""""""""""""""""""""
"	        TAGS		       "
""""""""""""""""""""""""""""""""""""""""
set tags+=~/.config/nvim/tags/racket.tag

""""""""""""""""""""""""""""""""""""""""
"	        AIRLINE		       "
""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline_theme = 'minimalist'

""""""""""""""""""""""""""""""""""""""""
"	   SPECIFIC CONFIGS 	       "
""""""""""""""""""""""""""""""""""""""""
au FileType tex source ~/.config/nvim/FileType/latex.vim
au FileType tex setlocal comments=b:$>$\\hspace{0.3cm}
let g:livepreview_previewer = 'zathura'
let g:livepreview_cursorhold_recompile = 0

autocmd BufNewFile,BufRead *.todo source ~/.config/nvim/FileType/todo.vim

au FileType racket source ~/.config/nvim/FileType/racket.vim

au FileType c source ~/.config/nvim/FileType/c.vim

""""""""""""""""""""""""""""""""""""""""
"	  MARKDOWN PREVIEWER	               "
""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.md nmap <C-p> <Plug>MarkdownPreviewToggle

let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'surf'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_markdown_css = '~/.config/nvim/plugin/markdown-preview/markdown.css'
let g:mkdp_highlight_css = '~/.config/nvim/plugin/markdown-preview/highlight/tomorrow-night-blue.css'
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}-Markdown Preview'

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false
    \ }

""""""""""""""""""""""""""""""""""""""""
"	   COLOR HIGHLIGHTER	       "
""""""""""""""""""""""""""""""""""""""""
let g:cssColorVimDoNotMessMyUpdatetime = 1

""""""""""""""""""""""""""""""""""""""""
"	    NETRW SETINGS	       "
""""""""""""""""""""""""""""""""""""""""
  " Netrw
  let g:netrw_banner = 0
  let g:netrw_liststyle = 3
  let g:netrw_browse_split = 4
  let g:netrw_winsize = 20

  function! OpenToRight()
    :normal v
    let g:path=expand('%:p')
    :q!
    execute 'belowright vnew' g:path
    :normal <C-w>l
  endfunction

  function! OpenBelow()
    :normal v
    let g:path=expand('%:p')
    :q!
    execute 'belowright new' g:path
    :normal <C-w>l
  endfunction


  function! NetrwMappings()
      " Hack fix to make ctrl-l work properly
      noremap <buffer> o <Enter>
      noremap <buffer> <A-l> <C-w>l
      noremap <buffer> <C-l> <C-w>l
      noremap <silent> <C-f> :call ToggleNetrw()<CR>
      noremap <buffer> V :call OpenToRight()<cr>
      noremap <buffer> H :call OpenBelow()<cr>
  endfunction

  augroup netrw_mappings
      autocmd!
      autocmd filetype netrw call NetrwMappings()
  augroup END

  " Allow for netrw to be toggled
  function! ToggleNetrw()
      if g:NetrwIsOpen
          let i = bufnr("$")
          while (i >= 1)
              if (getbufvar(i, "&filetype") == "netrw")
                  silent exe "bwipeout " . i
              endif
              let i-=1
          endwhile
          let g:NetrwIsOpen=0
      else
          let g:NetrwIsOpen=1
          silent Vex %:p:h
      endif
  endfunction

  " Check before opening buffer on any file
  function! NetrwOnBufferOpen()
    if exists('b:noNetrw')
        return
    endif
    call ToggleNetrw()
    call ToggleNetrw()
  endfun

  " Close Netrw if it's the only buffer open
  autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif

  " Make netrw act like a project Draw
  augroup ProjectDrawer
    autocmd!
		" Don't open Netrw
    autocmd VimEnter ~/.config/joplin/tmp/*,/tmp/calcurse*,~/.calcurse/notes/*,~/vimwiki/*,*/.git/COMMIT_EDITMSG let b:noNetrw=1
    autocmd VimEnter * :call NetrwOnBufferOpen()
  augroup END

  let g:NetrwIsOpen=0
