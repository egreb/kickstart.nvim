vim.api.nvim_create_user_command('DBUITab', function()
	for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
		local win = vim.api.nvim_tabpage_get_win(tab)
		local buf = vim.api.nvim_win_get_buf(win)
		local name = vim.api.nvim_buf_get_name(buf)
		if name:match 'dbui' then
			vim.cmd('tabnext ' .. tab)
			return
		end
	end
	vim.cmd 'tabnew | DBUI'
end, {})
