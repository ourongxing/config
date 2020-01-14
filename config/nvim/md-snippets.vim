autocmd Filetype markdown inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
autocmd Filetype markdown inoremap <buffer> ,s <Esc>/ <++><CR>:nohlsearch<CR>"_c5l
autocmd Filetype markdown inoremap <buffer> ,- ---<Enter><Enter>
autocmd Filetype markdown inoremap <buffer> ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap <buffer> ,x ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap <buffer> ,p ** <++><Esc>F*i
autocmd Filetype markdown inoremap <buffer> ,q `` <++><Esc>F`i
autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap <buffer> ,q - [ ] <Enter><++><ESC>kA
autocmd Filetype markdown inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,t <C-R>=strftime("%Y-%m-%d %H:%M:%S")
autocmd Filetype markdown inoremap <buffer> ,w {% web <++> <++> %}<++> 
autocmd Filetype markdown inoremap <buffer> ,d {% download <++> <++> %}<++>
