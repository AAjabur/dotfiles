local set = vim.opt

-- Uses RipGrep as grep
vim.o.grepprg = "rg --vimgrep"

set.number = true -- line number
set.relativenumber = true
set.tabstop = 4
set.shiftwidth = 4
set.scrolloff = 8 -- Keep minimum x number of screen lines above and below the cursor
set.swapfile = false
set.hlsearch = true -- Highlight search results
set.incsearch = true -- As you type, match the currently typed word w/o pressing enter
set.smartcase = true -- If you use upper case, it will match uppercase, not match oterwise
set.wrap = false
set.listchars='tab:🡢\\ ,trail:·,extends:>,precedes:<,space:·'
set.list = true
set.expandtab = true
