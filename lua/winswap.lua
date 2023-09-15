local ctx = require("infra.ctx")
local jelly = require("infra.jellyfish")("winmove", "debug")
local tty = require("infra.tty")

local api = vim.api

local M = {}

function M.with(winnr)
  local src_winid = api.nvim_get_current_win()
  local dest_winid = vim.fn.win_getid(winnr)
  if dest_winid == 0 then return jelly.warn("no such win by nr#%d", winnr) end
  if src_winid == dest_winid then return jelly.info("same win") end

  local src_bufnr = api.nvim_win_get_buf(src_winid)
  local dest_bufnr = api.nvim_win_get_buf(dest_winid)

  ctx.noautocmd(function()
    api.nvim_win_set_buf(src_winid, dest_bufnr)
    api.nvim_win_set_buf(dest_winid, src_bufnr)
  end)
end

function M.interact()
  local _, code = tty.read_raw()

  --only 1-9
  if not (code >= 49 and code <= 57) then return end

  return M.with(string.char(code))
end

return M
