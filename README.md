jfind.vim
---------

This is a quick and dirty solution for getting jfind working in regular vim.

If you use neovim, then use the [jfind.nvim](https://github.com/jake-stewart/jfind.nvim) plugin instead.

If you don't use neovim, probably use [fzf.vim](https://github.com/junegunn/fzf.vim).

I will not be adding new features to this plugin since I do not use regular vim. I will only fix bugs.

### Dependencies
 - [jfind](https://github.com/jake-stewart/jfind) (Required)
 - [fdfind](https://github.com/sharkdp/fd) (Recommended as a faster alternative to `find`)

Usage
-----

Put the following config in your vimrc:

```vim
let g:jfind_config = {
    \ "tmux": v:false,       " try to open jfind in a tmux popup
    \ "key": "<c-f>",        " keybinding for opening jfind window
    \ "formatPaths" v:true,  " format paths for easier searching
    \ "exclude": [           " exclude list. supports wildcards
    \       ".git",
    \       ".idea",
    \       ".vscode",
    \       ".sass-cache",
    \       ".class",
    \       "__pycache__",
    \       "node_modules",
    \       "target",
    \       "build",
    \       "tmp",
    \       "assets",
    \       "dist",
    \       "public",
    \       "*.iml",
    \       "*.meta"
    \ ]
\ }
```
