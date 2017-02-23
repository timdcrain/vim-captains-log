" captains-log.vim - Your own personal log
" Maintainer:   Timothy Crain

if exists("g:loaded_captains_log") || &cp
    finish
endif
let g:loaded_captains_log = 1

function! s:captains_log_enable()
    inoremap <buffer> <F2> <C-O>:call captains_log#begin_block()<CR>
    inoremap <buffer> <CR> <C-O>:call captains_log#add_timestamp()<CR>
    let b:captains_log_enabled = 1
endfunction

function! s:captains_log_disable()
    iunmap <buffer> <F2>
    iunmap <buffer> <CR>
    let b:captains_log_enabled = 0
endfunction

function! s:toggle()
    if !exists("b:captains_log_enabled") || !b:captains_log_enabled
        call s:captains_log_enable()
    else
        call s:captains_log_disable()
    endif
endfunction

command! -nargs=0 CaptainsLogToggle call s:toggle()
command! -nargs=0 CaptainsLogEnable call s:captains_log_enable()
command! -nargs=0 CaptainsLogDisable call s:captains_log_disable()
