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
Plug 'rakr/vim-one'
" Icons
Plug 'ryanoasis/vim-devicons'
" Syntax highlighting
Plug 'ap/vim-css-color'
Plug 'sheerun/vim-polyglot'
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
set mouse=a
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
