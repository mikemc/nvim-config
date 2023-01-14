" use R settings for Rmd files
if exists('b:did_ftplugin') | finish | endif

runtime! ftplugin/r.vim

" Override R options
setlocal formatoptions-=r
setlocal formatoptions-=o
setlocal formatoptions-=t

" Format one sentence per line
" https://vi.stackexchange.com/a/2848/18978
" function! MyFormatExpr(start, end)
"     silent execute a:start.','.a:end.'s/[.!?]\zs /\r/g'
" endfunction
" set formatexpr=MyFormatExpr(v:lnum,v:lnum+v:count-1)


" https://www.reddit.com/r/vim/comments/82sqoc/any_caveats_to_binding_j_and_k_to_gj_and_gk/
" nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
" nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'
" nnoremap <X-k> gk
" nnoremap <X-j> gj
nnoremap k gk
nnoremap j gj
nnoremap 0 g0
nnoremap $ g$
vnoremap k gk
vnoremap j gj
vnoremap 0 g0
vnoremap $ g$

" Bookdown rendering
" map <silent> <LocalLeader>kbb :call g:SendCmdToR("bookdown::render_book('.')")<CR>
" map <silent> <LocalLeader>kb :call g:SendCmdToR("bookdown::preview_chapter(%:p)")<CR>
"

" Formatting

" Command to enforce newlines around code blocks.
" The first substitution will insert a new line before a code block if needed.
" It works by matching the last letter and newline char (first group) followed
" by a line that starts with "```{r" (second group), and inserting a newline
" char in between these two patterns. The second substitution will insert a
" new line after code blocks if needed.
" command RmdAddNewlines %s:\(.\n\)\(```{r\):\1\r\2:e | %s:^\(```\n\)\(.\):\1\r\2:e
" set formatexpr=MyFormatExpr(v:lnum,v:lnum+v:count-1)
