" captains-log.vim - Your own personal log
" Maintainer:   Timothy Crain

if exists("g:loaded_captains_log") || &cp
    finish
endif
let g:loaded_captains_log = 1

function! s:captains_log_enable()
    inoremap <buffer> <CR> <C-O>:call captains_log#add_timestamp()<CR>
endfunction

function! s:captains_log_disable()
    iunmap <buffer> <CR>
endfunction

command! -nargs=0 CaptainsLogEnable call s:captains_log_enable()
command! -nargs=0 CaptainsLogDisable call s:captains_log_disable()
