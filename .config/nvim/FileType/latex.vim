setlocal formatoptions+=c formatoptions+=r formatoptions+=o

nmap <C-e> :e! <CR>
nmap <C-a> :w! <CR>:!latex="%" && pdflatex -output-directory ${latex\%/*} % <CR>
nmap <C-p> :LLPStartPreview <CR>
setl updatetime=1
nnoremap ;b o\begin{<replace>}<CR>\end{<replace>}<Esc>Vk:s/<replace>//<Left>
vnoremap a$ c$<C-r>"$<Esc>
vnoremap a" c``<C-r>"''<Esc>
vnoremap ai c\textit{<C-r>"}<Esc>
vnoremap ab c\textbf{<C-r>"}<Esc>

