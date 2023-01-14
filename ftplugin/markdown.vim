" Use visual line navigation
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

" Folding with treesitter; https://github.com/nvim-treesitter/nvim-treesitter#folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable                     " Disable folding at startup.
