setlocal formatoptions+=c formatoptions+=r formatoptions+=o

nmap <C-e> :e! <CR>
nmap <C-p> :LLPStartPreview <CR>
setl updatetime=1
nnoremap ;b o\begin{<replace>}<CR>\end{<replace>}<Esc>Vk:s/<replace>//<Left>
vnoremap a$ c$<C-r>"$<Esc>
vnoremap a" c``<C-r>"''<Esc>
vnoremap ai c\textit{<C-r>"}<Esc>
vnoremap ab c\textbf{<C-r>"}<Esc>
vnoremap t :Tabularize /&<CR>

inoremap { {}<++><left><left><left><left><left>
inoremap [ []<++><left><left><left><left><left>

inoremap <silent> <BS> <C-r>=BetterBS()<CR>

let g:couples = ["{#}<++>", '[#]<++>']
function BetterBS()

    for l:couple in g:couples
        if ! (l:couple =~ '#')
            continue
        endif
        let l:regex = substitute(escape(l:couple, '/\^$*.[~'), '#', '\\%#', '')
        if search(l:regex, 'n')
            let l:out = repeat("\<BS>", len(matchstr(l:couple, '^.\{-}\ze#')))
            let l:out .= repeat("\<DEL>", len(matchstr(l:couple, '#\zs.\{-}$')))
            return l:out
        endif
    endfor

    return "\<BS>"
endfunction
