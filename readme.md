i have never really understand how `<c-w>x` works, this is how i think it should be.

## features/limits
* winnr should be in `1-9`
* no fancy at all, no `tmux display-panes`

## prerequisites
* haolian9/infra.nvim
* tui nvim, it will not work in a gui frontend


## usage
* do notice the difference between winnr and winid
* `:lua require'winswap'.with(winnr)` # swap buffers of the given winnr and the current winnr
* `vim.keymap.set('n', "<c-w>x", function() require("winswap").interact() end)` then press 1-9.
