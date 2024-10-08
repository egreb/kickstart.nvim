local M = {}

M.is_vault = function()
  local home = os.getenv 'HOME' or ''
  local vaults_path = home .. '/vaults'
  local cwd = vim.fn.getcwd()
  if string.find(cwd, vaults_path, 1, true) then
    return true
  else
    return false
  end
end

return M
