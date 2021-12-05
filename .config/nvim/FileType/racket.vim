command! BufOnly execute '%bdelete!|edit #|normal `"'
command! BufTerm execute "new! term://start-racket.sh '%'"
nnoremap <C-a> :w<CR>:BufOnly<CR>:BufTerm<CR>
inoremap " ""<++><left><left><left><left><left>
inoremap ( ()<++><left><left><left><left><left>

inoremap <silent> <BS> <C-r>=BetterBS()<CR>

let g:couples = ["(#)<++>", '"#"<++>']
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
