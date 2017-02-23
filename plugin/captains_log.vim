" captains-log.vim - Your own personal log
" Maintainer:   Timothy Crain
" Version:      0.1.0

if exists("g:loaded_captains_log") || &cp
    finish
endif
let g:loaded_captains_log = 1

if !exists("g:captains_log_date_format")
    let g:captains_log_date_format = "%FT%T%z"
endif

function! s:add_timestamp()
    if !s:line_is_empty()
        if s:in_block()
            call s:block_add_timestamp()
        else
            let now = strftime(g:captains_log_date_format) . " "
            call s:prepend(".", now)
        endif
    endif

    call s:newline()
endfunction

function! s:block_add_timestamp()
    let current_line = line(".")
    let now = strftime(g:captains_log_date_format) . " "
    call s:prepend(b:block_start, now)

    let spaces = substitute(now, ".", " ", "g")
    let lnum = b:block_start + 1
    while lnum <= current_line
        call s:prepend(lnum, spaces)
        let lnum = lnum + 1
    endwhile

    unlet b:block_start
endfunction

function! s:begin_block()
    if !exists("b:block_start") && !s:line_is_empty()
        let b:block_start = line(".")
    endif
    call s:newline()
endfunction

function! s:in_block()
    return exists("b:block_start")
endfunction

function! s:prepend(lnum, text)
    call setline(a:lnum, a:text . getline(a:lnum))
endfunction

function! s:newline()
    let current_line = line(".")
    call append(current_line, "")
    call cursor(current_line + 1, 1)
endfunction

function! s:line_is_empty()
    return getline(".") =~ "^\\s*$"
endfunction

function! s:captains_log_enable()
    inoremap <buffer> <F2> <C-O>:call <SID>begin_block()<CR>
    inoremap <buffer> <CR> <C-O>:call <SID>add_timestamp()<CR>
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
