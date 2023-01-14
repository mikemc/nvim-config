setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal formatoptions+=ro

iabbrev <buffer> .. %>%

" Press the space bar to send lines and selection to R:
" vmap <Space> <Plug>RDSendSelection
" nmap <Space> <Plug>RDSendLine
" TODO: set so doesn't go to the next line in visual model
vmap <CR> <Plug>RDSendSelection
nmap <CR> <Plug>RDSendLine
" Shortcuts to mimic Rstudio behavior for package development. Using
" LocalLeader instead of Ctrl, but may want to switch to ctrl to keep more LL
" options.
" nmap <LocalLeader>L RAction("devtools::load_all()")<CR>
" imap <LocalLeader>L RAction("devtools::load_all()")<CR>
" vmap <LocalLeader>L RAction("devtools::load_all()")<CR>
" Todo: modify to run a 'wa' in vim first
" Reload package
map <silent> <LocalLeader>L :call g:SendCmdToR("devtools::load_all()")<CR>
" Compile documentation
map <silent> <LocalLeader>D :call g:SendCmdToR("devtools::document()")<CR>
" Run all tests
map <silent> <LocalLeader>T :call g:SendCmdToR("devtools::test()")<CR>
" Check package
map <silent> <LocalLeader>E :call g:SendCmdToR("devtools::check()")<CR>

" Apply dplyr::glimpse to the object under the cursor
nmap <silent> <LocalLeader>ri :call RAction("dplyr::glimpse")<CR>
vmap <silent> <LocalLeader>ri :call RAction("dplyr::glimpse", "v")<CR>
" Apply useful::corner to the object under the cursor
nmap <silent> <LocalLeader>uc :call RAction("useful::corner")<CR>
vmap <silent> <LocalLeader>uc :call RAction("useful::corner", "v")<CR>
