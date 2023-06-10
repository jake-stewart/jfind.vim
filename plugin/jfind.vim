let s:PLUGIN_DIR = substitute(expand('<sfile>:h:h'), "'", "'\"'\"'", "g")
let s:SCRIPTS_DIR = s:PLUGIN_DIR . "/scripts"
let s:TMUX_POPUP_SCRIPT = "'" . s:SCRIPTS_DIR . "/tmux-popup.sh'"
let s:JFIND_SCRIPT = "'" . s:SCRIPTS_DIR . "/jfind.sh'"

let s:JFIND_GITHUB_URL = "https://github.com/jake-stewart/jfind"
let s:CACHE = getenv("XDG_CACHE_HOME")
if s:CACHE == "" || s:CACHE == v:null
    let s:CACHE = getenv("HOME") + "/.cache"
endif
let s:JFIND_OUT_PATH = s:CACHE . "/jfind_out"
let s:JFIND_EXCLUDES_PATH = s:CACHE . "/jfind_excludes"

if !exists("g:jfind_config")
    let g:jfind_config = {"exclude": ["*.py"]}
endif

call writefile(get(g:jfind_config, "exclude", []), s:JFIND_EXCLUDES_PATH)

exe "nnoremap <silent>" . get(g:jfind_config, "key", "<c-f>")
            \ . " :silent! call Jfind()<CR>"

function Jfind()
    if vim.fn.executable("jfind") == 0 then
        echoerr "jfind is not installed. " . s:JFIND_GITHUB_URL
        return
    end

    if get(g:jfind_config, "formatPaths", v:false)
        let l:formatPaths = "true"
    else
        let l:formatPaths = "false"
    endif

    if get(g:jfind_config, "tmux", v:false)
        call system(s:TMUX_POPUP_SCRIPT . " 120 28 "
                    \ . s:JFIND_SCRIPT . " " . l:formatPaths)
        if v:shell_error != 0
            return
        endif
    else
        exe "silent !" . s:JFIND_SCRIPT . " " . l:formatPaths
    endif

    let l:contents = readfile(s:JFIND_OUT_PATH)
    exe 'edit ' . l:contents[0]

    redraw!
endfunction
