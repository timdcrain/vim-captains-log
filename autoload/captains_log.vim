" captains-log.vim - Your own personal log

if exists("g:loaded_captains_log_auto") || &cp
    finish
endif
let g:loaded_captains_log_auto = 1

if !exists("g:captains_log_date_format")
    let g:captains_log_date_format = "%FT%T%z"
endif

function! captains_log#add_timestamp()
    if !s:line_is_empty()
        if s:in_block()
            call s:block_add_timestamp()
        else
            let prefix = strftime(g:captains_log_date_format) . " "
            call s:prepend(".", prefix)
        endif
    endif

    call s:newline()
endfunction

function! captains_log#begin_block()
    if !exists("b:block_start") && !s:line_is_empty()
        let b:block_start = line(".")
    endif
    call s:newline()
endfunction

function! s:block_add_timestamp()
    let current_line = line(".")
    let prefix = strftime(g:captains_log_date_format) . " "
    call s:prepend(b:block_start, prefix)

    let spaces = repeat(' ', strwidth(prefix))
    let lnum = b:block_start + 1
    while lnum <= current_line
        call s:prepend(lnum, spaces)
        let lnum = lnum + 1
    endwhile

    unlet b:block_start
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
