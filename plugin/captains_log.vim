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
    if s:in_block()
        return s:block_add_timestamp()
    endif

    let now = strftime(g:captains_log_date_format)
    if getline(".") =~ "^\\s*$"
        return "\<CR>"
    else
        return "\<Home>\<C-R>=\"" . now . "\"\<CR>\<Space>\<End>\<CR>"
    endif
endfunction

function! s:block_add_timestamp()
    let current_line = line(".")
    let timestamp_line = b:block_start
    unlet b:block_start
    let now = strftime(g:captains_log_date_format)
    return "\<C-O>" . timestamp_line . "G\<Home>\<C-R>=\"" . now . "\"\<CR>\<Space>\<C-O>" . current_line . "G\<End>\<CR>"
endfunction

function! s:begin_block()
    if !exists("b:block_start")
        let b:block_start = line(".")
    endif
    return "\<CR>"
endfunction

function! s:in_block()
    return exists("b:block_start")
endfunction

function! s:toggle()
    if !exists("b:captains_log_enabled") || b:captains_log_enabled
        inoremap <buffer> <expr> <F2> <SID>begin_block()
        inoremap <buffer> <expr> <CR> <SID>add_timestamp()
        let b:captains_log_enabled = 0
    else
        iunmap <buffer> <F2>
        iunmap <buffer> <CR>
        let b:captains_log_enabled = 1
    endif
endfunction

command! -nargs=0 CaptainsLogToggle call s:toggle()
