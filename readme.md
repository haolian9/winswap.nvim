i have never really understood how `<c-w>x` works, this is what i think it should be.

## features/limits
* winnr should be in `1-9`
* no fancy at all, no `tmux display-panes`

## prerequisites
* haolian9/infra.nvim
* tui nvim, it will not work in a gui frontend


## usage
* do notice the difference between winnr and winid
* `:lua require'winswap'(winnr)` # swap buffers of the given winnr and the current winnr
* `vim.keymap.set('n', "<c-w>x", function() require("winswap")() end)` then press 1-9.
