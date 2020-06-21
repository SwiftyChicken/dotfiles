""""""""""""""""""""""""""""""""""""""""
"		PLUGINS		       "
""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
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
" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Initialize plugin system
call plug#end()


""""""""""""""""""""""""""""""""""""""""
"	    BASIC SETTING	       "
""""""""""""""""""""""""""""""""""""""""
scriptencoding utf-8 
set encoding=utf-8
set number relativenumber
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
"	    MAP CHARACTER	       "
""""""""""""""""""""""""""""""""""""""""
nnoremap <C-q> :q <CR>
nnoremap gl $
nnoremap gh 0
nnoremap gk H
nnoremap gj L
nnoremap <C-s> :%s//gI<Left><Left><Left>
" Shortcutting split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

""""""""""""""""""""""""""""""""""""""""
"	        AIRLINE		       "
""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline_theme = 'minimalist'

""""""""""""""""""""""""""""""""""""""""
"	  MARKDOWN PREVIEWER	       "
""""""""""""""""""""""""""""""""""""""""
let g:mkdp_auto_start = 1
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
