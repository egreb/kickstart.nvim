return {
  Get_hls_value = function(name, option)
    if type(name) ~= 'string' or (option ~= 'fg' and option ~= 'bg') then
      error "Invalid arguments. Usage: highlight(name: string, option: 'fg' | 'bg')"
    end
    local hl = vim.api.nvim_get_hl(0, { name = name })
    local color = hl[option]
    if not color then
      print('No ' .. option .. ' color found for highlight group: ' .. name)
      return nil
    end
    local hex_color = string.format('#%06x', color)
    return hex_color
  end,
}
