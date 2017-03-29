" captains-log.vim - Your own personal log

if exists("g:loaded_captains_log") || &cp
    finish
endif
let g:loaded_captains_log = 1

inoremap <silent> <Plug>(CaptainslogRecord) <C-O>:call captains_log#add_timestamp()<CR>

function! s:captains_log_enable()
    imap <buffer> <CR> <Plug>(CaptainslogRecord)
endfunction

function! s:captains_log_disable()
    iunmap <buffer> <CR>
endfunction

command! -nargs=0 CaptainsLogEnable call s:captains_log_enable()
command! -nargs=0 CaptainsLogDisable call s:captains_log_disable()
