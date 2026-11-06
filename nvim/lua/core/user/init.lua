local M = {}

function M.setup()
  local ok_hl, hl = pcall(require, "core.user.highlights")
  if ok_hl and hl and hl.setup then
    hl.setup()
  end

  local ok_beacon, beacon = pcall(require, "core.user.beacon")
  if ok_beacon and beacon and beacon.setup then
    beacon.setup()
  end

  local ok_diag, diag = pcall(require, "core.user.diagnostics")
  if ok_diag and diag and diag.setup then
    diag.setup()
  end
end

return M
