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

function! s:addtimestamp()
    let now = strftime(g:captains_log_date_format)
    if getline(".") =~ "^\\s*$"
        return "\<CR>"
    else
        return "\<Home>\<C-R>=\"" . now . "\"\<CR>\<Space>\<End>\<CR>"
    endif
endfunction

let s:captains_log_enabled = 1
function! s:toggle()
    if s:captains_log_enabled
        inoremap <buffer> <expr> <CR> <SID>addtimestamp()
        let s:captains_log_enabled = 0
    else
        iunmap <buffer> <CR>
        let s:captains_log_enabled = 1
    endif
endfunction

command! -nargs=0 CaptainsLogToggle call s:toggle()
