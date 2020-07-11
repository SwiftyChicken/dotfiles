inoremap <Enter> <Enter>[ ] 
inoremap <Tab>l <Esc>I<Tab><Esc>A
inoremap <Tab>h <Esc>I<BackSpace><Esc>A
inoremap <Esc> <Esc>:%s/\[ \] $/[ ] <!!>/<CR>
nnoremap <Enter> V:s/\[ \]/[x]/<CR>
nnoremap <BackSpace> V:s/\[x\]/[ ]/<CR>
