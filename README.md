jfind.vim
---------

This is a quick and dirty solution for getting jfind working in regular vim.

If you use neovim, then use the [jfind.nvim](https://github.com/jake-stewart/jfind.nvim) plugin instead.

If you don't use neovim, probably use [fzf.vim](https://github.com/junegunn/fzf.vim).

I will not be adding new features to this plugin since I do not use regular vim. I will only fix bugs.

### Dependencies
 - [jfind](https://github.com/jake-stewart/jfind) (Required)
 - [fdfind](https://github.com/sharkdp/fd) (Recommended as a faster alternative to `find`)

You can install jfind with this one liner. You will need git, cmake, and make.
```
git clone https://github.com/jake-stewart/jfind && cd jfind && cmake -S . -B build && cd build && sudo make install
```

Usage
-----

The following example uses [vim-plug](https://github.com/junegunn/vim-plug):

```vim
let g:jfind_config = {
    \ "tmux": v:true,
    \ "key": "<c-f>",
    \ "formatPaths": v:true,
    \ "exclude": [
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

call plug#begin()
Plug 'jake-stewart/jfind.vim'
call plug#end()
```

### Config options
- tmux: a boolean of whether jfind should be launched in a tmux window.
- key: a string of the key which will open jfind.
- formatPaths: a boolean of whether paths should be searched through only their file and first parent.
- exclude: a list of strings of which files/directories should be ignored. Wildcards are supported.
